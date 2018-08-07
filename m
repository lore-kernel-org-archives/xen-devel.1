From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v5 12/15] x86: add iommu_op to enable
 modification of IOMMU mappings
Date: Tue, 7 Aug 2018 09:19:30 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912AEBA5@SHSMSX101.ccr.corp.intel.com>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-13-paul.durrant@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AC265@SHSMSX101.ccr.corp.intel.com>
 <e8d453fd38d74526b6e07040f5362030@AMSPEX02CL03.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AE9E2@SHSMSX101.ccr.corp.intel.com>
 <ef80132eb1764ed686ad7d6de6444387@AMSPEX02CL03.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AEACC@SHSMSX101.ccr.corp.intel.com>
 <401d6969636b4158966b786ea184d5d2@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tozp=kw=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fmy9P-00088V-UA
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 09:19:35 +0000
In-Reply-To: <401d6969636b4158966b786ea184d5d2@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpQYXVsLkR1cnJhbnRAY2l0cml4LmNvbV0NCj4g
U2VudDogVHVlc2RheSwgQXVndXN0IDcsIDIwMTggNToxMiBQTQ0KPiANCj4gDQo+ID4gU28gaGVy
ZSBjdXJyZW50IHZlcnNpb24gcHZJT01NVSBvbmx5IHByb3ZpZGVzIGdsb2JhbCBhZGRyZXNzIHNw
YWNlLA0KPiA+IHRob3VnaCB1bmxpa2UgYW55IGV4aXN0aW5nIElPTU1VLiBtYXliZSB3ZSBzaG91
bGQgZXhwbGljaXRseSBjYWxsIG91dA0KPiA+IHRoaXMgZmFjdCBpbiBzb21lIGNhcGFiaWxpdHkg
ZmllbGQgZm9yIGZ1dHVyZSBleHRlbnNpb24uDQo+ID4NCj4gDQo+IERvZXMgTGludXggZXhwb3Nl
IHN1Y2ggYSB0aGluZyB0aHJvdWdoIHRoZSBkbWFfb3BzPyBJIGRpZG4ndCBzZWUgb25lLCBidXQN
Cj4gaWYgdGhlcmUgaXMgb25lIHRoZW4gd2UgY2FuIG9mIGNvdXJzZSBzZXQgaXQgY29ycmVjdGx5
IGFjY29yZGluZyB0byB0aGUNCj4gbGltaXRhdGlvbnMgb2YgdGhlIHVuZGVyeWluZyBoeXBlcnZp
c29yLiBUaHVzLCBpZiBYZW4gaXMgbW9kaWZpZWQgaW4gZnV0dXJlIHRvDQo+IHN1cHBvcnQgcGVy
LWRldmljZSBtYXBwaW5ncywgdGhpcyBjb3VsZCBiZSBleHBvc2VkIHRocm91Z2ggdG8gdGhlIGRy
aXZlcnMNCj4gdXNpbmcgRE1BLg0KPiANCg0Kbm90IGFib3V0IExpbnV4IGludGVybmFsIGV4cG9z
aW5nLiBpdCdzIGFib3V0IGh5cGVydmlzb3IgZXhwb3NpbmcNCnRoZSBjYXBhYmlsaXR5IHRvIHB2
SU9NTVUgZHJpdmVyLCBzbyB0aGUgbGF0dGVyIGtub3dzIHdoZXRoZXIgdG8NCmVuYWJsZSBwZXIt
ZGV2aWNlIG1hcHBpbmcuIEJ1dCBhcyB5b3UgY29tbWVudGVkIGluIGFub3RoZXINCm1haWwsIGl0
IGNvdWxkIGJlIGFjaGlldmVkIHRocm91Z2ggZW5hYmxpbmcgc2VxdWVuY2UuDQoNCmJ0dyBjb3Vs
ZCB5b3UgcHV0IGNsYXJpZmljYXRpb24gYWNjb3JkaW5nIHRvIG91ciBkaXNjdXNzaW9ucyBpbiB5
b3VyIA0KbmV4dCB2ZXJzaW9uIGNvdmVybGV0dGVyIHRvIHNldCB0aGUgdG9uZSBjbGVhciBmcm9t
IHN0YXJ0PyBJIGRvbid0DQp0aGluayBJJ2xsIGJlIHRoZSBvbmx5IG9uZSBpbnRlcnByZXRpbmcg
d3JvbmcgZ29hbCBmb3IgdGhpcyB3b3JrLiA6LSkNCg0KVGhhbmtzDQpLZXZpbg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
