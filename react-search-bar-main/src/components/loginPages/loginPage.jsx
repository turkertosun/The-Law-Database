import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./index.scss";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faUser } from "@fortawesome/free-solid-svg-icons";

const LoginPage = () => {
  const navigate = useNavigate();
  const [isSignUp, setIsSignUp] = useState(true);
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    password: "",
  });
  const [errors, setErrors] = useState({});

  const toggleForm = () => {
    setIsSignUp((prevState) => !prevState);
    setFormData({ name: "", email: "", password: "" });
    setErrors({});
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  const validate = () => {
    const newErrors = {};
    if (isSignUp && !formData.name) {
      newErrors.name = "Name is required for Sign Up";
    }
    if (!formData.email) {
      newErrors.email = "Email is required";
    }
    if (!formData.password) {
      newErrors.password = "Password is required";
    }
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (validate()) {
      if (!isSignUp) {
        if (formData.email === "admin@gmail.com" && formData.password === "admin") {
          console.log("Admin Sign-In Successful");
          navigate("/mainAdmin"); // Redirect to mainAdmin
        } else {
          console.log("Sign-In Successful");
          navigate("/main"); // Redirect to main
        }
      } else {
        console.log("Sign-Up Successful");
        alert("Sign-Up Successful");
      }
    }
  };

  return (
    <div className="container">
      <div className="form-box">
        <h1 id="title">{isSignUp ? "Sign Up" : "Sign In"}</h1>
        <form onSubmit={handleSubmit}>
          <div className="input-group">
            {isSignUp && (
              <div className="input-field" id="nameField">
                <FontAwesomeIcon className="userPerson" icon={faUser} />
                <input
                  type="text"
                  name="name"
                  placeholder="Name"
                  value={formData.name}
                  onChange={handleChange}
                />
                {errors.name && <small className="error">{errors.name}</small>}
              </div>
            )}

            <div className="input-field">
              <FontAwesomeIcon className="userPerson" icon={faUser} />
              <input
                type="email"
                name="email"
                placeholder="Email"
                value={formData.email}
                onChange={handleChange}
              />
              {errors.email && <small className="error">{errors.email}</small>}
            </div>

            <div className="input-field">
              <FontAwesomeIcon className="userPerson" icon={faUser} />
              <input
                type="password"
                name="password"
                placeholder="Password"
                value={formData.password}
                onChange={handleChange}
              />
              {errors.password && (
                <small className="error">{errors.password}</small>
              )}
            </div>

            {!isSignUp && (
              <p>
                Forgot Password? <a href="#">Click Here!</a>
              </p>
            )}
          </div>

          <div className="button-field">
            <button
              type="button"
              id="signUpbutton"
              className={isSignUp ? "active" : "disable"}
              onClick={toggleForm}
            >
              Sign Up
            </button>
            <button
              type="button"
              id="signInbutton"
              className={!isSignUp ? "active" : "disable"}
              onClick={toggleForm}
            >
              Sign In
            </button>
          </div>

          <button type="submit" className="login-btn">
            {isSignUp ? "Register" : "Login"}
          </button>
        </form>
      </div>
    </div>
  );
};

export default LoginPage;
