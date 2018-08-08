From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v21 1/2] common: add a new mappable resource
 type: XENMEM_resource_grant_table
Date: Wed, 8 Aug 2018 12:34:06 +0100
Message-ID: <eb22ed3f-e65b-5c35-857d-b1017143a359@citrix.com>
References: <20180808090032.2713-1-paul.durrant@citrix.com>
 <20180808090032.2713-2-paul.durrant@citrix.com>
 <5B6AC62F02000078001DBF2B@prv1-mh.provo.novell.com>
 <211629bf48134e848f3ea97b1fe5156b@AMSPEX02CL03.citrite.net>
 <5B6AC93D02000078001DBF4F@prv1-mh.provo.novell.com>
 <d110b5c9-50b6-a16a-79e3-5d8b76ed34a4@citrix.com>
 <5B6ACC1802000078001DBF88@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rtkw=kx=citrix.com=prvs=751d397f3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fnMjC-00023C-6y
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 11:34:10 +0000
In-Reply-To: <5B6ACC1802000078001DBF88@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDgvMTggMTE6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA4LjA4LjE4IGF0
IDEyOjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDA4LzA4LzE4
IDExOjQzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA4LjA4LjE4IGF0IDEyOjM4LCA8
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+PiBGcm9tOiBKYW4gQmV1bGljaCBb
bWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+Pj4+PiBTZW50OiAwOCBBdWd1c3QgMjAxOCAxMToz
MAo+Pj4+Pgo+Pj4+Pj4+PiBPbiAwOC4wOC4xOCBhdCAxMTowMCwgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPiB3cm90ZToKPj4+Pj4+ICtpbnQgZ250dGFiX2dldF9zaGFyZWRfZnJhbWUoc3RydWN0
IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBpZHgsCj4+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG1mbl90ICptZm4pCj4+Pj4+PiArewo+Pj4+Pj4gKyAgICBzdHJ1Y3QgZ3JhbnRf
dGFibGUgKmd0ID0gZC0+Z3JhbnRfdGFibGU7Cj4+Pj4+PiArICAgIGludCByYzsKPj4+Pj4+ICsK
Pj4+Pj4+ICsgICAgZ3JhbnRfd3JpdGVfbG9jayhndCk7Cj4+Pj4+PiArCj4+Pj4+PiArICAgIGlm
ICggZ3QtPmd0X3ZlcnNpb24gPT0gMCApCj4+Pj4+PiArICAgICAgICBndC0+Z3RfdmVyc2lvbiA9
IDE7Cj4+Pj4+IFNpbmNlIHlvdSd2ZSBtb3ZlZCB0aGlzIGhlcmUgaW5zdGVhZCBvZiBkcm9wcGlu
ZyBpdCwgd2hhdCByZXF1aXJlbWVudAo+Pj4+PiBoYXZlIHlvdSBmb3VuZCBmb3IgdGhpcyB0byBi
ZSBzZXQgKG90aGVyIHRoYW4gdGhlIEFTU0VSVCgpIHlvdSBwdXQgaW4KPj4+Pj4gZ250dGFiX2dl
dF9zaGFyZWRfZnJhbWVfbWZuKCk/Cj4+Pj4+Cj4+Pj4gVGhlIGNvZGUgaW4gcGF0Y2ggIzIgaXMg
ZXhlY3V0ZWQgYmVmb3JlIHRoZSBncmFudCB0YWJsZSB2ZXJzaW9uIGlzIHNldC4gSSAKPj4+PiBj
b3VsZCBhbHRlcm5hdGl2ZWx5IGhhdmUgbGlieGwgZXhwbGljaXRseSBzZXQgdGhlIHZlcnNpb24g
dG8gMSBiZWZvcmUgdHJ5aW5nIAo+Pj4+IHRvIHNlZWQgdGhlIHRhYmxlLgo+Pj4gQnV0IHRoYXQn
cyBub3QgbXkgcG9pbnQuIFdoYXQncyB3cm9uZyB3aXRoIGxlYXZpbmcgaXQgYXQgemVybz8KPj4g
T24gYSB0YW5nZW50LCB3aHkgZG9lcyBhIGdudHRhYiB2ZXJzaW9uIG9mIDAgZXhpc3QgYXQgYWxs
PyAgV2h5IGRvbid0IHdlCj4+IGV4cGxpY2l0bHkgaW5pdGlhbGlzZSBpdCB0byAxIGluIHRoZSBo
eXBlcnZpc29yPwo+IEZhaXIgcXVlc3Rpb24sIHdoaWNoIHVuZm9ydHVuYXRlbHkgSSBjYW4ndCBh
bnN3ZXIuCj4KPj4gV2UndmUgaGFkIHBsZW50eSBvZiBYU0FzIHRvIGRvIHdpdGggbWlzaGFuZGxp
bmcgb2YgYSBnbnR0YWIgdmVyc2lvbiBvZgo+PiAwLiAgV2h5IG5vdCBmaXggdGhlIHByb2JsZW0g
YXQgaXRzIHNvdXJjZSwgYW5kIHNpbXBsaWZ5IHRoZSBnbnR0YWIgY29kZQo+PiB3aGlsZSB3ZSBh
cmUgYXQgaXQuCj4gSSBkb24ndCBtaW5kLCB1bmxlc3MgYSByZWFzb24gZm9yIHRoZSBzZWVtaW5n
bHkgc3RyYW5nZSBiZWhhdmlvciBjYW4gYmUKPiBmb3VuZC4KCmd0X3ZlcnNpb24gb25seSBjYW1l
IGluIHdpdGggZ3JhbnQgdGFibGUgdjIsIHNvIHRoZSB0b29sc3RhY2sgbmV2ZXIKcHJldmlvdXNs
eSBzZXQgYSB2ZXJzaW9uLsKgIFRoYXQgZW5kZWQgdXAgd2l0aCBjYXNlcyB3aGVyZSBkb20wIHRy
aWVzIHRvCm1hcCB0aGUgc3RvcmUvY29ucyBncmFudHMgYmVmb3JlIHRoZSBndWVzdCBkcml2ZXIg
aGFzIGNob3NlbiBhIHZlcnNpb24uCgpJIGV4cGVjdCBpdHMgbGlrZSB0aGlzIGJlY2F1c2UgZ3Jh
bnQgdGFibGUgdjIgd2FzIGEgZ2lhbnQgcGlsZSBvZiBwb29ybHkKcmV2aWV3ZWQgaGFja3MsIHJh
dGhlciB0aGFuIGZvciBhbnkgYmV0dGVyIHJlYXNvbi4KCklmIG5vb25lIGVsc2UgZ2V0cyB0byBp
dCwgSSdsbCBmb2xkIGl0IGludG8gbXkgc2VyaWVzIHRvIG1lc3MgdGhvcm91Z2hseQp3aXRoIHBh
cmFtZXRlciBoYW5kbGluZyBpbiBET01DVExfY3JlYXRlZG9tYWluLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
