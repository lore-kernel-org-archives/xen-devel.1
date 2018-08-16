From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/setup: Avoid OoB E820 lookup when
 calculating the L1TF safe address
Date: Thu, 16 Aug 2018 16:27:57 +0100
Message-ID: <1534433277-29436-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QSBudW1iZXIgb2YgY29ybmVyIGNhc2VzIChtb3N0IG9idmlvdXNseSwgbm8tcmVhbC1tb2RlIGFu
ZCBubyBNdWx0aWJvb3QgbWVtb3J5Cm1hcCkgY2FuIGVuZCB1cCB3aXRoIGU4MjBfcmF3Lm5yX21h
cCBiZWluZyAwLCBhdCB3aGljaCBwb2ludCB0aGUgTDFURgpjYWxjdWxhdGlvbiB3aWxsIHVuZGVy
Zmxvdy4KClNwb3R0ZWQgYnkgQ292ZXJpdHkuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGlj
aEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvc2V0dXAu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMK
aW5kZXggNzI3ZGFkNC4uOGQwZjZmMSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMK
KysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTkxMyw3ICs5MTMsNyBAQCB2b2lkIF9faW5p
dCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgIC8qIFNhbml0
aXNlIHRoZSByYXcgRTgyMCBtYXAgdG8gcHJvZHVjZSBhIGZpbmFsIGNsZWFuIHZlcnNpb24uICov
CiAgICAgbWF4X3BhZ2UgPSByYXdfbWF4X3BhZ2UgPSBpbml0X2U4MjAobWVtbWFwX3R5cGUsICZl
ODIwX3Jhdyk7CiAKLSAgICBpZiAoICFlZmlfZW5hYmxlZChFRklfQk9PVCkgKQorICAgIGlmICgg
IWVmaV9lbmFibGVkKEVGSV9CT09UKSAmJiBlODIwX3Jhdy5ucl9tYXAgPj0gMSApCiAgICAgewog
ICAgICAgICAvKgogICAgICAgICAgKiBTdXBwbGVtZW50IHRoZSBoZXVyaXN0aWNzIGluIGwxdGZf
Y2FsY3VsYXRpb25zKCkgYnkgYXNzdW1pbmcgdGhhdAotLSAKMi4xLjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
