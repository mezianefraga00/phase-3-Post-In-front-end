import React, { useState } from "react";

const New_postin = () => {
  const [title, setTitle] = useState("");
  const [text, setText] = useState("");
  const [firstname, setName] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    const user = { title, text };

    const date = Date().toLocaleString();
    const member = { firstname, date };

    fetch("http://localhost:9393/postins", {
      method: `POST`,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(user),
    }).then((response) => response.json());

    fetch("http://localhost:9393/members", {
      method: `POST`,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(member),
    }).then((res) => res.json());

    window.location.reload();

    // PESSIMISTIC RENDERING
  };
  return (
    <form onSubmit={handleSubmit} style={{ padding: 5 + "%" }}>
      <label className="label">
        <h3>Name:</h3>
      </label>

      <input
        type="text"
        required
        value={firstname}
        onChange={(e) => setName(e.target.value)}
      />
      <label className="label">
        <h3>title:</h3>
      </label>

      <input
        type="text"
        required
        value={title}
        onChange={(e) => setTitle(e.target.value)}
      />

      <label className="label">
        <h3>Postin-In:</h3>
      </label>
      <input
        size="50"
        type="text"
        placeholder="Your Post-In"
        required
        value={text}
        onChange={(e) => setText(e.target.value)}
      />

      <button>Submit</button>
    </form>
  );
};

export default New_postin;
