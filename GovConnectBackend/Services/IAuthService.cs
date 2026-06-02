using GovConnectBackend.DTOs;

namespace GovConnectBackend.Services;

public interface IAuthService
{
    Task<LoginResponseDto?> LoginAsync(LoginRequestDto request);
}