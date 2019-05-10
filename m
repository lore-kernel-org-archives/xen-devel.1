From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 14/14] xen/mm: Provide dummy M2P-related
 helpers when !CONFIG_HAVE_M2P
Date: Fri, 10 May 2019 07:37:28 -0600
Message-ID: <5CD57E98020000780022D914@prv1-mh.provo.novell.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-15-julien.grall@arm.com>
 <5CD57C6F020000780022D8BC@prv1-mh.provo.novell.com>
 <8e10cc12-d9be-3891-fae9-501ab9a69019@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP5iM-00052U-TP
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:37:30 +0000
In-Reply-To: <8e10cc12-d9be-3891-fae9-501ab9a69019@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA1LjE5IGF0IDE1OjI5LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEwLzA1LzIwMTkgMTQ6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNy4wNS4x
OSBhdCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IC0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9tbS5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+Pj4gQEAgLTY1
OCw0ICs2NTgsMTggQEAgc3RhdGljIGlubGluZSB2b2lkIHNoYXJlX3hlbl9wYWdlX3dpdGhfcHJp
dmlsZWdlZF9ndWVzdHMoCj4+PiAgICAgICBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KHBhZ2Us
IGRvbV94ZW4sIGZsYWdzKTsKPj4+ICAgfQo+Pj4gICAKPj4+ICsvKgo+Pj4gKyAqIER1bW15IGlt
cGxlbWVudGF0aW9uIG9mIE0yUC1yZWxhdGVkIGhlbHBlcnMgZm9yIGNvbW1vbiBjb2RlIHdoZW4K
Pj4+ICsgKiB0aGUgYXJjaGl0ZWN0dXJlIGRvZXNuJ3QgaGF2ZSBhbiBNMlAuCj4+PiArICovCj4+
PiArI2lmbmRlZiBDT05GSUdfSEFTX00yUAo+Pj4gKwo+Pj4gKyNkZWZpbmUgSU5WQUxJRF9NMlBf
RU5UUlkgICAgICAgICh+MFVMKQo+Pj4gKyNkZWZpbmUgU0hBUkVEX00yUF9FTlRSWSAgICAgICAg
ICh+MFVMIC0gMVVMKQo+Pj4gKyNkZWZpbmUgU0hBUkVEX00yUChfZSkgICAgICAgICAgICgoX2Up
ID09IFNIQVJFRF9NMlBfRU5UUlkpCj4+PiArCj4+PiArc3RhdGljIGlubGluZSB2b2lkIHNldF9w
Zm5fZnJvbV9tZm4obWZuX3QgbWZuLCB1bnNpZ25lZCBsb25nIHBmbikge30KPj4+ICsKPj4+ICsj
ZW5kaWYKPj4gCj4+IEluIG9yZGVyIGZvciB0aGluZ3MgdG8gbm90IGJlIHNjYXR0ZXJlZCBhcm91
bmQsIGNvdWxkCj4+IGRvbWFpbl9zaGFyZWRfaW5mb19nZm4oKSAoc2VlIHBhdGNoIDkpIG1vdmUg
aGVyZT8gSXQgZG9lc24ndAo+PiBsb29rIGFzIGlmIHRoaXMgd291bGQgY2F1c2UgYSBidWlsZCBp
c3N1ZS4KPiAKPiBUaGUgdHdvIGFyZSBkaWZmZXJlbnQsIG9uZSBkZWFsIHdpdGggbWVtb3J5LCB0
aGUgb3RoZXIgd2l0aCBhIGRvbWFpbi4gU28gdGhlIAo+IGN1cnJlbnQgc3BsaXQgbWFrZXMgc2Vu
c2UuCgpXZWxsLCB0aGF0J3Mgb25lIHBlcnNwZWN0aXZlIHRvIHRha2UuIFRoZSBvdGhlciBpcyB0
aGF0IGl0J3MgbW0gdG8gb2J0YWluCmEgc3BlY2lmaWMgb3RoZXIgZm9ybSBvZiBhIGdpdmVuIGFk
ZHJlc3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
