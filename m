From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] iommu / p2m: add a page_order parameter to
 iommu_map/unmap_page()
Date: Mon, 29 Oct 2018 04:21:31 -0600
Message-ID: <5BD6DF2B02000078001F5B98@prv1-mh.provo.novell.com>
References: <20181017081958.40419-1-paul.durrant@citrix.com>
 <5BD3369B02000078001F5526@prv1-mh.provo.novell.com>
 <ef04c70be67e4dbcbfaadac7ecb31a4e@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m5uw=nj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gH4fw-0001cU-26
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 10:21:36 +0000
In-Reply-To: <ef04c70be67e4dbcbfaadac7ecb31a4e@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjEwLjE4IGF0IDE3OjUyLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAyNiBPY3RvYmVyIDIwMTggMTY6NDYKPj4gCj4+ID4+PiBPbiAxNy4xMC4xOCBhdCAxMDoxOSwg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4gPiAgICAgIHsKPj4gPiAtICAgICAg
ICBpZiAoICFkLT5pc19zaHV0dGluZ19kb3duICYmIHByaW50a19yYXRlbGltaXQoKSApCj4+ID4g
LSAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSCj4+ID4gLSAgICAgICAgICAgICAgICAgICAi
ZCVkOiBJT01NVSB1bm1hcHBpbmcgZGZuICUiUFJJX2RmbiIgZmFpbGVkOiAlZFxuIiwKPj4gPiAt
ICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgZGZuX3goZGZuKSwgcmMpOwo+PiA+ICsg
ICAgICAgIGludCByYyA9IGhkLT5wbGF0Zm9ybV9vcHMtPnVubWFwX3BhZ2UoZCwgZGZuX2FkZChk
Zm4sIGkpKTsKPj4gPgo+PiA+IC0gICAgICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihkKSAp
Cj4+ID4gLSAgICAgICAgICAgIGRvbWFpbl9jcmFzaChkKTsKPj4gPiArICAgICAgICBpZiAoIHVu
bGlrZWx5KHJjKSApCj4+ID4gKyAgICAgICAgewo+PiA+ICsgICAgICAgICAgICBpZiAoICFkLT5p
c19zaHV0dGluZ19kb3duICYmIHByaW50a19yYXRlbGltaXQoKSApCj4+ID4gKyAgICAgICAgICAg
ICAgICBwcmludGsoWEVOTE9HX0VSUgo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICJkJWQ6
IElPTU1VIHVubWFwcGluZyBkZm4gJSJQUklfZGZuIiBmYWlsZWQ6Cj4+ICVkXG4iLAo+PiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgZGZuX3goZGZuKSwgcmMpOwo+PiA+
ICsKPj4gPiArICAgICAgICAgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGQpICkKPj4gPiAr
ICAgICAgICAgICAgICAgIGRvbWFpbl9jcmFzaChkKTsKPj4gPiArCj4+ID4gKyAgICAgICAgICAg
IHJldHVybiByYzsKPj4gCj4+IFRoaXMgaXMgbm90IGluIGxpbmUgd2l0aCB0aGUgY29kZSB5b3Ug
ZHJvcDogVW5tYXAgc2hvdWxkIGNvbnRpbnVlCj4+IHRoZSBsb29wLCBhbmQganVzdCByZWNvcmQg
KGFuZCB0aGVuIHJlcG9ydCkgdGhlIGZpcnN0IChpZiBhbnkpIGVycm9yLAo+PiB0byBiZSBvbiB0
aGUgc2FmZSBzaWRlIGlmIGNhbGxlcnMgYXNzdW1lIHRoZSB1bm1hcCB3b24ndCBmYWlsICh3aGlj
aAo+PiBjYW4ndCBiZSBleGNsdWRlZCBkZXNwaXRlIHRoZSBfX211c3RfY2hlY2ssIGFzIHRoZSBj
b2RlIGluCj4+IGlvbW11X21hcF9wYWdlKCkgc2hvd3MpLiBQZXJoYXBzIHRoZSBsb2dnaW5nIHRo
ZW4gc2hvdWxkIGFsc28KPj4gYmUgcmVzdHJpY3RlZCB0byBqdXN0IHRoZSBmaXJzdCBjYXNlIG9m
IGVycm9yLCBhbmQgaW4gYW55IGV2ZW50IHBsZWFzZQo+PiB3aXRoIHRoZSBjb3JyZWN0IGRmbiAo
b3Igd2l0aCB0aGUgb3JkZXIgYWxzbyBsb2dnZWQpLgo+PiAKPiAKPiBPay4gSSBndWVzcyB1bm1h
cHBpbmcgYXMgbXVjaCBhcyBpcyBwb3NzaWJsZSBmb3IgdGhlIGgvdyBkb21haW4gaXMgCj4gcmVh
c29uYWJsZS4gQW55IG90aGVyIGRvbWFpbiB3aWxsIG9mIGNvdXJzZSBiZSBjcmFzaGVkLCBzbyBp
dCB3b3VsZCBzZWVtIAo+IGJldHRlciB0byBiYWlsIG91dCBvZiB0aGUgbG9vcCBlYXJseSBpbiB0
aGF0IGNhc2UuCgpGaW5lIHdpdGggbWUuCgpKYW4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
