From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/4] x86/passthrough: move io.c to the x86
 subfolder
Date: Mon, 7 Jan 2019 13:11:45 +0100
Message-ID: <20190107121145.lcca7itc6otkefdh@mac>
References: <20190104103329.35741-1-roger.pau@citrix.com>
 <20190104103329.35741-3-roger.pau@citrix.com>
 <5C2F91D9020000780020A562@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D5so=PP=citrix.com=prvs=9034de270=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ggTsW-0006KZ-PP
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 12:19:36 +0000
Content-Disposition: inline
In-Reply-To: <5C2F91D9020000780020A562@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMDQsIDIwMTkgYXQgMTA6MDM6MjFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjAxLjE5IGF0IDExOjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gSXQgbWFrZXMgbm8gc2Vuc2UgZm9yIGlvLmMgdG8gYmUgb24gdGhlIHRvcCBsZXZl
bCBwYXNzdGhyb3VnaAo+ID4gZGlyZWN0b3J5LCBzaW5jZSBpdCdzIHg4NiBzcGVjaWZpYy4KPiAK
PiBJJ20gbm90IHN1cmUgaXQgcmVhbGx5IGlzLiBJdCdzIGxhcmdlbHkgYWJvdXQgaW50ZXJydXB0
IGFycmFuZ2VtZW50cwo+IGZvciBndWVzdHMsIHdoaWNoIChiZWluZyBQQ0ktcmVsYXRlZCkgbWF5
IG9yIG1heSBub3QgYmUgcmUtCj4gdXNhYmxlIGJ5IEFybSBvbmNlIHRoZXkgZ2V0IHRvIHN1cHBv
cnQgUENJLgoKVGhlIGZpbGUgbWFrZXMgaGVhdnkgdXNhZ2Ugb2YgeDg2IG9ubHkgY29uc3RydWN0
cywgbGlrZQpodm1fcGlycV9kcGNpLCBodm1faXJxX2RwY2kgYW5kIGEgbG90IG9mIHg4NiBzcGVj
aWZpYyBIVk0gZnVuY3Rpb25zLgoKVGhpcyBjb3VsZCBpbmRlZWQgYmUgdXNlZCBieSBBUk0gaW4g
dGhlIGZ1dHVyZSBpZiBzdWNoIGZ1bmN0aW9ucyBhbmQKc3RydWN0dXJlcyBhcmUgaW1wbGVtZW50
ZWQgb24gQVJNLCBidXQgaXQgd291bGQgY2VydGFpbmx5IHJlcXVpcmUKYSBub24tdHJpdmlhbCBh
bW91bnQgb2YgY2hhbmdlcyB0byB0aGlzIGZpbGUgYW5kIG90aGVyIGNvZGUuCgpBcyBpdCBzdGFu
ZHMgbm93IHRoaXMgY29kZSBpcyB4ODYgc3BlY2lmaWMsIGFuZCBhcyBzdWNoIGl0IG1ha2VzIG1v
cmUKc2Vuc2UgSU1PIHRvIHJlc2lkZSBpbiB0aGUgeDg2IHN1Yi1mb2xkZXIuCgpJIGFncmVlIGl0
IG1ha2VzIHNlbnNlIHRvIHJlbmFtZSwgbWF5YmUgeDg2L2lycS5jIG9yIHg4Ni9pbnRlcnJ1cHQu
Yz8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
