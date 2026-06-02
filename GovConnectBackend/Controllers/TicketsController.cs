using GovConnectBackend.DTOs;
using GovConnectBackend.Services;
using Microsoft.AspNetCore.Mvc;

namespace GovConnectBackend.Controllers;

[ApiController]
[Route("api/[controller]")]
public class TicketsController : ControllerBase
{
    private readonly ITicketService _ticketService;

    public TicketsController(ITicketService ticketService)
    {
        _ticketService = ticketService;
    }

    [HttpGet]
    public async Task<IActionResult> GetAll()
    {
        var tickets = await _ticketService.GetAllAsync();
        return Ok(tickets);
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> GetById(int id)
    {
        var ticket = await _ticketService.GetByIdAsync(id);

        if (ticket == null)
        {
            return NotFound("Ticket not found");
        }

        return Ok(ticket);
    }

    [HttpPost]
    public async Task<IActionResult> Create(CreateTicketDto request)
    {
        var ticket = await _ticketService.CreateAsync(request);
        return Ok(ticket);
    }
}