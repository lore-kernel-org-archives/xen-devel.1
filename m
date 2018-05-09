From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.8] x86/emul: Fix emulator test harness
 build following a91b2ec337a
Date: Wed, 9 May 2018 16:25:14 +0100
Message-ID: <1525879514-25484-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VmVyc2lvbnMgb2YgWGVuIGJlZm9yZSBjL3MgNWM2YzNhYyBpbiBYZW4gNC45IGRvbid0IHVzZSBt
c3ItaW5kZXguaCBmb3IgdGhlCnRlc3QgaGFybmVzcy4KClJlcG9ydGVkLWJ5OiBJYW4gSmFja3Nv
biA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBJYW4gSmFja3NvbiA8SWFuLkph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy90ZXN0cy94ODZfZW11bGF0b3IveDg2X2Vt
dWxhdGUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3g4Nl9lbXVsYXRlLmMgYi90b29scy90ZXN0cy94
ODZfZW11bGF0b3IveDg2X2VtdWxhdGUuYwppbmRleCAxMjdhOTI2Li41OGNmZDhhIDEwMDY0NAot
LS0gYS90b29scy90ZXN0cy94ODZfZW11bGF0b3IveDg2X2VtdWxhdGUuYworKysgYi90b29scy90
ZXN0cy94ODZfZW11bGF0b3IveDg2X2VtdWxhdGUuYwpAQCAtMTQsNiArMTQsNyBAQCB0eXBlZGVm
IGJvb2wgYm9vbF90OwogCiAjZGVmaW5lIEVGRVJfU0NFICAgICAgICgxIDw8IDApCiAjZGVmaW5l
IEVGRVJfTE1BICAgICAgICgxIDw8IDEwKQorI2RlZmluZSBFRkVSX1NWTUUgICAgICAoMSA8PCAx
MikKIAogI2RlZmluZSBCVUcoKSBhYm9ydCgpCiAjZGVmaW5lIEFTU0VSVCBhc3NlcnQKLS0gCjIu
MS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
