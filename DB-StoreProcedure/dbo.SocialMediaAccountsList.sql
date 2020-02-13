USE [FStepCommunity_prod]
GO

/****** Object:  StoredProcedure [dbo].[SocialMediaAccountsList]    Script Date: 13/02/2020 15:41:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 22/05/2018
-- Description:	Displays the existing social media accounts
-- =============================================
CREATE PROCEDURE [dbo].[SocialMediaAccountsList]
	-- Add the parameters for the stored procedure here
@AccountType varchar (20)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @NewLineHTML varchar(max)
    DECLARE @outputHTML varchar(max)
    
    SET @outputHTML = '<style> body {
  font-family: "Open Sans", sans-serif;
  line-height: 1.25;
}

table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table tr {
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.5em;
  }
  
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
 }
  
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
      table th{ 
    border-bottom: 1px solid #ddd;
    display:block;
    font-size: .8em;
    text-align: centre;
  }
 table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }

  table td::before {
    /*
    * aria-label has no advantage, it will not be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table td:last-child {
    border-bottom: 0;
  }
}     
table {
    width: 100%;
    border-spacing: 0px;
    table-layout:fixed;
     text-align:center; 
    vertical-align:middle;
}
td {
border: 1px solid black;
border-collapse: collapse;
overflow-wrap: break-word;
word-wrap: break-word;
}


tr:nth-child(even) {
    background-color: #f8f8f8;
    word-wrap: break-word;
    
}
th {
border: 1px solid black;
border-collapse: collapse;
background-color:  #A9A9A9;
word-wrap: break-word;
}

</style>
<body>
<table>
  <tr>
    <th>Account Type</th>
    <th>Account Name</th>
    <th>Link</th></tr>'
  

			select @NewLineHTML = '<tr><td>' + AccountType + '</td><td>' + AccountName + '</td><td>' + Link + '</td></tr>'
			from SocialMediaAccounts
		
		
		SET @outputHTML = @outputHTML + @NewLineHTML
	
		
		SET @outputHTML = @outputHTML + '</body></table>'

		
	
	 select @outputHTML as outputHTML		

							



END

GO

