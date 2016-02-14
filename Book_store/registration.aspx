<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <title></title>
    <script src="jquery-2.2.0.min.js"></script>
    <script type="text/javascript">


        function validate() {
            var re =new RegExp( /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
            var zipregex = new RegExp(/(^\d{5}$)|(^\d{5}-\d{4}$)/);
            //var pas = new RegExp(^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$);
            var isvalid = true;
            var count = 0;
            var name = document.getElementById('name').value;
            var address1 = document.getElementById('address1').value;
            var city = document.getElementById('city').value;
            var zip = document.getElementById('zip').value;
            var email = document.getElementById('email').value;
            var pwd = document.getElementById('pwd').value;
            var cnfmpwd = document.getElementById('confirmpwd').value;
         
            if(name.length==0)
            {
                document.getElementById('Label1').innerText = "name is required";
                count++;
            }
            else
            {
                document.getElementById('Label1').innerText = "";
            }

            if(address1.length==0)
            {
                document.getElementById('Label2').innerText = "Address1 is required";
                count++;
            }
            else
            {
                document.getElementById('Label2').innerText = "";
            }

            if(city.length==0)
            {
                document.getElementById('Label3').innerText = "city is required";
                count++;
            }
            else
            {
                document.getElementById('Label3').innerText = "";
            }

            if(zip.length==0)
            {
                document.getElementById('Label4').innerText = "Zip is required";
                count++;
            }
            else if(!zipregex.test(zip))
            {
                document.getElementById('Label4').innerText = "Invalid Format";
                count++;
            }
            else
            {
                document.getElementById('Label4').innerText = "";
            }
            if (email.length == 0)
            {
                document.getElementById('Label5').innerText = "Email is Required";
                count++;
            }
            else if (!re.test(email))
            {
                document.getElementById('Label5').innerText = "Invalid format of email";
                count++;
            }
            else
            {
                document.getElementById('Label5').innerText = "";
            }
            if (pwd.length == 0)
            {
                document.getElementById('Label6').innerText = "Password is required";
                count++;
            }
            //else if (pas.test(pwd))
            //{
            //    document.getElementById('Label6').innerText="Password is invalid";
            //    count++;
            //}
            else
            {
                document.getElementById('Label6').innerText = "";
            }
            if (cnfmpwd.length == 0)
            {
                document.getElementById('Label7').innerText = "Password is required";
                count++;
            }
            else if (cnfmpwd != pwd)
            {
                document.getElementById('Label7').innerText = "password doesnt match";
                count++;
            }
            else {
                document.getElementById('Label7').innerText = "";
            }

            if (count > 0)
                return false;
            else
                return true;


            
        }
       
        function alertMessage1() {
            alert('Your Email Address is already registered in our database.Please login.');
        }
        function alertMessage2() {
            alert('Thank Yor for registration.Please login.');
        }
        function alertMessage3() {
            alert('Sorry! You are not a registered user.Please login.');
        }
        function alertMessage4() {
            alert('Sorry! No User registered.Please register first.');
        }




        $(function () {
            $("form input, form select, form textarea").change(validate);
        });

    </script>
</head>
<body style="background-color:khaki">
    <form id="form1" runat="server" method="post" >
    <div>
         <div id ="banner">
             <br />
         <img class="banner"  src="Images/images.jpg" />
         </div>
        <div id="steps">
            <h3>Just few steps...</h3>
        </div>
        <div id ="InfoLogin">
        <div id="PersonalInfo">
            <h2>Personal Information</h2>
            <h4>Tell us a little about yourself. This information is <b>only</b> used so that we can <b>pay</b> you, provide a <b>free shipping label,</b> and <b>communicate with you.</b></h4>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        Your Name<font color="red">*</font>       

                    </asp:TableCell>
                    <asp:TableCell>
                       <asp:TextBox ID="name" runat="server" width="330px"/><asp:Label ID="Label1" runat="server" CssClass="label" ForeColor="Red" ></asp:Label>                                      

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Address Line 1<font color="red">*</font>  

                    </asp:TableCell>
                    <asp:TableCell>
                       <asp:TextBox ID="address1" runat="server" width="400px"/><asp:Label ID="Label2" runat="server" CssClass="label" ForeColor="Red" ></asp:Label>            

                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        Address Line 2 
                    </asp:TableCell>
                    <asp:TableCell>
                       <asp:TextBox ID="address2" runat="server" width="400px"/>
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        City<font color="red">*</font>                 

                    </asp:TableCell>
                    <asp:TableCell>
                       <asp:TextBox ID="city" runat="server" width="330px"/> <asp:Label ID="Label3" runat="server" CssClass="label" ForeColor="Red" ></asp:Label>    

                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        Zip<font color="red">*</font>                  

                    </asp:TableCell>
                    <asp:TableCell>
                       <asp:TextBox ID="zip" runat="server" width="100px"/> <asp:Label ID="Label4" runat="server" CssClass="label" ForeColor="Red" ></asp:Label>    

                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        State 
                     </asp:TableCell>  <asp:TableCell>
                  <asp:DropDownList id="StateList" runat="server">
                     <asp:ListItem>AL</asp:ListItem>
                     <asp:ListItem>AK</asp:ListItem>
                     <asp:ListItem>AZ</asp:ListItem>
                     <asp:ListItem>AR</asp:ListItem>
                     <asp:ListItem>CA</asp:ListItem>
                     <asp:ListItem>CO</asp:ListItem>
                     <asp:ListItem>CT</asp:ListItem>
                     <asp:ListItem>DE</asp:ListItem>
                     <asp:ListItem>DC</asp:ListItem>
                     <asp:ListItem>FL</asp:ListItem>
                     <asp:ListItem>GA</asp:ListItem>
                     <asp:ListItem>HI</asp:ListItem>
                     <asp:ListItem>ID</asp:ListItem>
                     <asp:ListItem>IL</asp:ListItem>
                     <asp:ListItem>IN</asp:ListItem>
                     <asp:ListItem>IA</asp:ListItem>
                     <asp:ListItem>KS</asp:ListItem>
                     <asp:ListItem>KY</asp:ListItem>
                     <asp:ListItem>LA</asp:ListItem>
                     <asp:ListItem>ME</asp:ListItem>
                     <asp:ListItem>MD</asp:ListItem>
                     <asp:ListItem>MA</asp:ListItem>
                     <asp:ListItem>MI</asp:ListItem>
                     <asp:ListItem>MN</asp:ListItem>
                     <asp:ListItem>MS</asp:ListItem>
                     <asp:ListItem>MO</asp:ListItem>
                     <asp:ListItem>MT</asp:ListItem>
                     <asp:ListItem>NE</asp:ListItem>
                     <asp:ListItem>NV</asp:ListItem>
                     <asp:ListItem>NH</asp:ListItem>
                     <asp:ListItem>NJ</asp:ListItem>
                     <asp:ListItem>NM</asp:ListItem>
                     <asp:ListItem>NY</asp:ListItem>
                     <asp:ListItem>NC</asp:ListItem>
                     <asp:ListItem>ND</asp:ListItem>
                     <asp:ListItem>OH</asp:ListItem>
                     <asp:ListItem>OK</asp:ListItem>
                     <asp:ListItem>OR</asp:ListItem>
                     <asp:ListItem>PA</asp:ListItem>
                     <asp:ListItem>RI</asp:ListItem>
                     <asp:ListItem>SC</asp:ListItem>
                     <asp:ListItem>SD</asp:ListItem>
                     <asp:ListItem>TN</asp:ListItem>
                     <asp:ListItem>WA</asp:ListItem>
                     <asp:ListItem>TX</asp:ListItem>
                     <asp:ListItem>UT</asp:ListItem>
                     <asp:ListItem>VT</asp:ListItem>
                     <asp:ListItem>VA</asp:ListItem>
                     <asp:ListItem>WS</asp:ListItem>
                     <asp:ListItem>WY</asp:ListItem>
                     <asp:ListItem>WV</asp:ListItem>
                     <asp:ListItem> WI</asp:ListItem>      
      </asp:DropDownList>
     
                    </asp:TableCell>
                   
                </asp:TableRow>
            </asp:Table></div>
            <hr />
            <div id="login" style:"font-color= blue">
            <h2>Login Information</h2>
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            Email Address<font color="red">*</font>   
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="email" runat="server" width="330px"  /> <asp:Label ID="Label5" runat="server" CssClass="label" ForeColor="Red" ></asp:Label>            


                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Password<font color="red">*</font>                    

                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="pwd" runat="server" width="330px" TextMode="Password"/> <asp:Label ID="Label6" runat="server" CssClass="label" ForeColor="Red" ></asp:Label>     


                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Confirm Password    

                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="confirmpwd" runat="server" width="330px" TextMode="Password"/> <asp:Label ID="Label7" runat="server" CssClass="label" ForeColor="Red" ></asp:Label>      

                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table></div>
                <hr /> 
                  <div id="pay" style:"font-color= blue">
            <h2>Pay by me</h2>
                      <asp:RadioButton GroupName="Payment" ID="check" runat="server" text="Check" />
                      <asp:RadioButton GroupName="Payment" ID="paypal" runat="server" text="Paypal" />
                      </div><br />
            <asp:Button id="back" Text="Go to main page" OnClick="back_OnClick" runat="server" />
         <asp:Button id="regis" Text="Complete Registration" OnClick="regis_OnClick" OnClientClick="return validate();" runat="server"   ValidationGroup="a" />
        
    </div>
        </div>
        <div id ="Login">
           <h2>Already have an account</h2>
            <h4>Login</h4>
              <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                      Email Address<font color="red">*</font>
                    </asp:TableCell>
                    <asp:TableCell>
                       <asp:TextBox ID="TxtEmail" runat="server" width="218px"/>                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Email is required" ControlToValidate="TxtEmail" ValidationGroup="b" ForeColor="Red"></asp:RequiredFieldValidator>

                    </asp:TableCell>
                </asp:TableRow>
                   <asp:TableRow>
                    <asp:TableCell>
                      Password<font color="red">*</font> 
                    </asp:TableCell>
                    <asp:TableCell>
                       <asp:TextBox ID="Password" runat="server" width="218px" TextMode="Password"/>                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Password is required" ValidationGroup="b" ControlToValidate="Password" ForeColor="Red"></asp:RequiredFieldValidator>

                    </asp:TableCell>
                </asp:TableRow>
                 
                   <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button id="BtnLogin" Text="Login" OnClick="log_OnClick" runat="server"  ValidationGroup="b"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button id="BtnFrgtPwd" Text="Forgot Password" OnClick="frgtpwd_OnClick" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
</asp:Table>
        </div>

    </form>
</body>
</html>
