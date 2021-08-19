struct Bijections{P, D}
    info::D
end

"""
    to_natural(b::Bijections, t::Tangent)

Map from a structural `Tangent` to a natural tangent. This transformation shouln't change
the tangent, just its representation.
"""
to_natural(b::Bijections, t::Tangent)

"""
    to_structural(b::Bijections, n)

Map from an natural tangent `n` to a `Tangent`. This transformation shouldn't change the
tangent, just its representation.
"""
to_structural(b::Bijections, n)

# Diagonal
Bijections(::P) where {P<:Diagonal} = Bijections{P, Nothing}(nothing)

to_natural(b::Bijections{<:Diagonal}, t::Tangent) = Diagonal(t.diag)

to_structural(b::Bijections{P}, n::Diagonal) where {P<:Diagonal} = Tangent{P}(diag=n.diag)

# UpperTriangular
Bijections(::P) where {P<:UpperTriangular} = Bijections{P, Nothing}(nothing)

to_natural(b::Bijections{<:UpperTriangular}, t::Tangent) = UpperTriangular(t.data)

function to_structural(b::Bijections{P}, n::UpperTriangular) where {P<:UpperTriangular}
    return Tangent{P}(data=n.data)
end

# LowerTriangular
Bijections(::P) where {P<:LowerTriangular} = Bijections{P, Nothing}(nothing)

to_natural(b::Bijections{<:LowerTriangular}, t::Tangent) = LowerTriangular(t.data)

function to_structural(b::Bijections{P}, n::LowerTriangular) where {P<:LowerTriangular}
    return Tangent{P}(data=n.data)
end

# Symmetric
Bijections(::P) where {P<:Symmetric} = Bijections{P, Nothing}(nothing)

to_natural(b::Bijections{<:Symmetric}, t::Tangent) = Symmetric(t.data)

function to_structural(b::Bijections{P}, n::Symmetric) where {P<:Symmetric}
    return Tangent{P}(data=n.data)
end

# Hermitian
Bijections(::P) where {P<:Hermitian} = Bijections{P, Nothing}(nothing)

to_natural(b::Bijections{<:Hermitian}, t::Tangent) = Hermitian(t.data)

function to_structural(b::Bijections{P}, n::Hermitian) where {P<:Hermitian}
    return Tangent{P}(data=n.data)
end
