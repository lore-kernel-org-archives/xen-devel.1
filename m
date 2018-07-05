From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] EFI: add EFI_LOAD_OPTION support
Date: Thu, 05 Jul 2018 07:03:22 -0600
Message-ID: <5B3E171A02000078001D183F@prv1-mh.provo.novell.com>
References: <5B31E90F02000078001CDCE1@prv1-mh.provo.novell.com>
 <20180705095918.zklzzjraybeowhh3@citrix.com>
 <5B3E084E02000078001D17B9@prv1-mh.provo.novell.com>
 <2de546e1-3a12-6194-1923-2d4f8ec0dd71@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6ivd=jv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fb3uw-0005NE-ID
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 13:03:26 +0000
In-Reply-To: <2de546e1-3a12-6194-1923-2d4f8ec0dd71@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA3LjE4IGF0IDE0OjU3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMDcvMTggMTM6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNS4w
Ny4xOCBhdCAxMTo1OSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24gVHVlLCBK
dW4gMjYsIDIwMTggYXQgMDE6MTk6NDNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
V2hlbiBib290aW5nIFhlbiB2aWEgVUVGSSB0aGUgWGVuIGNvbmZpZyBmaWxlIGNhbiBjb250YWlu
IG11bHRpcGxlCj4+Pj4gc2VjdGlvbnMgZWFjaCBkZXNjcmliaW5nIGRpZmZlcmVudCBib290IG9w
dGlvbnMuIEl0IGlzIGN1cnJlbnRseSBvbmx5Cj4+Pj4gcG9zc2libGUgdG8gY2hvb3NlIHdoaWNo
IHNlY3Rpb24gdG8gYm9vdCB3aXRoIGlmIHRoZSBidWZmZXIgY29udGFpbnMgYQo+Pj4+IHN0cmlu
Zy4gVUVGSSBwcm92aWRlcyBhIGRpZmZlcmVudCBzdGFuZGFyZCB0byBwYXNzIG9wdGlvbmFsIGFy
Z3VtZW50cwo+Pj4+IHRvIGFuIGFwcGxpY2F0aW9uLCBhbmQgaW4gdGhpcyBwYXRjaCB3ZSBtYWtl
IFhlbiBwcm9wZXJseSBwYXJzZSB0aGlzCj4+Pj4gYnVmZmVyLCB0aHVzIG1ha2luZyBpdCBwb3Nz
aWJsZSB0byBoYXZlIHNlcGFyYXRlIEVGSSBib290IG9wdGlvbnMKPj4+PiBwcmVzZW50IGZvciB0
aGUgZGlmZmVyZW50IGNvbmZpZyBzZWN0aW9ucy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRh
bWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiBOb3Qgc3VyZSB3aHkgSSdtIENDJ2Vk
IG9uIHRoaXMgcGF0Y2guIFNpbmNlIHlvdSdyZSB0aGUgRUZJIG1haW50YWluZXIsIEkKPj4+IGRv
bid0IHRoaW5rIGEgdGFnIGlzIG5lZWRlZCBmb3IgeW91IHRvIGNvbW1pdCB0aGlzIGNoYW5nZS4K
Pj4gSG1tLCBzbyBmYXIgSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCB0aGUgbGFjayBv
ZiBhIDJuZAo+PiBtYWludGFpbmVyIG1lYW50IGFuIGFjayBmcm9tIFRIRSBSRVNUIHdvdWxkIGF0
IHRoZSB2ZXJ5IGxlYXN0Cj4+IGJlIGRlc2lyYWJsZS4KPiAKPiBBY2tlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBJZGVhbGx5LCBpZiBUYW1hcyBj
YW4gY29uZmlybSB0aGF0IHRoaXMgcGF0Y2ggd29ya3MgZm9yIGhpbSwgdGhhdCB3b3VsZAo+IGJl
IGJldHRlci4KCkVmZmVjdGl2ZWx5IGhlIGRpZCBpbgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMDUvbXNnMDE0OTIuaHRtbApBZnRlciB0
aGF0IEkndmUgb25seSBhZGRlZCBhIGZldyBjb21tZW50cyBmb3IgdGhlIGZpbmFsIHY0LgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
