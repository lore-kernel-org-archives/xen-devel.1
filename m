From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/6] x86/AMD: distinguish compute units
 from hyper-threads
Date: Wed, 18 Jul 2018 13:54:25 +0100
Message-ID: <8e6723a7-f575-00b7-f431-98e67a2a5f39@citrix.com>
References: <5B4EF70702000078001D53C7@prv1-mh.provo.novell.com>
 <5B4EF84D02000078001D53D7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dg1m=kc=citrix.com=prvs=730a7d111=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fflyP-0004H2-3b
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 12:54:29 +0000
In-Reply-To: <5B4EF84D02000078001D53D7@prv1-mh.provo.novell.com>
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

T24gMTgvMDcvMTggMDk6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZhbTE3IHJlcGxhY2VzIENV
cyBieSBIVHMsIHdoaWNoIHdlIHNob3VsZCByZWZsZWN0IGFjY29yZGluZ2x5LCBldmVuIGlmCj4g
dGhlIGRpZmZlcmVuY2UgaXMgbm90IHZlcnkgYmlnLiBUaGUgbW9zdCByZWxldmFudCBjaGFuZ2Ug
KHJlcXVpcmluZyBzb21lCj4gY29kZSByZXN0cnVjdHVyaW5nKSBpcyB0aGF0IHRoZSB0b3BvZXh0
IGZlYXR1cmUgbm8gbG9uZ2VyIG1lYW5zIHRoZXJlIGlzCj4gYSB2YWxpZCBDVSBJRC4KPgo+IFRh
a2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBjb252ZXJ0IHdyb25nbHkgcGxhaW4gaW50IHZhcmlhYmxl
cyBpbgo+IHNldF9jcHVfc2libGluZ19tYXAoKSB0byB1bnNpZ25lZCBpbnQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJy
aWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
