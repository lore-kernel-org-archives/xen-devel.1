From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [RFC PATCH v2 00/17] Add support for qemu-xen
 runnning in a Linux-based stubdomain.
Date: Wed, 17 Oct 2018 11:17:36 +0100
Message-ID: <23495.3136.246211.618120@mariner.uk.xensource.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23494.5998.10340.694382@mariner.uk.xensource.com>
 <20181016173240.GA1563@mail-itl>
 <23494.9572.676973.726194@mariner.uk.xensource.com>
 <20181016204628.GD1563@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pqcp=m5=citrix.com=prvs=8215e697b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gCitZ-00012d-Ny
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 10:17:41 +0000
In-Reply-To: <20181016204628.GD1563@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIlJlOiBbUkZDIFBBVENIIHYyIDAw
LzE3XSBBZGQgc3VwcG9ydCBmb3IgcWVtdS14ZW4gcnVubm5pbmcgaW4gYSBMaW51eC1iYXNlZCBz
dHViZG9tYWluLiIpOgo+IEZyb20gdGhvc2UgdHdvIG9wdGlvbnMgSSdkIHByZWZlciBtdWx0aXBs
ZSB4ZW5zdG9yZSBrZXlzIGFzIG11Y2gKPiBjbGVhbmVyLiBXZSBkbyBoYXZlIHRoZW0gYXMgYW4g
YXJyYXkgaW4gbGlieGwgYWxyZWFkeS4KPiAKPiBTbywgbGV0IGltYWdlL2RtYXJncyBiZSBhY3R1
YWxseSBhIGRpcmVjdG9yeSB3aXRoIGVudHJpZXMgbGlrZToKPiAgLSBpbWFnZS9kbWFyZ3MvMDAw
ID0gLXhlbi1kb21pZAo+ICAtIGltYWdlL2RtYXJncy8wMDEgPSAxMjMKPiAgLSBpbWFnZS9kbWFy
Z3MvMDAyID0gLW5vZGVmYXVsdHMKPgo+IEkgd29uZGVyIGlmIHRoZXJlIG5lZWRzIHRvIGJlIGFy
Z3VtZW50cyBjb3VudCwgb3IgaXRlcmF0aW5nIHVudGlsIEVOT0VOVAo+IGlzIGVub3VnaD8KCnhl
bnN0b3JlLXJlYWQgZG9lc24ndCBzZWVtIHRvIHByb3ZpZGUgYW4gZWFzeSB3YXkgZm9yIGEgc2hl
bGwgc2NyaXB0CnRvIHRlbGwgRU5PRU5UIGFwYXJ0IGZyb20gImV2ZXJ5dGhpbmcgaXMgZG9vbWVk
Ii4gIEhlcmUgaXMgaXRzCihmcmFua2x5LCB2ZXJ5IHBvb3IpIGVycm9yIGhhbmRsaW5nOgoKICAg
ICAgICAgICAgY2hhciAqdmFsID0geHNfcmVhZCh4c2gsIHh0aCwgYXJndltvcHRpbmRdLCAmbGVu
KTsKICAgICAgICAgICAgaWYgKHZhbCA9PSBOVUxMKSB7CiAgICAgICAgICAgICAgICB3YXJueCgi
Y291bGRuJ3QgcmVhZCBwYXRoICVzIiwgYXJndltvcHRpbmRdKTsKICAgICAgICAgICAgICAgIHJl
dHVybiAxOwogICAgICAgICAgICB9CgpJdCBkb2Vzbid0IGV2ZW4gcHJpbnQgdGhlIGVycm5vIHZh
bHVlLCBsZXQgYWxvbmUgY2hhbmdlIHRoZSBleGl0CnN0YXR1cyBvciBwcm92aWRlIGEgd2F5IHRv
IHRvbGVyYXRlIEVOT0VOVCB3aXRob3V0IGJ1bHJiaW5nIHRvIHN0ZGVyci4KCklmIEkgd2VyZSB5
b3UgSSdkIHNlbmQgYSBzaGVsbCBzdHJpbmcgYnV0IGl0J3MgZW50aXJlbHkgdXAgdG8geW91LgoK
PiA+IFllcy4gIE9yIHRlYWNoaW5nIHFlbXUgYWJvdXQgbGlidmNoYW4uCj4gCj4gVGhhdCdzIGFs
c28gYW4gb3B0aW9uLiBJJ2xsIHNlZSBob3cgaGFyZCBpdCB3b3VsZCBiZSB0byBhZGQgdGhpcyB0
bwo+IHFlbXUuCgpHb29kIGx1Y2suCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
