import React, { useEffect, useState } from "react";

const Member = ({ member_id }) => {
  const [listmembers, setListmembers] = useState([]);
  useEffect(() => {
    fetch("http://127.0.0.1:9393/members/" + member_id, {
      method: `GET`,
    })
      .then((response) => response.json())
      .then((listmembers) => {
        setListmembers(listmembers);
      });
  }, []);

  return (
    <div>
      <h3>{listmembers.firstname}</h3>
      <h3>{listmembers.datepost}</h3>
    </div>
  );
};
export default Member;
