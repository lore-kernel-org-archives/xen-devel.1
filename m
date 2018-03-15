From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 01/11] vpci: introduce basic handlers to
 trap accesses to the PCI config space
Date: Thu, 15 Mar 2018 09:50:04 +0000
Message-ID: <20180315095004.oy3ylmba7rotutea@MacBook-Pro-de-Roger.local>
References: <20180314140408.40947-1-roger.pau@citrix.com>
 <20180314140408.40947-2-roger.pau@citrix.com>
 <5AA9403702000078001B1994@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i8qd=gf=citrix.com=prvs=6054e4102=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ewPWc-0003PG-63
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 09:50:18 +0000
Content-Disposition: inline
In-Reply-To: <5AA9403702000078001B1994@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMDg6MzE6MDNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjAzLjE4IGF0IDE1OjAzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2RyaXZlcnMvS2NvbmZpZwo+ID4gKysrIGIveGVuL2RyaXZlcnMv
S2NvbmZpZwo+ID4gQEAgLTEyLDQgKzEyLDYgQEAgc291cmNlICJkcml2ZXJzL3BjaS9LY29uZmln
Igo+ID4gIAo+ID4gIHNvdXJjZSAiZHJpdmVycy92aWRlby9LY29uZmlnIgo+ID4gIAo+ID4gK3Nv
dXJjZSAiZHJpdmVycy92cGNpL0tjb25maWciCj4gCj4gQXJlIHRoZXJlIG1vcmUgdGhpbmdzIHRv
IGFwcGVhciBpbiB0aGF0IG5ldyBmaWxlPyBJZiBub3QsIHdoYXQgdGhlCj4gcG9pbnQgb2YgaW50
cm9kdWNpbmcgaXQ/CgpJJ3ZlIGFzc3VtZWQgdGhhdCB3YXMgdGhlIGNvcnJlY3QgaGllcmFyY2h5
IHRvIHByZXZlbnQgcG9sbHV0aW5nCktjb25maWcgZmlsZXMuIHBjaS8gYW5kIGNwdWZyZXEvIGFs
c28gY29udGFpbiBhIEtjb25maWcgZmlsZSB3aXRoIGEKc2luZ2xlIG9wdGlvbi4KCkkgY2FuIG1v
dmUgaXQgdG8gZHJpdmVycy9LY29uZmlnIGlmIHlvdSBwcmVmZXIuCgo+ID4gLS0tIC9kZXYvbnVs
bAo+ID4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9LY29uZmlnCj4gPiBAQCAtMCwwICsxLDQgQEAK
PiA+ICsKPiA+ICtjb25maWcgSEFTX1ZQQ0kKPiA+ICsJYm9vbAo+ID4gKwlkZXBlbmRzIG9uIEhB
U19QQ0kKPiAKPiBTbyB0aGlzIGlzIG9uZSBvZiB0aG9zZSBjb21tb24gS2NvbmZpZyBpc3N1ZXM6
IFdoZW4gdGhlcmUncyBubwo+IHByb21wdCwgYW55ICJkZXBlbmRzIG9uIiBjYW4gYXQgYmVzdCBs
ZWFkIHRvIHdhcm5pbmdzIHRoZSB0b29sCj4gaXNzdWVzIGFuZCBuby1vbmUgcGF5cyBhdHRlbnRp
b24gdG8uIEkgY2FuIG9ubHkgYWR2aXNlIHRvIGF2b2lkCj4gc3VjaCBkZXBlbmRlbmNpZXMuIElm
IGFueW9uZSBnZXRzIHRoZSBzZWxlY3RzIHdyb25nLCB0aGVyZSdsbAo+IGJlIGEgYnVpbGQgZmFp
bHVyZSBzb21ld2hlcmUgaW5kZXBlbmRlbnQgb2Ygc2FpZCB3YXJuaW5nLgoKWWVzLCB0aGUgYnVp
bGQgaXMgY2VydGFpbmx5IGdvaW5nIHRvIGZhaWwuCgo+IFdpdGggdGhlc2UgdGFrZW4gY2FyZSBv
ZiwgZmVlbCBmcmVlIHRvIHJlaW5zdGF0ZQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gKEkgdGhpbmsgdGhlIGFkanVzdG1lbnRzIGNvdWxkIGFsc28gYmUg
ZG9uZSB3aGlsZSBjb21taXR0aW5nLAo+IGlmIGVub3VnaCBvZiB0aGUgc2VyaWVzIGJlY29tZXMg
cmVhZHkgdG8gd2FycmFudCBwdXR0aW5nIGluCj4gYXQgbGVhc3QgcGFydCBvZiBpdDsgSSB0aGlu
ayBpdCB3YXMgcmVhbGx5IHRoZSBsYWNrIG9mIGFuIEFSTSBzaWRlCj4gYWNrIHdoaWNoIHByZXZl
bnRlZCBtZSBmcm9tIGRvaW5nIHRoaXMgb24gdjggYWxyZWFkeS4pCgpZb3UgaGF2ZSBjb21tZW50
cyBvbiBvdGhlciBwYXRjaGVzIHN0YXJ0aW5nIGZyb20gcGF0Y2ggNywgbGV0IG1lIHRha2UKYSBs
b29rIGF0IHRoZSBjb21tZW50cywgaWYgdGhleSBhcmUgbWlub3IgSSBjb3VsZCBwcm9iYWJseSBm
aXggdGhlbQpxdWlja2x5IGFuZCBzZW5kIGEgbmV3IHZlcnNpb24gd2l0aCB0aGlzIG1pbm9yIGNv
cnJlY3Rpb25zIGFsc28uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
