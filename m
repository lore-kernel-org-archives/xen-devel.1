From: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH 2/3] xen/drivers/char: Don't require vpl011
 for all non-x86 archs
Date: Thu, 16 May 2019 12:30:34 -0700
Message-ID: <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <20190516000212.13468-2-alistair.francis@wdc.com>
 <5CDD3C4B020000780022F8BE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pg8o=TQ=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1hRM5o-0007nn-AP
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 19:31:04 +0000
Received: by mail-lf1-x141.google.com with SMTP id n22so3496474lfe.12
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 12:31:02 -0700 (PDT)
In-Reply-To: <5CDD3C4B020000780022F8BE@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMzozMiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDE2LjA1LjE5IGF0IDAyOjAyLCA8YWxpc3RhaXIuZnJh
bmNpc0B3ZGMuY29tPiB3cm90ZToKPiA+IE1ha2UgdGhlIGFzbS92cGwwMTEuaCBkZXBlbmRlbnQg
b24gdGhlIEFSTSBhcmNoaXRlY3R1cmUuCj4KPiBCdXQgd2Ugb25seSBoYXZlIHg4NiBhbmQgQXJt
IHJpZ2h0IG5vdy4gQSB3b3JkIG1vcmUgYWJvdXQKPiB5b3VyIG1vdGl2YXRpb24gd291bGQgaGVs
cC4KCkFzIHRoZSBjb2RlIGN1cnJlbnRseSBpcyBubyBvbmUgY2FuIGFkZCBhbm90aGVyIGFyY2hp
dGVjdHVyZS4gVGhpcyBpcwpqdXN0IGEgZ2VuZXJhbCBmaXh1cCBhcyBhc3N1bWluZyBYZW4gd2ls
bCBvbmx5IGV2ZXIgc3VwcG9ydCB0d28gYXJjaHMKc2VlbXMgc3RyYW5nZS4KCj4KPiBBbHNvIEkg
ZG9uJ3QgdGhpbmsgeW91ciBDYyBsaXN0IGlzIHdpZGUgZW5vdWdoIGZvciB0aGlzIGNoYW5nZS4K
CkkgY291bGRuJ3QgZmluZCBhbnlvdGhlciBwZW9wbGUgaW4gdGhlIE1BSU5UQUlORVJTIGZpbGUs
IHdobyBlbHNlIHNob3VsZCBJIENDPwoKQWxpc3RhaXIKCj4KPiBKYW4KPgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
