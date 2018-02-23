From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/7] x86: add iommu_op to query reserved
 ranges
Date: Fri, 23 Feb 2018 02:02:46 -0700
Message-ID: <5A8FE6C602000078001AAC14@prv-mh.provo.novell.com>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-7-paul.durrant@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D191002748@SHSMSX101.ccr.corp.intel.com>
 <aff2fd1e0f2541e1844d99fea1cd6872@AMSPEX02CL03.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19101542D@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwfe=fr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ep9Fo-0004ju-Em
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 09:02:56 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19101542D@SHSMSX101.ccr.corp.intel.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, AndrewCooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAyLjE4IGF0IDA2OjIzLCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+
PiAgRnJvbTogUGF1bCBEdXJyYW50IFttYWlsdG86UGF1bC5EdXJyYW50QGNpdHJpeC5jb21dCj4+
IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDEzLCAyMDE4IDU6MjUgUE0KPj4gPiBGcm9tOiBUaWFu
LCBLZXZpbiBbbWFpbHRvOmtldmluLnRpYW5AaW50ZWwuY29tXQo+PiA+IFNlbnQ6IDEzIEZlYnJ1
YXJ5IDIwMTggMDY6NTIKPj4gPiA+IEZyb206IFBhdWwgRHVycmFudAo+PiA+ID4gU2VudDogTW9u
ZGF5LCBGZWJydWFyeSAxMiwgMjAxOCA2OjQ3IFBNCj4+ID4gPiArICAgIH0KPj4gPiA+ICsKPj4g
PiA+ICsgICAgY3R4dC0+bnJfZW50cmllcysrOwo+PiA+ID4gKwo+PiA+ID4gKyAgICByZXR1cm4g
MTsKPj4gPiA+ICt9Cj4+ID4gPiArCj4+ID4gPiArc3RhdGljIGludCBpb21tdW9wX3F1ZXJ5X3Jl
c2VydmVkKHN0cnVjdAo+PiA+ID4geGVuX2lvbW11X29wX3F1ZXJ5X3Jlc2VydmVkICpvcCkKPj4g
Pgo+PiA+IEkgZGlkbid0IGdldCB3aHkgd2UgY2Fubm90IHJldXNlIGV4aXN0aW5nIFhFTk1FTV9y
ZXNlcnZlZF8KPj4gPiBkZXZpY2VfbWVtb3J5X21hcD8KPj4gPgo+PiAKPj4gVGhpcyBoeXBlcmNh
bGwgaXMgbm90IGludGVuZGVkIHRvIGJlIHRvb2xzLW9ubHkuIFRoYXQgb25lIGlzLCB1bmxlc3Mg
SSBtaXNyZWFkCj4+IHRoZSAjaWZkZWZzLgo+PiAKPiAKPiBJIGRpZG4ndCByZWFsaXplIGl0LiBD
dXJpb3VzIGhvdyBYZW4gZW5mb3JjZXMgc3VjaCB0b29scy1vbmx5IHBvbGljeT8gV2hhdAo+IHdv
dWxkIGhhcHBlbiBpZiBjYWxsaW5nIGl0IGZyb20gRG9tMCBrZXJuZWw/IEkganVzdCBmZWx0IG5v
dCBnb29kIG9mCj4gY3JlYXRpbmcgYSBuZXcgaW50ZXJmYWNlIGp1c3QgZm9yIGR1cGxpY2F0ZWQg
cHVycG9zZS4uLgoKSXQncyBub3QgZW5mb3JjZWQgZm9yIERvbTA7IERvbTAgKGluY2x1ZGluZyBp
dHMga2VybmVsKSBpcyB0cnVzdGVkLgpIb3cgd291bGQgWGVuIGtub3cgd2hldGhlciBhIHJlcXVl
c3QgY2FtZSBmcm9tIHVzZXIgbGFuZAoodGhyb3VnaCB0aGUgcHJpdmNtZCBkcml2ZXIpIG9yIGRp
cmVjdGx5IGZyb20gc29tZSBrZXJuZWwgY29tcG9uZW50PwoKSmFuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
