using GovConnectBackend.DTOs;
using GovConnectBackend.Repositories;

namespace GovConnectBackend.Services;

public class AuthService : IAuthService
{
    private readonly IUserRepository _userRepository;

    public AuthService(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }

    public async Task<LoginResponseDto?> LoginAsync(LoginRequestDto request)
    {
        var user = await _userRepository.GetByEmailAndPasswordAsync(
            request.Email,
            request.Password
        );

        if (user == null)
        {
            return null;
        }

        return new LoginResponseDto
        {
            Id = user.Id,
            FullName = user.FullName,
            Email = user.Email,
            Role = user.Role
        };
    }
}