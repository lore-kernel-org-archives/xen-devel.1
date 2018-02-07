From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 0/7] x86: Meltdown band-aid overhead reduction
Date: Wed, 07 Feb 2018 09:05:35 -0700
Message-ID: <5A7B31DF02000078001A61F9@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=rmex=fb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ejSED-0005vQ-8I
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 16:05:45 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MTogc2xpZ2h0bHkgcmVkdWNlIE1lbHRkb3duIGJhbmQtYWlkIG92ZXJoZWFkCjI6IHJlbW92ZSBD
UiByZWFkcyBmcm9tIGV4aXQtdG8tZ3Vlc3QgcGF0aAozOiBpbnRyb2R1Y2UgYWx0aW5zdHJ1Y3Rp
b25fbm9wIGFzc2VtYmxlciBtYWNybwo0OiBOT1Agb3V0IG1vc3QgWFBUSSBlbnRyeS9leGl0IGNv
ZGUgd2hlbiBpdCdzIG5vdCBpbiB1c2UKNTogYXZvaWQgZG91YmxlIENSMyByZWxvYWQgd2hlbiBz
d2l0Y2hpbmcgdG8gZ3Vlc3QgdXNlciBtb2RlCjY6IGRpc2FibGUgWFBUSSB3aGVuIFJEQ0xfTk8K
NzogeDg2OiBsb2cgWFBUSSBlbmFibGVkIHN0YXR1cwoKSSB3b24ndCBtaW5kIGlmIGl0IHdhcyBk
ZWNpZGVkIGZvciBzb21lIG9mIHRoZW0gdG8gYmUgcG9pbnRsZXNzLCBidXQgSQp0aGluayAxIChi
ZWNhdXNlIG9mIGEgbWVhc3VyYWJsZSBpbXByb3ZlbWVudCBvZiAxLTMlKSwgNCAoaGVscGluZwp0
aGUgInhwdGk9bm8iIGNhc2UsIGV2ZW4gaWYgb25seSBhIGxpdHRsZTsgdGFraW5nIDMgYXMgcHJl
cmVxKSwgYW5kCjYrNyBzaG91bGQgYmUgY29uc2lkZXJlZCBzZXJpb3VzbHkuCgpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
