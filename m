From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 4/4] firmware/shim: avoid mkdir error during Xen
 tree setup
Date: Wed, 07 Feb 2018 08:08:47 -0700
Message-ID: <5A7B248F02000078001A614B@prv-mh.provo.novell.com>
References: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=rmex=fb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ejRLD-0000PL-QX
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 15:08:55 +0000
In-Reply-To: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Im1rZGlyIC1wIiByZXBvcnRzIGEgbWlzc2luZyBvcGVyYW5kLCBhcyBjb25maWcvIGhhcyBubyBz
dWJkaXJzLiBPZGRseQplbm91Z2ggdGhpcyBkb2Vzbid0IGNhdXNlIHRoZSB3aG9sZSBjb21tYW5k
IChhbmQgaGVuY2UgdGhlIGJ1aWxkIHRvCmZhaWwpLCBkZXNwaXRlIHRoZSAic2V0IC1lIiBub3cg
Y292ZXJpbmcgdGhlIGVudGlyZSBzZXQgb2YgY29tbWFuZHMgLQpwZXJoYXBzIGEgcXVpcmsgb2Yg
dGhlIHJlbGF0aXZlbHkgb2xkIGJhc2ggSSd2ZSBzZWVuIHRoaXMgd2l0aCAoYSBmZXcKc2ltcGxl
IGV4cGVyaW1lbnRzIHN1Z2dlc3QgdGhhdCBjb21tYW5kcyBpbnNpZGUgKCkgcHJvZHVjaW5nIGEg
bm9uLQpzdWNjZXNzIHN0YXR1cyB3b3VsZCBleGl0IHRoZSBpbm5lciBzaGVsbCwgYnV0IG5vdCB0
aGUgb3V0ZXIgb25lKS4KCkFkZCBhIGR1bW15IC4gYXJndW1lbnQgdG8gdGhlIGludm9jYXRpb24u
CgpTdWdnZXN0ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSB1bnN0YWJsZS5vcmlnL3Rv
b2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUJMjAxOC0wMi0wNyAxNTozNToxOC4xOTc3MTc5
MTAgKzAxMDAKKysrIHVuc3RhYmxlL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUJMjAx
OC0wMi0wNyAxNTozNTo1MS4wMjcyMTM4MjMgKzAxMDAKQEAgLTIyLDcgKzIyLDcgQEAgbGlua2Zh
cm0uc3RhbXA6ICQoREVQX0RJUlMpICQoREVQX0ZJTEVTKQogCQkgKG1rZGlyIC1wICQoRCkvJChk
KTsgXAogCQkgIGNkICQoRCkvJChkKTsgXAogCQkgIGZpbmQgJChYRU5fUk9PVCkvJChkKS8gLXR5
cGUgZCB8XAotCQkJc2VkICdzLF4kKFhFTl9ST09UKS8kKGQpLywsZycgfCB4YXJncyBta2RpciAt
cCk7KSBcCisJCQlzZWQgJ3MsXiQoWEVOX1JPT1QpLyQoZCkvLCxnJyB8IHhhcmdzIG1rZGlyIC1w
IC4pOykgXAogCSQoZm9yZWFjaCBkLCAkKExJTktfRElSUyksIFwKIAkJKGNkICQoWEVOX1JPT1Qp
OyBcCiAJCSBmaW5kICQoZCkgISAtdHlwZSBsIC10eXBlIGYgXAoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
