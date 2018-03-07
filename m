From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 6/6] xen/domain: Added debug safety in the
	domain_create() failure path
Date: Wed, 7 Mar 2018 19:12:17 +0000
Message-ID: <1520449937-14449-1-git-send-email-andrew.cooper3@citrix.com>
References: <1519827268-18199-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519827268-18199-7-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGl0dGluZyB0aGUgZmFpbCBwYXRoIHdpdGggZXJyID0gMCBjYXVzZXMgY2FsbGVycyB0byBkZXJl
ZmVyZW5jZSBhIE5VTEwKcG9pbnRlciwgYXMgMCBmYWlscyBhbiBJU19FUlIoKSBjaGVjay4KCkFs
bCBvZiB0aGUgcGF0aHMgYXBwZWFyIHRvIGJlIGZpbmUsIGJ1dCBsZWF2ZSBzb21lIGxvZ2ljIHRv
IGhlbHAgY2F0Y2ggc3RyYXkKbWlzdXNlcy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBldS5jaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
PgpDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDQzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogVGltIERlZWdh
biA8dGltQHhlbi5vcmc+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKdjI6CiAq
IENvbXBsZXRlbHkgZGlmZmVyZW50IGltcGxlbWVudGF0aW9uCi0tLQogeGVuL2NvbW1vbi9kb21h
aW4uYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKaW5kZXggM2NlZmU3
Ni4uZmQwNTRkYiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYworKysgYi94ZW4vY29t
bW9uL2RvbWFpbi5jCkBAIC0zOTksNiArMzk5LDkgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2Ny
ZWF0ZShkb21pZF90IGRvbWlkLCB1bnNpZ25lZCBpbnQgZG9tY3JfZmxhZ3MsCiAgICAgcmV0dXJu
IGQ7CiAKICBmYWlsOgorICAgIEFTU0VSVChlcnIgPCAwKTsgICAgICAvKiBTYW5pdHkgY2hlY2sg
cGF0aHMgbGVhZGluZyBoZXJlLiAqLworICAgIGVyciA9IGVyciA/OiAtRUlOVkFMOyAvKiBSZWxl
YXNlIGJ1aWxkIHNhZmV0eS4gKi8KKwogICAgIGQtPmlzX2R5aW5nID0gRE9NRFlJTkdfZGVhZDsK
ICAgICBpZiAoIGhhcmR3YXJlX2RvbWFpbiA9PSBkICkKICAgICAgICAgaGFyZHdhcmVfZG9tYWlu
ID0gb2xkX2h3ZG9tOwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
