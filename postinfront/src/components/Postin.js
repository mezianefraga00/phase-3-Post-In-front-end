import React, { useEffect, useState } from "react";
import Member from "./Member";

export default function Postin() {
  const [postins, setPostins] = useState([]);

  const deletePost = (id) => {
    let postins1;
    const post = { ...postins };

    try {
      fetch("http://127.0.0.1:9393/postins/" + id, {
        method: "DELETE",
      });
      postins1 = postins.filter((pos) => pos.id !== id);
      setPostins(postins1);
    } catch (ex) {
      setPostins(post);
    }
  };

  useEffect(() => {
    fetch("http://127.0.0.1:9393/postins")
      .then((response) => response.json())
      .then((listpostins) => {
        setPostins(listpostins);
      });
  }, []);
  return (
    <>
      <h2>Family-postins</h2>
      <div className="container">
        {postins.map((postin, key) => (
          <>
            <div className="element" key={postin.id}>
              <div className="card" key={postin.id}>
                <h5 className="card-title" key={postin.id}>
                  {postin.title}
                </h5>

                <p className="card-text" key={postin.id + "p"}>
                  {postin.text}
                </p>

                <h5 className="card-title" key={postin.id + "h5"}>
                  <Member member_id={postin.id} />
                </h5>
                <button
                  key={postin.id + "bu"}
                  className="button"
                  onClick={() => deletePost(postin.id)}
                >
                  DELETE
                </button>
              </div>
            </div>
          </>
        ))}
      </div>
    </>
  );
}
