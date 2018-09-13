From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 13/14] x86: add iommu_ops to modify and
 flush IOMMU mappings
Date: Thu, 13 Sep 2018 02:49:24 -0600
Message-ID: <5B9A249402000078001E812A@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-14-paul.durrant@citrix.com>
 <5B98BA5D02000078001E7923@prv1-mh.provo.novell.com>
 <e67cdfb0ab264efba6a63e17cc9b80e5@AMSPEX02CL03.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D191301AF0@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jl0+=l3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0NJa-0007EX-T9
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 08:49:30 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D191301AF0@SHSMSX101.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Tian <kevin.tian@intel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDA4OjQxLCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+
PiAgRnJvbTogUGF1bCBEdXJyYW50Cj4+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDEyLCAy
MDE4IDQ6MDIgUE0KPj4gCj4+ID4gSSBhbHNvIGhhdmUgYW5vdGhlciBtb3JlIGdlbmVyYWwgY29u
Y2VybjogQWxsb3dpbmcgdGhlIGd1ZXN0IHRvCj4+ID4gbWFuaXB1bGF0ZSBpdHMgSU9NTVUgcGFn
ZSB0YWJsZXMgbWVhbnMgdGhhdCBpdCBjYW4gZGVsaWJlcmF0ZWx5Cj4+ID4gc2hhdHRlciBsYXJn
ZSBwYWdlcywgZ3Jvd2luZyB0aGUgb3ZlcmFsbCBtZW1vcnkgZm9vdHByaW50IG9mIHRoZQo+PiA+
IGRvbWFpbi4gSSdtIGhlc2l0YW50IHRvIHNheSB0aGlzLCBidXQgSSdtIGFmcmFpZCB0aGF0IHJl
c291cmNlCj4+ID4gdHJhY2tpbmcgb2Ygc3VjaCAiYmVoaW5kIHRoZSBzY2VuZXMiIGFsbG9jYXRp
b25zIG1pZ2h0IGJlIGEKPj4gPiBuZWNlc3NhcnkgcHJlcmVxIGZvciB0aGUgUFYgSU9NTVUgd29y
ay4KPj4gPgo+PiAKPj4gUmVtZW1iZXIgdGhhdCBQVi1JT01NVSBpcyBvbmx5IGF2YWlsYWJsZSBm
b3IgZG9tMCBhcyBpdCBzdGFuZHMgKGFuZCB0aGF0Cj4+IGlzIHRoZSBvbmx5IHVzZS1jYXNlIHRo
YXQgWGVuU2VydmVyIGN1cnJlbnRseSBoYXMpIHNvIEkgdGhpbmsgdGhhdCwgd2hpbHN0IHRoZQo+
PiBjb25jZXJuIGlzIHZhbGlkLCB0aGVyZSBpcyBubyBuZWVkIGRhbmdlciBpbiBwdXR0aW5nIHRo
ZSBjb2RlIHdpdGhvdXQgc3VjaAo+PiB0cmFja2luZy4gU3VjaCB3b3JrIGNhbiBiZSBkZWZlcnJl
ZCB0byBtYWtpbmcgUFYtSU9NTVUgZm9yIGRlLXByaXZpbGVnZWQKPj4gZ3Vlc3RzLi4uIGlmIHRo
YXQgZmFjaWxpdHkgaXMgbmVlZGVkLgo+IAo+IEkgZGlkbid0IGdldCB3aHkgdGhpcyBpcyBQVi1J
T01NVSBzcGVjaWZpYy4gR3Vlc3QgY2FuIGFsd2F5cyBtYW5pcHVsYXRlCj4gZ3Vlc3QgQ1BVIHBh
Z2UgdGFibGUgdG8gc2hhdHRlciBsYXJnZSBwYWdlcyB0b28uLi4KCkhtbSwgZ29vZCBwb2ludC4g
SSBrZWVwIGZvcmdldHRpbmcgdGhhdCB3ZSBhbGxvdyBndWVzdHMgdG8gZmlkZGxlIHdpdGgKdGhl
aXIgb3duIHAybS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
