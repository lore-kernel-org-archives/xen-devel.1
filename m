From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] xen/arm: fix build after f20a6e309
Date: Mon, 9 Apr 2018 14:49:49 +0100
Message-ID: <20180409134949.13032-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3dws=g6=citrix.com=prvs=63055421e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f5XBC-0002VZ-29
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 13:49:54 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IGYyMGE2ZTMwOSByZW1vdmVkIGEgcGFyYW1ldGVyIGZyb20gc21wX3ByZXBhcmVfY3B1
cyBidXQgb25seQp0aGUgeDg2IHBhcnRzIHdlcmUgc3VibWl0dGVkIGFuZCBjb21taXR0ZWQuCgpT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KQ2M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL3NldHVwLmMgICB8IDIgKy0K
IHhlbi9hcmNoL2FybS9zbXBib290LmMgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAu
YyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCmluZGV4IDZlNDllOGZkMWYuLjFkNmY2YmYzN2UgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5j
CkBAIC04MDQsNyArODA0LDcgQEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcg
Ym9vdF9waHlzX29mZnNldCwKICAgICBsb2NhbF9pcnFfZW5hYmxlKCk7CiAgICAgbG9jYWxfYWJv
cnRfZW5hYmxlKCk7CiAKLSAgICBzbXBfcHJlcGFyZV9jcHVzKGNwdXMpOworICAgIHNtcF9wcmVw
YXJlX2NwdXMoKTsKIAogICAgIGluaXRpYWxpemVfa2V5dGFibGUoKTsKIApkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3NtcGJvb3QuYyBiL3hlbi9hcmNoL2FybS9zbXBib290LmMKaW5kZXggNjJm
Nzk1ZjY4ZS4uYjIxMTZmMGQyZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYwor
KysgYi94ZW4vYXJjaC9hcm0vc21wYm9vdC5jCkBAIC0yODMsNyArMjgzLDcgQEAgc21wX2dldF9t
YXhfY3B1cyAodm9pZCkKIH0KIAogdm9pZCBfX2luaXQKLXNtcF9wcmVwYXJlX2NwdXMgKHVuc2ln
bmVkIGludCBtYXhfY3B1cykKK3NtcF9wcmVwYXJlX2NwdXModm9pZCkKIHsKICAgICBjcHVtYXNr
X2NvcHkoJmNwdV9wcmVzZW50X21hcCwgJmNwdV9wb3NzaWJsZV9tYXApOwogCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
