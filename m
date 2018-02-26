From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 7/7] x86: add iommu_ops to map and unmap
 pages, and also to flush the IOTLB
Date: Mon, 26 Feb 2018 09:38:44 +0000
Message-ID: <22f534f9457040598eaa906d1ab89526@AMSPEX02CL03.citrite.net>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-8-paul.durrant@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D191002766@SHSMSX101.ccr.corp.intel.com>
 <c09970608c0f440e88055bdfb88cd8dc@AMSPEX02CL03.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D191015466@SHSMSX101.ccr.corp.intel.com>
 <910b9652dd3642b3b65e4fe2f4c45daa@AMSPEX02CL03.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19101851E@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=01ms=fu=citrix.com=prvs=5880d0b03=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1eqFF9-0007HQ-FO
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 09:38:47 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19101851E@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Tian <kevin.tian@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaWFuLCBLZXZpbiBbbWFpbHRv
OmtldmluLnRpYW5AaW50ZWwuY29tXQ0KPiBTZW50OiAyNCBGZWJydWFyeSAyMDE4IDAzOjAyDQo+
IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+OyBXZWkgTGl1DQo+IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgR2VvcmdlIER1
bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsNCj4gQW5kcmV3IENvb3BlciA8QW5kcmV3
LkNvb3BlcjNAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+IDxJYW4uSmFja3NvbkBjaXRyaXgu
Y29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBKYW4gQmV1bGljaA0KPiA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFJFOiBbWGVuLWRldmVsXSBbUEFUQ0ggNy83XSB4ODY6
IGFkZCBpb21tdV9vcHMgdG8gbWFwIGFuZA0KPiB1bm1hcCBwYWdlcywgYW5kIGFsc28gdG8gZmx1
c2ggdGhlIElPVExCDQpbc25pcF0NCj4gDQo+ID4NCj4gPiAuLi5zbyBteSBwbGFuIGlzIHRoYXQg
dGhlIGRvbTAgQVBJIHBpY2tzIGEgYmZuLCBkb2VzIHRoZSBtYXBwaW5nIGFuZCB0aGVuDQo+ID4g
cGFzc2VzIHRoZSBiZm4gYmFjayB0byB0aGUgY2FsbGVyLg0KPiA+DQo+IA0KPiBBIGN1cmlvdXMg
cXVlc3Rpb24uIEhvdyB0byBwYXNzIHRoZSBkb21pZCBmcm9tIFhlbkdUIHRvIHB2SU9NTVUNCj4g
ZHJpdmVyIHNvIHRoZSBsYXR0ZXIga25vd3Mgd2hldGhlciBpdCdzIGEgbG9jYWwgb3IgcmVtb3Rl
IG1hcHBpbmc/DQo+IElkZWFsbHkgcHZJT01NVSBkcml2ZXIgaXMgcmVnaXN0ZXJlZCB0byBMaW51
eCBJT01NVSBjb3JlIGxheWVyLA0KPiBvZiB3aGljaCBhbGwgZXhpc3RpbmcgQVBJIHdyYXBwZXJz
IGFyZSBvbmx5IGZvciBsb2NhbCBtYXBwaW5nIHRvZGF5Li4uDQo+IA0KDQpJdCBtYXkgd2VsbCBi
ZSB0aGF0LCBmb3IgcmVtb3RlIG1hcHBpbmcsIHRoYXQgbGF5ZXIgaXMganVzdCBub3QgYXBwcm9w
cmlhdGUuIEknbGwgbG9vayBpbnRvIHRoYXQgd2hlbiBJIGdldCB0byB0aGF0IHN0YWdlLg0KDQpD
aGVlcnMsDQoNCiAgICBQYXVsDQoNCj4gVGhhbmtzDQo+IEtldmluDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
