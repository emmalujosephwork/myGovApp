using GovConnectBackend.DTOs;
using GovConnectBackend.Models;
using GovConnectBackend.Repositories;

namespace GovConnectBackend.Services;

public class TicketService : ITicketService
{
    private readonly ITicketRepository _ticketRepository;

    public TicketService(ITicketRepository ticketRepository)
    {
        _ticketRepository = ticketRepository;
    }

    public async Task<List<TicketResponseDto>> GetAllAsync()
    {
        var tickets = await _ticketRepository.GetAllAsync();

        return tickets.Select(t => new TicketResponseDto
        {
            Id = t.Id,
            Title = t.Title,
            Description = t.Description,
            Category = t.Category,
            Status = t.Status,
            UserId = t.UserId,
            CreatedAt = t.CreatedAt
        }).ToList();
    }

    public async Task<TicketResponseDto?> GetByIdAsync(int id)
    {
        var ticket = await _ticketRepository.GetByIdAsync(id);

        if (ticket == null)
        {
            return null;
        }

        return new TicketResponseDto
        {
            Id = ticket.Id,
            Title = ticket.Title,
            Description = ticket.Description,
            Category = ticket.Category,
            Status = ticket.Status,
            UserId = ticket.UserId,
            CreatedAt = ticket.CreatedAt
        };
    }

    public async Task<TicketResponseDto> CreateAsync(CreateTicketDto request)
    {
        var ticket = new Ticket
        {
            Title = request.Title,
            Description = request.Description,
            Category = request.Category,
            Status = "Pending",
            UserId = request.UserId,
            CreatedAt = DateTime.Now
        };

        var savedTicket = await _ticketRepository.CreateAsync(ticket);

        return new TicketResponseDto
        {
            Id = savedTicket.Id,
            Title = savedTicket.Title,
            Description = savedTicket.Description,
            Category = savedTicket.Category,
            Status = savedTicket.Status,
            UserId = savedTicket.UserId,
            CreatedAt = savedTicket.CreatedAt
        };
    }
}