From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/6] xen/pvshim: identity pin shim vCPUs
	to pCPUs
Date: Thu, 18 Jan 2018 11:25:28 +0000
Message-ID: <20180118112528.qelfqswo25zz4fsn@MacBook-Pro-de-Roger.local>
References: <20180117111609.hlur2q5r34ld6ujf@citrix.com>
 <20180117162907.37974-1-roger.pau@citrix.com>
 <5A5F79EC020000E70331C076@prv-mh.provo.novell.com>
 <5A606D56020000780019FBB8@prv-mh.provo.novell.com>
 <23136.33005.376232.629418@mariner.uk.xensource.com>
 <5A609173020000780019FDE6@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lqax=en=citrix.com=prvs=549fb6881=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ec8KD-0001PT-TL
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 11:25:41 +0000
Content-Disposition: inline
In-Reply-To: <5A609173020000780019FDE6@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMDQ6MjI6MTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE4LjAxLjE4IGF0IDEyOjExLCA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBKYW4gQmV1bGljaCB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDMvNl0geGVu
L3B2c2hpbTogaWRlbnRpdHkgcGluIHNoaW0gdkNQVXMgCj4gPiB0byBwQ1BVcyIpOgo+ID4+IE9u
IDE3LjAxLjE4IGF0IDE3OjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4g
U2luY2UgVkNQVU9QX3t1cC9kb3dufSBhbHJlYWR5IGlkZW50aXR5IG1hcHMgdkNQVSBob3RwbHVn
IHRvIHBDUFUKPiA+PiA+IGhvdHBsdWcgYWxzbyBpZGVudGl0eSBwaW4gdGhlIHZDUFVzIHRvIHRo
ZSBwQ1BVcyBpbiB0aGUgc2NoZWR1bGVyLgo+ID4+ID4gVGhpcyBwcmV2ZW50cyB2Q1BVIG1pZ3Jh
dGlvbiBhbmQgc2hvdWxkIGltcHJvdmUgcGVyZm9ybWFuY2UuCj4gPj4gPiAKPiA+PiA+IFdoaWxl
IHRoZXJlIGFsc28gdXNlIF9fY3B1bWFza19zZXRfY3B1IGluc3RlYWQgb2YgY3B1bWFza19zZXRf
Y3B1LAo+ID4+ID4gdGhlcmUncyBubyBuZWVkIHRvIHVzZSB0aGUgbG9ja2VkIHZhcmlhbnQuCj4g
Pj4gPiAKPiA+PiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgo+ID4+ID4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+Cj4gPj4gCj4gPj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
PiA+IAo+ID4gU2hvdWxkIHRoaXMgYmUgaW4gdGhlIHNlY3VyaXR5IHJlc3BvbnNlIGNvbWV0IGJy
YW5jaCA/Cj4gCj4gSSBiZWxpZXZlIHNvLCBidXQgYmV0dGVyIGFzayBSb2dlciBhbmQgV2VpLgoK
SXQgc2hvdWxkIGJlIGluIHRoZSA0LjEwIGNvbW1lbnQgYnJhbmNoIG9ubHkgKG5vdCB0aGUgNC44
KSwgc2luY2UgaXQncwphIHNoaW0gcGF0Y2guCgpJbiBhbnkgY2FzZSwgaXQncyBub3QgYSBidWcg
Zml4LCBqdXN0IGEgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgYnV0CnN0aWxsIG5pY2UgdG8gaGF2
ZSBJTUhPLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
