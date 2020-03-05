<!DOCTYPE html>

<html>
<head>
<title>cfinput type submit: how to use input type submit in coldfusion</title>
</head>

<body>
<h2 style="color:SaddleBrown; font-style:italic">cfinput type submit example: how to use</h2>
<hr width="425" align="left" color="RosyBrown" />
<br />

<cfif IsDefined("Form.SubmitColor")>
    <cfoutput>
    <h3 style="color:OrangeRed;">
        Your favorite color is: : #Form.Color#
    </h3>
    </cfoutput>
</cfif>

<cfform name="InputTypeSubmitTest">
 <table border="1" cellpadding="5" cellspacing="0" bordercolor="Orange">
     <tr>
         <td colspan="2" bgcolor="DeepPink" style="color:Snow; font-size:large" align="center">
             Color Submit Form
            </td>
        </tr>
     <tr>
         <td style="color:RosyBrown; font-weight:bold">
             Favorite Color
            </td>
         <td>
    <cfinput 
                 name="Color" 
                    type="text" 
                    style="background-color:Wheat; color:RosyBrown; width:250px; height:25px; font-size:large; font-style:italic; font:'Comic Sans MS', cursive"
                    required="yes"
                    message="Input color name"
                    >
            </td>
        </tr>
     <tr>
         <td colspan="2" align="right">
       <cfinput 
                 name="SubmitColor" 
                    type="submit" 
                    value="Submit"
                    style="height:45px; width:150px; font-size:large; font-style:italic; font-weight:bold; color:OrangeRed;"
                    >
            </td>
        </tr>
    </table>
</cfform>
</body>
</html>