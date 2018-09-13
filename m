From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v6 13/14] x86: add iommu_ops to modify and
 flush IOMMU mappings
Date: Thu, 13 Sep 2018 06:41:25 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191301AF0@SHSMSX101.ccr.corp.intel.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-14-paul.durrant@citrix.com>
 <5B98BA5D02000078001E7923@prv1-mh.provo.novell.com>
 <e67cdfb0ab264efba6a63e17cc9b80e5@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0io5=l3=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1g0LKJ-0004Tj-Ag
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 06:42:07 +0000
In-Reply-To: <e67cdfb0ab264efba6a63e17cc9b80e5@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQNCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTIsIDIw
MTggNDowMiBQTQ0KPiANCj4gDQo+ID4gSW4gb3JkZXIgdG8gYXZvaWQgc2hvb3RpbmcgZG93biBh
bGwgcHJlLWV4aXN0aW5nIFJBTSBtYXBwaW5ncyAtIGlzDQo+ID4gdGhlcmUgbm8gd2F5IHRoZSBw
YWdlIHRhYmxlIGVudHJpZXMgY291bGQgYmUgbWFya2VkIHRvIGlkZW50aWZ5DQo+ID4gdGhlaXIg
b3JpZ2luPw0KPiA+DQo+IA0KPiBJIGRvbid0IGtub3cgd2hldGhlciB0aGF0IGlzIHBvc3NpYmxl
OyBJJ2xsIGhhdmUgdG8gZmluZCBzcGVjcyBmb3IgSW50ZWwgYW5kDQo+IEFNRCBJT01NVXMgYW5k
IHNlZSBpZiB0aGV5IGhhdmUgUFRFIGJpdHMgYXZhaWxhYmxlIGZvciBzdWNoIGEgdXNlLg0KDQp0
aGVyZSBhcmUgaWdub3JlZCBiaXRzDQoNCj4gDQo+ID4gSSBhbHNvIGhhdmUgYW5vdGhlciBtb3Jl
IGdlbmVyYWwgY29uY2VybjogQWxsb3dpbmcgdGhlIGd1ZXN0IHRvDQo+ID4gbWFuaXB1bGF0ZSBp
dHMgSU9NTVUgcGFnZSB0YWJsZXMgbWVhbnMgdGhhdCBpdCBjYW4gZGVsaWJlcmF0ZWx5DQo+ID4g
c2hhdHRlciBsYXJnZSBwYWdlcywgZ3Jvd2luZyB0aGUgb3ZlcmFsbCBtZW1vcnkgZm9vdHByaW50
IG9mIHRoZQ0KPiA+IGRvbWFpbi4gSSdtIGhlc2l0YW50IHRvIHNheSB0aGlzLCBidXQgSSdtIGFm
cmFpZCB0aGF0IHJlc291cmNlDQo+ID4gdHJhY2tpbmcgb2Ygc3VjaCAiYmVoaW5kIHRoZSBzY2Vu
ZXMiIGFsbG9jYXRpb25zIG1pZ2h0IGJlIGENCj4gPiBuZWNlc3NhcnkgcHJlcmVxIGZvciB0aGUg
UFYgSU9NTVUgd29yay4NCj4gPg0KPiANCj4gUmVtZW1iZXIgdGhhdCBQVi1JT01NVSBpcyBvbmx5
IGF2YWlsYWJsZSBmb3IgZG9tMCBhcyBpdCBzdGFuZHMgKGFuZCB0aGF0DQo+IGlzIHRoZSBvbmx5
IHVzZS1jYXNlIHRoYXQgWGVuU2VydmVyIGN1cnJlbnRseSBoYXMpIHNvIEkgdGhpbmsgdGhhdCwg
d2hpbHN0IHRoZQ0KPiBjb25jZXJuIGlzIHZhbGlkLCB0aGVyZSBpcyBubyBuZWVkIGRhbmdlciBp
biBwdXR0aW5nIHRoZSBjb2RlIHdpdGhvdXQgc3VjaA0KPiB0cmFja2luZy4gU3VjaCB3b3JrIGNh
biBiZSBkZWZlcnJlZCB0byBtYWtpbmcgUFYtSU9NTVUgZm9yIGRlLXByaXZpbGVnZWQNCj4gZ3Vl
c3RzLi4uIGlmIHRoYXQgZmFjaWxpdHkgaXMgbmVlZGVkLg0KPiANCg0KSSBkaWRuJ3QgZ2V0IHdo
eSB0aGlzIGlzIFBWLUlPTU1VIHNwZWNpZmljLiBHdWVzdCBjYW4gYWx3YXlzIG1hbmlwdWxhdGUN
Cmd1ZXN0IENQVSBwYWdlIHRhYmxlIHRvIHNoYXR0ZXIgbGFyZ2UgcGFnZXMgdG9vLi4uDQoNClRo
YW5rcw0KS2V2aW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
