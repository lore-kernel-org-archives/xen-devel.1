From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 10/13] x86: add iommu_op to enable
 modification of IOMMU mappings
Date: Fri, 20 Jul 2018 10:30:21 +0100
Message-ID: <20180720093021.wjwh3vc6qmpqiuom@citrix.com>
References: <20180717133816.37958-1-paul.durrant@citrix.com>
 <20180717133816.37958-11-paul.durrant@citrix.com>
 <20180720085924.knz5d4rytylytt5j@citrix.com>
 <98b59bedc72f49c3ac5c43966e15412d@AMSPEX02CL03.citrite.net>
 <9693246090d5443b9a5ce8e0d7d7277f@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5nua=ke=citrix.com=prvs=732c52347=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fgRk0-00068b-Nq
 for xen-devel@lists.xenproject.org; Fri, 20 Jul 2018 09:30:24 +0000
Content-Disposition: inline
In-Reply-To: <9693246090d5443b9a5ce8e0d7d7277f@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMjAsIDIwMTggYXQgMTA6MTk6NDRBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gPgo+ID4gPiBJIHRoaW5rIHRoaXMgZmxhZyBjdXJyZW50bHkgc2VydmVzIHR3byBw
dXJwb3Nlczogb25lIGlzIHRvIGluZGljYXRlCj4gPiA+IHdoZXRoZXIgdGhlcmUgYXJlIHJlc291
cmNlcyBhbGxvY2F0ZWQgd2l0aGluIHhlbiwgdGhlIG90aGVyIGl0IGluZGljYXRlCj4gPiA+IHdo
ZXRoZXIgaXQgaXMgaW4gdXNlIChhcyBzdWdnZXN0ZWQgaW4gdGhlIGNvbW1lbnQpLgo+ID4gPgo+
ID4gPiBTdXBwb3NlIGEgZG9tYWluIGdldHMgYWxsIGl0cyBkZXZpY2VzIGRlYXNzaWduZWQgYWZ0
ZXIgdGhpcyBjYWxsLAo+ID4gPiBvcmlnaW5hbCBpb21tdV90ZWFyZG93biB3b3VsZCBoYXZlIGJl
ZW4gY2FsbGVkLCBidXQgbm93IGl0IHdvbid0LiBUaGUKPiA+ID4gaW9tbXUgd2lsbCBzdGlsbCBi
ZSB0b3JuIGRvd24gd2hlbiBpdCBpcyBkZXN0cm95ZWQsIGJ1dCB0aGlzIGlzIGEgdmVyeQo+ID4g
PiBzdWJ0bGUgY2hhbmdlIGluIGJlaGF2aW91ci4KPiA+IAo+ID4gVGhhdCBpcyBwcmV0dHkgc3Vi
dGxlLgo+IAo+IEFjdHVhbGx5LCB0aGlua2luZyBhIGJpdCBtb3JlLCB0aGF0IGlzIHRoZSBzZW1h
bnRpYyBJIHdhbnQuIFRoZSBkb21haW4KPiBpcyB0YWtpbmcgY29udHJvbCBvZiBpdHMgb3duIG1h
cHBpbmdzLiBJdCBkb2Vzbid0IHdhbnQgWGVuIHRvIHRlYXIKPiB0aGVtIGRvd24gdW5kZXIgaXRz
IGZlZXQuCgpPaCwgdGhpcyBtYWtlcyBzZW5zZS4KCj4gCj4gPiAKPiA+ID4KPiA+ID4gSU1ITyB3
ZSBzaG91bGQgY2xlYXJseSBzZXBhcmF0ZSB0aGVzZSB0d28gY2FzZXMgaWYgcG9zc2libGUuCj4g
PiA+Cj4gPiAKPiA+IEFncmVlZC4gSSBuZXZlciBsaWtlZCB0aGUgJ25lZWRfaW9tbXUnIG5hbWUg
YW55d2F5LiBJJ2xsIGFkZCBhIHBhdGNoIGJlZm9yZQo+ID4gdGhpcyBvbmUgdG8gZG8gdGhlIHJl
bmFtZS9zcGxpdC4KPiA+IAo+IAo+IEkgc3RpbGwgdGhpbmsgdGhpcyByZW5hbWluZy9jbGFyaWZp
Y2F0aW9uIGlzIHdvcnRod2hpbGUgc28gSSdsbCBzdGlsbAo+IGFkZCBzb21ldGhpbmcgaW50byB0
aGUgc2VyaWVzLgo+IAoKVGhhbmtzLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
