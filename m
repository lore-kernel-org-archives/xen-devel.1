From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: suppress default test harness build
 with incapable assembler
Date: Mon, 26 Nov 2018 08:50:14 -0700
Message-ID: <5BFC163602000078002001A0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRJ9P-0007CU-KR
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 15:50:19 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QSB0b3AgbGV2ZWwgIm1ha2UgYnVpbGQiLCBhcyB1c2VkIGUuZy4gYnkgb3NzdGVzdCwgd2FudHMg
dG8gYnVpbGQgYWxsCiJhbGwiIHRhcmdldHMgaW4gZW5hYmxlZCB0b29scyBzdWJkaXJlY3Rvcmll
cywgd2hpY2ggYnkgZGVmYXVsdCBhbHNvCmluY2x1ZGVzIHRoZSBlbXVsYXRvciB0ZXN0IGhhcm5l
c3MuIFRoZSB1c2Ugb2YsIGluIHBhcnRpY3VsYXIsIHtldmV4fQppbnNuIHBzZXVkby1wcmVmaXhl
cyBpbiwgYWdhaW4gaW4gcGFydGljdWxhciwgdGVzdF94ODZfZW11bGF0b3IuYyBjYXVzZXMKdGhp
cyBidWlsZCB0byBmYWlsIHRob3VnaCB3aGVuIHRoZSBhc3NlbWJsZXIgaXMgbm90IG5ldyBlbm91
Z2guIFRha2UKYW5vdGhlciBiaWcgaGFtbWVyIGFuZCBzdXBwcmVzcyB0aGUgZGVmYXVsdCBoYXJu
ZXNzIGJ1aWxkIGFsdG9nZXRoZXIKYWxzbyB3aGVuIHRoaXMgYW5kIG90aGVyIHBzZXVkby1wcmVm
aXhlcyBhcmUgbm90IHN1cHBvcnRlZCBieSB0aGUKc3BlY2lmaWVkIChvciBkZWZhdWx0ZWQgdG8p
IGFzc2VtYmxlci4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCi0tLSBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZQorKysgYi90b29scy90
ZXN0cy94ODZfZW11bGF0b3IvTWFrZWZpbGUKQEAgLTgwLDYgKzgwLDEwIEBAIGVuZGVmCiAKICQo
Zm9yZWFjaCBmbGF2b3IsJChTSU1EKSAkKEZNQSksJChldmFsICQoY2FsbCBzaW1kLWNoZWNrLWNj
LCQoZmxhdm9yKSkpKQogCisjIEFsc28gZXhwbGljaXRseSBjaGVjayBmb3Ige2V2ZXh9IHBzZXVk
by1wcmVmaXggc3VwcG9ydCwgd2hpY2ggZ290IGludHJvZHVjZWQKKyMgb25seSBhZnRlciBBVlg1
MTJGIGFuZCBzb21lIG9mIGl0cyBleHRlbnNpb25zLgorVEFSR0VULSQoc2hlbGwgZWNobyAnYXNt
KCJ7ZXZleH0gdnplcm9hbGwiKTsnIHwgJChDQykgLXggYyAtYyAtbyAvZGV2L251bGwgLSB8fCBl
Y2hvIHkpIDo9CisKIGlmZXEgKCQoVEFSR0VULXkpLCkKICQod2FybmluZyBUZXN0IGhhcm5lc3Mg
bm90IGJ1aWx0LCB1c2UgbmV3ZXIgY29tcGlsZXIgdGhhbiAiJChDQykiKQogZW5kaWYKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
