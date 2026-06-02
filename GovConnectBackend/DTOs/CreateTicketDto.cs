namespace GovConnectBackend.DTOs;

public class CreateTicketDto
{
    public string Title { get; set; } = "";
    public string Description { get; set; } = "";
    public string Category { get; set; } = "";
    public int UserId { get; set; }
}