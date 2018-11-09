From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 5/7] vpci: fix execution of long running
 operations
Date: Fri, 09 Nov 2018 01:02:17 -0700
Message-ID: <5BE53F0902000078001FA032@prv1-mh.provo.novell.com>
References: <5BE2FF5802000078001F9313@prv1-mh.provo.novell.com>
 <20181107171517.7p34q6vjpggmzb4i@mac.citrite.net>
 <5BE4082C02000078001F97FE@prv1-mh.provo.novell.com>
 <20181108112959.7oc4guik3icb7nls@mac.citrite.net>
 <5BE42CC202000078001F9A29@prv1-mh.provo.novell.com>
 <20181108124727.34nyejn4ukggd4co@mac.citrite.net>
 <5BE4344B02000078001F9A7B@prv1-mh.provo.novell.com>
 <20181108132048.o4bnxvojp6deotwq@mac.citrite.net>
 <791E55F8020000889527FA34@prv1-mh.provo.novell.com>
 <5BE4637602000078001F9D5D@prv1-mh.provo.novell.com>
 <20181108165923.nh3iekrspsr7jr2r@mac.citrite.net>
 <791E55F8020000889527FA34@prv1-mh.provo.novell.com>
 <5BE4637602000078001F9D5D@prv1-mh.provo.novell.com>
 <E720D0C40200003B9527FA34@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mulf=nu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gL1kC-0000tW-M8
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 08:02:20 +0000
In-Reply-To: <E720D0C40200003B9527FA34@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjExLjE4IGF0IDE3OjU5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTm92IDA4LCAyMDE4IGF0IDA5OjI1OjI2QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDguMTEuMTggYXQgMTQ6MjAsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDY6MDQ6MTFBTSAtMDcwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAwOC4xMS4xOCBhdCAxMzo0NywgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiBNeSBwb2ludCB3b3VsZCBiZSB0aGF0IG9uIHg4
NiBJIHRoaW5rIHRoZSBvbmx5IHdheSB0byBoYXZlIHByZWVtcHRpYmxlCj4+ID4+ID4gbG9uZy1y
dW5uaW5nIG9wZXJhdGlvbnMgaW5zaWRlIG9mIFhlbiBpcyB0byBibG9jayB0aGUgZ3Vlc3QgdkNQ
VSBhbmQKPj4gPj4gPiBydW4gdGhlbSBpbiBhIHRhc2tsZXQsIG9yIGF0IGxlYXN0IHRoaXMgc2Vl
bXMgdGhlIGxlc3MgaW52YXNpdmUgb25lLgo+PiA+PiA+IAo+PiA+PiA+IERvIHlvdSBzdGlsbCBo
YXZlIG9iamVjdGlvbnMgdG8gdGhpcyBwYXRjaC9hcHByb2FjaD8KPj4gPj4gCj4+ID4+IFdlbGws
IEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IHRoaW5rIHlvdSBuZWVkIHRvIGludHJv
ZHVjZQo+PiA+PiBhIHRhc2tsZXQgaW4gdGhlIGZpcnN0IHBsYWNlLiBUaGF0J3MgYmVjYXVzZSBJ
IHN0aWxsIGRvbid0IHVuZGVyc3RhbmQKPj4gPj4gd2hhdCB5b3UgdGhpbmsgaXMgd3Jvbmcgd2l0
aCB0aGUgY3VycmVudCBhcHByb2FjaCAobGVhdmluZyBhc2lkZQo+PiA+PiB0aGUgZXhhY3QgcGxh
Y2VtZW50IG9mIHdoZXJlIHRoZSB2cGNpIGhvb2sgbmVlZHMgdG8gYmUgY2FsbGVkKS4KPj4gPiAK
Pj4gPiBUaGUgY3VycmVudCBhcHByb2FjaCBkb2Vzbid0IHByZXZlbnQgdGhlIHZDUFUgZnJvbSBy
ZXR1cm5pbmcgdG8gZ3Vlc3QKPj4gPiBjb250ZXh0IHdpdGggcGVuZGluZyB3b3JrLgo+PiA+IAo+
PiA+IFBsYWNpbmcgdGhlIHBlbmRpbmcgd29yayBob29rICh2cGNpX3Byb2Nlc3NfcGVuZGluZykg
aW4gaHZtX2RvX3Jlc3VtZQo+PiA+IGlzIG5vdCBnb2luZyB0byBzb2x2ZSB0aGlzIHVubGVzcyB3
ZSByYWlzZSBhbmQgcHJvY2VzcyBhIHNjaGVkdWxlcgo+PiA+IHNvZnRpcnEsIGFuZCB0aGVuIHRo
aXMgbGVhZHMgdG8gdGhlIHJlY3Vyc2lvbiBwcm9ibGVtLgo+PiAKPj4gV2hpY2ggcmVjdXJzaW9u
IHByb2JsZW0/IEkgc3RpbGwgaGF2ZW4ndCBzZWVuIGFuIG91dGxpbmUgdGFraW5nIGludG8KPj4g
YWNjb3VudCB3aGF0IEkgaGF2ZSB3cml0dGVuIGluIGVhcmxpZXIgcmVwbGllcy4gSW4gcGFydGlj
dWxhciBJIGRvbid0Cj4+IHNlZSBhIHNvZnRpcnEgaGFuZGxlciBpdHNlbGYgY2FsbGluZyBkb19z
b2Z0aXJxKCkgYW55d2hlcmUuCj4gCj4gSSBjb3VsZCBwbGFjZSB0aGUgdlBDSSBwZW5kaW5nIHdv
cmsgaG9vayBpbiBodm1fZG9fcmVzdW1lIG9yCj4gaGFuZGxlX2h2bV9pb19jb21wbGV0aW9uIGFu
ZCB0aGVuIHNpbXBseSBkbyBhCj4gcmFpc2Vfc29mdGlycShTQ0hFRFVMRVJfU09GVElSUSkgYW5k
IHJldHVybiBpbiBvcmRlciB0byBwcmVlbXB0LiBUaGUKPiBkb19zb2Z0aXJxKCkgY2FsbCBpbiB0
aGUgc3ZtL3ZteCBndWVzdCBlbnRyeSBwYXRoIGlzIGNhbGxlZCB3aXRoIGEKPiBjbGVhbiBzdGFj
ayBzbyB0aGVyZSdzIG5vIHN0YWNrIG92ZXJmbG93IGlzc3VlIHRoZXJlLgo+IAo+IERvIHlvdSB0
aGluayB0aGlzIHdvdWxkIGJlIGJldHRlciB0aGFuIGJsb2NraW5nIHRoZSB2Q1BVIGFuZCB1c2lu
ZyBhCj4gdGFza2xldD8KCkF0IGxlYXN0IGl0IHdvdWxkIGJldHRlciBmaXQgd2l0aCB0aGUgcmVz
dCBvZiBob3cgdGhpbmdzIGN1cnJlbnRseQpnZXQgZG9uZS4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
