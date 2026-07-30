import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure CrystalLattice where
  latticeVectors : Type u
  bravaisType : String
  latticeParity : Prop
  spaceGroup : Type v
  spaceGroupSymmetry : Prop
  unitCellVolume : Prop
  latticeParityTerm : latticeParity
  spaceGroupSymmetryTerm : spaceGroupSymmetry
  unitCellVolumeTerm : unitCellVolume

structure CrystalLatticeEvidence (L : CrystalLattice) where
  latticeParityClosed : L.latticeParity
  spaceGroupSymmetryClosed : L.spaceGroupSymmetry
  unitCellVolumeClosed : L.unitCellVolume

def CrystalLatticeClosed (L : CrystalLattice) : Prop :=
  L.latticeParity ∧ L.spaceGroupSymmetry ∧ L.unitCellVolume

theorem crystal_lattice_closed_from_evidence (L : CrystalLattice) (E : CrystalLatticeEvidence L) :
    CrystalLatticeClosed L := by
  exact And.intro E.latticeParityClosed (And.intro E.spaceGroupSymmetryClosed E.unitCellVolumeClosed)

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse