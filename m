From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] shut down domain when last vCPU goes down
Date: Fri, 16 Feb 2018 16:08:37 +0000
Message-ID: <20180216160837.n3ahilzmmoky2qx6@MacBook-Pro-de-Roger.local>
References: <5A87028802000078001A8759@prv-mh.provo.novell.com>
 <20180216155248.ni6vg3botbbwvb74@MacBook-Pro-de-Roger.local>
 <20180216155944.fqh44otswnkscrlw@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=c1s1=fk=citrix.com=prvs=57802d2d1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1emiZY-00076V-UL
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 16:09:16 +0000
Content-Disposition: inline
In-Reply-To: <20180216155944.fqh44otswnkscrlw@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMDM6NTk6NDVQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIEZlYiAxNiwgMjAxOCBhdCAwMzo1Mjo0OFBNICswMDAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMDg6MTA6NDhBTSAtMDcwMCwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+IEkndmUganVzdCBoYWQgdG8gZGVhbCB3aXRoIGFuIGVh
cmx5IGJvb3QgY3Jhc2ggb2YgTGludXggd2hpY2ggb2NjdXJyZWQKPiA+ID4gc28gZWFybHkgdGhh
dCBldmVuICJlYXJseXByaW50az14ZW4iIGRpZCBub3QgcHJvZHVjZSBhbnkgdXNlZnVsIG91dHB1
dC4KPiA+ID4gSGVuY2UgdGhlIGRvbWFpbiBhcHBlYXJlZCB0byBoYW5nLCB3aGlsZSBpbiBmYWN0
IGl0IGhhZCBicm91Z2h0IGRvd24gaXRzCj4gPiA+IG9ubHkgdkNQVS4gQnkgdHJhbnNsYXRpbmcg
dGhpcyB0byBhIHNodXRkb3duLCB0aGUgc2l0dWF0aW9uIHdpbGwgYmUKPiA+ID4gYmV0dGVyIHJl
Y29nbml6YWJsZS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+ID4gCj4gPiBJJ20gd29uZGVyaW5nLCBpcyBpdCBjb21tb24g
Zm9yIGEgZG9tYWluIHRvIHNodXRkb3duIGJ5IHNodXR0aW5nIGRvd24KPiA+IGFsbCBpdCdzIHZD
UFVzPwo+ID4gCj4gPiBJbiB0aGUgc2NlbmFyaW8gdGhhdCB5b3UgZGVzY3JpYmUgYWJvdmUgaXQg
c2VlbXMgaXQgd291bGQgYmUgbW9yZQo+ID4gaGVscGZ1bCB0byBpc3N1ZSBhIFNIVVRET1dOX2Ny
YXNoIGluc3RlYWQgbWF5YmUgd2l0aCBhIGdkcHJpbnRrCj4gPiBtZXNzYWdlIGluIG9yZGVyIHRv
IGFpZCBkZWJ1Z2dpbmcuCj4gCj4gVGhlcmUgZG9lc24ndCBzZWVtIHRvIGJlIGEgcmVsaWFibGUg
d2F5IHRvIGRpc3Rpbmd1aXNoIGEgY3Jhc2ggdnMgYQo+IGd1ZXN0IGNsZWFuIHNodXRkb3duIGlu
IHlvdSBzY2hlbWUgdGhvdWdoLgoKSSBhZ3JlZSwgSSBndWVzcyB0aGUgcmVhbCBwcm9ibGVtIGlz
IHRoYXQgdGhlIGd1ZXN0IHNob3VsZCB1c2UKU0hVVERPV05fY3Jhc2ggaXRzZWxmIGluc3RlYWQg
b2Ygc2h1dHRpbmcgZG93biB0aGUgdkNQVS4KCkJ1dCBJIGRvbid0IHRoaW5rIGEgZG9tYWluIHNo
b3VsZCB0cnkgdG8gcGVyZm9ybSBhIGNsZWFuIHNodXRkb3duIGJ5CnNodXR0aW5nIGRvd24gYWxs
IG9mIGl0J3MgdkNQVXMsIHRoZSBwcm9wZXIgd2F5IHRvIGRvIGEgY2xlYW4gc2h1dGRvd24KaXMg
dG8gY2FsbCBTSFVURE9XTl9wb3dlcm9mZi4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
