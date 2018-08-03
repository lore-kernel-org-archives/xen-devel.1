From: Alexandru Isaila <aisaila@bitdefender.com>
Subject: [PATCH v1] x86/hvm: Drop hvm_sr_handlers initializer
Date: Fri,  3 Aug 2018 12:27:33 +0300
Message-ID: <1533288453-31285-1-git-send-email-aisaila@bitdefender.com>
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
To: xen-devel@lists.xen.org
Cc: Alexandru Isaila <aisaila@bitdefender.com>, andrew.cooper3@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpbml0aWFsaXplciBpcyBmbGF3ZWQgYW5kIG9ubHkgc2V0cyAubmFtZSBvZiBhcnJheSBl
bnRyeSAwCnRvIGEgbm9uLU5VTEwgc3RyaW5nLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElz
YWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+ClN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2gg
PEpCZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2h2bS9zYXZlLmMgYi94ZW4vYXJjaC94ODYvaHZtL3NhdmUuYwppbmRl
eCA4OTg0YTIzLi40MjJiOTZjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3NhdmUuYwor
KysgYi94ZW4vYXJjaC94ODYvaHZtL3NhdmUuYwpAQCAtODksNyArODksNyBAQCBzdGF0aWMgc3Ry
dWN0IHsKICAgICBjb25zdCBjaGFyICpuYW1lOwogICAgIHNpemVfdCBzaXplOwogICAgIGludCBr
aW5kOwotfSBodm1fc3JfaGFuZGxlcnNbSFZNX1NBVkVfQ09ERV9NQVggKyAxXSA9IHsge05VTEws
IE5VTEwsICI8Pz4ifSwgfTsKK30gaHZtX3NyX2hhbmRsZXJzW0hWTV9TQVZFX0NPREVfTUFYICsg
MV07CiAKIC8qIEluaXQtdGltZSBmdW5jdGlvbiB0byBhZGQgZW50cmllcyB0byB0aGF0IGxpc3Qg
Ki8KIHZvaWQgX19pbml0IGh2bV9yZWdpc3Rlcl9zYXZldm0odWludDE2X3QgdHlwZWNvZGUsCi0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
