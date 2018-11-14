From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Wed, 14 Nov 2018 15:08:55 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811141508430.302@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com>
 <alpine.DEB.2.10.1811121738570.8259@sstabellini-ThinkPad-X260>
 <34830ab6-53dc-52c5-680d-a654d4b1ce4f@arm.com>
 <alpine.DEB.2.10.1811131108330.8259@sstabellini-ThinkPad-X260>
 <0e30f5ef-59cf-57c1-40e5-5d8cb0dd862e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ukuj=nz=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gN4HL-0005Q7-LH
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 23:08:59 +0000
In-Reply-To: <0e30f5ef-59cf-57c1-40e5-5d8cb0dd862e@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Xen Devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxNCBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEzLzExLzIwMTgg
MjA6MzksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFR1ZSwgMTMgTm92IDIwMTgs
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+IAo+ID4gSWYgd2UgbWFyayB0aGUgZG9tVSBzaW1wbHkg
YXMgInBhdXNlZCIgaXQgd2lsbCBiZSBkaWZmaWN1bHQgdG8gaW1wbGVtZW50Cj4gPiBjb3JyZWN0
bHkgInhsIHJlc3RvcmUiIC8gInhsIHRyaWdnZXIgczNyZXN1bWUiLiBXZSBzaG91bGQgYmUgYWJs
ZSB0bwo+ID4gZGlzdGluZ3Vpc2ggYSBkb21haW4gd2hpY2ggaXMgc2ltcGx5IG5vdCBydW5uaW5n
IG9yIHBhdXNlZCAoYXMgaW4gInhsCj4gPiBwYXVzZSIpIGZyb20gb25lIHRoYXQgaGFzIGJlZW4g
cHV0IHRvIHNsZWVwLiAgT3RoZXJ3aXNlIHdlIHdvbid0IGJlIGFibGUKPiA+IHRvIHVzZSAieGwg
cGF1c2UiIGluIGl0cyBvcmlnaW5hbCBzZW5zZSBhbnltb3JlLiAieGwgcGF1c2UiIHdpbGwgYmVj
b21lCj4gPiBlZmZlY3RpdmVseSAieGwgdHJpZ2dlciBzbGVlcCIgb24gQVJNLiBXaGljaCBpcyBz
b21ldGhpbmcgdG8gY29uc2lkZXIKPiA+IGJ1dCBJIGRvbid0IHRoaW5rIHRoYXQgaXMgd2hhdCB3
ZSB3YW50Lgo+IAo+IEkgZGlkbid0IHN1Z2dlc3RlZCB0byBvbmx5IHVzZSB0aG9zZSAyIGhlbHBl
cnMuIEJ1dCB5b3UgY2FuIGJ1aWxkCj4gc3VzcGVuZC9yZXN1bWUgb24gdG9wIG9mIGl0LiBBRkFJ
Q1QsIHRoaXMgaXMgaG93IHMzIHN1c3BlbmQvcmVzdW1lIHdvcmtzIG9uCj4geDg2IEhWTS4KClNv
dW5kcyBsaWtlIHdlIGFyZSBzYXlpbmcgdGhlIHNhbWUgdGhpbmcuCgoKPiA+IFRoZSBtb3N0IHNp
bWlsYXIgZmVhdHVyZSBpcyBBQ1BJIFMzIGluIHg4Ni1sYW5kIGJ1dCB0aGUgY3VycmVudCBjYWxs
cwo+ID4gYXJlIHNvIEFDUEkveDg2IHNwZWNpZmljIHRoYXQgZG9uJ3QgbWFrZSBtdWNoIHNlbnNl
IG9uIGEgQUNQSS1sZXNzIEFSTQo+ID4gaW1wbGVtZW50YXRpb24uIElmIEkgYW0gbm90IG1pc3Rh
a2VuLCBvbiB4ODYgdGhlcmUgaXMgYSBzcGVjaWFsIHN0cnVjdAo+ID4gZG9tYWluIGZsYWcgZm9y
IHRoaXM6IGQtPmFyY2guaHZtLmlzX3MzX3N1c3BlbmRlZC4KPiA+IAo+ID4gCj4gPiBMZXQncyBs
ZWF2ZSBhc2lkZSB0aGUgIndoaWNoIGNvbW1hbmRzIHNob3VsZCB3ZSB1c2UiIGRpc2N1c3Npb24g
Zm9yIG5vdwo+ID4gYmVjYXVzZSBpdCBkb2Vzbid0IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCBzZXJp
ZXMuIEl0IHNlZW1zIHRvIG1lIHRoYXQgdGhlCj4gPiBiZXN0IG9wdGlvbiBpcyB0byBpbnRyb2R1
Y2UgYSBuZXcgQVJNIHNwZWNpZmljIHN0cnVjdCBkb21haW4gZmxhZywKPiA+IHNvbWV0aGluZyBh
a2luIHRvIGQtPmFyY2guaHZtLmlzX3MzX3N1c3BlbmRlZCBidXQgQVJNIFBTQ0kgc3BlY2lmaWMu
Cj4gCj4gU2VlIGFib3ZlLgo+IAo+IC0tIAo+IEp1bGllbiBHcmFsbAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
