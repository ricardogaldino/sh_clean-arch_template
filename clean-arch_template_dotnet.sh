#!/bin/bash

PROJECT="$1"

SRC="src"
TEST="test"

CLEAN_ARCH_ADAPTERS="Adapters"
CLEAN_ARCH_ENTITIES="Entities"
CLEAN_ARCH_USE_CASES="UseCases"
CLEAN_ARCH_FRAMEWORKS="Frameworks"

TEST_UNITARY="UnitTest"
TEST_INTEGRATION="IntegTest"
TEST_ARCHITECTURE="ArchTest"

UI="UI"
UI_API="UI.Api"
DTOS=Dtos
MODELS="Models"
VIEW_MODELS="ViewModels"
ENUMS="Enums"
INTERFACES="Interfaces"
SERVICES="Services"
CONTROLLERS="Controllers"
DATABASE="Database"
REPOSITORIES="Repositories"
EXTERNAL="External"
REQUESTS="Requests"
RESPONSES="Responses"
UNITARY="Unitary"
INTEGRATION="Integration"
ARCHITECTURE="Architecture"
MAPPERS="Mappers"
DEPENDENCIES="Dependencies"
CLASSES="Classes"
ATTRIBUTES="Attributes"
METHODS="Methods"

# --------------------------------------------------
# ********** CREATE PROJECT **********
# --------------------------------------------------
rm -Rf "$PROJECT"
mkdir "$PROJECT"
cd "$PROJECT"

mkdir "$SRC"
mkdir "$TEST"

# --------------------------------------------------
# ********** CREATE SOLUTION **********
# --------------------------------------------------
dotnet new sln -n "$PROJECT"
# --------------------------------------------------

cd "$SRC"

# --------------------------------------------------
# ********** CREATE ENTITIES LAYER **********
# --------------------------------------------------
mkdir "$CLEAN_ARCH_ENTITIES"
cd "$CLEAN_ARCH_ENTITIES"

dotnet new classlib -n "$PROJECT.$CLEAN_ARCH_ENTITIES"
cd "$PROJECT.$CLEAN_ARCH_ENTITIES"

mkdir "$MODELS"
touch "$MODELS/.gitkeep"

mkdir "$ENUMS"
touch "$ENUMS/.gitkeep"

cd ..
cd ..

# --------------------------------------------------
# ********** CREATE ADAPTERS LAYER **********
# --------------------------------------------------
mkdir "$CLEAN_ARCH_ADAPTERS"
cd "$CLEAN_ARCH_ADAPTERS"

dotnet new classlib -n "$PROJECT.$CLEAN_ARCH_ADAPTERS"
cd "$PROJECT.$CLEAN_ARCH_ADAPTERS"

dotnet add package AutoMapper

mkdir "$DTOS"
touch "$DTOS/.gitkeep"

mkdir "$MAPPERS"
touch "$MAPPERS/.gitkeep"

mkdir "$INTERFACES"
mkdir "$INTERFACES/$CLEAN_ARCH_USE_CASES"
touch "$INTERFACES/$CLEAN_ARCH_USE_CASES/.gitkeep"
mkdir "$INTERFACES/$CLEAN_ARCH_FRAMEWORKS"
mkdir "$INTERFACES/$CLEAN_ARCH_FRAMEWORKS/$DATABASE"
mkdir "$INTERFACES/$CLEAN_ARCH_FRAMEWORKS/$DATABASE/$REPOSITORIES"
touch "$INTERFACES/$CLEAN_ARCH_FRAMEWORKS/$DATABASE/$REPOSITORIES/.gitkeep"
mkdir "$INTERFACES/$CLEAN_ARCH_FRAMEWORKS/$EXTERNAL"
mkdir "$INTERFACES/$CLEAN_ARCH_FRAMEWORKS/$EXTERNAL/$SERVICES"
touch "$INTERFACES/$CLEAN_ARCH_FRAMEWORKS/$EXTERNAL/$SERVICES/.gitkeep"

cd ..
cd ..

# --------------------------------------------------
# ********** CREATE USE_CASES LAYER **********
# --------------------------------------------------
mkdir "$CLEAN_ARCH_USE_CASES"
cd "$CLEAN_ARCH_USE_CASES"

dotnet new classlib -n "$PROJECT.$CLEAN_ARCH_USE_CASES"

cd ..

# --------------------------------------------------
# ********** CREATE FRAMEWORKS LAYER **********
# --------------------------------------------------
mkdir "$CLEAN_ARCH_FRAMEWORKS"
cd "$CLEAN_ARCH_FRAMEWORKS"

dotnet new webapi -n "$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$UI_API" --no-https
cd "$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$UI_API"

dotnet add package Microsoft.Extensions.DependencyInjection
dotnet add package Microsoft.Extensions.DependencyInjection.Abstractions

mkdir "$VIEW_MODELS"
mkdir "$VIEW_MODELS/$REQUESTS"
touch "$VIEW_MODELS/$REQUESTS/.gitkeep"
mkdir "$VIEW_MODELS/$RESPONSES"
touch "$VIEW_MODELS/$RESPONSES/.gitkeep"

cd ..

dotnet new classlib -n "$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$EXTERNAL"
cd "$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$EXTERNAL"

mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"

cd ..

dotnet new classlib -n "$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$DATABASE"
cd "$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$DATABASE"

dotnet add package Dapper
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package EFCore.NamingConventions

mkdir "$REPOSITORIES"
touch "$REPOSITORIES/.gitkeep"

cd ..
cd ..
cd ..

# --------------------------------------------------
# ********** CREATE TESTS LAYER **********
# --------------------------------------------------
cd "$TEST"

mkdir "$UNITARY"
cd "$UNITARY"

dotnet new xunit -n "$PROJECT.$TEST_UNITARY"
cd "$PROJECT.$TEST_UNITARY"

mkdir "$CLEAN_ARCH_USE_CASES"
touch "$CLEAN_ARCH_USE_CASES/.gitkeep"

mkdir "$CLEAN_ARCH_ENTITIES"
mkdir "$CLEAN_ARCH_ENTITIES/$MODELS"
touch "$CLEAN_ARCH_ENTITIES/$MODELS/.gitkeep"

mkdir "$CLEAN_ARCH_ADAPTERS"
mkdir "$CLEAN_ARCH_ADAPTERS/$MAPPERS"
touch "$CLEAN_ARCH_ADAPTERS/$MAPPERS/.gitkeep"

dotnet add package Microsoft.NET.Test.Sdk
dotnet add package xunit
dotnet add package xunit.runner.console
dotnet add package xunit.runner.visualstudio
dotnet add package coverlet.collector
dotnet add package coverlet.msbuild

cd ..
cd ..

mkdir "$INTEGRATION"
cd "$INTEGRATION"

dotnet new xunit -n "$PROJECT.$TEST_INTEGRATION"
cd "$PROJECT.$TEST_INTEGRATION"

mkdir "$CLEAN_ARCH_FRAMEWORKS"
mkdir "$CLEAN_ARCH_FRAMEWORKS/$UI"
mkdir "$CLEAN_ARCH_FRAMEWORKS/$UI/$CONTROLLERS"
touch "$CLEAN_ARCH_FRAMEWORKS/$UI/$CONTROLLERS/.gitkeep"
mkdir "$CLEAN_ARCH_FRAMEWORKS/$DATABASE"
mkdir "$CLEAN_ARCH_FRAMEWORKS/$DATABASE/$REPOSITORIES"
touch "$CLEAN_ARCH_FRAMEWORKS/$DATABASE/$REPOSITORIES/.gitkeep"
mkdir "$CLEAN_ARCH_FRAMEWORKS/$EXTERNAL"
mkdir "$CLEAN_ARCH_FRAMEWORKS/$EXTERNAL/$SERVICES"
touch "$CLEAN_ARCH_FRAMEWORKS/$EXTERNAL/$SERVICES/.gitkeep"

dotnet add package Microsoft.NET.Test.Sdk
dotnet add package Microsoft.AspNetCore.Mvc.Testing
dotnet add package DotNet.Testcontainers
dotnet add package xunit
dotnet add package xunit.runner.console
dotnet add package xunit.runner.visualstudio
dotnet add package coverlet.collector
dotnet add package coverlet.msbuild

cd ..
cd ..

mkdir "$ARCHITECTURE"
cd "$ARCHITECTURE"

dotnet new xunit -n "$PROJECT.$TEST_ARCHITECTURE"
cd "$PROJECT.$TEST_ARCHITECTURE"

mkdir "$DEPENDENCIES"
touch "$DEPENDENCIES/.gitkeep"

mkdir "$CLASSES"
touch "$CLASSES/.gitkeep"

mkdir "$ATTRIBUTES"
touch "$ATTRIBUTES/.gitkeep"

mkdir "$METHODS"
touch "$METHODS/.gitkeep"

mkdir "$INTERFACES"
touch "$INTERFACES/.gitkeep"

dotnet add package Microsoft.NET.Test.Sdk
dotnet add package Microsoft.AspNetCore.Mvc.Testing
dotnet add package xunit
dotnet add package xunit.runner.console
dotnet add package xunit.runner.visualstudio
dotnet add package coverlet.collector
dotnet add package coverlet.msbuild
dotnet add package TngTech.ArchUnitNET
dotnet add package TngTech.ArchUnitNET.xUnit

cd ..
cd ..
cd ..

# --------------------------------------------------
# ********** ADD PROJECTS IN SOLUTION **********
# --------------------------------------------------
dotnet sln "$PROJECT.sln" add "$SRC/$CLEAN_ARCH_ENTITIES/$PROJECT.$CLEAN_ARCH_ENTITIES/$PROJECT.$CLEAN_ARCH_ENTITIES.csproj"
dotnet sln "$PROJECT.sln" add "$SRC/$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS.csproj"
dotnet sln "$PROJECT.sln" add "$SRC/$CLEAN_ARCH_USE_CASES/$PROJECT.$CLEAN_ARCH_USE_CASES/$PROJECT.$CLEAN_ARCH_USE_CASES.csproj"
dotnet sln "$PROJECT.sln" add "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$UI_API/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$UI_API.csproj"
dotnet sln "$PROJECT.sln" add "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$EXTERNAL/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$EXTERNAL.csproj"
dotnet sln "$PROJECT.sln" add "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$DATABASE/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$DATABASE.csproj"
dotnet sln "$PROJECT.sln" add "$TEST/$UNITARY/$PROJECT.$TEST_UNITARY/$PROJECT.$TEST_UNITARY.csproj"
dotnet sln "$PROJECT.sln" add "$TEST/$INTEGRATION/$PROJECT.$TEST_INTEGRATION/$PROJECT.$TEST_INTEGRATION.csproj"
dotnet sln "$PROJECT.sln" add "$TEST/$ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj"

# --------------------------------------------------
# ********** ADD REFERENCES IN PROJECTS **********
# --------------------------------------------------
dotnet add  "$SRC/$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS.csproj" reference "$SRC/$CLEAN_ARCH_ENTITIES/$PROJECT.$CLEAN_ARCH_ENTITIES/$PROJECT.$CLEAN_ARCH_ENTITIES.csproj"
dotnet add  "$SRC/$CLEAN_ARCH_USE_CASES/$PROJECT.$CLEAN_ARCH_USE_CASES/$PROJECT.$CLEAN_ARCH_USE_CASES.csproj" reference "$SRC/$CLEAN_ARCH_ENTITIES/$PROJECT.$CLEAN_ARCH_ENTITIES/$PROJECT.$CLEAN_ARCH_ENTITIES.csproj"
dotnet add  "$SRC/$CLEAN_ARCH_USE_CASES/$PROJECT.$CLEAN_ARCH_USE_CASES/$PROJECT.$CLEAN_ARCH_USE_CASES.csproj" reference "$SRC/$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS.csproj"
dotnet add  "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$UI_API/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$UI_API.csproj" reference "$SRC/$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS.csproj"
dotnet add  "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$DATABASE/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$DATABASE.csproj" reference "$SRC/$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS.csproj"
dotnet add  "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$EXTERNAL/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$EXTERNAL.csproj" reference "$SRC/$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS.csproj"

dotnet add  "$TEST/$UNITARY/$PROJECT.$TEST_UNITARY/$PROJECT.$TEST_UNITARY.csproj" reference "$SRC/$CLEAN_ARCH_ENTITIES/$PROJECT.$CLEAN_ARCH_ENTITIES/$PROJECT.$CLEAN_ARCH_ENTITIES.csproj"
dotnet add  "$TEST/$UNITARY/$PROJECT.$TEST_UNITARY/$PROJECT.$TEST_UNITARY.csproj" reference "$SRC/$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS.csproj"
dotnet add  "$TEST/$UNITARY/$PROJECT.$TEST_UNITARY/$PROJECT.$TEST_UNITARY.csproj" reference "$SRC/$CLEAN_ARCH_USE_CASES/$PROJECT.$CLEAN_ARCH_USE_CASES/$PROJECT.$CLEAN_ARCH_USE_CASES.csproj"

dotnet add  "$TEST/$INTEGRATION/$PROJECT.$TEST_INTEGRATION/$PROJECT.$TEST_INTEGRATION.csproj" reference "$SRC/$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS.csproj"
dotnet add  "$TEST/$INTEGRATION/$PROJECT.$TEST_INTEGRATION/$PROJECT.$TEST_INTEGRATION.csproj" reference "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$UI_API/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$UI_API.csproj"
dotnet add  "$TEST/$INTEGRATION/$PROJECT.$TEST_INTEGRATION/$PROJECT.$TEST_INTEGRATION.csproj" reference "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$DATABASE/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$DATABASE.csproj"
dotnet add  "$TEST/$INTEGRATION/$PROJECT.$TEST_INTEGRATION/$PROJECT.$TEST_INTEGRATION.csproj" reference "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$EXTERNAL/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$EXTERNAL.csproj"

dotnet add  "$TEST/$ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj" reference "$SRC/$CLEAN_ARCH_ENTITIES/$PROJECT.$CLEAN_ARCH_ENTITIES/$PROJECT.$CLEAN_ARCH_ENTITIES.csproj"
dotnet add  "$TEST/$ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj" reference "$SRC/$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS/$PROJECT.$CLEAN_ARCH_ADAPTERS.csproj"
dotnet add  "$TEST/$ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj" reference "$SRC/$CLEAN_ARCH_USE_CASES/$PROJECT.$CLEAN_ARCH_USE_CASES/$PROJECT.$CLEAN_ARCH_USE_CASES.csproj"
dotnet add  "$TEST/$ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj" reference "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$UI_API/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$UI_API.csproj"
dotnet add  "$TEST/$ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj" reference "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$DATABASE/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$DATABASE.csproj"
dotnet add  "$TEST/$ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj" reference "$SRC/$CLEAN_ARCH_FRAMEWORKS/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$EXTERNAL/$PROJECT.$CLEAN_ARCH_FRAMEWORKS.$EXTERNAL.csproj"
