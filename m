From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86: decouple xen alignment setting
 from EFI/non-EFI build
Date: Tue, 19 Mar 2019 06:48:37 -0600
Message-ID: <5C90E5250200007800220403@prv1-mh.provo.novell.com>
References: <20190318145719.11396-1-wei.liu2@citrix.com>
 <20190318145719.11396-2-wei.liu2@citrix.com>
 <5C90C84F0200007800220382@prv1-mh.provo.novell.com>
 <20190319112434.GD14641@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h6EAd-0005qK-SK
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 12:48:43 +0000
In-Reply-To: <20190319112434.GD14641@zion.uk.xensource.com>
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

Pj4+IE9uIDE5LjAzLjE5IGF0IDEyOjI0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMDQ6NDU6MzVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxOC4wMy4xOSBhdCAxNTo1NywgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4+ID4gKysrIGIveGVuL2FyY2gv
eDg2L0tjb25maWcKPj4gPiBAQCAtMTM4LDYgKzEzOCwzMiBAQCBjb25maWcgVEJPT1QKPj4gPiAg
Cj4+ID4gIAkgIElmIHVuc3VyZSwgc2F5IFkuCj4+ID4gIAo+PiA+ICtjaG9pY2UKPj4gPiArCXBy
b21wdCAiQWxpZ25tZW50IG9mIFhlbiBiaW5hcnkiCj4+ID4gKwlkZXBlbmRzIG9uIFg4Ngo+PiA+
ICsJZGVmYXVsdCBYRU5fQUxJR05fREVGQVVMVAo+PiA+ICsJLS0taGVscC0tLQo+PiA+ICsJICBT
cGVjaWZ5IGFsaWdubWVudCBmb3IgWGVuIGJpbmFyeS4KPj4gPiArCj4+ID4gKwkgIElmIHVuc3Vy
ZSwgY2hvb3NlICJkZWZhdWx0Ii4KPj4gPiArCj4+ID4gK2NvbmZpZyBYRU5fQUxJR05fREVGQVVM
VAo+PiA+ICsJYm9vbCAiRGVmYXVsdCBhbGlnbm1lbnQiCj4+ID4gKwktLS1oZWxwLS0tCj4+ID4g
KwkgIFBpY2sgYWxpZ25tZW50IGFjY29yZGluZyB0byBidWlsZCB2YXJpYW50cy4KPj4gPiArCj4+
ID4gKwkgIEZvciBFRkkgYnVpbGQgdGhlIGRlZmF1bHQgYWxpZ25tZW50IGlzIDJNLiBGb3Igbm9u
LUVGSSBidWlsZAo+PiA+ICsJICB0aGUgZGVmYXVsdCBhbGlnbm1lbnQgaXMgNEsgZHVlIHRvIHN5
c2xpbnV4IGZhaWxpbmcgdG8gaGFuZGxlCj4+ID4gKwkgIDJNIGFsaWdubWVudC4KPj4gCj4+IFdh
c24ndCBpdCB0aGUgcmVzdWx0aW5nIGltYWdlIHNpemUgcmF0aGVyIHRoYW4gdGhlIGFsaWdubWVu
dCBpdHNlbGYKPj4gd2hpY2ggZGlkIGNhdXNlIHRoZSBwcm9ibGVtPyBIYXMgdGhlIGlzc3VlIGJl
ZW4gZml4ZWQgaW4gbmV3ZXIKPj4gc3lzbGludXg/Cj4+IAo+IAo+IFJpZ2h0LiBJIGNhbiBtYWtl
IHRoaXMgY2xlYXJlci4KPiAKPiAiZHVlIHRvIHN5c2xpbnV4IGZhaWxpbmcgdG8gaGFuZGxlIHRo
ZSBpbWFnZSBzaXplIGluY3JlbWVudCBpbmR1Y2VkIGJ5Cj4gMk0gYWxpZ25tZW50Ii4KPiAKPiBB
bHNvLCBJIHRoaW5rIHMvYmluYXJ5L2ltYWdlLyBpbiB0aGUgZGVzY3JpcHRpb24gd291bGQgYmUg
YmV0dGVyLgoKQWdyZWVkLgoKPj4gPiArY29uZmlnIFhFTl9BTElHTl80Swo+PiA+ICsJYm9vbCAi
NEsgYWxpZ25tZW50Igo+PiA+ICsKPj4gPiArY29uZmlnIFhFTl9BTElHTl8yTQo+PiA+ICsJYm9v
bCAiMk0gYWxpZ25tZW50Igo+PiAKPj4gSW4gcGF0Y2ggMiB5b3Ugb25seSBuZWVkIHRoZSBsYXR0
ZXIgLSBpcyB0aGVyZSByZWFsbHkgbXVjaCB2YWx1ZSBpbgo+PiBhbGxvd2luZyBleHBsaWNpdGx5
IHJlcXVlc3RpbmcgNGs/Cj4gCj4gSSB0aG91Z2h0IHRoZXJlIHdvdWxkIGJlIGEgY2FzZSBpbiB3
aGljaCB1c2VycyB3YW50IDRLIGV4cGxpY2l0bHk/IEknbQo+IGNlcnRhaW5seSBmaW5lIHdpdGgg
ZHJvcHBpbmcgdGhlIDRLIGFsaWdubWVudCBvcHRpb24uCgpXZWxsLCB3aXRob3V0IGEgc3BlY2lm
aWMgbmVlZCBvciByZXF1ZXN0IEknZCBwcmVmZXIgbm90IHRvIHNlZSBleHRyYQpvcHRpb25zIGlu
dHJvZHVjZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
