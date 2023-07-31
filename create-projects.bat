#!/usr/bin/env.sh
mkdir Reactivities
cd Reactivities

echo -e "Creating solution"
dotnet new sln
dotnet new webapi -n API
dotnet new classlib -n Application
dotnet new classlib -n Domain
dotnet new classlib -n Persistence

echo -e "Addint projects to the solution"
dotnet sln add API/API.csproj
dotnet sln add Application/Application.csproj
dotnet sln add Domain/Domain.csproj
dotnet sln add Persistence/Percistence.csproj

echo -e "Setting up project depencies"
cd API
dotnet add reference ../Application/Application.csproj
cd ../Application
dotnet add reference ../Domain/Domain.csproj
dotnet add reference ../Persistence/Percistence.csproj
cd ../Persistence
dotnet add reference ../Domain/Domain.csproj
cd ..

echo -e "executing dotnet restore"
dotnet restore
echo -e "finished"

