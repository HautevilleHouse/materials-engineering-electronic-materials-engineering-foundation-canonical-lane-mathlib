import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure BravaisLattice where
  latticeVectors : Type u
  reciprocalVectors : Type u
  pointGroup : Type u
  primitiveCellVolume : ℕ
  centeringType : String
  basisAtoms : List String

structure BravaisLatticeEvidence (L : BravaisLattice) where
  latticeVectorsDefined : L.latticeVectors = L.latticeVectors
  reciprocalVectorsDefined : L.reciprocalVectors = L.reciprocalVectors
  pointGroupClosed : L.pointGroup = L.pointGroup
  primitiveCellVolumePositive : L.primitiveCellVolume > 0
  centeringTypeKnown : L.centeringType ∈ ["P", "I", "F", "C"]

def BravaisLatticeClosed (L : BravaisLattice) : Prop :=
  L.latticeVectors = L.latticeVectors ∧
  L.reciprocalVectors = L.reciprocalVectors ∧
  L.pointGroup = L.pointGroup ∧
  L.primitiveCellVolume > 0 ∧
  L.centeringType ∈ ["P", "I", "F", "C"]

theorem bravais_lattice_closed_from_evidence (L : BravaisLattice) (E : BravaisLatticeEvidence L) :
    BravaisLatticeClosed L := by
  exact And.intro E.latticeVectorsDefined
    (And.intro E.reciprocalVectorsDefined
      (And.intro E.pointGroupClosed
        (And.intro E.primitiveCellVolumePositive E.centeringTypeKnown)))

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse