From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v21 1/2] common: add a new mappable resource
 type: XENMEM_resource_grant_table
Date: Wed, 08 Aug 2018 04:55:20 -0600
Message-ID: <5B6ACC1802000078001DBF88@prv1-mh.provo.novell.com>
References: <20180808090032.2713-1-paul.durrant@citrix.com>
 <20180808090032.2713-2-paul.durrant@citrix.com>
 <5B6AC62F02000078001DBF2B@prv1-mh.provo.novell.com>
 <211629bf48134e848f3ea97b1fe5156b@AMSPEX02CL03.citrite.net>
 <5B6AC93D02000078001DBF4F@prv1-mh.provo.novell.com>
 <d110b5c9-50b6-a16a-79e3-5d8b76ed34a4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wdim=kx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fnM7g-0007Le-BS
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 10:55:24 +0000
In-Reply-To: <d110b5c9-50b6-a16a-79e3-5d8b76ed34a4@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA4LjE4IGF0IDEyOjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDgvMDgvMTggMTE6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwOC4w
OC4xOCBhdCAxMjozOCwgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4+PiBGcm9t
OiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+Pj4+IFNlbnQ6IDA4IEF1
Z3VzdCAyMDE4IDExOjMwCj4+Pj4KPj4+Pj4+PiBPbiAwOC4wOC4xOCBhdCAxMTowMCwgPHBhdWwu
ZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4+Pj4gK2ludCBnbnR0YWJfZ2V0X3NoYXJlZF9m
cmFtZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGlkeCwKPj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtZm5fdCAqbWZuKQo+Pj4+PiArewo+Pj4+PiArICAgIHN0cnVj
dCBncmFudF90YWJsZSAqZ3QgPSBkLT5ncmFudF90YWJsZTsKPj4+Pj4gKyAgICBpbnQgcmM7Cj4+
Pj4+ICsKPj4+Pj4gKyAgICBncmFudF93cml0ZV9sb2NrKGd0KTsKPj4+Pj4gKwo+Pj4+PiArICAg
IGlmICggZ3QtPmd0X3ZlcnNpb24gPT0gMCApCj4+Pj4+ICsgICAgICAgIGd0LT5ndF92ZXJzaW9u
ID0gMTsKPj4+PiBTaW5jZSB5b3UndmUgbW92ZWQgdGhpcyBoZXJlIGluc3RlYWQgb2YgZHJvcHBp
bmcgaXQsIHdoYXQgcmVxdWlyZW1lbnQKPj4+PiBoYXZlIHlvdSBmb3VuZCBmb3IgdGhpcyB0byBi
ZSBzZXQgKG90aGVyIHRoYW4gdGhlIEFTU0VSVCgpIHlvdSBwdXQgaW4KPj4+PiBnbnR0YWJfZ2V0
X3NoYXJlZF9mcmFtZV9tZm4oKT8KPj4+Pgo+Pj4gVGhlIGNvZGUgaW4gcGF0Y2ggIzIgaXMgZXhl
Y3V0ZWQgYmVmb3JlIHRoZSBncmFudCB0YWJsZSB2ZXJzaW9uIGlzIHNldC4gSSAKPj4+IGNvdWxk
IGFsdGVybmF0aXZlbHkgaGF2ZSBsaWJ4bCBleHBsaWNpdGx5IHNldCB0aGUgdmVyc2lvbiB0byAx
IGJlZm9yZSB0cnlpbmcgCj4+PiB0byBzZWVkIHRoZSB0YWJsZS4KPj4gQnV0IHRoYXQncyBub3Qg
bXkgcG9pbnQuIFdoYXQncyB3cm9uZyB3aXRoIGxlYXZpbmcgaXQgYXQgemVybz8KPiAKPiBPbiBh
IHRhbmdlbnQsIHdoeSBkb2VzIGEgZ250dGFiIHZlcnNpb24gb2YgMCBleGlzdCBhdCBhbGw/ICBX
aHkgZG9uJ3Qgd2UKPiBleHBsaWNpdGx5IGluaXRpYWxpc2UgaXQgdG8gMSBpbiB0aGUgaHlwZXJ2
aXNvcj8KCkZhaXIgcXVlc3Rpb24sIHdoaWNoIHVuZm9ydHVuYXRlbHkgSSBjYW4ndCBhbnN3ZXIu
Cgo+IFdlJ3ZlIGhhZCBwbGVudHkgb2YgWFNBcyB0byBkbyB3aXRoIG1pc2hhbmRsaW5nIG9mIGEg
Z250dGFiIHZlcnNpb24gb2YKPiAwLiAgV2h5IG5vdCBmaXggdGhlIHByb2JsZW0gYXQgaXRzIHNv
dXJjZSwgYW5kIHNpbXBsaWZ5IHRoZSBnbnR0YWIgY29kZQo+IHdoaWxlIHdlIGFyZSBhdCBpdC4K
CkkgZG9uJ3QgbWluZCwgdW5sZXNzIGEgcmVhc29uIGZvciB0aGUgc2VlbWluZ2x5IHN0cmFuZ2Ug
YmVoYXZpb3IgY2FuIGJlCmZvdW5kLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
