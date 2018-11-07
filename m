From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 1/8] xen: xsm: flask: introduce
 XENMAPSPACE_gmfn_share for memory sharing
Date: Wed, 07 Nov 2018 00:41:53 -0700
Message-ID: <5BE2974102000078001F8F25@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1810081606390.28877@sstabellini-ThinkPad-X260>
 <1539041841-17655-1-git-send-email-sstabellini@kernel.org>
 <5BBC54C702000078001EFD71@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1811061441130.21987@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1811061441130.21987@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Sky Liu <blackskygg@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjExLjE4IGF0IDIzOjQyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gVHVlLCA5IE9jdCAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4+IE9uIDA5LjEw
LjE4IGF0IDAxOjM3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4gLS0tIGEv
eGVuL2luY2x1ZGUveHNtL2R1bW15LmgKPj4gPiArKysgYi94ZW4vaW5jbHVkZS94c20vZHVtbXku
aAo+PiA+IEBAIC01MzUsNiArNTM1LDIwIEBAIHN0YXRpYyBYU01fSU5MSU5FIGludCB4c21fbWFw
X2dtZm5fZm9yZWlnbihYU01fREVGQVVMVF9BUkcgc3RydWN0IGRvbWFpbiAqZCwgc3RyCj4+ID4g
ICAgICByZXR1cm4geHNtX2RlZmF1bHRfYWN0aW9uKGFjdGlvbiwgZCwgdCk7Cj4+ID4gIH0KPj4g
PiAgCj4+ID4gKy8qCj4+ID4gKyAqIEJlIGF3YXJlIHRoYXQgdGhpcyBpcyBub3QgYW4gZXhhY3Qg
ZGVmYXVsdCBlcXVpdmFsZW5jZSBvZiBpdHMgZmxhc2sKPj4gPiArICogdmFyaWFudCB3aGljaCBh
bHNvIGNoZWNrcyBpZiBAZCBhbmQgQHQgImFyZSBhbGxvd2VkIHRvIHNoYXJlIG1lbW9yeQo+PiA+
ICsgKiBwYWdlcyIsIGZvciBub3csIHdlIGRvbid0IGhhdmUgYSBwcm9wZXIgZGVmYXVsdCBlcXVp
dmFsZW5jZSBvZiBzdWNoIGEKPj4gPiArICogY2hlY2suCj4+ID4gKyAqLwo+PiA+ICtzdGF0aWMg
WFNNX0lOTElORSBpbnQgeHNtX21hcF9nbWZuX3NoYXJlKFhTTV9ERUZBVUxUX0FSRyBzdHJ1Y3Qg
ZG9tYWluICpkLAo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBkb21haW4gKnQpCj4+ID4gK3sKPj4gPiArICAgIFhTTV9BU1NFUlRfQUNUSU9OKFhT
TV9UQVJHRVQpOwo+PiA+ICsgICAgcmV0dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihYU01fVEFSR0VU
LCBjdXJyZW50LT5kb21haW4sIGQpID86Cj4+ID4gKyAgICAgICAgICAgeHNtX2RlZmF1bHRfYWN0
aW9uKGFjdGlvbiwgY3VycmVudC0+ZG9tYWluLCB0KTsKPj4gPiArfQo+PiAKPj4gRG9lcyB0aGlz
IChzcGVjaWZpY2FsbHkgeHNtL2R1bW15LmMpKSBidWlsZCB3aXRoIFhTTSBlbmFibGVkPwo+PiBB
ZmFpY3QgImFjdGlvbiIgaXMgZ29pbmcgdG8gYmUgYW4gdW5kZWZpbmVkIHN5bWJvbCBpbiB0aGF0
IGNhc2UuCj4gCj4gSSB0cmllZCBpdCBhbmQgaXQgZG9lcyBidWlsZCBPSwoKT2gsIEkgc2VlIC0g
dGhhdCBiZWNhdXNlIG9mIHRoZSB3YXkgWFNNX0FTU0VSVF9BQ1RJT04oKSBpcwpkZWZpbmVkIGlu
IHRoYXQgY2FzZS4gSXQncyBpbiBmYWN0IHRoZSBvdGhlciB3YXkgYXJvdW5kOiBGb3IKY29uc2lz
dGVuY3kgd2l0aCBvdGhlciBjb2RlLCB5b3Ugc2hvdWxkbid0IHVzZSBsaXRlcmFsClhTTV9UQVJH
RVQgaW4gdGhlIGZpcnN0IGZ1bmN0aW9uIGludm9jYXRpb24uCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
