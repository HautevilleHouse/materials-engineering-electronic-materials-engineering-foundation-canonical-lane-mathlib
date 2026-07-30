import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure DopingAndTransportPackage where
  donorLevel : ℝ
  acceptorLevel : ℝ
  carrierMobility : ℝ
  driftDiffusionEquation : Prop
  conductivityFormula : Prop
  hallEffectCoefficient : ℝ

structure DopingAndTransportEvidence (D : DopingAndTransportPackage) where
  driftDiffusionEquationClosed : D.driftDiffusionEquation
  conductivityFormulaClosed : D.conductivityFormula
  hallEffectCoefficientClosed : D.hallEffectCoefficient > 0

def DopingAndTransportClosed (D : DopingAndTransportPackage) : Prop :=
  D.driftDiffusionEquation ∧ D.conductivityFormula ∧ (D.hallEffectCoefficient > 0)

theorem doping_and_transport_closed_from_evidence (D : DopingAndTransportPackage) (E : DopingAndTransportEvidence D) :
    DopingAndTransportClosed D := by
  exact And.intro E.driftDiffusionEquationClosed (And.intro E.conductivityFormulaClosed E.hallEffectCoefficientClosed)

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse