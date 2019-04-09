From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 07/55] x86/mm: add an end_of_loop label
 in map_pages_to_xen
Date: Tue, 09 Apr 2019 06:50:09 -0600
Message-ID: <5CAC95010200007800225DA6@prv1-mh.provo.novell.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-8-wei.liu2@citrix.com>
 <5C8BC777020000780021F5EF@prv1-mh.provo.novell.com>
 <20190409122235.GP1986@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDqCh-0003it-7q
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:50:19 +0000
In-Reply-To: <20190409122235.GP1986@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA0LjE5IGF0IDE0OjIyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDk6NDA6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNy4wMi4xOSBhdCAxNzo0NCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IFdlIHdpbGwgc29vbiBuZWVkIHRvIGNsZWFuIHVwIG1hcHBpbmdzIHdoZW5ldmVy
IHRoZSBvdXQgbW9zdCBsb29wIGlzCj4+ID4gZW5kZWQuIEFkZCBhIG5ldyBsYWJlbCBhbmQgdHVy
biByZWxldmFudCBjb250aW51ZSdzIGludG8gZ290bydzLgo+PiAKPj4gVG8gYmUgaG9uZXN0LCBJ
IHdhcyBvbiB0aGUgZWRnZSBvZiBhbHJlYWR5IHN1Z2dlc3RpbmcgbGVzcyB1c2UKPj4gb2YgZ290
byBpbiB0aGUgcHJldmlvdXMgcGF0Y2guIFRoaXMgb25lIGRlZmluaXRlbHkgZ29lcyB0b28gZmFy
Cj4+IGZvciBteSB0YXN0ZSAtIEkgY2FuIHNvbWVob3cgbGl2ZSB3aXRoIGdvdG8tcyB1c2VkIGZv
ciBlcnJvcgo+PiBoYW5kbGluZywgYnV0IHBsZWFzZSBub3QgbXVjaCBtb3JlLiBJcyB0aGVyZSBy
ZWFsbHkgbm8gYmV0dGVyCj4+IHdheT8KPj4gCj4gCj4gSXQgbWF5IGJlIHBvc3NpYmxlIHRvIGNh
bGwgVU5NQVAgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgbG9vcCBpbnN0ZWFkLgo+IEhvdyBkb2Vz
IHRoYXQgc291bmQgdG8geW91PwoKSSB0aGluayB0aGF0J3MgZ29pbmcgdG8gYmUgYmV0dGVyLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
