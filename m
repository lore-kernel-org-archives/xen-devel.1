From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: [PATCH] x86/physdev: Remove redundant assignment in
 allocate_and_map_msi_pirq()
Date: Fri, 20 Jul 2018 02:29:34 -0700 (PDT)
Message-ID: <6be2c543-bca6-4e52-870a-9ed63fd6c67f@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-Devel <xen-devel@lists.xen.org>
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhl
bnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaXJxLmMgfCAgICAyIC0t
CiAxIGZpbGVzIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvaXJxLmMgYi94ZW4vYXJjaC94ODYvaXJxLmMKaW5kZXggODdl
ZjJlOC4uNTI1M2ZkMSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2lycS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9pcnEuYwpAQCAtMjcwMSw4ICsyNzAxLDYgQEAgaW50IGFsbG9jYXRlX2FuZF9tYXBf
bXNpX3BpcnEoc3RydWN0IGRvbWFpbiAqZCwgaW50IGluZGV4LCBpbnQgKnBpcnFfcCwKICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgfQogCi0gICAgbXNpLT5pcnEgPSBpcnE7Ci0KICAgICBw
Y2lkZXZzX2xvY2soKTsKICAgICAvKiBWZXJpZnkgb3IgZ2V0IHBpcnEuICovCiAgICAgc3Bpbl9s
b2NrKCZkLT5ldmVudF9sb2NrKTsKLS0gCjEuNy4zCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
