using GovConnectBackend.Models;

namespace GovConnectBackend.Repositories;

public interface IUserRepository
{
    Task<User?> GetByEmailAndPasswordAsync(string email, string password);
}