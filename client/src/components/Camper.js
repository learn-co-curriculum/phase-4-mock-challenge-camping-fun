import { useEffect, useState } from "react";
import { useParams } from "react-router";

function Camper() {
  const [{ data: camper, error, status }, setCamper] = useState({
    data: null,
    error: null,
    status: "pending",
  });
  const { id } = useParams();

  useEffect(() => {
    fetch(`/campers/${id}`).then((r) => {
      if (r.ok) {
        r.json().then((camper) =>
          setCamper({ data: camper, error: null, status: "resolved" })
        );
      } else {
        r.json().then((err) =>
          setCamper({ data: null, error: err.error, status: "rejected" })
        );
      }
    });
  }, [id]);

  if (status === "pending") return <h2>Loading...</h2>;
  if (status === "rejected") return <h2>Error: {error}</h2>;

  return (
    <div>
      <h2>{camper.name}'s Activities</h2>
      <ul>
        {camper.activities.map((activity) => (
          <li key={activity.id}>
            {activity.name} | Difficulty: {activity.difficulty}
          </li>
        ))}
      </ul>
      <hr />
    </div>
  );
}

export default Camper;
