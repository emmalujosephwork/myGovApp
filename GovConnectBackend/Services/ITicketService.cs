using GovConnectBackend.DTOs;

namespace GovConnectBackend.Services;

public interface ITicketService
{
    Task<List<TicketResponseDto>> GetAllAsync();
    Task<TicketResponseDto?> GetByIdAsync(int id);
    Task<TicketResponseDto> CreateAsync(CreateTicketDto request);
}