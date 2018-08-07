From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 09/15] vtd: add lookup_page method to
 iommu_ops
Date: Tue, 07 Aug 2018 02:29:50 -0600
Message-ID: <5B69587E02000078001DB62F@prv1-mh.provo.novell.com>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-10-paul.durrant@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AC1B1@SHSMSX101.ccr.corp.intel.com>
 <0a4bee6dd58242f39e71c8e9bf2f89e0@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fmxNM-0002Ku-NG
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 08:29:56 +0000
In-Reply-To: <0a4bee6dd58242f39e71c8e9bf2f89e0@AMSPEX02CL03.citrite.net>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDEwOjIxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBUaWFuLCBLZXZpbiBbbWFpbHRvOmtldmluLnRpYW5AaW50ZWwuY29tXQo+PiBT
ZW50OiAwNyBBdWd1c3QgMjAxOCAwNDoyNQo+PiAKPj4gPiBGcm9tOiBQYXVsIER1cnJhbnQgW21h
aWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0KPj4gPiBTZW50OiBTYXR1cmRheSwgQXVndXN0
IDQsIDIwMTggMToyMiBBTQo+PiA+Cj4+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
dnRkL2lvbW11LmMKPj4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUu
Ywo+PiA+IEBAIC0xODMwLDYgKzE4MzAsMzkgQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sKPj4g
PiBpbnRlbF9pb21tdV91bm1hcF9wYWdlKHN0cnVjdCBkb21haW4gKmQsCj4+ID4gICAgICByZXR1
cm4gZG1hX3B0ZV9jbGVhcl9vbmUoZCwgYmZuX3RvX2JhZGRyKGJmbikpOwo+PiA+ICB9Cj4+ID4K
Pj4gPiArc3RhdGljIGludCBpbnRlbF9pb21tdV9sb29rdXBfcGFnZShzdHJ1Y3QgZG9tYWluICpk
LCBiZm5fdCBiZm4sIG1mbl90Cj4+ID4gKm1mbiwKPj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmZsYWdzKQo+PiAKPj4gTm90IGxvb2tpbmcgYXQg
bGF0ZXIgcGF0Y2hlcyB5ZXQuLi4gYnV0IGluIGNvbmNlcHQgYmZuIGFkZHJlc3MKPj4gc3BhY2Ug
aXMgcGVyIGRldmljZSBpbnN0ZWFkIG9mIHBlciBkb21haW4uCj4gCj4gTm90IGluIHRoaXMgY2Fz
ZS4gWGVuIGhhcyBhbHdheXMgbWFpbnRhaW5lZCBhIHNpbmdsZSBJT01NVSBhZGRyZXNzIHBlciAK
PiB2aXJ0dWFsIG1hY2hpbmUuIFRoYXQgaXMgd2hhdCBCRk4gcmVmZXJzIHRvLgoKTnV0IGlzIHRo
YXQgYSBtb2RlbCB3ZSBjYW4gbWFpbnRhaW4gbWlkIGFuZCBsb25nIHRlcm0/IEluIHBhcnRpY3Vs
YXIKb24gQVJNLCB3aGVyZSBKdWxpZW4gaGFzIHRvbGQgbWUgYSBzaW5nbGUgc3lzdGVtIGNvdWxk
IGhhdmUgbXVsdGlwbGUKX2RpZmZlcmVudF8gSU9NTVVzLCBJIGNvdWxkIGVhc2lseSBzZWUgdGhl
IGFkZHJlc3Mgc3BhY2VzIGRpdmVyZ2luZy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
