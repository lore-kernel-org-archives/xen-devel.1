From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 254 (CVE-2017-5753, CVE-2017-5715,
 CVE-2017-5754) - Information leak via side effects of speculative
 execution
Date: Fri, 23 Feb 2018 19:17:03 +0000
Message-ID: <E1epIq7-0001yc-0n@xenbits.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org, xen-users@lists.xen.org, oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
List-Id: xen-devel@lists.xenproject.org

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

 Xen Security Advisory CVE-2017-5753,CVE-2017-5715,CVE-2017-5754 / XSA-254
                                 version 11

        Information leak via side effects of speculative execution

UPDATES IN VERSION 11
=====================

Information provided about migitation for Spectre variant 2.

Mention whether CPU hardware virtualisation extensions are required
in the SP3 mitigations summary table.

An additional patch "x86: fix GET_STACK_END" is required to fix a
possible build failure in the PTI patches.  README.pti updated
accordingly.

ISSUE DESCRIPTION
=================

Processors give the illusion of a sequence of instructions executed
one-by-one.  However, in order to most efficiently use cpu resources,
modern superscalar processors actually begin executing many
instructions in parallel.  In cases where instructions depend on the
result of previous instructions or checks which have not yet
completed, execution happens based on guesses about what the outcome
will be.  If the guess is correct, execution has been sped up.  If the
guess is incorrect, partially-executed instructions are cancelled and
architectural state changes (to registers, memory, and so on)
reverted; but the whole process is no slower than if no guess had been
made at all.  This is sometimes called "speculative execution".

Unfortunately, although architectural state is rolled back, there are
other side effects, such as changes to TLB or cache state, which are
not rolled back.  These side effects can subsequently be detected by
an attacker to determine information about what happened during the
speculative execution phase.  If an attacker can cause speculative
execution to access sensitive memory areas, they may be able to infer
what that sensitive memory contained.

Furthermore, these guesses can often be 'poisoned', such that attacker
can cause logic to reliably 'guess' the way the attacker chooses.
This advisory discusses three ways to cause speculative execution to
access sensitive memory areas (named here according to the
discoverer's naming scheme):

"Bounds-check bypass" (aka SP1, "Variant 1", Spectre CVE-2017-5753):
Poison the branch predictor, such that victim code is speculatively
executed past boundary and security checks.  This would allow an
attacker to, for instance, cause speculative code in the normal
hypercall / emulation path to execute with wild array indexes.

"Branch Target Injection" (aka SP2, "Variant 2", Spectre CVE-2017-5715):
Poison the branch predictor.  Well-abstracted code often involves
calling function pointers via indirect branches; reading these
function pointers may involve a (slow) memory access, so the CPU
attempts to guess where indirect branches will lead.  Poisoning this
enables an attacker to speculatively branch to any code that is
executable by the victim (eg, anywhere in the hypervisor).

"Rogue Data Load" (aka SP3, "Variant 3", Meltdown, CVE-2017-5754):
On some processors, certain pagetable permission checks only happen
when the instruction is retired; effectively meaning that speculative
execution is not subject to pagetable permission checks.  On such
processors, an attacker can speculatively execute arbitrary code in
userspace with, effectively, the highest privilege level.

More information is available here:
  https://meltdownattack.com/
  https://spectreattack.com/
  https://googleprojectzero.blogspot.co.uk/2018/01/reading-privileged-memory-with-side.html

Additional Xen-specific background:

Xen hypervisors on most systems map all of physical RAM, so code
speculatively executed in a hypervisor context can read all of system
RAM.

When running PV guests, the guest and the hypervisor share the address
space; guest kernels run in a lower privilege level, and Xen runs in
the highest privilege level.  (x86 HVM and PVH guests, and ARM guests,
run in a separate address space to the hypervisor.)  However, only
64-bit PV guests can generate addresses large enough to point to
hypervisor memory.

IMPACT
======

Xen guests may be able to infer the contents of arbitrary host memory,
including memory assigned to other guests.

An attacker's choice of code to speculatively execute (and thus the
ease of extracting useful information) goes up with the numbers.  For
SP1, an attacker is limited to windows of code after bound checks of
user-supplied indexes.  For SP2, the attacker will in many cases will
be limited to executing arbitrary pre-existing code inside of Xen.
For SP3 (and other cases for SP2), an attacker can write arbitrary
code to speculatively execute.

Additionally, in general, attacks within a guest (from guest user to
guest kernel) will be the same as on real hardware.  Consult your
operating system provider for more information.

NOTE ON TIMING
==============

This vulnerability was originally scheduled to be made public on 9
January.  It was accelerated at the request of the discloser due to
one of the issues being made public.

VULNERABLE SYSTEMS
==================

Systems running all versions of Xen are affected.

For SP1 and SP2, both Intel and AMD are vulnerable.  Vulnerability of
ARM processors to SP1 and SP2 varies by model and manufacturer.  ARM
has information on affected models on the following website:
   https://developer.arm.com/support/security-update

For SP3, only Intel processors are vulnerable.  (The hypervisor cannot
be attacked using SP3 on any ARM processors, even those that are
listed as affected by SP3.)

Furthermore, only 64-bit PV guests can exploit SP3 against Xen.  PVH,
HVM, and 32-bit PV guests cannot exploit SP3.

MITIGATION
==========

There is no mitigation for SP1.

SP2 can be mitigated by a combination of new microcode and compiler
and hypervisor changes.  See Resolution below.

SP3 can be mitigated by page-table isolation ("PTI").
See Resolution below.

SP3 can, alternatively, be mitigated by running guests in HVM or PVH
mode.  (Within-guest attacks are still possible unless the guest OS
has also been updated with an SP3 mitigation series such as
KPTI/Kaiser.)

For guests with legacy PV kernels which cannot be run in HVM or PVH
mode directly, we have developed two "shim" hypervisors that allow PV
guests to run in HVM mode or PVH mode.  This prevents attacks on the
host, but it leaves the guest vulnerable to Meltdown attacks by its
own unprivileged processes, even if the guest OS has KPTI or similar
Meltdown mitigation.

The HVM shim (codenamed "Vixen") is available now, as is the PVH shim
(codenamed "Comet") for Xen 4.10 and Xen 4.8.   Please read
README.which-shim to determine which shim is suitable for you.


RESOLUTION
==========

These are hardware bugs, so technically speaking they cannot be
properly fixed in software.  However, it is possible in many cases to
provide patches to software to work around the problems.


There is no available resolution for SP1.  A solution may be available
in the future.


SP2 can be mitigated on x86 by combinations of new CPU microcode and
new hypervisor code.  The required hypervisor changes for Xen 4.6,
4.7, 4.8, 4.9 and 4.10 are detailed in the attached README.bti.

For AMD hardware, and for Intel hardware pre-dating the Skylake
microarchitecture, the hypervisor changes alone are sufficient to
mitigate the issue for Xen itself.  No microcode updates are required.
For the Intel Skylake microarchitecture the hypervisor changes are
insufficient to protect Xen without appropriate new microcode.
Microcode updates are required in any event to guard against one guest
attacking another.

Consult Intel, your hardware vendor, or your dom0 OS distributor for the
microcode updates.

Additionally, compiler support for `indirect thunk' is required.
Again, without appropriate compiler support, the hypervisor patches
are insufficient.  Consult your compiler distributor.


SP2 is mitigated on ARM 32-bit by a set of changes to the hypervisor
alone.  SP2 can be mitigated on ARM 64-bit (aarch64) by a combination
of new PSCI firmware and new hypervisor code.  The required hypervisor
changes for Xen 4.6, 4.7, 4.8, 4.9 and 4.10 are detailed in the
attached README.bti.

For ARM 32-bit these changes are complete.

For ARM 64-bit the hypervisor changes are still in development and are
expected to be available soon.


SP3 can be mitigated by page-table isolation ("PTI").

We have a "stage 1" implementation.  It allows 64-bit PV guests to be
run natively while restricting what can be accessed via SP3 to the Xen
stack of the current pcpu (which may contain remnants of information
from other guests, but should be much more difficult to attack
reliably).

Unfortunately these "stage 1" patches incur a non-negligible
performance overhead; about equivalent to the "PV shim" approaches
above.  Moving to plain HVM or PVH guests is recommended where
possible.  For more information on that, see below.

Patches for the "stage-1" PTI implementation are available in the Xen
staging-NN branches for each Xen revision.  See README.pti for
specific revisons.


SP3 MITIGATION OPTIONS SUMMARY TABLE FOR 64-bit X86 PV GUESTS
=============================================================

Everything in this section applies to 64-bit PV x86 guests only.

             Xen PTI      Use PVH      Use HVM     PVH shim     HVM shim
             "stage 1"                             "Comet"      "Vixen"

How to use   README.pti  type="pvh"  type="hvm"  README.comet  README.vixen

Guest          All        Linux 4.11+  Most[4]     All         All
support                ?unikernels?[3]

Xen            4.6+      4.10+         All         4.10, 4.8   All
 versions                4.8-comet[1]

Testing       Limited    4.10: Good    Very good   Moderate    Very good
 status       Very new   4.8: Moderate

Performance    Fair        Excellent   Varies[4]   Fair        Fair

Hypervisor     Needed      No need     No need     No need     No need
  changes

SP3 guest   Substantially  Protected   Protected   Protected   Protected
 to host      protected

SP3 within    Protected    Guest       Guest       Vulnerable  Vulnerable
 guest                     patches     patches      [5]         [5]

SP3 from      Protected    n/a; vuln.  n/a; vuln.  n/a; vuln.  n/a; vuln.
 dom0 user                  [9]         [9]         [9]         [9]

Device model   No dm       No dm       Qemu        No dm       Qemu

Config change  None      type="pvh"  type="hvm"/  type="pvh"   Tool to rewrite
                                    builder="hvm"  pvshim=1    Needs "sidecar"

Within-guest   None       Should be    Disks+net   None        None
 changes?                  none        may change

CPU hw virt   Not needed  Needed       Needed      Needed      Needed
feature (VT-x)

Extra RAM use  V. slight   None       ~9Mb/guest >=~20Mb/guest >=~29Mb/guest

Migration      OK          OK          OK[4]       OK          Unsupported[2]
Guest mem adj  OK          OK          OK          Broken[2]   Unsupported[2]
vcpu hotplug   OK          OK          OK          OK          Unsupported[2]

Solution      Indefinite  Indefinite  Indefinite  Indefinite  Limited
 lifetime                                           [7]        [6]

[1] PVH is supported in Xen 4.8 only with the 4.8 "Comet" security
release branch.

[2] Some features in PVH/HVM shim guests are not inherently broken,
but buggy in the currently available versions.  These may be fixed in
future proper releases of the same feature.

[3] Most unikernels have Xen support based on a version of mini-os.
mini-os master can boot PVH.  But this is very recent.

[4] Some guests which have support for Xen PV fail to boot properly in
Xen HVM.  Some such guests can made to boot HVM by disabling the
PV-on-HVM support entirely in the guest or in Xen; in that case the
guest may work but IO performance will be poor.  Some PV-supporting
guests can boot as HVM, with PV drivers, but fail when migrated.

[5] The Comet and Vixen shim hypervisors direct-map all of their
"physical" memory, and that direct-map can be accessed using Meltdown
by unprivileged processes in the guest.  So the guest is vulnerable to
within-guest Meltdown attacks and the guest operating system cannot
protect itself.

[6] "Vixen" HVM shim is not expected to be incorporated in future Xen
stable releases.  At some point, support for it will be withdrawn.
However, HVM shim functionality may be available in a future Xen 4.10
stable point release and would then probably be useable with the
existing conversion script provided in this advisory.

[7] The lifetime of the special Comet branches is limited, but we will
not desupport them until some time after the same functionality is in
appropriate Xen stable point releases.

[8] The 64-bit x86 PV guest ABI precludes a guest from mapping its
kernel and userspace in the same address space.  So these guests are
inherently immune to within-guest Meltdown attacks, without
within-guest patching.  (This applies to 64-bit x86 PV guests only.)

[9] It is not possible to run dom0 as HVM.  dom0 PVH is a planned
enhancement which is not yet available even in preview form.


ATTACHMENTS
===========

$ sha256sum xsa254*/*
c5f2d8f87169edc9be890416a4d261cfc11d9f8d898d83a8922360b210676015  xsa254/README.bti
1cba14ff83844d001d6c8a74afc3f764f49182cc7a06bb4463548450ac96cc2f  xsa254/README.comet
208453583ee3c7bb427aa2f70fc5fdc687ba084341129624e511eb6c064fb801  xsa254/README.pti
3ef42381879befc84aa78b67d3a9b7b0cd862a2ffa445810466e90be6c6a5e86  xsa254/README.vixen
7e816160c1c1d1cd93ec3c3dd9753c8f3957fefe86b7aa967e9e77833828f849  xsa254/README.which-shim
1d2098ad3890a5be49444560406f8f271c716e9f80e7dfe11ff5c818277f33f8  xsa254/pvshim-converter.pl
$


NOTE ON LACK OF EMBARGO
=======================

The timetable and process were set by the discloser.

After the intensive initial response period for these vulnerabilities
is over, we will prepare and publish a full timeline, as we have done
in a handful of other cases of significant public interest where we
saw opportunities for process improvement.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCAAGBQJakGiYAAoJEIP+FMlX6CvZTo0H/jmtssoZhVRYDbi5UP07eWla
ZefMHnwagNUeMEf4rZgWoGSuftiRPMXH73V4r02SDfIauC/7qTPJTxg3ozBLP6RK
d3bQtdb+Hr/i5mtYnD/ubjmg+VgB04Q4CF5Ikgc8Yx8qiUuSxo5HTHQV72a175eZ
ze6xRBvUSt4hw25X7kNGYpkpN1Hoyydv2/pHPdkuAfP90ZTlxPq+UWDwa37Z55ON
E/hVjBcvsnpvmgfztablVz5kFA+6O1aXzFuouNCQz0x62necQCrRgz9T173dlB1+
uQlvNN8gXV513ePaYjVP3B7c7P3QjMszX4WlK498KZTwo4ck+h0XtYdLtPAAZrg=
=2SNf
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa254/README.bti"
Content-Disposition: attachment; filename="xsa254/README.bti"
Content-Transfer-Encoding: base64

ICAgICAgICAgICAgICAgICAgICAgIEJyYW5jaCBUYXJnZXQgSW5qZWN0aW9u
IChCVEkpCiAgICAgICAgICAgICAgICAgICAgICA9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09CgpTdW1tYXJ5Ci0tLS0tLS0KClRoaXMgUkVBRE1F
IGdpdmVzIHJlZmVyZW5jZXMgZm9yIHRoZSBtaXRpZ2F0aW9uIGZvciBTcGVj
dHJlIHYyLgoKCkRldGVybWluaW5nIHdoZXRoZXIgdGhlIG1pZ2l0YXRpb24g
aXMgZW5hYmxlZCBvbiB4ODYKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKSW4gZ2VuZXJhbCwgY29tcGls
ZXIgYW5kIENQVSBtaWNyb2NvZGUgdXBkYXRlcyBhcmUgYWxzbyByZXF1aXJl
ZC4KCldoZW4gdGhlIG1pdGlnYXRpb24gaXMgZnVsbHkgYWN0aXZlLCBvbiBB
TUQgaGFyZHdhcmUsClhlbiBwcmludHMgYXQgbGVhc3QgdGhlIGZvbGxvd2lu
ZyBtZXNzYWdlczoKCiAgU3BlY3VsYXRpdmUgbWl0aWdhdGlvbiBmYWNpbGl0
aWVzOgogICAgQ29tcGlsZWQtaW4gc3VwcG9ydDogSU5ESVJFQ1RfVEhVTksK
ICBCVEkgbWl0aWdhdGlvbnM6IFRodW5rIExGRU5DRQoKT24gcHJlLVNreWxh
a2UgSW50ZWwgaGFyZHdhcmU6CgogIFNwZWN1bGF0aXZlIG1pdGlnYXRpb24g
ZmFjaWxpdGllczoKICAgIENvbXBpbGVkLWluIHN1cHBvcnQ6IElORElSRUNU
X1RIVU5LCiAgQlRJIG1pdGlnYXRpb25zOiBUaHVuayBSRVRQT0xJTkUKCk9u
IFNreWxha2UgKG9yIGxhdGVyKSBJbnRlbCBoYXJkd2FyZToKCiAgU3BlY3Vs
YXRpdmUgbWl0aWdhdGlvbiBmYWNpbGl0aWVzOgogICAgSGFyZHdhcmUgZmVh
dHVyZXM6IElCUlMvSUJQQiBTVElCUAogICAgQ29tcGlsZWQtaW4gc3VwcG9y
dDogSU5ESVJFQ1RfVEhVTksKICBCVEkgbWl0aWdhdGlvbnM6IFRodW5rIEpN
UCwgT3RoZXJzOiBJQlJTKyBJQlBCCgpOb3RlIGhvd2V2ZXIgdGhhdCBvbiBy
ZWxlYXNlIGJ1aWxkcyBub25lIG9mIHRoZXNlIG1lc3NhZ2VzIGFyZSB2aXNp
YmxlCmJ5IGRlZmF1bHQ7ICJsb2dsdmw9YWxsIiBuZWVkcyB0byBiZSBwYXNz
ZWQgdG8gc2VlIGFsbCBvZiB0aGVtLgpIb3dldmVyIHByb2R1Y3Rpb24gc3lz
dGVtcyBzaG91bGQgbm90IGJlIHJ1biB3aXRoICJsb2dsdmw9YWxsIiBhcyB0
aGF0CmV4cG9zZXMgYSBsb2cgc3BldyAoZGVuaWFsIG9mIHNlcnZpY2UpIHZ1
bG5lcmFiaWxpdHkgdG8gZ3Vlc3RzLgoKImxvZ2x2bD1pbmZvIiAod2hpY2gg
aXMgcGVyaGFwcyBiZXR0ZXIpIGlzIHN1ZmZpY2llbnQgdG8gc2VlCiAgQlRJ
IG1pdGlnYXRpb25zOiAuLi4KbGlzdGluZyB0aGUgbWl0aWdhdGlvbnMgWGVu
IGFjdHVhbGx5IHVzZXMuCgpJZiB5b3UgYXJlIG5vdCBzdXJlIHdoZXRoZXIg
eW91ciBJbnRlbCBDUFUgaXMgcHJlLSBvciBwb3N0LVNreWxha2UsCnBsZWFz
ZSBsb29rIHlvdXIgY3B1IG1vZGVsIG51bWJlciAocHJpbnRlZCBpbiAvcHJv
Yy9jcHVpbmZvIG9uIExpbnV4KQp1cCBvbiBXaWtpcGVkaWEuCgoKUHJlY2lz
ZSBnaXQgY29tbWl0cwotLS0tLS0tLS0tLS0tLS0tLS0tCgo0LjEwOgoKMzE4
MTQ3MmE1Y2E0NWFlNWU3N2FiYmNmMDI0ZDAyNWQ5YmE3OWNlZCB4ODYvaWRs
ZTogQ2xlYXIgU1BFQ19DVFJMIHdoaWxlIGlkbGUKNTY0NDUxNDA1MGI5YWU3
ZDc1Y2RkOTVmZDA3OTEyYjk5MzBjYWUwOCB4ODYvY3B1aWQ6IE9mZmVyIElu
ZGlyZWN0IEJyYW5jaCBDb250cm9scyB0byBndWVzdHMKZGIxMjc0M2YyZDI0
ZmM1OWQ1YjljZWZjMTVlYjNkNTZjZGFmNTQ5ZCB4ODYvY3R4dDogSXNzdWUg
YSBzcGVjdWxhdGlvbiBiYXJyaWVyIGJldHdlZW4gdmNwdSBjb250ZXh0cwpi
YzBlNTk5YTgzZDE3ZjA2ZWM3ZGExNzA4NzIxY2VkZTJkZjgyNzRlIHg4Ni9i
b290OiBDYWxjdWxhdGUgdGhlIG1vc3QgYXBwcm9wcmlhdGUgQlRJIG1pdGln
YXRpb24gdG8gdXNlCmZjODE5NDZjZWFhZTJjMjdmY2UyYmEwZjNmMjlmYTlk
ZjM5NzU5NTEgeDg2L2VudHJ5OiBBdm9pZCB1c2luZyBhbHRlcm5hdGl2ZXMg
aW4gTk1JLyNNQyBwYXRocwpjZTdkN2MwMTY4NTU2OWQ5ZmYxZjk3MWMwZjA2
MjI1NzNiZmU4YmYzIHg4Ni9lbnRyeTogT3JnYW5pc2UgdGhlIGNsb2JiZXJp
bmcgb2YgdGhlIFJTQi9SQVMgb24gZW50cnkgdG8gWGVuCmE2OTVmOGRjZTdj
M2YxMzdmNjFjOGM4YTg4MGIyNGIxYjRjZjMxOWMgeDg2L2VudHJ5OiBPcmdh
bmlzZSB0aGUgdXNlIG9mIE1TUl9TUEVDX0NUUkwgYXQgZWFjaCBlbnRyeS9l
eGl0IHBvaW50CjkyZWZiZTg2NTgxM2Q4NDg3M2EwZTcyNjJiMWZhNDE0ODQy
MzA2YjYgeDg2L2h2bTogUGVybWl0IGd1ZXN0cyBkaXJlY3QgYWNjZXNzIHRv
IE1TUl97U1BFQ19DVFJMLFBSRURfQ01EfQo4YmFiYTg3NGQ2Yzc2YzFkNmRk
NjliMWQ5YWEwNmFiZGMzNDRhMWY1IHg4Ni9taWdyYXRlOiBNb3ZlIE1TUl9T
UEVDX0NUUkwgb24gbWlncmF0ZQo3OTg5MWVmOTQ0MmFjYjk5OGYzNTRiOTY5
ZTczMDJkODEyNDVhYjBiIHg4Ni9tc3I6IEVtdWxhdGlvbiBvZiBNU1Jfe1NQ
RUNfQ1RSTCxQUkVEX0NNRH0gZm9yIGd1ZXN0cwo2NDFjMTFlZjI5M2M3ZjNh
NThjMTg1NjEzODgzNWMwNmUwOWQ2YjA3IHg4Ni9jcHVpZDogSGFuZGxpbmcg
b2YgSUJSUy9JQlBCLCBTVElCUCBhbmQgSUJSUyBmb3IgZ3Vlc3RzCjY1ZWU2
ZTA0M2E2ZGM2MWJlY2U3NWE5ZGZlMjRjN2VlNzBjNjU5N2MgeDg2L2NtZGxp
bmU6IEludHJvZHVjZSBhIGNvbW1hbmQgbGluZSBvcHRpb24gdG8gZGlzYWJs
ZSBJQlJTL0lCUEIsIFNUSUJQIGFuZCBJQlBCCjEyOTg4MGRkOGYyOGJjNzI4
ZjkzZTNhYWQ0Njc1NjIyYzFlZTJhYWQgeDg2L2ZlYXR1cmU6IERlZmluaXRp
b25zIGZvciBJbmRpcmVjdCBCcmFuY2ggQ29udHJvbHMKYzUxMzI0NGQ4ZTVi
OGFhMDMyNmM2ZjJkNWZiMjM4MjgxMWM5N2Q2ZCB4ODY6IEludHJvZHVjZSBh
bHRlcm5hdGl2ZSBpbmRpcmVjdCB0aHVua3MKMGUxMmMyYzg4MWFhMTIwMTZi
YjY1OWFiMWViNGM3Mjg5MjQ0YjNlNyB4ODYvYW1kOiBUcnkgdG8gc2V0IGxm
ZW5jZSBhcyBiZWluZyBEaXNwYXRjaCBTZXJpYWxpc2luZwo2YWFmMzUzZjJl
Y2JlOGFlNTdlMTY4MTJhNmQ3NGE0ZjA4OWRlZjNhIHg4Ni9ib290OiBSZXBv
cnQgZGV0YWlscyBvZiBzcGVjdWxhdGl2ZSBtaXRpZ2F0aW9ucwozMmJhYmZj
MTlhZDNhMzEyM2Y4ZWQ0NDY2ZGYzYzc5NDkyYTIyMTJiIHg4NjogU3VwcG9y
dCBpbmRpcmVjdCB0aHVua3MgZnJvbSBhc3NlbWJseSBjb2RlCjQ3YmJjYjJk
ZDEyOTFkNjEwNjJmZTU4ZGE4MDcwMTA2MzFmZTFiM2EgeDg2OiBTdXBwb3J0
IGNvbXBpbGluZyB3aXRoIGluZGlyZWN0IGJyYW5jaCB0aHVua3MKODc0M2Zj
MmVmN2QxMDcxMDRjMTdiNzczZWFkZWUxNWZlZmE2NGU1MyBjb21tb24vd2Fp
dDogQ2xhcmlmaWNhdGlvbnMgdG8gd2FpdCBpbmZyYXN0cnVjdHVyZQoxODMw
YjIwYjZiODNiZTM4NzM4Nzg0ZWExNjJkNjJmY2Y4NWYzMTc4IHg4Ni9lbnRy
eTogRXJhc2UgZ3Vlc3QgR1BSIHN0YXRlIG9uIGVudHJ5IHRvIFhlbgphYjk1
Y2IwZDk0OGZkYzlmY2RhMjE1ZmVjMDUyNmFjOTAyMzQwYjE0IHg4Ni9odm06
IFVzZSBTQVZFX0FMTCB0byBjb25zdHJ1Y3QgdGhlIGNwdV91c2VyX3JlZ3Mg
ZnJhbWUgYWZ0ZXIgVk1FeGl0CmQwMmVmM2QyNzQ4NWUxNDI5YWM0ODBjY2E3
OGFiMzYzNjM4N2RmMjMgeDg2L2VudHJ5OiBSZWFycmFuZ2UgUkVTVE9SRV9B
TEwgdG8gcmVzdG9yZSByZWdpc3RlciBpbiBzdGFjayBvcmRlcgplMzJmODE0
MTYwYzk1MDk0ZGE4M2ZiYzgxM2I0NWVjYTQyZDUzOTdhIHg4NjogSW50cm9k
dWNlIGEgY29tbW9uIGNwdWlkX3BvbGljeV91cGRhdGVkKCkKYzUzNGFiNGU5
NDBhZTNmYmRkZjBiNDg0MGMzNTQ5YzAzNjU0OTIxZiB4ODYvaHZtOiBSZW5h
bWUgdXBkYXRlX2d1ZXN0X3ZlbmRvcigpIGNhbGxiYWNrIHRvIGNwdWlkX3Bv
bGljeV9jaGFuZ2VkKCkKYmUzMTM4YjZmNjU5NTUxOTZkNjdjMWQ1NGFlYTNk
NmEzYmYzMzkzNCB4ODYvYWx0OiBJbnRyb2R1Y2UgQUxURVJOQVRJVkV7LF8y
fSBtYWNyb3MKNzkwMTJlYWQ5MzdmMDUzM2VjNTkxYzRlY2U5MjVlNGQyMzU2
ODg3NCB4ODYvYWx0OiBCcmVhayBvdXQgYWx0ZXJuYXRpdmUtYXNtIGludG8g
YSBzZXBhcmF0ZSBoZWFkZXIgZmlsZQpiYmQwOTNjNTAzM2Q4N2MwMDQzY2Y5
MGFhNzgyZWZkYzE0MWRjMGU3IHhlbi9hcm0zMjogZW50cnk6IERvY3VtZW50
IHRoZSBwdXJwb3NlIG9mIHIxMSBpbiB0aGUgdHJhcHMgaGFuZGxlcgphNjlh
OGI1ZmRjOWNjOTBhYTRmYWY1MjJjMzU1YWJkODQ5ZjExMDAxIHhlbi9hcm0z
MjogSW52YWxpZGF0ZSBpY2FjaGUgb24gZ3Vlc3QgZXhpc3QgZm9yIENvcnRl
eC1BMTUKZjE2N2ViZjZiMzNjNGRiZGIwMTM1YzM1MGMwZDkyNzk4MDE5MWFj
NSB4ZW4vYXJtMzI6IEludmFsaWRhdGUgQlRCIG9uIGd1ZXN0IGV4aXQgZm9y
IENvcnRleCBBMTcgYW5kIDEyCmM0YzAxODc4MzliYWNhZGM4MmE1NzI5Y2Vh
NzM5ZThjNDg1ZjZjNjAgeGVuL2FybTMyOiBBZGQgc2tlbGV0b24gdG8gaGFy
ZGVuIGJyYW5jaCBwcmVkaWN0b3IgYWxpYXNpbmcgYXR0YWNrcwoxOWFkOGE3
Mjg3Mjk4ZjcwMWI1NTdlNTVlNGJlNjg5YTcwMjE5NGMwIHhlbi9hcm0zMjog
ZW50cnk6IEFkZCBtaXNzaW5nIHRyYXBfcmVzZXQgZW50cnkKM2NhZjMyYzQ3
MGYyZjdlYjM0NTJjOGE2MWQ2MjI0ZDEwZTU2ZjlhMyB4ZW4vYXJtMzI6IEFk
ZCBtaXNzaW5nIE1JRFIgdmFsdWVzIGZvciBDb3J0ZXgtQTE3IGFuZCBBMTIK
ZGY3YmU5NGYyNjc1N2E3Nzc0N2JmNGZiZmI4NGJiZTJhM2RhM2I0ZiB4ZW4v
YXJtMzI6IGVudHJ5OiBDb25zb2xpZGF0ZSBERUZJTkVfVFJBUF9FTlRSWV8q
IG1hY3Jvcwo3MjhmYWRiNTg2YTJhMTRhMjQ0ZGFiZDcwNDYzYmNjMTY1NGVj
Yzg1IHhlbi9hcm06IGNwdWVycmF0YTogUmVtb3ZlIHBlcmNwdS5oIGluY2x1
ZGUKOTI4MTEyOTAwZTViNGE5MmNjZWJiMmVlYTExNjY1ZmQ3NmFhMGYwZCB4
ZW4vYXJtNjQ6IEltcGxlbWVudCBicmFuY2ggcHJlZGljdG9yIGhhcmRlbmlu
ZyBmb3IgYWZmZWN0ZWQgQ29ydGV4LUEgQ1BVcwpjYWU2ZTE1NzJmMzlhMTkw
NmJlMGZjM2JkYWY0OWZlNTE0YzZhOWMwIHhlbi9hcm02NDogQWRkIHNrZWxl
dG9uIHRvIGhhcmRlbiB0aGUgYnJhbmNoIHByZWRpY3RvciBhbGlhc2luZyBh
dHRhY2tzCmQxZjQyODNhMWQ4NDA1YTQ4MGI0MTIxZTFlZmNmYWVjOGJiZGJm
ZmEgeGVuL2FybTogY3B1ZXJyYXRhOiBBZGQgTUlEUl9BTExfVkVSU0lPTlMK
MGY3YTRmYWFmYjJkNzk5MjBjYzYzNDU3Y2ZjYTNlMDM5OTBhZjRjYyB4ZW4v
YXJtNjQ6IEFkZCBtaXNzaW5nIE1JRFIgdmFsdWVzIGZvciBDb3J0ZXgtQTcy
LCBBNzMgYW5kIEE3NQpiODI5ZDQyODI5YzFmZjYyNmEwMjc1NmFjYWU0ZGQ0
ODJmYzIwYzlhIHhlbi9hcm06IEludHJvZHVjZSBlbmFibGUgY2FsbGJhY2sg
dG8gZW5hYmxlIGEgY2FwYWJpbGl0aWVzIG9uIGVhY2ggb25saW5lIENQVQo5
MTBkZDAwNWRhMjBmMjdmMzQxNWI3ZWNjZGY0MzY4NzQ5ODk1MDZiIHg4Ni9l
bnRyeTogUmVtb3ZlIHN1cHBvcnQgZm9yIHBhcnRpYWwgY3B1X3VzZXJfcmVn
cyBmcmFtZXMKCjQuOToKCjg4ZmJhYmM0OTE1OGIwYjg1ODI0OGZhMTI0ZWY1
OTBjNWRmNzc4MmYgeDg2L1BWOiBjb3JyZWN0bHkgY291bnQgTVNScyB0byBt
aWdyYXRlCjdkNWY4YjM2YmUxNDljMTY5MjE1YjNhZmUyMGUxY2ZiYTg0NTYx
NzAgeDg2L2lkbGU6IENsZWFyIFNQRUNfQ1RSTCB3aGlsZSBpZGxlCjU5OTk5
YWVjZGFkNmZjNGY0NDY5NThiNjVlMjg2OWUwMjUzMGIxYTYgeDg2L2NwdWlk
OiBPZmZlciBJbmRpcmVjdCBCcmFuY2ggQ29udHJvbHMgdG8gZ3Vlc3RzCjc5
ZDUxOTc5NTIzMTExMGYyMjJhMjQzNzllM2E0MzI0M2RiNmU1NWYgeDg2L2N0
eHQ6IElzc3VlIGEgc3BlY3VsYXRpb24gYmFycmllciBiZXR3ZWVuIHZjcHUg
Y29udGV4dHMKNjhjNzZkNzFlMDQ1YTRlODUxMDcwNDI3MGZjNTcwZmI5ZDc5
N2RmZCB4ODYvYm9vdDogQ2FsY3VsYXRlIHRoZSBtb3N0IGFwcHJvcHJpYXRl
IEJUSSBtaXRpZ2F0aW9uIHRvIHVzZQpiZGEzMjgzNjNmZmVmNThjMzQ3NTEw
NWU5MzAxNmZjYWM0ODZjNWQ1IHg4Ni9lbnRyeTogQXZvaWQgdXNpbmcgYWx0
ZXJuYXRpdmVzIGluIE5NSS8jTUMgcGF0aHMKYTI0Yjc1NTNmOTI1MTdiM2Q4
MWNhZDFhZDQ3OThlZjc0YjQyMDU1YiB4ODYvZW50cnk6IE9yZ2FuaXNlIHRo
ZSBjbG9iYmVyaW5nIG9mIHRoZSBSU0IvUkFTIG9uIGVudHJ5IHRvIFhlbgox
M2EzMGJhNTRjYWExYjMzZjcwNzEzNzI3OWQyN2Q1Y2QzOWU4ODQ0IHg4Ni9l
bnRyeTogT3JnYW5pc2UgdGhlIHVzZSBvZiBNU1JfU1BFQ19DVFJMIGF0IGVh
Y2ggZW50cnkvZXhpdCBwb2ludAowMTc3YmY1ZDI1YzY2ZTcwMGUxNTAyNDkx
M2EzYmM3MWM3Y2Y1MDdkIHg4Ni9odm06IFBlcm1pdCBndWVzdHMgZGlyZWN0
IGFjY2VzcyB0byBNU1Jfe1NQRUNfQ1RSTCxQUkVEX0NNRH0KMmZkZWU2MGVj
MTJjMjM4MzU4YmZmMjA5Mzc4YzdkOTFlNDgxN2ZhNyB4ODYvbWlncmF0ZTog
TW92ZSBNU1JfU1BFQ19DVFJMIG9uIG1pZ3JhdGUKZTU3ZDRkMDQzYjBkZjhm
OTk1M2IzZDIxMWZlYWNjM2E1NDQwMTgxNyB4ODYvbXNyOiBFbXVsYXRpb24g
b2YgTVNSX3tTUEVDX0NUUkwsUFJFRF9DTUR9IGZvciBndWVzdHMKMWRjZmQz
OTUxOTk5ZTg3NWY5MTFmYjA1MTMzOTE3NzRhZjhkNWZiNCB4ODYvY3B1aWQ6
IEhhbmRsaW5nIG9mIElCUlMvSUJQQiwgU1RJQlAgYW5kIElCUlMgZm9yIGd1
ZXN0cwo3NjQ4MDQ5MzhjNjliNjllMWVlMzY5YTliNTQ4MGU4OWIxOGU0NTNh
IHg4Ni9jbWRsaW5lOiBJbnRyb2R1Y2UgYSBjb21tYW5kIGxpbmUgb3B0aW9u
IHRvIGRpc2FibGUgSUJSUy9JQlBCLCBTVElCUCBhbmQgSUJQQgo2MDI2MzNl
YjczZWQyZDk5MThkYTJkYWU3YmViZjI3OWEwNTdlYTIwIHg4Ni9mZWF0dXJl
OiBEZWZpbml0aW9ucyBmb3IgSW5kaXJlY3QgQnJhbmNoIENvbnRyb2xzCjZm
ZWY0NmQ2ZmI5ZmE0NTc4Yjk3ZjhkNmEwY2IyNDBhYmVjNDg1ODcgeDg2OiBJ
bnRyb2R1Y2UgYWx0ZXJuYXRpdmUgaW5kaXJlY3QgdGh1bmtzCjMwYjk5Mjk5
ZDZlYTBjNTAwOGY1ZTRmNDFlYjFmNDhlMWFlNTY2Y2UgeDg2L2FtZDogVHJ5
IHRvIHNldCBsZmVuY2UgYXMgYmVpbmcgRGlzcGF0Y2ggU2VyaWFsaXNpbmcK
NDQ3ZGNlODkxZjA1YzA1ODVlYzY3YzQ3ZWQyMmViMmUwNzNjZTBhYiB4ODYv
Ym9vdDogUmVwb3J0IGRldGFpbHMgb2Ygc3BlY3VsYXRpdmUgbWl0aWdhdGlv
bnMKMjlkZjhhNWM0ZDYyNzFkNTIyMzFiYmVjYzUyYTdjM2ViMzhhYWMxMyB4
ODY6IFN1cHBvcnQgaW5kaXJlY3QgdGh1bmtzIGZyb20gYXNzZW1ibHkgY29k
ZQo2NDAzYjUwNDhkNmYxYWM1YmM4NTI0OTM3Yjc5NzVmOTZiNTk3MDQ2IHg4
NjogU3VwcG9ydCBjb21waWxpbmcgd2l0aCBpbmRpcmVjdCBicmFuY2ggdGh1
bmtzCjYyOGI2YWYyNGY5NzI3ZjIwMWY2NzdhNGFkOTgxMDRjMDBjYzc2YzEg
Y29tbW9uL3dhaXQ6IENsYXJpZmljYXRpb25zIHRvIHdhaXQgaW5mcmFzdHJ1
Y3R1cmUKMjM3YTU4YjFkMGMzNTIwMWUxZTllZDdjMzJkZWFjZjljZDgwNDIy
OSB4ODYvZW50cnk6IEVyYXNlIGd1ZXN0IEdQUiBzdGF0ZSBvbiBlbnRyeSB0
byBYZW4KZjBmN2NlNWU4MmI1YmQ1MTFlZjNlZWQ4ZmU4YjhiMjdhMjNmNDM2
NSB4ODYvaHZtOiBVc2UgU0FWRV9BTEwgdG8gY29uc3RydWN0IHRoZSBjcHVf
dXNlcl9yZWdzIGZyYW1lIGFmdGVyIFZNRXhpdApkNmU5NzI1MDhlZDZhZTg0
YzVhNDY1ODBhZjEyZWJkY2I4OGRlNzAyIHg4Ni9lbnRyeTogUmVhcnJhbmdl
IFJFU1RPUkVfQUxMIHRvIHJlc3RvcmUgcmVnaXN0ZXIgaW4gc3RhY2sgb3Jk
ZXIKOWFhYTIwODg4NjNkNjMxNjg5ODZmOWU2OWMwZjQ4MjgzOWEyNGQ4MCB4
ODY6IEludHJvZHVjZSBhIGNvbW1vbiBjcHVpZF9wb2xpY3lfdXBkYXRlZCgp
CjQwZjlhZTlkMDUzMmEzYzdkYmIyYTFlNzQwYzJjZWJlMmFlYjFkNzIgeDg2
L2h2bTogUmVuYW1lIHVwZGF0ZV9ndWVzdF92ZW5kb3IoKSBjYWxsYmFjayB0
byBjcHVpZF9wb2xpY3lfY2hhbmdlZCgpCmFkZTk1NTRmODcyNjJiMGM2ZGNj
MjFhY2ExOTRmMzEzOWEzMWZjZmEgeDg2L2FsdDogSW50cm9kdWNlIEFMVEVS
TkFUSVZFeyxfMn0gbWFjcm9zCmEwZWQwMzQ5ZmYyMTJiNDFkYmZhYjM3MTQx
Y2NjYjcxYmMxYzMwMzEgeDg2L2FsdDogQnJlYWsgb3V0IGFsdGVybmF0aXZl
LWFzbSBpbnRvIGEgc2VwYXJhdGUgaGVhZGVyIGZpbGUKNGQwMWRiYzcxMzNl
MGM1NWFlY2IzMWQ5NWNkNDYxNTgwMjQxYzU3NiB4ZW4vYXJtMzI6IGVudHJ5
OiBEb2N1bWVudCB0aGUgcHVycG9zZSBvZiByMTEgaW4gdGhlIHRyYXBzIGhh
bmRsZXIKMjIzNzliNmFkY2UwMjQ5ZmZjMDVhM2E3ODcwZjIyOTMzNjgzMzdl
MSB4ZW4vYXJtMzI6IEludmFsaWRhdGUgaWNhY2hlIG9uIGd1ZXN0IGV4aXN0
IGZvciBDb3J0ZXgtQTE1CjZlMTNhZDc3N2QzMzFjZDUzNDkyOGRmNzIwZGJm
NTQyNDk3MjMxYmEgeGVuL2FybTMyOiBJbnZhbGlkYXRlIEJUQiBvbiBndWVz
dCBleGl0IGZvciBDb3J0ZXggQTE3IGFuZCAxMgowZDMyMjM3ZDVmNGRiNDE5
Zjg0ZGE4OTE3NjFhYmI0ZjZiMWE4ZjUyIHhlbi9hcm0zMjogQWRkIHNrZWxl
dG9uIHRvIGhhcmRlbiBicmFuY2ggcHJlZGljdG9yIGFsaWFzaW5nIGF0dGFj
a3MKNGJhNTliZGMyNmJkNjliZGQ4NGJjYjJiZDU5N2ZlZTE0NGU4NDVkOSB4
ZW4vYXJtMzI6IGVudHJ5OiBBZGQgbWlzc2luZyB0cmFwX3Jlc2V0IGVudHJ5
CjI5OTdjNWU2MjhkZDU4OGZmNGFkYjM3MzNiN2Y0OGJiMDUyMWEyNDMgeGVu
L2FybTMyOiBBZGQgbWlzc2luZyBNSURSIHZhbHVlcyBmb3IgQ29ydGV4LUEx
NyBhbmQgQTEyCjc1MWM4NzkxZDA4NjgzMWYyMDM4ZmUxODIxN2U1NTNmNjEy
YTU2MDAgeGVuL2FybTMyOiBlbnRyeTogQ29uc29saWRhdGUgREVGSU5FX1RS
QVBfRU5UUllfKiBtYWNyb3MKYTI1NjdkNmI1NGI3YjE4N2VjYzAxNjUwMjFi
NmRkMDdkYWZhZjA2YSB4ZW4vYXJtOiBjcHVlcnJhdGE6IFJlbW92ZSBwZXJj
cHUuaCBpbmNsdWRlCjlmNzllOGQ4NDZlODQxM2M4MjhmNWZjN2NjNmFjNzMz
NzI4ZGZmMDAgeGVuL2FybTY0OiBJbXBsZW1lbnQgYnJhbmNoIHByZWRpY3Rv
ciBoYXJkZW5pbmcgZm9yIGFmZmVjdGVkIENvcnRleC1BIENQVXMKZmJhNDhl
ZmYxOGMwMmQ3MTZjOTViOTJkZjgwNGE3NTU2MjBiZTgyZSB4ZW4vYXJtNjQ6
IEFkZCBza2VsZXRvbiB0byBoYXJkZW4gdGhlIGJyYW5jaCBwcmVkaWN0b3Ig
YWxpYXNpbmcgYXR0YWNrcwozNzkwODMzZWYxNmI5NTY1MzQyNGVjOWIxNDVl
NDYwZWMxYTU2ZDE2IHhlbi9hcm06IGNwdWVycmF0YTogQWRkIE1JRFJfQUxM
X1ZFUlNJT05TCjUwNDUwYzFmMzNkYzcyZjIxMzhhNjcxZDczODkzNGY3OTZi
ZTMzMTggeGVuL2FybTY0OiBBZGQgbWlzc2luZyBNSURSIHZhbHVlcyBmb3Ig
Q29ydGV4LUE3MiwgQTczIGFuZCBBNzUKMmVjN2NjYmZmYzZiNzg4ZjY1ZTU1
NDk4ZTQzNDdjMWVlM2E0NGIwMSB4ZW4vYXJtOiBJbnRyb2R1Y2UgZW5hYmxl
IGNhbGxiYWNrIHRvIGVuYWJsZSBhIGNhcGFiaWxpdGllcyBvbiBlYWNoIG9u
bGluZSBDUFUKMjIxM2ZmZTFhMmQ4MmMzYzljNGExNTRlYTZlZTI1MjM5NWFh
ODY5MyB4ODYvZW50cnk6IFJlbW92ZSBzdXBwb3J0IGZvciBwYXJ0aWFsIGNw
dV91c2VyX3JlZ3MgZnJhbWVzCgo0Ljg6Cgo1OTM4YWExN2I0OTU5NTE1MGNh
ZGUzZGRjMmMxOTI5ZWNkMGRmMzlhIHg4Ni9QVjogY29ycmVjdGx5IGNvdW50
IE1TUnMgdG8gbWlncmF0ZQo5OWVkNzg2M2IyOWVhMTcwZTUwNzQ5ZmUyMjk5
MWI5NjRjYmNlNmJhIHg4Ni9pZGxlOiBDbGVhciBTUEVDX0NUUkwgd2hpbGUg
aWRsZQo3NmJkZmU4OTRhYjIyMDVmNTk3ZTUyNDQ4ZDYyMDk4MmI4NDU2NWM0
IHg4Ni9jcHVpZDogT2ZmZXIgSW5kaXJlY3QgQnJhbmNoIENvbnRyb2xzIHRv
IGd1ZXN0cwpmZWU0Njg5YzVjNjBiNjk5ZjRkZWEyMWEyMWEyYmExNzg4N2Qy
ZjQ5IHg4Ni9jdHh0OiBJc3N1ZSBhIHNwZWN1bGF0aW9uIGJhcnJpZXIgYmV0
d2VlbiB2Y3B1IGNvbnRleHRzCmMwYmZkZTY4Y2NkOTQxYjE0YTJmMGNhNTRj
NjFhODM3OTYxNTZlYTYgeDg2L2Jvb3Q6IENhbGN1bGF0ZSB0aGUgbW9zdCBh
cHByb3ByaWF0ZSBCVEkgbWl0aWdhdGlvbiB0byB1c2UKNjRjMTc0MmIyMDYz
NDRjNTFkYjEzMGIwYmI0N2ZjMjk5YTE0NjJjYSB4ODYvZW50cnk6IEF2b2lk
IHVzaW5nIGFsdGVybmF0aXZlcyBpbiBOTUkvI01DIHBhdGhzCjg2MTUzODU2
Zjg1N2Y3ODZiOTVlY2M0ZjgxMjYwNDc3ZDc1ZGMxNWMgeDg2L2VudHJ5OiBP
cmdhbmlzZSB0aGUgY2xvYmJlcmluZyBvZiB0aGUgUlNCL1JBUyBvbiBlbnRy
eSB0byBYZW4KZTA5YTVjMjkxNzUwNmNmOWQ5NWQ4NWY2NWIyZGYxNThhNDk0
NjQ5YyB4ODYvZW50cnk6IE9yZ2FuaXNlIHRoZSB1c2Ugb2YgTVNSX1NQRUNf
Q1RSTCBhdCBlYWNoIGVudHJ5L2V4aXQgcG9pbnQKZmY1NzBhM2VlMGI0MmEw
MzZkZjFlOGMyYjA1NzMwMTkyYWQ0YmQ5MCB4ODYvaHZtOiBQZXJtaXQgZ3Vl
c3RzIGRpcmVjdCBhY2Nlc3MgdG8gTVNSX3tTUEVDX0NUUkwsUFJFRF9DTUR9
CmU2YmNiNDE2YTVmNTQ4OTM2NmZjMjBmNDVmZDkyYTcwM2FkOTZlMTUgeDg2
L21pZ3JhdGU6IE1vdmUgTVNSX1NQRUNfQ1RSTCBvbiBtaWdyYXRlCjI5ZTcx
NzFlOWRkMGFhOGUzNWY3OTAxNTdkNzgxZGZmMjJmNmE5NzAgeDg2L21zcjog
RW11bGF0aW9uIG9mIE1TUl97U1BFQ19DVFJMLFBSRURfQ01EfSBmb3IgZ3Vl
c3RzCmMzZDE5NWNkOTEzODU1MzFlZDEyYWYyNTc2YmZlZGNhYjMxMTgyMTEg
eDg2L2NwdWlkOiBIYW5kbGluZyBvZiBJQlJTL0lCUEIsIFNUSUJQIGFuZCBJ
QlJTIGZvciBndWVzdHMKNTMyY2NmNGZkNTVjZmQ5MTZmNTYyNzlhNzE4NTI1
ODVkNzI2YWIyMyB4ODYvY21kbGluZTogSW50cm9kdWNlIGEgY29tbWFuZCBs
aW5lIG9wdGlvbiB0byBkaXNhYmxlIElCUlMvSUJQQiwgU1RJQlAgYW5kIElC
UEIKZGE0OWU1MThkNzljYTZjNDA1YTI0NDg4OWNhYjU3YWM4ZWQwOTdjYiB4
ODYvZmVhdHVyZTogRGVmaW5pdGlvbnMgZm9yIEluZGlyZWN0IEJyYW5jaCBD
b250cm9scwpjYTk1ODNkOWU3MDVhYWE3NGRhMTIxZTkyMGViZjc3ZDlmNzk5
NWIyIHg4NjogSW50cm9kdWNlIGFsdGVybmF0aXZlIGluZGlyZWN0IHRodW5r
cwo0NzliODc5YTdkZDBiYmYwMjkyMGQyZjYwNTNkOWJlZTI3MTc5N2NlIHg4
Ni9hbWQ6IFRyeSB0byBzZXQgbGZlbmNlIGFzIGJlaW5nIERpc3BhdGNoIFNl
cmlhbGlzaW5nCjJlZWZkOTI2YmJjODIxN2NmNTExYmMwOTZjODk3YWU0YzU2
ZGQwYzIgeDg2L2Jvb3Q6IFJlcG9ydCBkZXRhaWxzIG9mIHNwZWN1bGF0aXZl
IG1pdGlnYXRpb25zCjYwYzUwZjJiMGJmNWQzZjg5NGNhNDI4Y2Y0YjQzNzRm
YmVhMmQwODIgeDg2OiBTdXBwb3J0IGluZGlyZWN0IHRodW5rcyBmcm9tIGFz
c2VtYmx5IGNvZGUKMTgzOGUyMTUyMTQ5N2NkZmE2ZDNiMWRmYWMwMzc0YmNj
ZTcxN2ViYSB4ODY6IFN1cHBvcnQgY29tcGlsaW5nIHdpdGggaW5kaXJlY3Qg
YnJhbmNoIHRodW5rcwo1NzMyYThlZjI4ODU2MzNjZGZmYzU2ZmU5ZDhkZjQw
Zjc2YmZiMmMyIGNvbW1vbi93YWl0OiBDbGFyaWZpY2F0aW9ucyB0byB3YWl0
IGluZnJhc3RydWN0dXJlCjk4N2IwOGQ1NmNkOGQ0MzliZGY0MzUwOTkyMThi
OTZkZTkwMTE5OWQgeDg2L2VudHJ5OiBFcmFzZSBndWVzdCBHUFIgc3RhdGUg
b24gZW50cnkgdG8gWGVuCmVhZGNkODMxOGM0NmY1M2VkOGVlNjUxNmNhODc2
MjcxZjc1OTMwZmEgeDg2L2h2bTogVXNlIFNBVkVfQUxMIHRvIGNvbnN0cnVj
dCB0aGUgY3B1X3VzZXJfcmVncyBmcmFtZSBhZnRlciBWTUV4aXQKZWYyNDY0
YzU2ZThkYWIxOTRjZDk1NjQ5OGMzZDUyMTVmMWI2Yjk3YiB4ODYvZW50cnk6
IFJlYXJyYW5nZSBSRVNUT1JFX0FMTCB0byByZXN0b3JlIHJlZ2lzdGVyIGlu
IHN0YWNrIG9yZGVyCjE3YmZiYzgyODljNDg3YmNiNWY0NDZmNzlkZTU0ODY5
ZjEyNzg2Y2IgeDg2OiBJbnRyb2R1Y2UgYSBjb21tb24gY3B1aWRfcG9saWN5
X3VwZGF0ZWQoKQo0OTkzOTFiNTBiODVkMzFmYTNkZDRjNDI3YTgxNmUxMGZh
Y2IxZmU0IHg4Ni9odm06IFJlbmFtZSB1cGRhdGVfZ3Vlc3RfdmVuZG9yKCkg
Y2FsbGJhY2sgdG8gY3B1aWRfcG9saWN5X2NoYW5nZWQoKQo4N2NiMGUyMDkw
ZmNlMzE3YzRlNjc3NWYzNDNkNWNhYmE2NmY2MWYxIHg4Ni9hbHQ6IEludHJv
ZHVjZSBBTFRFUk5BVElWRXssXzJ9IG1hY3JvcwozZWZjZDdmYjQwYTkwMGJj
N2Q0ZjkwNjNmMmQ0M2VlMjdiMGE1MjcwIHg4Ni9hbHQ6IEJyZWFrIG91dCBh
bHRlcm5hdGl2ZS1hc20gaW50byBhIHNlcGFyYXRlIGhlYWRlciBmaWxlCjEx
ODc1YjdkNTcwNmY4YWVmODZkMzA2YTQzZDdmZTNiNzAxMWFhYTIgeGVuL2Fy
bTMyOiBlbnRyeTogRG9jdW1lbnQgdGhlIHB1cnBvc2Ugb2YgcjExIGluIHRo
ZSB0cmFwcyBoYW5kbGVyCjExMDVmM2E5MmRmODNmM2JmY2RhNzhkNjZjNGQy
ODQ1ODEyM2UxYmIgeGVuL2FybTMyOiBJbnZhbGlkYXRlIGljYWNoZSBvbiBn
dWVzdCBleGlzdCBmb3IgQ29ydGV4LUExNQo3NTQzNDVjMDE5MzNmMWVlZDNk
MTYwMWZhOGZkYmY2MmY1MmM5ZDgwIHhlbi9hcm0zMjogSW52YWxpZGF0ZSBC
VEIgb24gZ3Vlc3QgZXhpdCBmb3IgQ29ydGV4IEExNyBhbmQgMTIKNzMzNmQw
ZDJhNzE5ZDYxMzViOGQwMjgwMTQwMWU0NDliMGRiYmZiNiB4ZW4vYXJtMzI6
IEFkZCBza2VsZXRvbiB0byBoYXJkZW4gYnJhbmNoIHByZWRpY3RvciBhbGlh
c2luZyBhdHRhY2tzCmNmOTViYmE3Yjc0MDZlZjE5MjllYTRjNmMzNjM4OGVk
NDNiNGY5YmIgeGVuL2FybTMyOiBlbnRyeTogQWRkIG1pc3NpbmcgdHJhcF9y
ZXNldCBlbnRyeQphNTg2Y2JkOWYwY2JiMzgzNWRlMWY4YWI0ZDlhMTA1ZTA4
YjJhYzVhIHhlbi9hcm0zMjogQWRkIG1pc3NpbmcgTUlEUiB2YWx1ZXMgZm9y
IENvcnRleC1BMTcgYW5kIEExMgo2MDgyZTNiYTg5NDFiM2QxMGMzY2I3M2Y0
NDU3NTljMTllODlhZmM5IHhlbi9hcm0zMjogZW50cnk6IENvbnNvbGlkYXRl
IERFRklORV9UUkFQX0VOVFJZXyogbWFjcm9zCjZmNjc4NmVmMGQ3ZjcwMjU4
NjBkMzYwZjZiMTI2NzE5M2ZmZDFiMjcgeGVuL2FybTY0OiBJbXBsZW1lbnQg
YnJhbmNoIHByZWRpY3RvciBoYXJkZW5pbmcgZm9yIGFmZmVjdGVkIENvcnRl
eC1BIENQVXMKNDQxMzlmZWQ3Yzc5NGViNGU0N2E5YmI5MzA2MWUzMjViZDU3
ZmU4YyB4ZW4vYXJtNjQ6IEFkZCBza2VsZXRvbiB0byBoYXJkZW4gdGhlIGJy
YW5jaCBwcmVkaWN0b3IgYWxpYXNpbmcgYXR0YWNrcwpjZjBiNTg0YzhjNTAz
MDU4OGJjNDdhMzYxNGFkODYwYWY3NDgyYzUzIHhlbi9hcm06IGNwdWVycmF0
YTogQWRkIE1JRFJfQUxMX1ZFUlNJT05TCjg1OTkwYmY1M2FkZGNkYjBjZThl
NDU4YTNkOGZhZDE5OTcxMGFjNTkgeGVuL2FybTY0OiBBZGQgbWlzc2luZyBN
SURSIHZhbHVlcyBmb3IgQ29ydGV4LUE3MiwgQTczIGFuZCBBNzUKOTQ2ZGQy
ZWVmYWUyZmFlZWNiZWI5NjYyZTY2OTM1YzgwNzBmNjRmNSB4ZW4vYXJtOiBJ
bnRyb2R1Y2UgZW5hYmxlIGNhbGxiYWNrIHRvIGVuYWJsZSBhIGNhcGFiaWxp
dGllcyBvbiBlYWNoIG9ubGluZSBDUFUKYTdjZjBhM2I4MTgzNzdhOGE0OWJh
ZWQzNjA2YmZhMmYyMTRjZDY0NSB4ODYvZW50cnk6IFJlbW92ZSBzdXBwb3J0
IGZvciBwYXJ0aWFsIGNwdV91c2VyX3JlZ3MgZnJhbWVzCgo0Ljc6CgphZGUz
YmNhZmQyNTg4MzEzMGZjMjM0MTIxZWQ3NDE2ZDUzMWU0NTZkIHg4Ni9QVjog
Y29ycmVjdGx5IGNvdW50IE1TUnMgdG8gbWlncmF0ZQphYWM0Y2JlMzY0NDcz
OGQ0ODVkMzhiZDU1MTA0NmQ2M2MwMGNjNjcwIHg4NjogZml4IGJ1aWxkIHdp
dGggb2xkZXIgdG9vbCBjaGFpbgo2ODQyMGI0N2Q5YjgxM2NhNDg4OTFiNjA0
ZmFiMzc5ZDQwYWE1OTRlIHg4Ni9pZGxlOiBDbGVhciBTUEVDX0NUUkwgd2hp
bGUgaWRsZQplMDk1NDhkMjhhMWNmZmFmYzBmYTVlZDlmOTdhYzU4NTE0NDkx
YWI4IHg4Ni9jcHVpZDogT2ZmZXIgSW5kaXJlY3QgQnJhbmNoIENvbnRyb2xz
IHRvIGd1ZXN0cwpiZTI2MWJkOTdmN2I0ZmM3NmRiN2MxMWJiMzM2Njk3NGY1
NjM1YTA0IHg4Ni9jdHh0OiBJc3N1ZSBhIHNwZWN1bGF0aW9uIGJhcnJpZXIg
YmV0d2VlbiB2Y3B1IGNvbnRleHRzCjMyN2E3ODM2NzQ0Y2E4ZDdlMWNmYzZk
YzQ3NmQ1MWQ3YzYzZjY4ZWEgeDg2L2Jvb3Q6IENhbGN1bGF0ZSB0aGUgbW9z
dCBhcHByb3ByaWF0ZSBCVEkgbWl0aWdhdGlvbiB0byB1c2UKOWYwOGZjZTNi
OTQyMTgwZDYyYmM3NzNjYWI4NDBmYTQ1MzNkMGE1MSB4ODYvZW50cnk6IEF2
b2lkIHVzaW5nIGFsdGVybmF0aXZlcyBpbiBOTUkvI01DIHBhdGhzCjRhMzhl
YzI2YmFmZGU3MGYyYWYzNmQ3YmMyYmVjN2YyMTgxNDU5ODIgeDg2L2VudHJ5
OiBPcmdhbmlzZSB0aGUgY2xvYmJlcmluZyBvZiB0aGUgUlNCL1JBUyBvbiBl
bnRyeSB0byBYZW4KNjVjOWUwNjQyOWY2MjkyNDlhODRkMDEyMzFiZTVmYTY0
MzQ2MDU0NyB4ODYvZW50cnk6IE9yZ2FuaXNlIHRoZSB1c2Ugb2YgTVNSX1NQ
RUNfQ1RSTCBhdCBlYWNoIGVudHJ5L2V4aXQgcG9pbnQKODRkNDdhY2MwNWFm
NTE2ZDgxM2YxOTUyZTg1M2M0Y2EyYmUyYWRiYSB4ODYvaHZtOiBQZXJtaXQg
Z3Vlc3RzIGRpcmVjdCBhY2Nlc3MgdG8gTVNSX3tTUEVDX0NUUkwsUFJFRF9D
TUR9CmI3ZGFlNTVjMGVhYWU2ZDVhMzRiZmRkM2E2MmZlOTM4NjczZjUzY2Yg
eDg2L21pZ3JhdGU6IE1vdmUgTVNSX1NQRUNfQ1RSTCBvbiBtaWdyYXRlCmIy
YjdmZTEyOGY2ZmJlY2Y1NGU5N2NkZDJkNzE5MjNkMGE4NTI1MzUgeDg2L21z
cjogRW11bGF0aW9uIG9mIE1TUl97U1BFQ19DVFJMLFBSRURfQ01EfSBmb3Ig
Z3Vlc3RzCmM5NDdlMWUyM2QxZGIxN2RhMGRkMjExYjk0MTBmMzExMjQ4YjZj
MTMgeDg2L2NwdWlkOiBIYW5kbGluZyBvZiBJQlJTL0lCUEIsIFNUSUJQIGFu
ZCBJQlJTIGZvciBndWVzdHMKZTkyMjBiNDBjNjdhNmMxZWFiNmIzNjEzZjYw
NTRhZGZhY2VhNjVlYiB4ODYvY21kbGluZTogSW50cm9kdWNlIGEgY29tbWFu
ZCBsaW5lIG9wdGlvbiB0byBkaXNhYmxlIElCUlMvSUJQQiwgU1RJQlAgYW5k
IElCUEIKZjk2MTY4ODRlMTZiODAyOGMyNTdjOGIwMWZiMTJkYWZmN2ZlMzQ1
NCB4ODYvZmVhdHVyZTogRGVmaW5pdGlvbnMgZm9yIEluZGlyZWN0IEJyYW5j
aCBDb250cm9scwo5MWY3ZTQ2MjdiNjU5NzUzNmRlZDViODMyNmRhM2NhNTA0
YjE3NzJmIHg4NjogSW50cm9kdWNlIGFsdGVybmF0aXZlIGluZGlyZWN0IHRo
dW5rcwpmMjkxYzAxY2Q2ZDQwNTkyN2NlYjAyMmJkZWY2NDc5ZGU4YjlmYjlh
IHg4Ni9hbWQ6IFRyeSB0byBzZXQgbGZlbmNlIGFzIGJlaW5nIERpc3BhdGNo
IFNlcmlhbGlzaW5nCjNjZjRlMjlmOGRmNWZjMThmNjViYWEwODQwOGEzZDdj
ZjMyNjlkMDMgeDg2L2Jvb3Q6IFJlcG9ydCBkZXRhaWxzIG9mIHNwZWN1bGF0
aXZlIG1pdGlnYXRpb25zCjg4NjAyMTkwZjY5OGFlYWNlNmQ3ZTAyODk1NGEx
MzQ5OTk3ZWUwYmUgeDg2OiBTdXBwb3J0IGluZGlyZWN0IHRodW5rcyBmcm9t
IGFzc2VtYmx5IGNvZGUKNjJhMjYyNGUzYzYyNTBjNmJlOGE5MjQ4YzhmZTVh
MzIxMTgzNGQ0ZCB4ODY6IFN1cHBvcnQgY29tcGlsaW5nIHdpdGggaW5kaXJl
Y3QgYnJhbmNoIHRodW5rcwpjM2Y4ZGYzZGYyMjRlZWFjMGU3ODUzMzY0NDAx
MGVkMDk2ZGU3YTM0IGNvbW1vbi93YWl0OiBDbGFyaWZpY2F0aW9ucyB0byB3
YWl0IGluZnJhc3RydWN0dXJlCjM4NzdjMDI0ZWE0OTE2ZWRlMTc3ZWYwMDY3
YTA4MWY3M2VlMTZjNGQgeDg2L2VudHJ5OiBFcmFzZSBndWVzdCBHUFIgc3Rh
dGUgb24gZW50cnkgdG8gWGVuCmYwZWQ1Zjk1Y2IzNzNmYjU1ZDllYjJlYjNm
ZTBjYmE0NDJlODBlYjIgeDg2L2h2bTogVXNlIFNBVkVfQUxMIHRvIGNvbnN0
cnVjdCB0aGUgY3B1X3VzZXJfcmVncyBmcmFtZSBhZnRlciBWTUV4aXQKMTYw
YjUzYzgyNDAxMWI5ZGRiODllNjdmMGY2ODJmNDcxMzM1NzQ3ZCB4ODYvZW50
cnk6IFJlYXJyYW5nZSBSRVNUT1JFX0FMTCB0byByZXN0b3JlIHJlZ2lzdGVy
IGluIHN0YWNrIG9yZGVyCmUxMzEzMDk4ZTQzYzQxNTk4ZDViMzc4ZTYzNDRk
NjkxZGNmMjlmMmYgeDg2OiBJbnRyb2R1Y2UgYSBjb21tb24gY3B1aWRfcG9s
aWN5X3VwZGF0ZWQoKQo5ZWRlMWFjYmU5MWNiMTI3YjIzZDVlNzExNDcwMDI1
YjQ2MmY1ZDUwIHg4Ni9odm06IFJlbmFtZSB1cGRhdGVfZ3Vlc3RfdmVuZG9y
KCkgY2FsbGJhY2sgdG8gY3B1aWRfcG9saWN5X2NoYW5nZWQoKQpkMGNmYmU4
MWQwMWIyYWMxZGM5ZDAyZDcwZDMyNDkyNDlkNWNiNWJjIHg4Ni9hbHQ6IElu
dHJvZHVjZSBBTFRFUk5BVElWRXssXzJ9IG1hY3JvcwpkNTk2ZTZhMGE2ZGRm
ZWJiZTY1N2QwN2QwZDY0MTU5Y2M0ZWI3YTY4IHg4Ni9hbHQ6IEJyZWFrIG91
dCBhbHRlcm5hdGl2ZS1hc20gaW50byBhIHNlcGFyYXRlIGhlYWRlciBmaWxl
CmY1MGVhODQwYjlhODYwOTI3YzdhY2E1ZmE2NGViMzRlMTRmMTcxNjQgeGVu
L2FybTMyOiBlbnRyeTogRG9jdW1lbnQgdGhlIHB1cnBvc2Ugb2YgcjExIGlu
IHRoZSB0cmFwcyBoYW5kbGVyCmRlM2JkYWE3MTcwMDJlNGVjOTE3YmQwNDk0
OTQzZWIxNjYwZDcxYjggeGVuL2FybTMyOiBJbnZhbGlkYXRlIGljYWNoZSBv
biBndWVzdCBleGlzdCBmb3IgQ29ydGV4LUExNQo3NjY5OTBiMGI2NDMzNmQx
Yjg1OWI2Y2FhMzYwMzNlYzUzMzhkNTYzIHhlbi9hcm0zMjogSW52YWxpZGF0
ZSBCVEIgb24gZ3Vlc3QgZXhpdCBmb3IgQ29ydGV4IEExNyBhbmQgMTIKNGFj
MDIyOWJjNTMxMmEwMTY2NGI3NDcyNjFlZTFjYzdlYTUyYzRiNSB4ZW4vYXJt
MzI6IEFkZCBza2VsZXRvbiB0byBoYXJkZW4gYnJhbmNoIHByZWRpY3RvciBh
bGlhc2luZyBhdHRhY2tzCmJhZmQ2M2Y4YmUyZThhNzhjMGU4NTQ0NGU0YzI1
NWU2NzkzMDMyODIgeGVuL2FybTMyOiBlbnRyeTogQWRkIG1pc3NpbmcgdHJh
cF9yZXNldCBlbnRyeQpkNWJiNDI1ZGFjNjcxOGQzZmJhNjRiODYzYjA3ZDcz
MTRjODU3MDY3IHhlbi9hcm0zMjogQWRkIG1pc3NpbmcgTUlEUiB2YWx1ZXMg
Zm9yIENvcnRleC1BMTcgYW5kIEExMgowMDNlYzNlMDBhMDU5MzVlYTZhMzE0
MzBkYTY1ZWU2MjM2MzkwMGY5IHhlbi9hcm0zMjogZW50cnk6IENvbnNvbGlk
YXRlIERFRklORV9UUkFQX0VOVFJZXyogbWFjcm9zCmZkODg0ZDYxOTkxY2Qw
ZGU1ODhhZTUxNzI4Y2QwNjAyMzc1ZGZhNzEgeGVuL2FybTY0OiBJbXBsZW1l
bnQgYnJhbmNoIHByZWRpY3RvciBoYXJkZW5pbmcgZm9yIGFmZmVjdGVkIENv
cnRleC1BIENQVXMKNTBjNjhkZjgxODJiZjMzMjUyNWViZjYxMjBkM2IxZTBm
ZGY3NzU0NSB4ZW4vYXJtNjQ6IEFkZCBza2VsZXRvbiB0byBoYXJkZW4gdGhl
IGJyYW5jaCBwcmVkaWN0b3IgYWxpYXNpbmcgYXR0YWNrcwoxYmRjYzlmN2Vm
NDM4YWI5YzIxOWE1MDk5NzI2YjExMmI5M2E0ZmJlIHhlbi9hcm06IGNwdWVy
cmF0YTogQWRkIE1JRFJfQUxMX1ZFUlNJT05TCjI5MTRlZjU3NTNjOTMyODg4
OWRmMzE0ZjMzYmIxMmVjZTFiZDRmYmUgeGVuL2FybTY0OiBBZGQgbWlzc2lu
ZyBNSURSIHZhbHVlcyBmb3IgQ29ydGV4LUE3MiwgQTczIGFuZCBBNzUKNjJi
OTcwNmRiYTNiNmEzZDk4ODEzMjliY2E2MDQyMTYzMTNjODJkYyB4ZW4vYXJt
OiBJbnRyb2R1Y2UgZW5hYmxlIGNhbGxiYWNrIHRvIGVuYWJsZSBhIGNhcGFi
aWxpdGllcyBvbiBlYWNoIG9ubGluZSBDUFUKNjI0YWJkY2YyZDMwYWU0OGUw
NjUzZmI1MTFiNGM5MGQzY2NkZDJhZiB4ZW4vYXJtOiBEZXRlY3Qgc2lsaWNv
biByZXZpc2lvbiBhbmQgc2V0IGNhcCBiaXRzIGFjY29yZGluZ2x5CmQ3Yjcz
ZWRkMGZlNmJiMGM0NmFhODgzMjI5ZjkwMDY0M2I0NzI2ZTkgeGVuL2FybTog
Y3B1ZmVhdHVyZTogUHJvdmlkZSBhbiBoZWxwZXIgdG8gY2hlY2sgaWYgYSBj
YXBhYmlsaXR5IGlzIHN1cHBvcnRlZAoxMTJjNDljMTE0ZmZlMzdlMDY4ZmM5
ZjEzZTk2MGE4ZjI3NTM3OWQyIHhlbi9hcm06IEFkZCBjcHVfaHdjYXAgYml0
bWFwCmE1YjBmYTQ4NzFiMDg5NWRhMjAzZmIyZGFjMTY4NDBkMjRjNmJlMjEg
eGVuL2FybTogQWRkIG1hY3JvcyB0byBoYW5kbGUgdGhlIE1JRFIKMGU2YzZm
YzQ0OTAwMGQ5N2Y5ZmE4N2VkMWZiZTIzZjBjZjIxNDA2YiB4ODYvZW50cnk6
IFJlbW92ZSBzdXBwb3J0IGZvciBwYXJ0aWFsIGNwdV91c2VyX3JlZ3MgZnJh
bWVzCgo0LjY6CgowZmJmMzBhN2Y4NjMxMzlkZDBhYzU1NmU0NGY5MmY1Nzg3
NjU0ODQ3IHg4Ni9odm06IERvbid0IGNvcnJ1cHQgdGhlIEhWTSBjb250ZXh0
IHN0cmVhbSB3aGVuIHdyaXRpbmcgdGhlIE1TUiByZWNvcmQKN2UyMGI5YjJk
ZGJiMDRjNmViYjYwNjEzYjExMTdlMDVlZGM4YTVlYSB4ODYvUFY6IGNvcnJl
Y3RseSBjb3VudCBNU1JzIHRvIG1pZ3JhdGUKNzViZGQ2OTMwMzNlNmRiZDZm
ZTVhZTIzNWY3OTk2MWQyZjBhYTg0ZCB4ODYvaWRsZTogQ2xlYXIgU1BFQ19D
VFJMIHdoaWxlIGlkbGUKODk5NGNmM2NmNzMwNDIyZGVkNjU5NmVjYjE4ZGMw
ZDhiNjU3OTQ5MyB4ODYvY3R4dDogSXNzdWUgYSBzcGVjdWxhdGlvbiBiYXJy
aWVyIGJldHdlZW4gdmNwdSBjb250ZXh0cwo2NDJjNjAzN2JiYTMxMDUzOGIw
MGMwY2JiNWQ5MTUyNWJkMWVlZDBhIHg4Ni9ib290OiBDYWxjdWxhdGUgdGhl
IG1vc3QgYXBwcm9wcmlhdGUgQlRJIG1pdGlnYXRpb24gdG8gdXNlCmMyNWVh
OWExMzkzYzFlYjVkNjczMmVjMzY2YmFhMTA5MWRiNWU3ZGIgeDg2L2VudHJ5
OiBBdm9pZCB1c2luZyBhbHRlcm5hdGl2ZXMgaW4gTk1JLyNNQyBwYXRocwpm
ZWJhNTcxYTVkOTU4Njc3OGUwOTc4YjhkZjViOTE2NjI3NWI4NjgwIHg4Ni9l
bnRyeTogT3JnYW5pc2UgdGhlIGNsb2JiZXJpbmcgb2YgdGhlIFJTQi9SQVMg
b24gZW50cnkgdG8gWGVuCjAxNjMwODdlZDYxNzViMDA5NjZmNGVlOTkxZDhj
NDI0YWQ3ZWI1OWQgeDg2L2VudHJ5OiBPcmdhbmlzZSB0aGUgdXNlIG9mIE1T
Ul9TUEVDX0NUUkwgYXQgZWFjaCBlbnRyeS9leGl0IHBvaW50CjQ0YzI2NjY1
ODlmZWZjMTMwNDllZGM4NzRjN2VmMDYzODIzYmFkOTAgeDg2L2h2bTogUGVy
bWl0IGd1ZXN0cyBkaXJlY3QgYWNjZXNzIHRvIE1TUl97U1BFQ19DVFJMLFBS
RURfQ01EfQpkYjc0M2IwNDk5OGE5Y2JmNjg2NmI1ZjMyODg1NTIzOWE3MzIy
MGU1IHg4Ni9taWdyYXRlOiBNb3ZlIE1TUl9TUEVDX0NUUkwgb24gbWlncmF0
ZQo0MWE1Y2NlYzk5ZTgxYTc2OGE2Njk5NWY0ODNmNDI0Zjg0OGY1YjVlIHg4
Ni9tc3I6IEVtdWxhdGlvbiBvZiBNU1Jfe1NQRUNfQ1RSTCxQUkVEX0NNRH0g
Zm9yIGd1ZXN0cwo0ZTFiOWU5OGRmZmJjMmYyOWEwYTkwYTRhZTQzYjllMTlm
MzIzMDg5IHg4Ni9jcHVpZDogSGFuZGxpbmcgb2YgSUJSUy9JQlBCLCBTVElC
UCBhbmQgSUJSUyBmb3IgZ3Vlc3RzCjRkMjE1NDkxNGUzZjQ0YmFlMTIzZGM2
YTkzZmJiM2YxYjM5YzBmZWUgeDg2L2NtZGxpbmU6IEludHJvZHVjZSBhIGNv
bW1hbmQgbGluZSBvcHRpb24gdG8gZGlzYWJsZSBJQlJTL0lCUEIsIFNUSUJQ
IGFuZCBJQlBCCmZmNDgwMGNhYzYzNzU2Zjc3NTVlNmMyNTE1NzFjZDI5ZmQ1
MTcxZWIgeDg2L2ZlYXR1cmU6IERlZmluaXRpb25zIGZvciBJbmRpcmVjdCBC
cmFuY2ggQ29udHJvbHMKMjYxM2ExYmM3MDllZDRiNDZhZjM2YjBiYWIzMjAw
ZWQ5ZDNjODZkMCB4ODY6IEludHJvZHVjZSBhbHRlcm5hdGl2ZSBpbmRpcmVj
dCB0aHVua3MKODMzNWM4YWVkYWNkOWE1MGI0Nzk2YWZiNTMzZGM4MjA1ZjIx
MjllNCB4ODYvYW1kOiBUcnkgdG8gc2V0IGxmZW5jZSBhcyBiZWluZyBEaXNw
YXRjaCBTZXJpYWxpc2luZwphYjIwYzVjODA0YWU4MTRkZTliZWQ1Zjg1ZDU1
ZmVjYzg5NGRjNzhmIHg4Ni9ib290OiBSZXBvcnQgZGV0YWlscyBvZiBzcGVj
dWxhdGl2ZSBtaXRpZ2F0aW9ucwo5MDg5ZGE5Y2QwNjg3NWJlNmMxMDIyZDU5
YTY2NTFjZjM5MTlkYTJlIHg4NjogU3VwcG9ydCBpbmRpcmVjdCB0aHVua3Mg
ZnJvbSBhc3NlbWJseSBjb2RlCjhlZGZjODJmNjdmMjUxMzc5MDlkZGExM2U2
NjU4Y2JhNGQxZTVkMjYgeDg2OiBTdXBwb3J0IGNvbXBpbGluZyB3aXRoIGlu
ZGlyZWN0IGJyYW5jaCB0aHVua3MKYWY1YjYxYWY5ZTM1MGJjYzJjOGIwZjA1
MzY4MmUzYzdhNzAwYjQ2ZiBjb21tb24vd2FpdDogQ2xhcmlmaWNhdGlvbnMg
dG8gd2FpdCBpbmZyYXN0cnVjdHVyZQplYzA1MDkwNDAzZWY0ZDc2MGZiZTcw
MWUzMWFmZDBmMGVkYzQxNGQ1IHg4Ni9lbnRyeTogRXJhc2UgZ3Vlc3QgR1BS
IHN0YXRlIG9uIGVudHJ5IHRvIFhlbgo3NTI2M2Y3OTA4YTAyZjU2NzNjMjVk
ZjliY2RhZWQ5ZmU1ZjlkZTVjIHg4Ni9odm06IFVzZSBTQVZFX0FMTCB0byBj
b25zdHJ1Y3QgdGhlIGNwdV91c2VyX3JlZ3MgZnJhbWUgYWZ0ZXIgVk1FeGl0
CmY3ZTI3M2EwN2NjZjk5MzA2MzcyNzY3NTU4OWYxMGRhMjA2ZjE2ODMgeDg2
L2VudHJ5OiBSZWFycmFuZ2UgUkVTVE9SRV9BTEwgdG8gcmVzdG9yZSByZWdp
c3RlciBpbiBzdGFjayBvcmRlcgowM2M3ZDJjZDFiNGJiOTg2OGMxMGM0YTNk
YjJiMDkyZDIxMWQwNTVhIHg4Ni9hbHQ6IEludHJvZHVjZSBBTFRFUk5BVElW
RXssXzJ9IG1hY3Jvcwo5Y2UxYTcxODAwNTAzNTNjMDczMjE5ODBjZjFlZDBi
MGJhZWJmMzhhIHg4Ni9hbHQ6IEJyZWFrIG91dCBhbHRlcm5hdGl2ZS1hc20g
aW50byBhIHNlcGFyYXRlIGhlYWRlciBmaWxlCmE3MzVjN2FlODA0NjAyNDky
NTkyNzQwNjc0N2Q0YTZjYTViZjdmY2MgeDg2L21pY3JvY29kZTogQWRkIHN1
cHBvcnQgZm9yIGZhbTE3aCBtaWNyb2NvZGUgbG9hZGluZwo5ZDUzNGMxMmJm
NzFiYWJiNzZmMTMzODAyOTg0MWY3NTcxOTFmNzI5IHhlbi9hcm0zMjogZW50
cnk6IERvY3VtZW50IHRoZSBwdXJwb3NlIG9mIHIxMSBpbiB0aGUgdHJhcHMg
aGFuZGxlcgpkYmIzNTUzMTMwMjQxYWU5OWQ0NDRhNmEwOGI3ZGMzMmNlOTBh
MjcyIHhlbi9hcm0zMjogSW52YWxpZGF0ZSBpY2FjaGUgb24gZ3Vlc3QgZXhp
c3QgZm9yIENvcnRleC1BMTUKZTU0YThjNjE3Y2ViNWJhMzQ4MWU2YWExMjJh
ZDNmODM1YzE5MTViOCB4ZW4vYXJtMzI6IEludmFsaWRhdGUgQlRCIG9uIGd1
ZXN0IGV4aXQgZm9yIENvcnRleCBBMTcgYW5kIDEyCjgwMDVlZDNlZjE0YzZj
OGIzMWE5ZTFhNWFlMjU3NmE0YjRjNjY1MjggeGVuL2FybTMyOiBBZGQgc2tl
bGV0b24gdG8gaGFyZGVuIGJyYW5jaCBwcmVkaWN0b3IgYWxpYXNpbmcgYXR0
YWNrcwo5YTg1MmUwZWViYzYzMDA1ODVkYjg5NjY5ZGJhZGU2MjViZTE4YTEy
IHhlbi9hcm0zMjogZW50cnk6IEFkZCBtaXNzaW5nIHRyYXBfcmVzZXQgZW50
cnkKZDc3OWNjMWY5YzZhNWYxZDQwZGI5ZTg1Zjc3OWE3OWM4ZWVkMmNjZiB4
ZW4vYXJtMzI6IEFkZCBtaXNzaW5nIE1JRFIgdmFsdWVzIGZvciBDb3J0ZXgt
QTE3IGFuZCBBMTIKYzkzYmNmOTQwOWUwZGExNGNiYzRiZjQzYmYxMzhiZmFh
ZWNlZmEyYyB4ZW4vYXJtMzI6IGVudHJ5OiBDb25zb2xpZGF0ZSBERUZJTkVf
VFJBUF9FTlRSWV8qIG1hY3JvcwoxNWFkY2YzOTU5MjM0OTllYjFlYWFjYTFl
NjdjMDMyOTU2NDI4MTkxIHhlbi9hcm02NDogSW1wbGVtZW50IGJyYW5jaCBw
cmVkaWN0b3IgaGFyZGVuaW5nIGZvciBhZmZlY3RlZCBDb3J0ZXgtQSBDUFVz
CmQ3YjgxOTBkMzIyMjE1NmU4OWNjZWZiN2FjNzRhZDA0MTAzMzcwOTcgeGVu
L2FybTY0OiBBZGQgc2tlbGV0b24gdG8gaGFyZGVuIHRoZSBicmFuY2ggcHJl
ZGljdG9yIGFsaWFzaW5nIGF0dGFja3MKMmIxNDU3Zjk1NWE5ODAwN2NkNTFi
ZTY3Zjc4ZDE2OTA3MTFlODg0OSB4ZW4vYXJtOiBjcHVlcnJhdGE6IEFkZCBN
SURSX0FMTF9WRVJTSU9OUwphMzU3ODgwMmEyODgyYWZiYmZlNzMwZjAyMjdl
MDc1YjVmNDJiNGE2IHhlbi9hcm02NDogQWRkIG1pc3NpbmcgTUlEUiB2YWx1
ZXMgZm9yIENvcnRleC1BNzIsIEE3MyBhbmQgQTc1CmVlMjNmY2MyNTM5Y2U4
MTQzYWU0Y2U1OGE3YzE0MGZhNDZhNDM1OWIgeGVuL2FybTogSW50cm9kdWNl
IGVuYWJsZSBjYWxsYmFjayB0byBlbmFibGUgYSBjYXBhYmlsaXRpZXMgb24g
ZWFjaCBvbmxpbmUgQ1BVCjU2NTEwMTU0YmJkMjFmMTAwODA5OTNiNzg4OGMx
YTQ3YTgwMmMzZTIgeGVuL2FybTogRGV0ZWN0IHNpbGljb24gcmV2aXNpb24g
YW5kIHNldCBjYXAgYml0cyBhY2NvcmRpbmdseQoyMjVlOWM3MDUwZThmMjY5
NGRmM2RjOTJjOTViMDZhNDZlNTcxMzBlIHhlbi9hcm06IGNwdWZlYXR1cmU6
IFByb3ZpZGUgYW4gaGVscGVyIHRvIGNoZWNrIGlmIGEgY2FwYWJpbGl0eSBp
cyBzdXBwb3J0ZWQKM2M3MDYxOTU1NjU5MTBiOTYxZWI1YTdlNjRmMzQ5NDhk
ZWIyYTU0NSB4ZW4vYXJtOiBBZGQgY3B1X2h3Y2FwIGJpdG1hcAoxMjIyMzMz
YTgyMjA2Mzg3NDdlNzdiNDBiNjQxOGRhYTg1MjcwMjY1IHhlbi9hcm06IEFk
ZCBtYWNyb3MgdG8gaGFuZGxlIHRoZSBNSURSCmM2ZTllNjA5NTY2OWIzYzYz
YjkyZDIxZmRkYjMyNjQ0MWM3MzcxMmMgeDg2L2VudHJ5OiBSZW1vdmUgc3Vw
cG9ydCBmb3IgcGFydGlhbCBjcHVfdXNlcl9yZWdzIGZyYW1lcwo=

--=separator
Content-Type: application/octet-stream; name="xsa254/README.comet"
Content-Disposition: attachment; filename="xsa254/README.comet"
Content-Transfer-Encoding: base64

CQkJICAgIFBWLWluLVBWSCBzaGltCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA9PT09PT09PT09PT09PQoKU3VtbWFyeQotLS0tLS0tCgpUaGlzIFJF
QURNRSBkZXNjcmliZXMgb25lIG9mIHRocmVlIG1pdGlnYXRpb24gc3RyYXRl
Z2llcyBmb3IgTWVsdGRvd24uCgpUaGUgYmFzaWMgcHJpbmNpcGxlIGlzIHRv
IHJ1biBQViBndWVzdHMgKHdoaWNoIGNhbiByZWFkIGFsbCBvZiBob3N0Cm1l
bW9yeSBkdWUgdG8gdGhlIGhhcmR3YXJlIGJ1Z3MpIGFzIFBWSCBndWVzdHMg
KHdoaWNoIGNhbm5vdCwgYXQgbGVhc3QKbm90IGR1ZSB0byBNZWx0ZG93biku
ICBUaGUgUFYgZW52aXJvbm1lbnQgaXMgc3RpbGwgcHJvdmlkZWQgdG8gdGhl
Cmd1ZXN0IGJ5IGFuIGVtYmVkZGVkIGNvcHkgb2YgWGVuLCB0aGUgInNoaW0i
LiAgVGhpcyB2ZXJzaW9uIG9mIHRoZQpzaGltIGlzIGNvZGVuYW1lZCAiQ29t
ZXQiLgoKVW5saWtlIFZpeGVuLCBDb21ldCByZXF1aXJlcyBtb2RpZmljYXRp
b25zIHRvIHRoZSB0b29sc3RhY2sgYW5kIGhvc3QKaHlwZXJ2aXNvci4KCk5v
dGUgdGhhdCBib3RoIG9mIHRoZXNlIHNoaW0tYmFzZWQgYXBwcm9hY2hlcyBw
cmV2ZW50IGF0dGFja3Mgb24gdGhlCmhvc3QsIGJ1dCBsZWF2ZSB0aGUgZ3Vl
c3QgdnVsbmVyYWJsZSB0byBNZWx0ZG93biBhdHRhY2tzIGJ5IGl0cyBvd24K
dW5wcml2aWxlZ2VkIHByb2Nlc3NlczsgdGhpcyBpcyB0cnVlIGV2ZW4gaWYg
dGhlIGd1ZXN0IE9TIGhhcyBLUFRJIG9yCnNpbWlsYXIgTWVsdGRvd24gbWl0
aWdhdGlvbi4KClZlcnNpb25zIGZvciBYZW4gNC44IGFuZCA0LjEwIGFyZSBh
dmFpbGFibGUuCgpXaGF0IHlvdSB3aWxsIG5lZWQKLS0tLS0tLS0tLS0tLS0t
LS0tCgogKiBZb3Ugd2lsbCBuZWVkIHRoZSB4ZW4uZ2l0IHdpdGggdGhlIGZv
bGxvd2luZyB0YWdzOgogIC0gRm9yIDQuMTA6IDQuMTAuMC1zaGltLWNvbWV0
LTMKICAtIEZvciA0Ljg6ICA0LjguM3ByZS1zaGltLWNvbWV0LTIgICBhbmQg
IDQuMTAuMC1zaGltLWNvbWV0LTMKCkJ1aWxkIGluc3RydWN0aW9uczogNC4x
MAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCjEuIEJ1aWxkIGEgNC4xMCsg
c3lzdGVtCiAgICBnaXQgY2xvbmUgZ2l0Oi8veGVuYml0cy54ZW5wcm9qZWN0
Lm9yZy94ZW4uZ2l0IHhlbi5naXQKICAgIGNkIHhlbi5naXQKICAgIGdpdCBj
aGVja291dCA0LjEwLjAtc2hpbS1jb21ldC0zCgpEbyBhIGJ1aWxkIGFuZCBp
bnN0YWxsIGFzIG5vcm1hbC4gIFRoZSBzaGltIHdpbGwgYmUgYnVpbHQgYXMg
cGFydCBvZiB0aGUKbm9ybWFsIGJ1aWxkIHByb2Nlc3MsIGFuZCBwbGFjZWQg
d2l0aCBvdGhlciAnc3lzdGVtJyBiaW5hcmllcyB3aGVyZSB0aGUKdG9vc3Rh
Y2sga25vd3MgaG93IHRvIGZpbmQgaXQuCgpCdWlsZCBpbnN0cnVjdGlvbnM6
IDQuOAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKVGhlIGNvZGUgZm9yIHNo
aW0gaXRzZWxmIGlzIG5vdCBiYWNrcG9ydGVkIHRvIDQuOC4gIDQuOCB1c2Vy
cyBzaG91bGQKdXNlIGEgc2hpbSBidWlsdCBmcm9tIDQuMTAtYmFzZWQgc291
cmNlIGNvZGU7IHRoaXMgY2FuIGJlIHNpbXBseQpkcm9wcGVkIGludG8gYSBY
ZW4gNC44IGluc3RhbGxhdGlvbi4KCjEuIEJ1aWxkIGEgNC44KyBzeXN0ZW0g
d2l0aCBzdXBwb3J0IGZvciBydW5uaW5nIFBWSCwgYW5kIGZvciBwdnNoaW06
CgogICAgZ2l0IGNsb25lIGdpdDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcv
eGVuLmdpdCB4ZW4uZ2l0CiAgICBjZCB4ZW4uZ2l0CiAgICBnaXQgY2hlY2tv
dXQgNC44LjNwcmUtc2hpbS1jb21ldC0yCgogIERvIGEgYnVpbGQgYW5kIGlu
c3RhbGwgYXMgbm9ybWFsLgoKMi4gQnVpbGQgYSA0LjEwKyBzeXN0ZW0gdG8g
YmUgdGhlIHNoaW06CgogICAgZ2l0IGNsb25lIGdpdDovL3hlbmJpdHMueGVu
cHJvamVjdC5vcmcveGVuLmdpdCB4ZW4uZ2l0CiAgICBjZCB4ZW4uZ2l0CiAg
ICBnaXQgY2hlY2tvdXQgNC4xMC4wLXNoaW0tY29tZXQtMwogICAgLi9jb25m
aWd1cmUKICAgIG1ha2UgLUMgdG9vbHMvZmlybXdhcmUveGVuLWRpcgoKICBB
bmQgdGhlbiBpbnN0YWxsIHRoZSBzaGltIGV4ZWN1dGFibGUgd2hlcmUKICB0
aGUgNC44IHB2IHNoaW0gbW9kZSB0b29scyBleHBlY3QgdG8gZmluZCBpdAoK
ICAgIGNwIHRvb2xzL2Zpcm13YXJlL3hlbi1kaXIveGVuLXNoaW0gL3Vzci9s
aWIveGVuL2Jvb3QveGVuLXNoaW0KICAgIGNwIHRvb2xzL2Zpcm13YXJlL3hl
bi1kaXIveGVuLXNoaW0gL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QveGVuLXNo
aW0KCiAgVGhpcyBzdGVwIGlzIG9ubHkgbmVlZGVkIHRvIGJvb3QgZ3Vlc3Rz
IGluICJQVkggd2l0aCBQViBzaGltIgogIG1vZGU7IGl0IGlzIG5vdCBuZWVk
ZWQgd2hlbiBib290aW5nIFBWSC1zdXBwb3J0aW5nIGd1ZXN0cyBhcyBQVkgu
CgoKVXNhZ2UgaW5zdHJ1Y3Rpb25zCi0tLS0tLS0tLS0tLS0tLS0tLQoKKiBD
b252ZXJ0aW5nIGEgUFYgY29uZmlnIHRvIGEgUFZIIHNoaW0gY29uZmlnCgot
IFJlbW92ZSBhbnkgcmVmZXJlbmNlIHRvICdidWlsZGVyJyAoZS5nLiwgYGJ1
aWxkZXI9ImdlbmVyaWMiYCkKLSBBZGQgdGhlIGZvbGxvd2luZyB0d28gbGlu
ZXM6CiAgdHlwZT0icHZoIgogIHB2c2hpbT0xCgoqIENvbnZlcnRpbmcgYSBQ
ViBjb25maWcgdG8gYSBQVkggY29uZmlnCgpJZiB5b3UgaGF2ZSBhIGtlcm5l
bCBjYXBhYmxlIG9mIGJvb3RpbmcgUFZILCB0aGVuIFBWSCBtb2RlIGlzIGJv
dGgKZmFzdGVyIGFuZCBtb3JlIHNlY3VyZSB0aGFuIFBWIG9yIFBWSC1zaGlt
IG1vZGUuCgotIFJlbW92ZSBhbnkgcmVmZXJlbmNlIHRvICdidWlsZGVyJyAo
ZS5nLiwgYGJ1aWxkZXI9ImdlbmVyaWMiYCkKLSBBZGQgdGhlIGZvbGxvd2lu
ZyBsaW5lOgogIHR5cGU9InB2aCIKCiogVGhlcmUgaXMgbm8gbmVlZCB0byBy
ZWJvb3QgdGhlIGhvc3QuCg==

--=separator
Content-Type: application/octet-stream; name="xsa254/README.pti"
Content-Disposition: attachment; filename="xsa254/README.pti"
Content-Transfer-Encoding: base64

ICAgICAgICAgICAgICAgICAgICAgIFhlbiBwYWdlLXRhYmxlIGlzb2xhdGlv
biAoWFBUSSkKICAgICAgICAgICAgICAgICAgICAgID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0KClN1bW1hcnkKLS0tLS0tLQoKVGhpcyBSRUFE
TUUgZ2l2ZXMgcmVmZXJlbmNlcyBmb3Igb25lIG9mIHRocmVlIG1pdGlnYXRp
b24gc3RyYXRlZ2llcwpmb3IgTWVsdGRvd24uCgpUaGlzIHNlcmllcyBpcyBh
IGZpcnN0LWNsYXNzIG1pZ2l0YXRpb24gcGFnZXRhYmxlIGlzb2xhdGlvbiBz
ZXJpZXMgZm9yClhlbi4gIEl0IGlzIGF2YWlsYWJsZSBmb3IgWGVuIDQuNiB0
byBYZW4gNC4xMCBhbmQgbGF0ZXIuCgpQcmVjaXNlIGdpdCBjb21taXRzIGFy
ZSBhcyBmb2xsb3dzOgoKNC4xMDoKCjA1ZWJhOTNhMGEzNDRlYzE4OWU3MTcy
MmJkNTQyY2RjNzk0OWE4YTUgeDg2OiBmaXggR0VUX1NUQUNLX0VORAo3Y2Nj
ZDZmNzQ4ZWM3MjRjZjk0MDhjZWM2YjNlYzhlNTRhOGEyYzFmIHg4NjogYWxs
b3cgTWVsdGRvd24gYmFuZC1haWQgdG8gYmUgZGlzYWJsZWQKMjM0ZjQ4MTMz
N2VhMWE5M2RiOTY4ZDYxNDY0OWE2YmRmZGM4NDE4YSB4ODY6IE1lbHRkb3du
IGJhbmQtYWlkIGFnYWluc3QgbWFsaWNpb3VzIDY0LWJpdCBQViBndWVzdHMK
NTdkYzE5N2NmMGQzNmM1NmJhMWQ5ZDMyYzZhMTQ1NGJiNTI2MDViYiB4ODYv
bW06IEFsd2F5cyBzZXQgX1BBR0VfQUNDRVNTRUQgb24gTDRlIHVwZGF0ZXMK
OTEwZGQwMDVkYTIwZjI3ZjM0MTViN2VjY2RmNDM2ODc0OTg5NTA2YiB4ODYv
ZW50cnk6IFJlbW92ZSBzdXBwb3J0IGZvciBwYXJ0aWFsIGNwdV91c2VyX3Jl
Z3MgZnJhbWVzCgo0Ljk6CgpmMTFjZjI5ZjI3NGU5MGU2NDUxYWFhYTVhYjUy
ZGYyZWQ2M2ViMzBkIHg4NjogZml4IEdFVF9TVEFDS19FTkQKZGM3ZDQ2NTgw
ZDljNjMzYTU5YmUxYzM3NzZmNzljMDFkZDBjYjk4YiB4ODY6IGFsbG93IE1l
bHRkb3duIGJhbmQtYWlkIHRvIGJlIGRpc2FibGVkCjFlMDk3NDYzOGQ2NWQ5
YjhhY2Y5YWM3NTExZDc0NzE4OGYzOGJjYzMgeDg2OiBNZWx0ZG93biBiYW5k
LWFpZCBhZ2FpbnN0IG1hbGljaW91cyA2NC1iaXQgUFYgZ3Vlc3RzCjg3ZWE3
ODE2MjQ3MDkwZThlNWJjNTY1M2IxNmM0MTI5NDNhMDU4YjUgeDg2L21tOiBB
bHdheXMgc2V0IF9QQUdFX0FDQ0VTU0VEIG9uIEw0ZSB1cGRhdGVzCjIyMTNm
ZmUxYTJkODJjM2M5YzRhMTU0ZWE2ZWUyNTIzOTVhYTg2OTMgeDg2L2VudHJ5
OiBSZW1vdmUgc3VwcG9ydCBmb3IgcGFydGlhbCBjcHVfdXNlcl9yZWdzIGZy
YW1lcwoKNC44OgoKMmNkMTg5ZWI1NWFmOGIwNDE4NWI0NzNhYzI4ODVmNzZi
M2Q4N2VmZSB4ODY6IGZpeCBHRVRfU1RBQ0tfRU5ECjMxZDM4ZDYzM2EzMDZi
MmIwNjc2N2I1YTVmNWE4YTAwMjY5ZjNjOTIgeDg2OiBhbGxvdyBNZWx0ZG93
biBiYW5kLWFpZCB0byBiZSBkaXNhYmxlZAoxYmE0NzdiZGU3MzdiZjliMjhj
YzQ1NWJlZjFlOWE2YmM3NmQ2NmZjIHg4NjogTWVsdGRvd24gYmFuZC1haWQg
YWdhaW5zdCBtYWxpY2lvdXMgNjQtYml0IFBWIGd1ZXN0cwowNDllMmY0NWJm
YTQ4ODk2NzQ5NDQ2NmVjNjUwNmMzZWNhZTVmZTBlIHg4Ni9tbTogQWx3YXlz
IHNldCBfUEFHRV9BQ0NFU1NFRCBvbiBMNGUgdXBkYXRlcwphN2NmMGEzYjgx
ODM3N2E4YTQ5YmFlZDM2MDZiZmEyZjIxNGNkNjQ1IHg4Ni9lbnRyeTogUmVt
b3ZlIHN1cHBvcnQgZm9yIHBhcnRpYWwgY3B1X3VzZXJfcmVncyBmcmFtZXMK
CjQuNzoKCmIxYWUxMjY0YmFmODYxN2RmMDM2YTI5ODQ2MWExYmI0M2VhZTc5
YzEgeDg2OiBmaXggR0VUX1NUQUNLX0VORAplMTlkMGFmNGVlMmFlOWU0MmE4
NWRiNjM5ZmQ2ODQ4ZTcyZjU2NThiIHg4NjogYWxsb3cgTWVsdGRvd24gYmFu
ZC1haWQgdG8gYmUgZGlzYWJsZWQKZTE5NTE3YTMzNTVhY2FhYTJmZjgzMDE4
YmM0MWU3ZmQwNDQxNjFlNSB4ODY6IE1lbHRkb3duIGJhbmQtYWlkIGFnYWlu
c3QgbWFsaWNpb3VzIDY0LWJpdCBQViBndWVzdHMKOWI3NjkwOGU2ZTA3NGQ3
ZWZiZWFmZTZiYWQwNjZlY2M1ZjNjM2M0MyB4ODYvbW06IEFsd2F5cyBzZXQg
X1BBR0VfQUNDRVNTRUQgb24gTDRlIHVwZGF0ZXMKMGU2YzZmYzQ0OTAwMGQ5
N2Y5ZmE4N2VkMWZiZTIzZjBjZjIxNDA2YiB4ODYvZW50cnk6IFJlbW92ZSBz
dXBwb3J0IGZvciBwYXJ0aWFsIGNwdV91c2VyX3JlZ3MgZnJhbWVzCgo0LjY6
Cgo0NGFkN2Y2ODk1ZGE5ODYxMDQyZDdhNDFlNjM1ZDQyZDgzY2IyNjYwIHg4
NjogYWxsb3cgTWVsdGRvd24gYmFuZC1haWQgdG8gYmUgZGlzYWJsZWQKOTFk
YzkwMmZkZjQxNjU5YzIxMDMyOWQ2ZjY1NzhmODEzMmVlNDc3MCB4ODY6IE1l
bHRkb3duIGJhbmQtYWlkIGFnYWluc3QgbWFsaWNpb3VzIDY0LWJpdCBQViBn
dWVzdHMKYTA2NTg0MWIzYWU5ZjBlZjQ5Yjk4MjNjZDIwNWM3OWVlMGMyMmI5
YyB4ODYvbW06IEFsd2F5cyBzZXQgX1BBR0VfQUNDRVNTRUQgb24gTDRlIHVw
ZGF0ZXMKYzZlOWU2MDk1NjY5YjNjNjNiOTJkMjFmZGRiMzI2NDQxYzczNzEy
YyB4ODYvZW50cnk6IFJlbW92ZSBzdXBwb3J0IGZvciBwYXJ0aWFsIGNwdV91
c2VyX3JlZ3MgZnJhbWVzCg==

--=separator
Content-Type: application/octet-stream; name="xsa254/README.vixen"
Content-Disposition: attachment; filename="xsa254/README.vixen"
Content-Transfer-Encoding: base64

ICAgICAgICAgICAgICAgIFBWLWluLUhWTSBzaGltIHdpdGggInNpZGVjYXIi
IElTTwogICAgICAgICAgICAgICAgPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09CgpTdW1tYXJ5Ci0tLS0tLS0KClRoaXMgUkVBRE1FIGRlc2Ny
aWJlcyBvbmUgb2YgdGhyZWUgbWl0aWdhdGlvbiBzdHJhdGVnaWVzIGZvciBN
ZWx0ZG93bi4KClRoZSBiYXNpYyBwcmluY2lwbGUgaXMgdG8gcnVuIFBWIGd1
ZXN0cyAod2hpY2ggY2FuIHJlYWQgYWxsIG9mIGhvc3QKbWVtb3J5IGR1ZSB0
byB0aGUgaGFyZHdhcmUgYnVncykgYXMgSFZNIGd1ZXN0cyAod2hpY2ggY2Fu
bm90LCBhdCBsZWFzdApub3QgZHVlIHRvIE1lbHRkb3duKS4gIFRoZSBQViBl
bnZpcm9ubWVudCBpcyBzdGlsbCBwcm92aWRlZCB0byB0aGUKZ3Vlc3QgYnkg
YW4gZW1iZWRkZWQgY29weSBvZiBYZW4sIHRoZSAic2hpbSIuICBUaGlzIHZl
cnNpb24gb2YgdGhlCnNoaW0gaXMgY29kZW5hbWVkICJWaXhlbiIuCgpJbiBv
cmRlciB0byBib290IHRoZSBzaGltIHdpdGggYW4gdW5tb2RpZmllZCB0b29s
c3RhY2ssIHlvdSBhbHNvCnByb3ZpZGUgYSBzcGVjaWFsIGRpc2sgY29udGFp
bmluZyB0aGUgc2hpbSBhbmQgdGhlIGd1ZXN0IGtlcm5lbCAob3IKcHZncnVi
KTsgdGhpcyBpcyBjYWxsZWQgdGhlICJzaWRlY2FyIi4KCk5vdGUgdGhhdCBi
b3RoIG9mIHRoZXNlIHNoaW0tYmFzZWQgYXBwcm9hY2hlcyBwcmV2ZW50IGF0
dGFja3Mgb24gdGhlCmhvc3QsIGJ1dCBsZWF2ZSB0aGUgZ3Vlc3QgdnVsbmVy
YWJsZSB0byBNZWx0ZG93biBhdHRhY2tzIGJ5IGl0cyBvd24KdW5wcml2aWxl
Z2VkIHByb2Nlc3NlczsgdGhpcyBpcyB0cnVlIGV2ZW4gaWYgdGhlIGd1ZXN0
IE9TIGhhcyBLUFRJIG9yCnNpbWlsYXIgTWVsdGRvd24gbWl0aWdhdGlvbi4K
CldoYXQgeW91IHdpbGwgbmVlZAotLS0tLS0tLS0tLS0tLS0tLS0KCiAqIFlv
dXIgaG9zdCBtdXN0IGJlIGFibGUgdG8gcnVuIGdydWItbWtyZXNjdWUgdG8g
Z2VuZXJhdGUgYSAuaXNvCiAqIFlvdSB3aWxsIHRoZXJlZm9yZSBuZWVkIHhv
cnJpc28gYW5kIG10b29scwogKiBZb3UgbXVzdCBiZSB1c2luZyB4bCBhbmQg
YWJsZSB0byB1c2UgYW4gYWx0ZXJuYXRpdmUgeW91ciBndWVzdCBjb25maWcK
CiAqIFlvdSB3aWxsIG5lZWQgdGhlIHNjcmlwdCAicHZzaGltLWNvbnZlcnRl
ci5wbCIKICAtIFRoaXMgcmVsaWVzIG9uIHBlcmwtanNvbgogKiBZb3Ugd2ls
bCBuZWVkIHRoZSB4ZW4uZ2l0IHRhZyA0LjkuMS1zaGltLXZpeGVuLTEKCgpJ
bnN0cnVjdGlvbnMKLS0tLS0tLS0tLS0tCgoxLiBPbiBhIHN1aXRhYmxlIHN5
c3RlbSAocGVyaGFwcyBhIGRpZmZlcmVudCBob3N0KQogICAgZ2l0IGNsb25l
IGdpdDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcveGVuLmdpdCB4ZW4uZ2l0
CiAgICBjZCB4ZW4uZ2l0CiAgICBnaXQgY2hlY2tvdXQgNC45LjEtc2hpbS12
aXhlbi0xCgpJZiB5b3UgbmVlZCBiaS1kaXJlY3Rpb25hbCBjb25zb2xlIGFu
ZCBkb24ndCBtaW5kIGEgbGVzcy10ZXN0ZWQgcGF0Y2gsCnlvdSBjYW4gYXBw
bHkgdGhlIHBhdGNoIGZvdW5kIGluIHRoaXMgZW1haWw6CgogICAgbWFyYy5p
bmZvLz9pPTwxNTE1NjA0NTUyLTkyMDUtMS1naXQtc2VuZC1lbWFpbC1zcm5A
cHJnbXIuY29tPgoKYnVpbGQgYSB4ZW4gaHlwZXJ2aXNvciBiaW5hcnkgYXMg
dXN1YWw6CgogICAgbWFrZSB4ZW4KCklmIHlvdXIgZGVmYXVsdCB2ZXJzaW9u
IG9mIHB5dGhvbiBpcyBweXRob24gMywgeW91IG1heSBuZWVkIHRvIGFkZCB0
aGUgZm9sbG93aW5nOgoKICAgIG1ha2UgUFlUSE9OPXB5dGhvbjIgeGVuCgpU
aGlzIHdpbGwgYnVpbGQgYSBmaWxlCiAgICB4ZW4veGVuLmd6CgoyLiBDb3B5
IHRoYXQgZmlsZSB0byB5b3VyIGRvbTAuCgpJZGVhbGx5IHNvbWVwbGFjZSBs
aWtlIC91c3IvbGliL3hlbi9ib290L3hlbi12aXhlbi5negoKMy4gQ29weSB0
aGUgc2NyaXB0IHB2c2hpbS1jb252ZXJ0ZXIgdG8geW91ciBkb20wIGFuZCBt
YWtlCiAgIGl0IGV4ZWN1dGFibGU6CiAgICAgIGNobW9kICt4IHB2c2hpbS1j
b252ZXJ0ZXIucGwKCjQuIEZvciBlYWNoIGd1ZXN0CgogIChpKSBpZiB0aGUg
Z3Vlc3QgaXMgY3VycmVudGx5IGJvb3RlZCB3aXRoIHB5Z3J1YiB5b3UgbXVz
dCBmaXJzdAogICBzd2l0Y2ggdG8gZGlyZWN0IGtlcm5lbCBib290IChieSBt
YW51YWxseSBjb3B5aW5nIHRoZSBrZXJuZWwgYW5kCiAgIGluaXRyYW1mcyBv
dXQgb2YgdGhlIGd1ZXN0LCBhbmQgY29uZmlndXJpbmcgdGhlIGNvbW1hbmQg
bGluZSBpbiB0aGUKICAgZG9tYWluIGNvbmZpZ3VyYXRpb24gZmlsZSksIG9y
IHB2Z3J1Yi4KCiAgKGlpKSBydW4KICAgICAgLi9wdnNoaW0tY29udmVydGVy
LnBsIC0tc2hpbT0vdXNyL2xpYi94ZW4vYm9vdC94ZW4tdml4ZW4uZ3ogL2V0
Yy94ZW4vR1VFU1QuY2ZnIC9ldGMveGVuL0dVRVNULndpdGgtc2hpbS1jZmcK
CiAgKGlpaSkgc2h1dCB0aGUgZ3Vlc3QgZG93biBjbGVhbmx5CgogIChpdikg
Y3JlYXRlIHRoZSBndWVzdCB3aXRoIHRoZSBuZXcgY29uZmlnCiAgICAgIHhs
IGNyZWF0ZSAvZXRjL3hlbi9HVUVTVC53aXRoLXNoaW0tY2ZnCgogICh2KSBD
aGVjayB0aGF0IGl0IGJvb3RzIHByb3Blcmx5LiAgeGwgY29uc29sZSBzaG91
bGQgd29yay4KCiAgKHZpKSBNYWtlIGFycmFuZ2VtZW50cyBzbyB0aGF0IGF1
dG9zdGFydGluZyBvZiB0aGUgZ3Vlc3Qgd2lsbCB1c2UKICAgICB0aGUgbmV3
IGNvbmZpZyBmaWxlIHJhdGhlciB0aGFuIHRoZSBvbGQgb25lCgo=

--=separator
Content-Type: application/octet-stream; name="xsa254/README.which-shim"
Content-Disposition: attachment; filename="xsa254/README.which-shim"
Content-Transfer-Encoding: base64

CQkgICBIb3cgdG8gZGVjaWRlIHdoaWNoIHNoaW0gdG8gdXNlCgkJICAgPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKQSB3b3JrLWFyb3VuZCB0
byBNZWx0ZG93biAoYWthICJTUDMiIG9yICJWYXJpYW50IDMiKSBvbiBJbnRl
bApwcm9jZXNzb3JzIGlzIHRvIHJ1biBndWVzdHMgaW4gSFZNIG9yIFBWSCBt
b2RlLgoKTm90ZSB0aGlzIHNoaW0tYmFzZWQgYXBwcm9hY2ggcHJldmVudHMg
YXR0YWNrcyBvbiB0aGUgaG9zdCwgYnV0IGxlYXZlcwp0aGUgZ3Vlc3QgdnVs
bmVyYWJsZSB0byBNZWx0ZG93biBhdHRhY2tzIGJ5IGl0cyBvd24gdW5wcml2
aWxlZ2VkCnByb2Nlc3NlczsgdGhpcyBpcyB0cnVlIGV2ZW4gaWYgdGhlIGd1
ZXN0IE9TIGhhcyBLUFRJIG9yIHNpbWlsYXIKTWVsdGRvd24gbWl0aWdhdGlv
bi4KClNvbWUgZ3Vlc3RzIGFyZSBkaWZmaWN1bHQgdG8gY29udmVydCB0byBy
dW5uaW5nIGluIEhWTSBvciBQVkggbW9kZSwKZWl0aGVyIGR1ZSB0byBsYWNr
IG9mIHBhcnRpdGlvbmluZyAvIE1CUiwgb3IgZHVlIHRvIGtlcm5lbApjb21w
YXRpYmlsaXRpZXMuICBBcyBhbiBlbWVyZ2VuY3kgYmFja3N0b3AsIHRoZXJl
IGFyZSB0d28gYXBwcm9hY2hlcywKd2hpY2ggd2UndmUgY29kZW5hbWVkICJW
aXhlbiIgYW5kICJDb21ldCIuICBCb3RoIGludm9sdmUgcnVubmluZyBhbgpl
bWJlZGRlZCBjb3B5IG9mIFhlbiAoY2FsbGVkIGEgInNoaW0iKSB3aXRoaW4g
dGhlIEhWTSBvciBQVkggZ3Vlc3QgdG8KcHJvdmlkZSB0aGUgbmF0aXZlIFBW
IGludGVyZmFjZS4KCkJlbG93IGRlc2NyaWJlcyB0aGUgcHJvcGVydGllcywg
YW5kIHdobyBtaWdodCB3YW50IHRvIHVzZSBlYWNoIG9uZS4KCk5PVEU6IEJv
dGggc2hpbXMgcmVxdWlyZSBob3N0IHBhdGNoZXMgdG8gYm9vdCBvbiBBTUQg
aG9zdHMuICBUaGlzCnNob3VsZG4ndCBiZSBhbiBpc3N1ZSwgYXMgU1AzIGRv
ZXMgbm90IGFmZmVjdCBzeXN0ZW1zIHJ1bm5pbmcgb24gQU1ELgoKVml4ZW4K
LS0tLS0KClZpeGVuIGhhcyB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6CiAq
IFJ1bnMgdGhlIHNoaW0gaW4gYW4gSFZNIGd1ZXN0LgogKiBJdCByZXF1aXJl
cyBubyBoeXBlcnZpc29yIG9yIHRvb2xzdGFjayBjaGFuZ2VzLCBub3IgZG9l
cyBpdCByZXF1aXJlCiAgIGEgaG9zdCByZWJvb3QuCiAqIEl0IGhhcyBiZWVu
IGV4dGVuc2l2ZWx5IHRlc3RlZCBpbiBBbWF6b24ncyBkZXBsb3ltZW50IGZv
ciB2ZXJzaW9ucwogICBvZiBYZW4gZ29pbmcgYmFjayB0byAzLjQKICogR3Vl
c3QgcmVib290cyBhcmUgcmVxdWlyZWQKICogR3Vlc3QgY29uZmlncyBtdXN0
IGJlIGZlZCB0aHJvdWdoIGEgY29udmVydGVyIHByb2dyYW0KICogVGhlIGNv
bnZlcnRlciBwcm9ncmFtIHNwaXRzIG91dCBhIHNtYWxsIGd1ZXN0LXNwZWNp
ZmljIC5pc28KICAgaW1hZ2UgKHdlIGNhbGwgdGhpcyBhICJzaWRlY2FyIikg
dXNlZCBmb3IgYm9vdGluZwogKiBCZWNhdXNlIHRoZSByZXN1bHQgaXMgYW4g
SFZNIGd1ZXN0LCB0aGlzIGFwcHJvYWNoIGludm9sdmVzCiAgIHJ1bm5pbmcg
cWVtdSBhcyBhIFBDIGVtdWxhdG9yICh0aGlzIGlzIGRvbmUgYXV0b21hdGlj
YWxseSkKICogU29tZSBjb21tb24gZmVhdHVyZXMgYXJlIG5vdCBzdXBwb3J0
ZWQ6CiAgLSBCYWxsb29uaW5nCiAgLSBNaWdyYXRpb24KICAtIHZjcHUgaG90
cGx1ZwogIC0gYmlkaXJlY3Rpb25hbCBjb25zb2xlIHN1cHBvcnQgKGNvbnNv
bGUgaXMgd3JpdGUtb25seSkKICogRGlyZWN0LWJvb3Qga2VybmVscyBhbmQg
cHZncnViIChib3RoIHB2Z3J1YjEgYW5kIHB2Z3J1YjIpIGFyZQogICBzdXBw
b3J0ZWQgYnkgdGhlIGNvbnZlcnNpb24gcHJvZ3JhbS4gICdweWdydWInIGlz
IG5vdCBzdXBwb3J0ZWQuCiAqIHhsIGFuZCB4bSBkb21haW4gY29uZmlncyBj
YW4gYmUgY29udmVydGVkOyBsaWJ2aXJ0IGRvbWFpbgogICBjb25maWd1cmF0
aW9uIGFycmFuZ2VtZW50cyBhcmUgbm90IHN1cHBvcnRlZC4KICogR3Vlc3Qg
dXNlcnNwYWNlIGNhbiByZWFkIGFsbCBvZiBndWVzdCBtZW1vcnksIHdpdGhp
biBlYWNoIGd1ZXN0LAogICBhbmQgYSBndWVzdCBtaWdpdGF0aW9uIGZvciB0
aGlzIGlzIG5vdCBwb3NzaWJsZS4KCllvdSBtaWdodCBjb25zaWRlciB0aGlz
IGFwcHJvYWNoIGlmOgotIFlvdSB3YW50IHRvIGRlcGxveSBhIGZpeCBpbW1l
ZGlhdGVseQotIFlvdSBjYW4gdG9sZXJhdGUgdGhlIGxvc3Mgb2Ygd2l0aGlu
LWd1ZXN0IHNlY3VyaXR5Ci0gWW91IGNhbid0LCBvciB3b3VsZCBsaWtlIHRv
IGF2b2lkLCB1cGRhdGluZyB0byBYZW4gNC44IG9yIG5ld2VyCi0gWW91J2Qg
bGlrZSB0byBhdm9pZCBwYXRjaGluZyBhbmQgcmVib290aW5nIHlvdXIgaG9z
dAotIFlvdSBhcmUgYWJsZSB0bzoKIC0gUnVuIGEgc2NyaXB0IHRvIG1vZGlm
eSBlYWNoIGRvbWFpbiBjb25maWcKIC0gQWZmb3JkIGFuIGV4dHJhIDgwTWlC
IHBlciBndWVzdAogLSBUb2xlcmF0ZSBoYXZpbmcgYW4gZXh0cmEgUUVNVSBh
cm91bmQKLSBZb3UgZG9uJ3QgbmVlZCBtaWdyYXRpb24sIG1lbW9yeSBiYWxs
b29uaW5nLCB2Y3B1IGhvdHBsdWcsCiAgb3IgYSBiaS1kaXJlY3Rpb25hbCBj
b25zb2xlCgpUbyB1c2UgdGhpcyBzb2x1dGlvbiwgc2VlIFJFQURNRS52aXhl
bi4KCkJpLWRpcmVjdGlvbmFsIGNvbnNvbGUgaXMgYXZhaWxhYmxlIGFzIGFu
IGV4dHJhIHBhdGNoLCBidXQgaGFzbid0IGJlZW4Kd2lkZWx5IHRlc3RlZDoK
Cm1hcmMuaW5mby8/aT08MTUxNTYwNDU1Mi05MjA1LTEtZ2l0LXNlbmQtZW1h
aWwtc3JuQHByZ21yLmNvbT4KCkNvbWV0Ci0tLS0tCgpDb21ldCBoYXMgdGhl
IGZvbGxvd2luZyBwcm9wZXJ0aWVzOgogKiBSdW5zIHRoZSBzaGltIGluIGEg
UFZIIGd1ZXN0LgogKiBQVkggbW9kZSBpcyBhdmFpbGFibGUgaW4gWGVuIDQu
MTAsIGFuZCB3aWxsIGJlIGJhY2twb3J0ZWQgdG8gWGVuCiAgIDQuOSBhbmQg
NC44IGJ1dCBubyBmYXJ0aGVyCiAqIFJlcXVpcmVzIGhvc3QgaHlwZXJ2aXNv
ciBhbmQgdG9vbHN0YWNrIHBhdGNoZXMgKGFuZCBob3N0IHJlYm9vdCksCiAg
IGV2ZW4gZm9yIFhlbiA0LjEwCiAqIFJlcXVpcmVzIG1pbmltYWwgZ3Vlc3Qg
Y29uZmlnIGNoYW5nZXMsIGFuZCBubyAic2lkZWNhciIKICogQm9vdGxvYWRp
bmcgaXMgaWRlbnRpY2FsIHRvIG5hdGl2ZSBQViBndWVzdHM7IGRpcmVjdC1i
b290LCBwdmdydWIsCiAgIGFuZCBweWdydWIgYWxsIHdvcmsgZXF1YWxseSB3
ZWxsCiAqIEJlY2F1c2UgdGhlIHJlc3VsdCBpcyBhIFBWSCBndWVzdCwgdGhp
cyBhcHByb2FjaCBpbnZvbHZlcyBubyBQQyBlbXVsYXRvci4KICogVGhlIGZv
bGxvd2luZyBmZWF0dXJlcyBub3QgYXZhaWxhYmxlIGluIFZpeGVuIGFyZSBz
dXBwb3J0ZWQ6CiAgLSBNZW1vcnkgYmFsbG9vbmluZwogIC0gR3Vlc3QgbWln
cmF0aW9uCiAgLSB2Y3B1IGhvdHBsdWcKICAtIGJpZGlyZWN0aW9uYWwgY29u
c29sZSBzdXBwb3J0CiAqIEd1ZXN0IHVzZXJzcGFjZSBjYW4gcmVhZCBhbGwg
b2YgZ3Vlc3QgbWVtb3J5LCB3aXRoaW4gZWFjaCBndWVzdCwKICAgYW5kIGEg
Z3Vlc3QgbWlnaXRhdGlvbiBmb3IgdGhpcyBpcyBub3QgcG9zc2libGUuCgpZ
b3UgbWlnaHQgY29uc2lkZXIgdGhpcyBhcHByb2FjaCBpZjoKLSBZb3UncmUg
b24gNC44IG9yIGxhdGVyIGFscmVhZHkKLSBZb3UgY2FuIHRvbGVyYXRlIHRo
ZSBsb3NzIG9mIHdpdGhpbi1ndWVzdCBzZWN1cml0eQotIFlvdSBjYW4gcGF0
Y2ggYW5kIHJlYm9vdCB5b3VyIGhvc3QKLSBZb3UgZG9uJ3Qgd2FudCBhbiBl
eHRyYSBRRU1VIGFyb3VuZAotIFlvdSBuZWVkIG1pZ3JhdGlvbiwgbWVtb3J5
IGJhbGxvb25pbmcsIG9yIHZjcHUgaG90cGx1Zywgb3IgYQogIGJpZGlyZWN0
aW9uYWwgY29uc29sZQotIFlvdSBuZWVkIHB5Z3J1YgotIFlvdSBuZWVkIHRv
IHVzZSBsaWJ2aXJ0CgpBdCB0aGUgbW9tZW50LCBDb21ldCBpcyBhdmFpbGFi
bGUgZm9yIDQuMTAuICAgV2UgZXhwZWN0IHRvIGhhdmUKYmFja3BvcnRzIHRv
IDQuOCBhbmQgNC44IGF2YWlsYWJsZSB3aXRoaW4gYSBmZXcgd29ya2luZyBk
YXlzLgo=

--=separator
Content-Type: application/octet-stream; name="xsa254/pvshim-converter.pl"
Content-Disposition: attachment; filename="xsa254/pvshim-converter.pl"
Content-Transfer-Encoding: base64

IyEvdXNyL2Jpbi9wZXJsIC13CiMKIyB1c2FnZToKIyAgIHB2c2hpbS1jb252
ZXJ0ZXIgW09QVElPTlNdIE9MRC1DT05GSUcgTkVXLUNPTkZJRwojCiMgb3B0
aW9uczoKIyAgIC0tcWVtdSBQQVRILVRPLVFFTVUgICAgICAgIGZpbGVuYW1l
IG9mIHFlbXUtc3lzdGVtLWkzODYKIyAgIC0tc2lkZWNhcnMtZGlyZWN0b3J5
IERJUiAgIGRlZmF1bHQgaXMgL3Zhci9saWIveGVuL3B2c2hpbS1zaWRlY2Fy
cwojICAgLS1zaGltIFNISU0gICAgICAgICAgICAgICAgb3ZlcnJpZGVzIGRv
bWFpbiBjb25maWcgZmlsZQojICAgLS1kZWJ1ZyAgICAgICAgICAgICAgICAg
ICAgdmVyYm9zZSwgYW5kIGxlYXZlcyBzaWRlY2FyIHByZXAgZGlyIGFyb3Vu
ZAojCiMgV2hhdCB3ZSBkbwojCiMgIHJlYWQgZXhpc3RpbmcgY29uZmlnIGZp
bGUgdXNpbmcgcHl0aG9uCiMgIGRldGVybWluZSBrZXJuZWwsIHJhbWRpc2sg
YW5kIGNtZGxpbmUKIyAgdXNlIHRoZW0gdG8gcHJvZHVjZSBzaWRlY2FyIGFu
ZCBzYXZlIGl0IHVuZGVyIGRvbWFpbiBuYW1lCiMgIG1lc3Mgd2l0aCB0aGUg
dGhpbmdzIHRoYXQgbmVlZCB0byBiZSBtZXNzZWQgd2l0aAojICBzcGl0IG91
dCBuZXcgY29uZmlnIGZpbGUKCnVzZSBzdHJpY3Q7Cgp1c2UgR2V0b3B0OjpM
b25nOwp1c2UgSlNPTjsKdXNlIElPOjpIYW5kbGU7CnVzZSBQT1NJWDsKdXNl
IEZjbnRsIHF3KDpmbG9jayk7CgpvdXIgJGRlYnVnOwoKc3ViIHJ1bmNtZCB7
CiAgICBwcmludCBTVERFUlIgIisgQF9cbiIgaWYgJGRlYnVnOwogICAgJCE9
MDsgJD89MDsgc3lzdGVtIEBfIGFuZCBkaWUgIiRfWzBdOiAkISAkPyI7Cn0K
Cm91ciAkcWVtdTsKb3VyICRzaGltOwpvdXIgJHNpZGVjYXJzX2RpciA9ICcv
dmFyL2xpYi94ZW4vcHZzaGltLXNpZGVjYXJzJzsKCkdldE9wdGlvbnMoJ3Fl
bXU9cycgPT4gXCRxZW11LAogICAgICAgICAgICdzaWRlY2Fycy1kaXJlY3Rv
cnk9cycgPT4gXCRzaWRlY2Fyc19kaXIsCiAgICAgICAgICAgJ3NoaW09cycg
PT4gXCRzaGltLAogICAgICAgICAgICdkZWJ1ZycgPT4gXCRkZWJ1ZykKICAg
IG9yIGRpZSAicHZzaGltLWNvbnZlcnRlcjogYmFkIG9wdGlvbnNcbiI7CgpA
QVJHVj09MiBvciBkaWUgInB2c2hpbS1jb252ZXJ0ZXI6IG5lZWQgb2xkIGFu
ZCBuZXcgY29uZmlnIGZpbGVuYW1lcyI7CgpvdXIgKCRpbiwkb3V0KSA9IEBB
UkdWOwoKb3VyICRpbmRhdGE7CgppZiAoJGluIG5lICctJykgewogICAgb3Bl
biBJLCAnPCcsICIkaW4iIG9yIGRpZSAib3BlbiBpbnB1dCBjb25maWcgZmls
ZTogJCFcbiI7Cn0gZWxzZSB7CiAgICBvcGVuIEksICc8JlNURElOJyBvciBk
aWUgJCE7Cn0KewogICAgbG9jYWwgJC87CiAgICAkaW5kYXRhID0gPEk+Owp9
CkktPmVycm9yIGFuZCBkaWUgJCE7CmNsb3NlIEk7CgpvcGVuIFAsICItfCIs
IHF3KHB5dGhvbjIgLWMpLCA8PEVORCwgJGluZGF0YSBvciBkaWUgJCE7Cmlt
cG9ydCBzeXMKaW1wb3J0IGpzb24KbCA9IHt9CmV4ZWMgc3lzLmFyZ3ZbMV0g
aW4gbApmb3IgayBpbiBsLmtleXMoKToKCWlmIGsuc3RhcnRzd2l0aCgiXyIp
OgoJCWRlbCBsW2tdCnByaW50IGpzb24uZHVtcHMobCkKRU5ECgpvdXIgJGM7
Cgp7CiAgICBsb2NhbCAkLzsKICAgICRfID0gPFA+OwogICAgJCE9MDsgJD89
MDsgY2xvc2UgUCBvciBkaWUgIiQhICQ/IjsKICAgICRjID0gZGVjb2RlX2pz
b24gJF87Cn0KCmRpZSAibm8gZG9tYWluIG5hbWUgPyIgdW5sZXNzIGV4aXN0
cyAkYy0+e25hbWV9OwpkaWUgImJvb3Rsb2FkZXIgbm90IHlldCBzdXBwb3J0
ZWQiIGlmICRjLT57Ym9vdGxvYWRlcn07CmRpZSAibm8ga2VybmVsIiB1bmxl
c3MgJGMtPntrZXJuZWx9OwoKb3VyICRzaWRlY2FyID0gJGMtPntwdnNoaW1f
c2lkZWNhcl9wYXRofSB8fCAiJHNpZGVjYXJzX2Rpci8kYy0+e25hbWV9Lmlz
byI7Cm91ciAkZG13cmFwID0gJGMtPntwdnNoaW1fc2lkZWNhcl9wYXRofSB8
fCAiJHNpZGVjYXJzX2Rpci8kYy0+e25hbWV9LmRtIjsKCiRzaGltIHx8PSAk
Yy0+e3B2c2hpbV9wYXRofTsKJHNoaW0gfHw9ICcvdXNyL2xvY2FsL2xpYi94
ZW4vYm9vdC94ZW4tc2hpbSc7CgpvdXIgJHNoaW1fY21kbGluZSA9ICRjLT57
cHZzaGltX2NtZGxpbmV9IHx8ICdjb25zb2xlPWNvbTEgY29tMT0xMTUyMDBu
MSc7CiRzaGltX2NtZGxpbmUgLj0gJyAnLiRjLT57cHZzaGltX2V4dHJhfSBp
ZiAkYy0+e3B2c2hpbV9leHRyYX07CgpvdXIgJGtlcm5lbF9jbWRsaW5lID0g
JGMtPntjbWRsaW5lfSB8fCAnJzsKJGtlcm5lbF9jbWRsaW5lIC49ICcgcm9v
dD0nLiRjLT57cm9vdH0gaWYgJGMtPntyb290fTsKJGtlcm5lbF9jbWRsaW5l
IC49ICcgJy4kYy0+e2V4dHJhfSBpZiAkYy0+e2V4dHJhfTsKCnByaW50ICJw
dnNoaW0tY29udmVydGVyOiBjcmVhdGluZyBzaWRlY2FyIGluICRzaWRlY2Fy
XG4iOwoKcnVuY21kIHF3KG1rZGlyIC1tNzAwIC1wIC0tKSwgJHNpZGVjYXJz
X2RpcjsKCm9wZW4gTCwgIj4iLCAiJHNpZGVjYXIubG9jayIgb3IgZGllICIk
c2lkZWNhci5sb2NrOiBvcGVuICQhIjsKZmxvY2sgTCwgTE9DS19FWCBvciBk
aWUgIiRzaWRlY2FyLmxvY2s6IGxvY2s6ICQhIjsKCm15ICRzZCA9ICIkc2lk
ZWNhci5kaXIiOwoKc3lzdGVtIHF3KHJtIC1yZiAtLSksICRzZDsKbWtkaXIg
JHNkLCAwNzAwOwoKcnVuY21kIHF3KGNwIC0tKSwgJHNoaW0sICIkc2Qvc2hp
bSI7CnJ1bmNtZCBxdyhjcCAtLSksICRjLT57a2VybmVsfSwgIiRzZC9rZXJu
ZWwiOwpydW5jbWQgcXcoY3AgLS0pLCAkYy0+e3JhbWRpc2t9LCAiJHNkL3Jh
bWRpc2siIGlmICRjLT57cmFtZGlza307CgpteSAkZ3J1YmNmZyA9IDw8RU5E
OwpzZXJpYWwgLS11bml0PTAgLS1zcGVlZD05NjAwIC0td29yZD04IC0tcGFy
aXR5PW5vIC0tc3RvcD0xCnRlcm1pbmFsX2lucHV0IHNlcmlhbAp0ZXJtaW5h
bF9vdXRwdXQgc2VyaWFsCgpzZXQgdGltZW91dD0wCgptZW51ZW50cnkgJ1hl
biBzaGltJyB7CglpbnNtb2QgZ3ppbwoJaW5zbW9kIHh6aW8KICAgICAgICBt
dWx0aWJvb3QgKGNkKS9zaGltIHBsYWNlaG9sZGVyICRzaGltX2NtZGxpbmUK
ICAgICAgICBtb2R1bGUgKGNkKS9rZXJuZWwgcGxhY2Vob2xkZXIgJGtlcm5l
bF9jbWRsaW5lCiAgICAgICAgbW9kdWxlIChjZCkvcmFtZGlzawp9CkVORAoK
cnVuY21kIHF3KG1rZGlyIC1wIC0tKSwgIiRzZC9ib290L2dydWIiOwpvcGVu
IEcsICI+IiwgIiRzZC9ib290L2dydWIvZ3J1Yi5jZmciIG9yIGRpZSAiJHNk
LCBncnViLmNmZzogJCEiOwpwcmludCBHICRncnViY2ZnIG9yIGRpZSAkITsK
Y2xvc2UgRyBvciBkaWUgJCE7Cgp1bmxpbmsgIiRzaWRlY2FyLm5ldyIgb3Ig
JCE9PUVOT0VOVCBvciBkaWUgIiRzaWRlY2FyLm5ldzogcm06ICQhIjsKcnVu
Y21kIHF3KGdydWItbWtyZXNjdWUgLW8pLCAiJHNpZGVjYXIubmV3IiwgIiRz
aWRlY2FyLmRpciI7CmlmICghc3RhdCAiJHNpZGVjYXIubmV3IikgewogICAg
JCE9PUVOT0VOVCBvciBkaWUgIiRzaWRlY2FyLm5ldzogc3RhdDogJCEiOwoK
ICAgIHByaW50IFNUREVSUiA8PEVORDsKcHZzaGltLWNvbnZlcnRlcjogZ3J1
Yi1ta3Jlc2N1ZSBleGl0ZWQgd2l0aCBzdGF0dXMgemVybyBidXQgZmFpbGVk
IHRvIG1ha2UgaXNvLgpOQiB0aGF0IGdydWItbWtyZXNjdWUgaGFzIGEgdGVu
ZGVuY3kgdG8gbGllIGluIGl0cyBlcnJvciBtZXNzYWdlcy4KRU5ECiAgICBt
eSAkbWlzc2luZzsKICAgIGZvcmVhY2ggbXkgJGNoZWNrIChxdyh4b3JyaXNv
IG1mb3JtYXQpKSB7CiAgICAgICAgJG1pc3NpbmcgfD0gc3lzdGVtIHF3KHNo
IC1jKSwgInR5cGUgJGNoZWNrIjsKICAgIH0KCiAgICBpZiAoJG1pc3Npbmcp
IHsKICAgICAgICBwcmludCBTVERFUlIgPDxFTkQ7CllvdSBzZWVtIHRvIGhh
dmUgc29tZSBwcm9ncmFtKHMpIG1pc3Npbmcgd2hpY2ggZ3J1Yi1ta3Jlc2N1
ZSBkZXBlbmRzIG9uLApzZWUgYWJvdmUuICAoIm1mb3JtYXQiIGlzIG5vcm1h
bGx5IGluIHRoZSBwYWNrYWdlICJtdG9vbHMiLikKSW5zdGFsbGluZyB0aG9z
ZSBwcm9ncmFtcyB3aWxsIHByb2JhYmx5IGhlbHAuCkVORAogICAgfSBlbHNl
IHsKICAgICAgICBwcmludCBTVERFUlIgPDxFTkQ7CkFuZCBvbGRlciBncnVi
LW1rcmVzY3VlIGhhcyBhIHRlbmRlbmN5IG5vdCB0byBub3RpY2UgY2VydGFp
biBwcm9ibGVtcy4KTWF5YmUgc3RyYWNlIHdpbGwgdGVsbCB5b3Ugd2hhdCBp
cyB3cm9uZy4gIDotLwpFTkQKICAgIH0KICAgIGRpZSAicHZzaGltLWNvbnZl
cnRlcjogZ3J1Yi1ta3Jlc2N1ZSBkaWQgbm90IG1ha2UgaXNvXG4iOwp9Cgpy
dW5jbWQgcXcocm0gLXJmIC0tKSwgIiRzaWRlY2FyLmRpciIgdW5sZXNzICRk
ZWJ1ZzsKCm9wZW4gUSwgIj4iLCAiJGRtd3JhcC5uZXciIG9yIGRpZSAiJGRt
d3JhcDogJCEiOwpwcmludCBRIDw8J0VORF9ETVdSQVAnIG9yIGRpZSAkITsK
IyEvYmluL2Jhc2gKCnNldCAteAo6ICIkQCIKc2V0ICt4CgpuZXdhcmdzPSgp
CgpuZXdhcmcgKCkgewogICAgbmV3YXJncys9KCIkMSIpCn0KCndoaWxlIFsg
JCMgLWd0IDEgXTsgZG8KICAgIGNhc2UgIiQxIiBpbgoJLW5vLXNodXRkb3du
fC1ub2RlZmF1bHRzfC1uby11c2VyLWNvbmZpZykKCSAgICBuZXdhcmcgIiQx
Ijsgc2hpZnQKCSAgICA7OwoJLXhlbi1kb21pZHwtY2hhcmRldnwtbW9ufC1k
aXNwbGF5fC1ib290fC1tfC1tYWNoaW5lKQoJICAgIG5ld2FyZyAiJDEiOyBz
aGlmdAoJICAgIG5ld2FyZyAiJDEiOyBzaGlmdAoJICAgIDs7CiAgICAgICAg
LW5hbWUpCiAgICAgICAgICAgIG5ld2FyZyAiJDEiOyBzaGlmdAogICAgICAg
ICAgICBuYW1lPSIkMSI7IHNoaWZ0CiAgICAgICAgICAgIG5ld2FyZyAiJG5h
bWUiCiAgICAgICAgICAgIDs7CgktbmV0ZGV2fC1jZHJvbSkKCSAgICA6IGZp
eG1lCgkgICAgbmV3YXJnICIkMSI7IHNoaWZ0CgkgICAgbmV3YXJnICIkMSI7
IHNoaWZ0CgkgICAgOzsKCS1kcml2ZXwta2VybmVsfC1pbml0cmR8LWFwcGVu
ZHwtdm5jKQoJICAgIHNoaWZ0OyBzaGlmdAoJICAgIDs7CgktZGV2aWNlKQoJ
ICAgIHNoaWZ0CgkgICAgY2FzZSAiJDEiIGluCgkJWFhYcnRsODEzOSopCgkJ
ICAgIG5ld2FyZyAiLWRldmljZSIKCQkgICAgbmV3YXJnICIkMSI7IHNoaWZ0
CgkJICAgIDs7CgkJKikKCQkgICAgc2hpZnQKCQkgICAgOzsKCSAgICBlc2Fj
CgkgICAgOzsKCSopCgkgICAgZWNobyA+JjIgIndhcm5pbmc6IHVuZXhwZWN0
ZWQgYXJndW1lbnQgJDEgYmVpbmcgcGFzc2VkIHRocm91Z2giCgkgICAgbmV3
YXJnICIkMSI7IHNoaWZ0CgkgICAgOzsKICAgIGVzYWMKZG9uZQoKI2lmIFsg
IngkbmFtZSIgIT0geCBdOyB0aGVuCiMgICAgbG9nZGlyPS92YXIvbG9nL3hl
bgojICAgIGxvZ2ZpbGU9IiRsb2dkaXIvc2hpbS0kbmFtZS5sb2ciCiMgICAg
c2F2ZWxvZyAiJGxvZ2ZpbGUiIHx8OgojICAgIG5ld2FyZyAtc2VyaWFsCiMg
ICAgbmV3YXJnICJmaWxlOiRsb2dmaWxlIgojZmkKRU5EX0RNV1JBUAoKaWYg
KCRxZW11KSB7CiAgICBwcmludGYgUSA8PCdFTkRfRE1XUkFQJywgJHFlbXUg
b3IgZGllICQhOwogICAgZXhlYyAnJXMnICIke25ld2FyZ3NbQF19IgpFTkRf
RE1XUkFQCn0gZWxzZSB7CiAgICBwcmludCBRIDw8J0VORF9ETVdSQVAnIG9y
IGRpZSAkITsKc2V0IC14CmZvciBwYXRoIGluIC91c3IvbG9jYWwvbGliL3hl
bi9iaW4gL3Vzci9saWIveGVuL2JpbiAvdXNyL2xvY2FsL2JpbiAvdXNyL2Jp
bjsgZG8KICAgIGlmIHRlc3QgLWUgJHBhdGgvcWVtdS1zeXN0ZW0taTM4Njsg
dGhlbgogICAgICAgIGV4ZWMgJHBhdGgvcWVtdS1zeXN0ZW0taTM4NiAiJHtu
ZXdhcmdzW0BdfSIKICAgIGZpCmRvbmUKZWNobyA+JjIgJ2NvdWxkIG5vdCBl
eGVjIHFlbXUnCmV4aXQgMTI3CkVORF9ETVdSQVAKfQoKY2htb2QgMDc1NSwg
IiRkbXdyYXAubmV3IiBvciBkaWUgIiRkbXdyYXA6IGNobW9kOiAkISI7Cgpj
bG9zZSBRIG9yIGRpZSAkITsKCnJlbmFtZSAiJHNpZGVjYXIubmV3IiwgJHNp
ZGVjYXIgb3IgZGllICIkc2lkZWNhcjogaW5zdGFsbDogJCEiOwpyZW5hbWUg
IiRkbXdyYXAubmV3IiwgICRkbXdyYXAgIG9yIGRpZSAiJGRtd3JhcDogaW5z
dGFsbDogJCEiOwoKcHJpbnQgU1RERVJSIDw8RU5EOwpwdnNoaW0tY29udmVy
dGVyOiB3cm90ZSBxZW11IHdyYXBwZXIgdG8gJGRtd3JhcApwdnNoaW0tY29u
dmVydGVyOiB3cm90ZSBzaWRlY2FyIHRvICRzaWRlY2FyCkVORAoKbXkgJGFw
cGVuZCA9IDw8RU5EOwpidWlsZGVyPSdodm0nCnR5cGU9J2h2bScKZGV2aWNl
X21vZGVsX3ZlcnNpb249J3FlbXUteGVuJwpkZXZpY2VfbW9kZWxfb3ZlcnJp
ZGU9JyRkbXdyYXAnCmRldmljZV9tb2RlbF9hcmdzX2h2bT1bJy1jZHJvbScs
JyRzaWRlY2FyJ10KYm9vdD0nYycKc2VyaWFsPSdwdHknCkVORAoKaWYgKCRv
dXQgbmUgJy0nKSB7CiAgICBvcGVuIE8sICI+IiwgIiRvdXQudG1wIiBvciBk
aWUgIm9wZW4gb3V0cHV0IGNvbmZpZyB0ZW1wOiAkb3V0LnRtcDogJCFcbiI7
Cn0gZWxzZSB7CiAgICBvcGVuIE8sICI+JlNURE9VVCIgb3IgZGllICQhOwp9
CgpwcmludCBPICRpbmRhdGEsICJcbiIsICRhcHBlbmQgb3IgZGllICJ3cml0
ZSBvdXRwdXQ6ICQhIjsKY2xvc2UgTyBvciBkaWUgImNsb3NlIG91dHB1dDog
JCEiOwoKaWYgKCRvdXQgbmUgJy0nKSB7CiAgICByZW5hbWUgIiRvdXQudG1w
IiwgJG91dCBvciBkaWUgImluc3RhbGwgb3V0cHV0OiAkISI7CiAgICBwcmlu
dCBTVERFUlIgInB2c2hpbS1jb252ZXJ0ZXI6IHdyb3RlIG5ldyBndWVzdCBj
b25maWcgdG8gJG91dFxuIjsKfSBlbHNlIHsKICAgIHByaW50IFNUREVSUiAi
cHZzaGltLWNvbnZlcnRlcjogd3JvdGUgbmV3IGd1ZXN0IGNvbmZpZyB0byBz
dGRvdXRcbiI7Cn0K

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
