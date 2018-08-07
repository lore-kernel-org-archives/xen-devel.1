From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 05/15] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Tue, 07 Aug 2018 02:23:30 -0600
Message-ID: <5B69570202000078001DB5F5@prv1-mh.provo.novell.com>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-6-paul.durrant@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AC0E6@SHSMSX101.ccr.corp.intel.com>
 <5d82e1ed61b8476182ae5ea352fa38b3@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fmxHE-0001Z8-CM
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 08:23:36 +0000
In-Reply-To: <5d82e1ed61b8476182ae5ea352fa38b3@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, Kevin Tian <kevin.tian@intel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, IanJackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDEwOjA1LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBUaWFuLCBLZXZpbiBbbWFpbHRvOmtldmluLnRpYW5AaW50ZWwuY29tXQo+PiBT
ZW50OiAwNyBBdWd1c3QgMjAxOCAwMzo1Ngo+PiA+IEZyb206IFBhdWwgRHVycmFudCBbbWFpbHRv
OnBhdWwuZHVycmFudEBjaXRyaXguY29tXQo+PiA+IFNlbnQ6IFNhdHVyZGF5LCBBdWd1c3QgNCwg
MjAxOCAxOjIyIEFNCj4+ID4gICAgICBpZiAoIG5lZWRfaW9tbXUocDJtLT5kb21haW4pICYmCj4+
ID4gICAgICAgICAgIChscGFlX3ZhbGlkKG9yaWdfcHRlKSB8fCBscGFlX3ZhbGlkKCplbnRyeSkp
ICkKPj4gPiArICAgIHsKPj4gPiAgICAgICAgICByYyA9IGlvbW11X2lvdGxiX2ZsdXNoKHAybS0+
ZG9tYWluLCBfYmZuKGdmbl94KHNnZm4pKSwKPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDFVTCA8PCBwYWdlX29yZGVyKTsKPj4gPiArICAgICAgICBpZiAoIHVubGlrZWx5KHJj
KSAmJiAhaXNfaGFyZHdhcmVfZG9tYWluKHAybS0+ZG9tYWluKSApCj4+ID4gKyAgICAgICAgICAg
IGRvbWFpbl9jcmFzaChwMm0tPmRvbWFpbik7Cj4+ID4gKyAgICB9Cj4+IAo+PiB0byByZWR1Y2Ug
ZHVwbGljYXRpb24sIGRvZXMgaXQgbWFrZSBzZW5zZSB0byBpbnRyb2R1Y2UgYSB3cmFwcGVyCj4+
IGxpa2UgZG9tYWluX2NyYXNoX25kICgnbmQnIGluZGljYXRlICFpc19oYXJkd2FyZV9kb21haW4s
IGFuZAo+PiBiZWNvbWVzIGEgbm9wIGZvciBoYXJkd2FyZSBkb21haW4pPyBUaGVuIGl0IGJlY29t
ZXM6Cj4+IAo+PiAJaWYgKCB1bmxpa2VseShyYykgKQo+PiAJCWRvbWFpbl9jcmFzaF9uZChwMm0t
PmRvbWFpbik7Cj4gCj4gVGhhdCdzIGEgYmlnZ2VyIGNoYW5nZSBhbmQgSSdkIGxpa2UgdG8gZGVm
ZXIgdG8gdGhlIG90aGVyIG1haW50YWluZXJzIGFzIHRvIAo+IHdoZXRoZXIgdGhleSB0aGluayBp
dCBpcyBhIGdvb2QgaWRlYS4gSSdtIGhhcHB5IHRvIGNoYW5nZSB0aGlzIGluIHY2IGlmIAo+IGFu
eW9uZSBnaXZlcyBtZSBhICsxLgoKV2VsbCwgaWYgdGhpcyBpcyBhIGNvbW1vbiBpZGlvbSwgdGhl
biB5ZXMsIEkgdGhpbmsgYSBoZWxwZXIgd291bGQKYmUgZGVzaXJhYmxlLiBIb3dldmVyIC0gd2hh
dCBpcyB0aGUgX25kIHN1ZmZpeCBzdXBwb3NlZCB0bwpzdGFuZCBmb3I/IEknbSBpbmNsaW5lZCB0
byBzdWdnZXN0IGRvbXVfY3Jhc2goKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
