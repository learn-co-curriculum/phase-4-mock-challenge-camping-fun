import { Link, Route, Switch } from "react-router-dom";
import Camper from "./Camper";
import Home from "./Home";

function App() {
  return (
    <main>
      <h1>Camping Fun</h1>
      <nav>
        <Link to="/">Home</Link>
      </nav>
      <Switch>
        <Route exact path="/">
          <Home />
        </Route>
        <Route exact path="/campers/:id">
          <Camper />
        </Route>
      </Switch>
    </main>
  );
}

export default App;
