import "./App.css";
import { useState } from "react";
require('dotenv').config()

function JsonDataDisplay(JsonData) {
  const DisplayData = JsonData.map(
    (info) => {
      return (
        <tr>
          <td>{info.id}</td>
          <td>{info.name}</td>
          <td>{info.text}</td>
        </tr>
      )
    }
  )

  return (
    <div>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Text</th>
          </tr>
        </thead>
        <tbody>


          {DisplayData}

        </tbody>
      </table>

    </div>
  )
}

function App() {
  const [name, setName] = useState("");
  const [contactmessage, setContact] = useState("");
  const [message, setMessage] = useState("");

  let APIUrl = process.env.REACT_APP_API_URL;

  let handleSubmit = async (e) => {
    e.preventDefault();
    try {
      let body = {
        operation: "create",
        tableName: "Contact",
        payload: {
          Item: {
            name: name,
            text: contactmessage
          }
        }
      };
      let jsonString = JSON.stringify(body);
      let res = await fetch(APIUrl, {
        method: "POST",
        body: jsonString
      });
      console.log(res);
      let resJson = await res.json();
      console.log(resJson);

      if (res.status === 200) {
        setMessage(name + " your contact was sent successfully");
        setName("");
        setContact("");
      } else {
        setMessage("Some error occured");
      }
    } catch (err) {
      console.log(err);
      console.log(APIUrl);
    }
  };

  let handleSubmit2 = async (e) => {
    e.preventDefault();
    try {
      let body = {
        operation: "list",
        tableName: "Contact",
        payload: {
        }
      };
      let jsonString = JSON.stringify(body);
      let res = await fetch(APIUrl, {
        method: "POST",
        body: jsonString
      });
      let resJson = await res.json();
      let items = resJson.output.Items;
      console.log(items);

      if (res.status === 200) {
        setMessage(JsonDataDisplay(items));
      } else {
        setMessage("Some error occured");
      }
    } catch (err) {
      console.log(err);
      console.log(APIUrl);
    }
  };

  return (
    <div className="App">
      <form onSubmit={handleSubmit}>
        <div className="message">Super pretty frontend page</div><br />
        <input
          type="text"
          value={name}
          placeholder="Name"
          onChange={(e) => setName(e.target.value)}
        />
        <textarea
          value={contactmessage}
          placeholder="Write a message"
          onChange={(e) => setContact(e.target.value)}
        />
        <br />
        <button type="submit">Send</button>
        <button type="submit" onClick={handleSubmit2}>List elements</button>
        <div className="message">{message ? <p>{message}</p> : null}</div>
      </form>
    </div>

  );
}

export default App;
