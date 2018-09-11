From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 0/3] xen-netback: hash mapping hanling
 adjustments
Date: Tue, 11 Sep 2018 11:16:23 +0100
Message-ID: <20180911101623.3tuzvlyr7musocrg__2299.15916356749$1536660904$gmane$org@zion.uk.xensource.com>
References: <5B85622302000078001E2A35@prv1-mh.provo.novell.com>
 <5B9778D702000078001E7069@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7vmb=lz=citrix.com=prvs=7855fab4e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fzfid-0003dS-8p
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 10:16:27 +0000
Content-Disposition: inline
In-Reply-To: <5B9778D702000078001E7069@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, davem@davemloft.net, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDI6MTI6MDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjA4LjE4IGF0IDE2OjU0LCAgd3JvdGU6Cj4gPiBGaXJzdCBhbmQgZm9y
ZW1vc3QgdGhlIGZpeCBmb3IgWFNBLTI3MC4gT24gdG9wIG9mIHRoYXQgZnVydGhlciBjaGFuZ2Vz
Cj4gPiB3aGljaCBsb29rZWQgZGVzaXJhYmxlIHRvIG1lIHdoaWxlIGludmVzdGlnYXRpbmcgdGhh
dCBYU0EuCj4gPiAKPiA+IDE6IGZpeCBpbnB1dCB2YWxpZGF0aW9uIGluIHhlbnZpZl9zZXRfaGFz
aF9tYXBwaW5nKCkKPiA+IDI6IHZhbGlkYXRlIHF1ZXVlIG51bWJlcnMgaW4geGVudmlmX3NldF9o
YXNoX21hcHBpbmcoKQo+ID4gMzogaGFuZGxlIHBhZ2Ugc3RyYWRkbGluZyBpbiB4ZW52aWZfc2V0
X2hhc2hfbWFwcGluZygpCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiAKPiBXaGF0IGlzIHRoZSB3YXkgZm9yd2FyZCBoZXJlPyBJJ3ZlIGdv
dCBSLWItcyBmcm9tIFBhdWwgZm9yIGFsbCB0aHJlZQo+IHBhdGNoZXMsIGFuZCBhIG1pbm9yIGNo
YW5nZSByZXF1ZXN0IG9uIHBhdGNoIDIgZnJvbSBXZWkuIEknbSBub3QKPiByZWFsbHkgY2VydGFp
biB3aGF0IHRvIGRvIGluIHRoaXMgY2FzZSAoaGludHMgYXBwcmVjaWF0ZWQpLCBidXQgY291bGQK
PiBhdCBsZWFzdCB0aGUgc2VjdXJpdHkgZml4IChwYXRjaCAxKSBiZSBhcHBsaWVkIGltbWVkaWF0
ZWx5PwoKSWYgeW91IGhhcHBlbiB0byByZXNlbmQsIHBsZWFzZSBtYWtlIHRoZSBhZGp1c3RtZW50
OyBvdGhlcndpc2UgSSdtIGZpbmUKd2l0aCB0aGUgcGF0Y2hlcyBhcyB0aGV5IGFyZS4gSSBkb24n
dCB3YW50IHRvIGJsb2NrIHVzZWZ1bCB0aGluZ3Mgb24KY29zbWV0aWMgaXNzdWVzLgoKV2VpLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
