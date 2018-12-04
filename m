From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 3/4] iommu: elide flushing for higher
 order map/unmap operations
Date: Tue, 04 Dec 2018 10:20:18 -0700
Message-ID: <5C06B7520200007800202D7B@prv1-mh.provo.novell.com>
References: <20181203174017.11956-1-paul.durrant@citrix.com>
 <20181203174017.11956-4-paul.durrant@citrix.com>
 <5C069A650200007800202BFD@prv1-mh.provo.novell.com>
 <0d6a78307bb5438582dd7e8e55a449db@AMSPEX02CL03.citrite.net>
 <5C06A4E60200007800202C98@prv1-mh.provo.novell.com>
 <ad36b7431b004ce89a6de1700a399a75@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uzs+=on=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUEMz-0002Ls-Df
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 17:20:25 +0000
In-Reply-To: <ad36b7431b004ce89a6de1700a399a75@AMSPEX02CL03.citrite.net>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEyLjE4IGF0IDE3OjUzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5w
cm9qZWN0Lm9yZ10gT24gQmVoYWxmCj4+IE9mIEphbiBCZXVsaWNoCj4+IFNlbnQ6IDA0IERlY2Vt
YmVyIDIwMTggMTY6MDIKPj4gCj4+ID4+PiBPbiAwNC4xMi4xOCBhdCAxNjozNiwgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gRnJvbTogSmFuIEJldWxpY2ggW21haWx0bzpK
QmV1bGljaEBzdXNlLmNvbV0KPj4gPj4gU2VudDogMDQgRGVjZW1iZXIgMjAxOCAxNToxNwo+PiA+
Pgo+PiA+PiA+Pj4gT24gMDMuMTIuMTggYXQgMTg6NDAsIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNv
bT4gd3JvdGU6Cj4+ID4+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11
LmMKPj4gPj4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+PiA+
PiA+IEBAIC02MzMsMTEgKzYzMywxNCBAQCBzdGF0aWMgaW50IF9fbXVzdF9jaGVjawo+PiBpb21t
dV9mbHVzaF9pb3RsYihzdHJ1Y3QKPj4gPj4gZG9tYWluICpkLCBkZm5fdCBkZm4sCj4+ID4+ID4K
Pj4gPj4gPiAgc3RhdGljIGludCBfX211c3RfY2hlY2sgaW9tbXVfZmx1c2hfaW90bGJfcGFnZXMo
c3RydWN0IGRvbWFpbiAqZCwKPj4gPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGZuX3QgZGZuLAo+PiA+PiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQKPj4gPj4gcGFnZV9jb3Vu
dCkKPj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50Cj4+ID4+IHBhZ2VfY291bnQsCj4+ID4+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludAo+PiA+PiBmbHVz
aF9mbGFncykKPj4gPj4gPiAgewo+PiA+PiA+ICAgICAgQVNTRVJUKHBhZ2VfY291bnQgJiYgIWRm
bl9lcShkZm4sIElOVkFMSURfREZOKSk7Cj4+ID4+ID4gKyAgICBBU1NFUlQoZmx1c2hfZmxhZ3Mp
Owo+PiA+PiA+Cj4+ID4+ID4gLSAgICByZXR1cm4gaW9tbXVfZmx1c2hfaW90bGIoZCwgZGZuLCAx
LCBwYWdlX2NvdW50KTsKPj4gPj4gPiArICAgIHJldHVybiBpb21tdV9mbHVzaF9pb3RsYihkLCBk
Zm4sIGZsdXNoX2ZsYWdzICYKPj4gPj4gSU9NTVVfRkxVU0hGX21vZGlmaWVkLAo+PiA+PiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2VfY291bnQpOwo+PiA+Pgo+PiA+PiBXaHkg
dGhlIHJlc3RyaWN0aW9uIHRvICJtb2RpZmllZCI/Cj4+ID4KPj4gPiBUaGUgcGFyYW1ldGVyIGlz
IGEgYm9vbCB3aGljaCBzaG91bGQgYmUgdHJ1ZSBpZiBhbiBleGlzdGluZyBQVEUgd2FzCj4+IG1v
ZGlmaWVkCj4+ID4gb3IgZmFsc2Ugb3RoZXJ3aXNlLiBJIGNhbiBtYWtlIHRoaXMgISEoZmx1c2hf
ZmxhZ3MgJgo+PiBJT01NVV9GTFVTSEZfbW9kaWZpZWQpIGlzCj4+ID4geW91IHByZWZlci4KPj4g
Cj4+IE5vLCB0aGF0IHdhc24ndCBteSBwb2ludC4gVGhlIHF1ZXN0aW9uIGlzIHdoeSB0aGlzIGlz
bid0IGp1c3QKPj4gImZsdXNoX2ZsYWdzIiwgd2l0aG91dCBhbnkgbWFza2luZy4gSWlyYyB0aGVy
ZSBhcmUgcHJlY2F1dGlvbnMKPj4gaW4gdGhlIFZULWQgY29kZSB0byBkZWFsIHdpdGggaGFyZHdh
cmUgd2hpY2ggbWF5IGNhY2hlCj4+IG5vbi1wcmVzZW50IGVudHJpZXMuIEluIHRoYXQgY2FzZSAi
YWRkZWQiIHJlcXVpcmVzIGZsdXNoaW5nIHRvby4KPj4gCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5k
LiBpb21tdV9mbHVzaF9pb3RsYigpJ3MgdGhpcmQgYXJndW1lbnQgaXMgCj4gJ2RtYV9vbGRfcHRl
X3ByZXNlbnQnIHNvIHRoYXQgc2hvdWxkIGJlIHRydWUgaWZmIElPTU1VX0ZMVVNIRl9tb2RpZmll
ZCBpcyAKPiBzZXQuIElPTU1VX0ZMVVNIRl9hZGRlZCBpcyBpcnJlbGV2YW50IHRvIHRoZSBpbXBs
ZW1lbnRhdGlvbi4KCk9oLCB5b3UncmUgcmlnaHQuIEknbSBzb3JyeSBmb3IgdGhlIG5vaXNlIHRo
ZW4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
