From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 6/6] x86emul: generalize vector length
 handling for AVX512/EVEX
Date: Tue, 4 Sep 2018 12:02:23 +0100
Message-ID: <38ebd1b2-01d4-0b2d-4b84-a7b857df4872@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5B86AB9002000078001E31E3@prv1-mh.provo.novell.com>
 <5B86ACEE02000078001E31FC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wdzn=ls=citrix.com=prvs=778137930=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fx96g-0002H4-UA
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 11:02:50 +0000
In-Reply-To: <5B86ACEE02000078001E31FC@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTU6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC0yODE4LDYgKzI4MTgs
OSBAQCB4ODZfZGVjb2RlKAo+ICAKPiAgICAgICAgICAgICAgICAgIG9wY29kZSB8PSBiIHwgTUFT
S19JTlNSKHZleC5wZngsIFg4NkVNVUxfT1BDX1BGWF9NQVNLKTsKPiAgCj4gKyAgICAgICAgICAg
ICAgICBpZiAoICFldmV4Lm1icyApCgpUaGlzIHVzZSBvZiBtYnMgaXMgdmVyeSBjb25mdXNpbmcg
dG8gcmVhZC7CoCBIb3cgYWJvdXQ6CgojZGVmaW5lIGV2ZXhfZW5jb2RlZCBldmV4Lm1icwoKd2hp
Y2ggYXQgbGVhc3QgZ2l2ZXMgYSBzZW1hbnRpYyBuYW1lIHRvIHRoZSBob3cgeW91IGFyZSB1c2lu
ZyB0aGUgbWJzIGJpdD8KCn5BbmRyZXcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
