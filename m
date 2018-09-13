From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v6 07/14] x86: add iommu_op to query
 reserved ranges
Date: Thu, 13 Sep 2018 06:11:54 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1913019FE@SHSMSX101.ccr.corp.intel.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-8-paul.durrant@citrix.com>
 <5B925A8902000078001E6525@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0io5=l3=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1g0Kr8-00023i-Vs
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 06:11:59 +0000
In-Reply-To: <5B925A8902000078001E6525@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaA0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciA3LCAyMDE4IDc6
MDEgUE0NCj4gDQo+ID4+PiBPbiAyMy4wOC4xOCBhdCAxMTo0NywgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPiB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMgYW4gaW9tbXVfb3AgdG8gYWxsb3cg
dGhlIGRvbWFpbiBJT01NVSByZXNlcnZlZA0KPiByYW5nZXMgdG8gYmUNCj4gPiBxdWVyaWVkIGJ5
IHRoZSBndWVzdC4NCj4gPg0KPiA+IE5PVEU6IFRoZSBudW1iZXIgb2YgcmVzZXJ2ZWQgcmFuZ2Vz
IGlzIGRldGVybWluZWQgYnkgc3lzdGVtIGZpcm13YXJlLA0KPiBpbg0KPiA+ICAgICAgIGNvbmp1
bmN0aW9uIHdpdGggWGVuIGNvbW1hbmQgbGluZSBvcHRpb25zLCBhbmQgaXMgZXhwZWN0ZWQgdG8g
YmUNCj4gPiAgICAgICBzbWFsbC4gVGh1cywgdG8gYXZvaWQgb3Zlci1jb21wbGljYXRpbmcgdGhl
IGNvZGUsIHRoZXJlIGlzIG5vDQo+ID4gICAgICAgcHJlLWVtcHRpb24gY2hlY2sgd2l0aGluIHRo
ZSBvcGVyYXRpb24uDQo+IA0KPiBIbW0sIFJNUlJzIHJlcG9ydGVkbHkgY2FuIGNvdmVyIGEgZmFp
ciBwYXJ0IG9mICh0aGUgZW50aXJlPykgZnJhbWUNCj4gYnVmZmVyIG9mIGEgZ3JhcGhpY3MgZGV2
aWNlLg0KPiANCg0KYnV0IGl0IGlzIHN0aWxsIGp1c3Qgb25lIHJhbmdlDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
