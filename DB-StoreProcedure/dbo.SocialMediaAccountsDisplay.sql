USE [FStepCommunity_prod]
GO

/****** Object:  StoredProcedure [dbo].[SocialMediaAccountsDisplay]    Script Date: 13/02/2020 15:41:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 23/05/2018
-- Description:	Displays social media accounts by type from SocialMediaAccounts table
-- =============================================
CREATE PROCEDURE [dbo].[SocialMediaAccountsDisplay]
	-- Add the parameters for the stored procedure here
	@AccountType varchar (20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  create table #temp (RowID int IDENTITY(1,1),AccountType varchar(max)
						, AccountName varchar(max)
						, Link varchar(max))
	DECLARE @NumberRecords int
	DECLARE @RowCount int
	SET @RowCount = 1
    DECLARE @NewLineHTML varchar(max)
    DECLARE @outputHTML varchar(max)
    
    INSERT INTO #temp (AccountType
							, AccountName
							, Link) 
	SELECT AccountType AS AccountType, AccountName AS AccountName, ISNULL(Link,'') AS Link FROM SocialMediaAccounts
	WHERE (AccountType = @AccountType OR ISNULL(@AccountType,'') = '')
	
	SET @NumberRecords = @@ROWCOUNT;
	
	IF @NumberRecords > 0

	BEGIN


		SET @outputHTML = '<style> body {
  font-family: "Open Sans", sans-serif;
  line-height: 1.25;
}

table.PCCfieldsT {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  table-layout: fixed;
}

table.PCCfieldsT caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table.PCCfieldsT tr {
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}

table.PCCfieldsT th,
table.PCCfieldsT td {
  padding: .625em;
  text-align: center;
}

table.PCCfieldsT th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table.PCCfieldsT {
    border: 0;
  }

  table.PCCfieldsT caption {
    font-size: 1.5em;
  }
  
  table.PCCfieldsT thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
 }
  
  table.PCCfieldsT tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
      table.PCCfieldsT th{ 
    border-bottom: 1px solid #ddd;
    display:block;
    font-size: .8em;
    text-align: centre;
  }
 table.PCCfieldsT td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }

  table.PCCfieldsT td::before {
    /*
    * aria-label has no advantage, it will not be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table.PCCfieldsT td:last-child {
    border-bottom: 0;
  }
}     
table.PCCfieldsT {
    width: 100%;
    border-spacing: 0px;
    table-layout:fixed;
     text-align:center; 
    vertical-align:middle;
}
table.PCCfieldsT td {
border: 1px solid black;
border-collapse: collapse;
overflow-wrap: break-word;
word-wrap: break-word;
}


table.PCCfieldsT tr:nth-child(even) {
    background-color: #f8f8f8;
    word-wrap: break-word;
    
}
table.PCCfieldsT th {
border: 1px solid black;
border-collapse: collapse;
background-color:  #A9A9A9;
word-wrap: break-word;
}

</style>
<body>
<table class = "PCCfieldsT">
  <tr>
    <th>Account Name</th>
    <th>Link</th></tr>'
  
  WHILE @RowCount <= @NumberRecords

		begin

			select @NewLineHTML = '<tr><td>'+ AccountName + '</td><td><a target="_blank" href="' + Link + '">' + Link + '</a></td><tr>'
			from #temp 
			WHERE RowID = @RowCount 
		
			SET @outputHTML = @outputHTML + @NewLineHTML
			
			SET @RowCount = @RowCount + 1;
		end	
		SET @outputHTML = @outputHTML + '</body></table>'


end
	else
		SET @outputHTML = '<font size="3" color="red">No records found</font>' 
		
	
	select @outputHTML as outputHTML		

							
END

GO

