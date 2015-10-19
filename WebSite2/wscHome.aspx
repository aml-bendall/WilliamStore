<%@ Page Title="" Language="VB" MasterPageFile="wsc.master" AutoEventWireup="false" CodeFile="wscHome.aspx.vb" Inherits="Default3" %>
<%@ Import namespace="System.Data.OleDb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
			<!-- Begin Main -->
			<div id="main">
				<!-- Begin Slider -->
				<div id="slider">
					<!-- Begin Slider Items -->
					<div class="slider-items">
						<ul>
							<li>
								<img src="css/images/engraving.jpg" alt="First Slide Image" />
								<div class="slide-entry">
									<h2>CUSTOM ENGRAVING</h2>
									<h3>Any image can be created quickly and accurately</h3>
									<p>Our Engraving is the best in the business. We can fulfill any custom business need and complete the job in a timely manner. Place an order and our Sales team will get in touch quickly!</p>
									<a href="#" class="more" title="Learn More">Learn More</a>
								</div>
							</li>
							<li>
								<img src="css/images/bc.jpg" alt="Second Slide Image" />
								<div class="slide-entry">
									<h2>Custom Printing</h2>
									<h3>Business Cards, presentations, and more</h3>
									<p>We can help your business reach the next level with custom printing. Place an order now!</p>
									<a href="#" class="more" title="Learn More">Learn More</a>
								</div>
							</li>
							<li>
								<img src="css/images/partner.jpg" alt="Third Slide Image" />
								<div class="slide-entry">
									<h2>Trusted, valued, and an Industry Leader</h2>
									<h3>Gain a valuable business partner today!</h3>
									<p>We value you as a customer and will make sure that you are 100% satisfied with our product. We do not look to fulfill orders once. We look to build partnerships for years to come.</p>
									<a href="#" class="more" title="Learn More">Learn More</a>
								</div>
							</li>
						</ul>
						<div class="cl">&nbsp;</div>
					</div>
					<!-- End Slider Items -->
					<!-- Begin Slider Nav -->
					<div class="slider-nav">
						<ul>
							<li class="first">
								<a href="#" title="First Slide">
									<span><img src="css/images/engraving2.jpg" alt="First Slide Image" /></span>
								</a>
								<span class="slide-sep">&nbsp;</span>
							</li>
							<li>
								<a href="#" title="Second Slide">
									<span><img src="css/images/bc2.jpg" alt="Second Slide Image" /></span>
								</a>
								<span class="slide-sep">&nbsp;</span>
							</li>
							<li class="last">
								<a href="#" title="Third Slide">
									<span><img src="css/images/partner2.jpg" alt="Third Slide Image" /></span>
								</a>
							</li>
						</ul>
						<div class="cl">&nbsp;</div>
					</div>
					<!-- End Slider Nav -->
				</div>
				<!-- End Slider -->
				<!-- Begin Content -->
				<div id="content">
					<div class="top"></div>
					<!-- Begin Inner -->
					<div class="inner">
						<div id="products">
							<h2>Our Products</h2>
                           <% 
                               Dim connect As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data source=C:\Users\Demystify\Desktop\WilliamStore\WebSite2\TeamA_WSC_Website_Database.accdb;User ID=Admin;Password=;"
                               Dim query As String = "Select * from items"
                               Using conn As New OleDbConnection(connect)
                                   Using cmd As New OleDbCommand(query, conn)
                                       conn.Open()
                                       Dim reader As OleDbDataReader = cmd.ExecuteReader()
                                       Dim count As Int32 = 1
                                       Dim EndDiv As String = "N"
                                       While reader.Read()
                                           If (count Mod 3) = 1 Or count = 1 Then %>
                                                <!-- Begin Row -->
                                                <div class="row">
                                           <% EndDiv = "Y"
                        End If %>
								                    <div class="product">
									                    <div class="img-box">
										                    <img src = "css/images/engraving3.jpg" alt="Product Image" />
										                    <a href = "/AddToCart.aspx?productID=<%=reader.GetInt32(0) %>" class="more" title="Add To Cart">Add To Cart</a>
									                    </div>
									                    <div class="pr-entry">
										                    <h4><%=reader.GetString(5) %></h4>
										                    <span class="pr-number">Qty Remaining: <%=reader.GetInt32(3) %></span>
										                    <p> <%=reader.GetString(1) %></p>
										                    <span class="pr-price"><span>$</span><%=reader.GetDecimal(2)%></span>
									                    </div>
								                    </div>
								                    
							                  <%If (count Mod 3) = 0 Then %>  
                                                    <div class="cl">&nbsp;</div>
                                                </div>
							                    <!-- End Row -->
                                                
                                    <%          EndDiv = "N"
                                            End If
                                            count = count + 1
                                        End While
                                        reader.Close()
                                        conn.Close()
                                        If EndDiv = "Y" Then
                                                    %>
                                        <div class="cl">&nbsp;</div>
                                </div>
                           <%
                                End If
                            End Using
                        End Using
                           %>
						</div>
					</div>
					<!-- End Inner -->
				</div>
				<!-- End Content -->
			</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:Panel runat="server" ID="AuthenticatedMessagePanel">
        <asp:Label runat="server" ID="WelcomeBackMessage"></asp:Label>
    </asp:Panel>
    
    <asp:Panel runat="Server" ID="AnonymousMessagePanel">
        <asp:HyperLink runat="server" ID="lnkLogin" Text="Log In" NavigateUrl="~/Login.aspx"></asp:HyperLink>
    </asp:Panel>

</asp:Content>

