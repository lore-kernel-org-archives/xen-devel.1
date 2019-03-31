From: Martin Cerveny <martin@c-home.cz>
Subject: [BUG] pci: mixed allocation pf and non-pf PCI MEM BAR
 (OVMF crash)
Date: Sun, 31 Mar 2019 10:11:57 +0200 (CEST)
Message-ID: <alpine.GSO.2.00.1903310940430.7231@dmz.c-home.cz>
Reply-To: Martin Cerveny <M.Cerveny@computer.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-559023410-351212254-1554019470=:7231"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-ID: <alpine.GSO.2.00.1903311005360.7231@dmz.c-home.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---559023410-351212254-1554019470=:7231
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; format=flowed
Content-ID: <alpine.GSO.2.00.1903311005361.7231@dmz.c-home.cz>

Hello.

There is problem in PCI device allocation algorithm (pci_setup()).
Algorithm allocates PCI BAR sorted by size and this allows
mixed allocation of prefetchable and non-prefetchable PCI MEM BAR.
This leads to wrong config of PCI root port (see "Type 1 Configuration 
Space Registers (Root Ports)").

Tested with version xen 4.11.1 + "export OVMF_UPSTREAM_REVISION=ef529e6ab7c31290a33045bb1f1837447cc0eb56"
(embeded commit OVMF does not work (crashed even in Win10.iso and uncompilable with newer gcc)).

Attached also testing patch.

Thanks, Martin Cerveny

---------------------------------------------------------------------

Verifiable in crash of OVMF (UEFI firmware) [OVMF DEBUG]:

ASSERT_EFI_ERROR (Status = Not Found)
ASSERT /root/rpmbuild/BUILD/xen-4.11.1/tools/firmware/ovmf-dir-remote/MdeModulePkg/Bus/Pci/PciHostBridgeDxe/PciHostBridge.c(513): !EFI_ERROR (Status)

---------------------------------------------------------------------

Summary of errored output:

[xl dmesg]
(d1) [  395.698273] pci dev 0b:0 bar 14 size 010000000: 0e0000008
(d1) [  395.714836] pci dev 0b:0 bar 18 size 002000000: 0f0000000
(d1) [  395.715369] pci dev 02:0 bar 14 size 001000000: 0f2000008
(d1) [  395.716049] pci dev 0b:0 bar 10 size 001000000: 0f3000000
(d1) [  395.716479] pci dev 04:0 bar 30 size 000040000: 0f4000000
(d1) [  395.716908] pci dev 0b:0 bar 30 size 000010000: 0f4040000

- *008 == prefetchable MEM BAR (PCI_BASE_ADDRESS_MEM_PREFETCH)

[OVMF DEBUG]:
InitRootBridge: populated root bus 0, with room for 0 subordinate bus(es)
RootBridge: PciRoot(0x0)
   Support/Attr: 7007F / 7007F
     DmaAbove4G: No
NoExtConfSpace: Yes
      AllocAttr: 0 ()
            Bus: 0 - 0 Translation=0
             Io: C000 - C2EF Translation=0
            Mem: F0000000 - F40550FF Translation=0
     MemAbove4G: FFFFFFFFFFFFFFFF - 0 Translation=0
           PMem: E0000000 - F2FFFFFF Translation=0
    PMemAbove4G: FFFFFFFFFFFFFFFF - 0 Translation=0

- check overlap of Mem an PMem!
- check code tools/firmware/ovmf-dir-remote/MdeModulePkg/Bus/Pci/PciHostBridgeDxe/PciHostBridge.c
     //
     // Add all the Mem/PMem aperture to GCD
     // Mem/PMem shouldn't overlap with each other
     // Root bridge which needs to combine MEM and PMEM should only report
     // the MEM aperture in Mem
     //

---------------------------------------------------------------------

Summary of OK/expected output:

[xl dmesg]
(d2) [ 1833.077182] pci dev 0b:0 bar 14 size 010000000: 0e0000008
(d2) [ 1833.077798] pci dev 02:0 bar 14 size 001000000: 0f0000008
(d2) [ 1833.103301] pci dev 0b:0 bar 18 size 002000000: 0f2000000
(d2) [ 1833.103882] pci dev 0b:0 bar 10 size 001000000: 0f4000000
(d2) [ 1833.104164] pci dev 04:0 bar 30 size 000040000: 0f5000000
(d2) [ 1833.104429] pci dev 0b:0 bar 30 size 000010000: 0f5040000

[OVMF DEBUG]
RootBridge: PciRoot(0x0)
   Support/Attr: 7007F / 7007F
     DmaAbove4G: No
NoExtConfSpace: Yes
      AllocAttr: 0 ()
            Bus: 0 - 0 Translation=0
             Io: C000 - C2EF Translation=0
            Mem: F2000000 - F50550FF Translation=0
     MemAbove4G: FFFFFFFFFFFFFFFF - 0 Translation=0
           PMem: E0000000 - F0FFFFFF Translation=0
    PMemAbove4G: FFFFFFFFFFFFFFFF - 0 Translation=0

---------------------------------------------------------------------
---559023410-351212254-1554019470=:7231
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; NAME=0001-pci-Merge-allocation-of-prefetchable-MEM-BAR.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.GSO.2.00.1903311004300.7231@dmz.c-home.cz>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=0001-pci-Merge-allocation-of-prefetchable-MEM-BAR.patch

RnJvbSBiOGQ4ZjlmNWFkYTk1NjhmNjcyZjRjZTlkNjhmZTBmNjZjYWU0NGY1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogTWFydGluIENlcnZl
bnkgPE0uQ2VydmVueUBjb21wdXRlci5vcmc+DQpEYXRlOiBTdW4sIDMxIE1h
ciAyMDE5IDA5OjI2OjA1ICswMjAwDQpTdWJqZWN0OiBbUEFUQ0hdIHBjaTog
TWVyZ2UgYWxsb2NhdGlvbiBvZiBwcmVmZXRjaGFibGUgTUVNIEJBUg0KDQpG
cmFnbWVudGVkIGFsbG9jYXRpb24gb2YgTk9OLXByZWZldGNoYWJsZSAoTU1J
TykgYW5kIHByZWZldGNoYWJsZSBQQ0kgTUVNIEJBUg0Kbm90IHN1cHBvcnRl
ZCAtIHNlZSAiVHlwZSAxIENvbmZpZ3VyYXRpb24gU3BhY2UgUmVnaXN0ZXJz
IChSb290IFBvcnRzKSIuDQotLS0NCiB0b29scy9maXJtd2FyZS9odm1sb2Fk
ZXIvcGNpLmMgfCAxOCArKysrKysrKysrKysrKy0tLS0NCiAxIGZpbGUgY2hh
bmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9wY2kuYyBiL3Rv
b2xzL2Zpcm13YXJlL2h2bWxvYWRlci9wY2kuYw0KaW5kZXggMGI3MDhiZjU3
OC4uNDJhM2RkNWU2MiAxMDA2NDQNCi0tLSBhL3Rvb2xzL2Zpcm13YXJlL2h2
bWxvYWRlci9wY2kuYw0KKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVy
L3BjaS5jDQpAQCAtOTcsNyArOTcsNyBAQCB2b2lkIHBjaV9zZXR1cCh2b2lk
KQ0KICAgICAgICAgdWludDMyX3QgYmFyX3JlZzsNCiAgICAgICAgIHVpbnQ2
NF90IGJhcl9zejsNCiAgICAgfSAqYmFycyA9IChzdHJ1Y3QgYmFycyAqKXNj
cmF0Y2hfc3RhcnQ7DQotICAgIHVuc2lnbmVkIGludCBpLCBucl9iYXJzID0g
MDsNCisgICAgdW5zaWduZWQgaW50IGksIG5yX2JhcnMgPSAwLCBucl9iYXJz
X3ByZWYgPSAwOw0KICAgICB1aW50NjRfdCBtbWlvX2hvbGVfc2l6ZSA9IDA7
DQogDQogICAgIGNvbnN0IGNoYXIgKnM7DQpAQCAtMjUzLDkgKzI1MywxOSBA
QCB2b2lkIHBjaV9zZXR1cCh2b2lkKQ0KICAgICAgICAgICAgIGlmICggYmFy
X3N6ID09IDAgKQ0KICAgICAgICAgICAgICAgICBjb250aW51ZTsNCiANCi0g
ICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IG5yX2JhcnM7IGkrKyApDQot
ICAgICAgICAgICAgICAgIGlmICggYmFyc1tpXS5iYXJfc3ogPCBiYXJfc3og
KQ0KLSAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQorCSAgICBpZiAoKChi
YXJfZGF0YSAmIFBDSV9CQVNFX0FERFJFU1NfU1BBQ0UpID09DQorICAgICAg
ICAgICAgICAgICBQQ0lfQkFTRV9BRERSRVNTX1NQQUNFX01FTU9SWSkgJiYN
CisgICAgICAgICAgICAgICAgKChiYXJfZGF0YSAmIFBDSV9CQVNFX0FERFJF
U1NfTUVNX1BSRUZFVENIKSA9PQ0KKyAgICAgICAgICAgICAgICBQQ0lfQkFT
RV9BRERSRVNTX01FTV9QUkVGRVRDSCkpIHsNCisgICAgICAgICAgICAgICAg
Zm9yICggaSA9IDA7IGkgPCBucl9iYXJzX3ByZWY7IGkrKyApDQorICAgICAg
ICAgICAgICAgICAgIGlmICggYmFyc1tpXS5iYXJfc3ogPCBiYXJfc3ogKQ0K
KyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQorICAgICAgICAgICAg
ICAgIG5yX2JhcnNfcHJlZisrOw0KKyAgICAgICAgICAgIH0NCisgICAgICAg
ICAgICBlbHNlDQorICAgICAgICAgICAgICAgIGZvciAoIGkgPSBucl9iYXJz
X3ByZWY7IGkgPCBucl9iYXJzOyBpKysgKQ0KKyAgICAgICAgICAgICAgICAg
ICAgaWYgKCBiYXJzW2ldLmJhcl9zeiA8IGJhcl9zeiApDQorICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsNCiANCiAgICAgICAgICAgICBpZiAoIGkg
IT0gbnJfYmFycyApDQogICAgICAgICAgICAgICAgIG1lbW1vdmUoJmJhcnNb
aSsxXSwgJmJhcnNbaV0sIChucl9iYXJzLWkpICogc2l6ZW9mKCpiYXJzKSk7
DQotLSANCjIuMjAuMQ0KDQo=

---559023410-351212254-1554019470=:7231
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

---559023410-351212254-1554019470=:7231--
