From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/5] docs/pvh: document initial MTRR state
Date: Tue, 15 May 2018 01:51:03 -0600
Message-ID: <5AFA916702000078001C2BCB@prv1-mh.provo.novell.com>
References: <20180510171505.37309-1-roger.pau@citrix.com>
 <20180510171505.37309-6-roger.pau@citrix.com>
 <20180514160352.3niqmzctpntjhoeg@citrix.com>
 <5AF9B5BB02000078001C299B@prv1-mh.provo.novell.com>
 <20180514161852.mvwylcax5tb7ywsj@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ecih=ic=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIUjj-0006My-Kx
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 07:51:07 +0000
In-Reply-To: <20180514161852.mvwylcax5tb7ywsj@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA1LjE4IGF0IDE4OjE4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBNYXkgMTQsIDIwMTggYXQgMTA6MTM6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxNC4wNS4xOCBhdCAxODowMywgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IE9uIFRodSwgTWF5IDEwLCAyMDE4IGF0IDA2OjE1OjA1UE0gKzAxMDAsIFJvZ2Vy
IFBhdSBNb25uZSB3cm90ZToKPj4gPj4gLS0tIGEvZG9jcy9taXNjL3B2aC5tYXJrZG93bgo+PiA+
PiArKysgYi9kb2NzL21pc2MvcHZoLm1hcmtkb3duCj4+ID4+IEBAIC05MiwzICs5MiwxOCBAQCBl
dmVudCBjaGFubmVscy4gRGVsaXZlcnkgb2YgdGhvc2UgaW50ZXJydXB0cyBjYW4gYmUgY29uZmln
dXJlZCBpbiB0aGUgc2FtZSB3YXkKPj4gPj4gIGFzIEhWTSBndWVzdHMsIGNoZWNrIHhlbi9pbmNs
dWRlL3B1YmxpYy9odm0vcGFyYW1zLmggYW5kCj4+ID4+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvaHZt
L2h2bVxfb3AuaCBmb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCBhdmFpbGFibGUgZGVsaXZlcnkK
Pj4gPj4gIG1ldGhvZHMuCj4+ID4+ICsKPj4gPj4gKyMjIE1UUlIgIyMKPj4gPj4gKwo+PiA+PiAr
IyMjIFVucHJpdmlsZWdlZCBndWVzdHMgIyMjCj4+ID4+ICsKPj4gPj4gK1BWSCBndWVzdHMgYXJl
IGJvb3RlZCB3aXRoIHRoZSBkZWZhdWx0IE1UUlIgdHlwZSBzZXQgdG8gd3JpdGUtYmFjayBhbmQg
TVRSUgo+PiA+PiArZW5hYmxlZC4gVGhpcyBhbGxvd3MgRG9tVXMgdG8gc3RhcnQgd2l0aCBhIHNh
bmUgTVRSUiBzdGF0ZS4gTm90ZSB0aGF0IHRoaXMgd2lsbAo+PiA+PiAraGF2ZSB0byBiZSByZXZp
c2l0ZWQgd2hlbiBwY2ktcGFzc3Rocm91Z2ggaXMgYWRkZWQgdG8gUFZIIGluIG9yZGVyIHRvIHNl
dCBNTUlPCj4+ID4+ICtyZWdpb25zIGFzIFVDLgo+PiA+IAo+PiA+IE15IHJlYWRpbmcgaXMgInJl
dmlzaXRlZCIgaW1wbGllcyB0aGUgZGVmYXVsdCB0eXBlIHdpbGwgY2hhbmdlLiBJbiBmYWN0Cj4+
ID4gaXQgc2hvdWxkbid0LiBXZSBzaG91bGQgY2xhcmlmeTogZm9yIHJhbSBpdCB3aWxsIHJlbWFp
biBXQiwgZm9yIE1NSU8KPj4gPiBob2xlcyBpdCB3aWxsIGJlIFVDLgo+PiAKPj4gV2h5IHdvdWxk
IGNoYW5naW5nIHRoZSBkZWZhdWx0IGxhdGUgYmUgYSBwcm9ibGVtPyBBIGZpcm13YXJlIHVwZGF0
ZSBvbgo+PiBiYXJlIGhhcmR3YXJlIG1pZ2h0IGFsc28gaGF2ZSBzdWNoIGFuIGVmZmVjdC4gVGhl
IGRlZmF1bHQgdHlwZSByZWFkIGZyb20KPj4gdGhlIE1TUiBtdXN0IG5vdCBjaGFuZ2UgYWNyb3Nz
IHRoZSBsaWZldGltZSBvZiBhIFZNLCBidXQgaW1vIG1heSBjaGFuZ2UKPj4gYWNyb3NzIHJlYm9v
dHMgb2YgaXQuCj4+IAo+IAo+IFRoZW4gc2V0dGluZyBhIGRlZmF1bHQgaGVyZSBkb2Vzbid0IHJl
YWxseSBoZWxwIE9TIGRldmVsb3BlcnMgYmVjYXVzZQo+IHRoZXkgd2lsbCBhbHdheXMgbmVlZCB0
byB3cml0ZSBjb2RlIHRvIHNldCB0aGUgY29ycmVjdCB0eXBlIC0tIG5vdCB0aGF0Cj4gdGhpcyBp
cyBhIGJpZyBpc3N1ZSwgYnV0IGFzIEkgdW5kZXJzdGFuZCBpdCB0aGUgcG9pbnQgaGVyZSBpcyB0
byBhdm9pZAo+IHRoYXQuCgpIbW0sIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIHB1cnBvc2Ugb2Yg
dGhlIHNlcmllcyB3YXMgdGhhdCBpdCBhaW1zIGF0CmVzdGFibGlzaGluZyBzb21lIHNhbmUgKGku
ZS4gcmVhc29uYWJsZSBmb3IgYW4gT1MgdG8gZXhwZWN0KSBzdGF0ZSwgaW5zdGVhZApvZiBhIGZp
cm0gInRoaXMgd2lsbCBhbHdheXMgYmUgdGhpcyB3YXkiIG9uZS4gRnVydGhlcm1vcmUgT1NlcyBn
ZW5lcmFsbHkKc2hvdWxkbid0IGZpbmQgYSBuZWVkIHRvIGZpZGRsZSB3aXRoIE1UUlJzLCBwcm92
aWRlZCBmaXJtd2FyZSBoYXMgZG9uZSBhCnByb3BlciBqb2Igc2V0dGluZyB0aGVtIHVwLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
