From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.11] x86/spec_ctrl: Fix typo in ARCH_CAPS
 decode
Date: Tue, 24 Apr 2018 10:44:33 +0100
Message-ID: <1524563073-16425-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NwZWNfY3RybC5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jIGIveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCmlu
ZGV4IGJhYjg1OTUuLmZhYjNjMWQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwu
YworKysgYi94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKQEAgLTExOSw3ICsxMTksNyBAQCBzdGF0
aWMgdm9pZCBfX2luaXQgcHJpbnRfZGV0YWlscyhlbnVtIGluZF90aHVuayB0aHVuaykKICAgICAg
ICAgICAgKGU4YiAgJiBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfSUJQQikpICA/ICIgSUJQQiIg
ICAgICA6ICIiLAogICAgICAgICAgICAoY2FwcyAmIEFSQ0hfQ0FQQUJJTElUSUVTX0lCUlNfQUxM
KSAgICAgID8gIiBJQlJTX0FMTCIgIDogIiIsCiAgICAgICAgICAgIChjYXBzICYgQVJDSF9DQVBB
QklMSVRJRVNfUkRDTF9OTykgICAgICAgPyAiIFJEQ0xfTk8iICAgOiAiIiwKLSAgICAgICAgICAg
KGNhcHMgJiBBUkNIX0NBUFNfUlNCQSkgICAgICAgICAgICAgICAgICA/ICIgUkJTQSIgICAgICA6
ICIiKTsKKyAgICAgICAgICAgKGNhcHMgJiBBUkNIX0NBUFNfUlNCQSkgICAgICAgICAgICAgICAg
ICA/ICIgUlNCQSIgICAgICA6ICIiKTsKIAogICAgIC8qIENvbXBpbGVkLWluIHN1cHBvcnQgd2hp
Y2ggcGVydGFpbnMgdG8gQlRJIG1pdGlnYXRpb25zLiAqLwogICAgIGlmICggSVNfRU5BQkxFRChD
T05GSUdfSU5ESVJFQ1RfVEhVTkspICkKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
