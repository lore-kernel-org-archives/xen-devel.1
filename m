From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v4 3/4] iommu: elide flushing for higher
 order map/unmap operations
Date: Thu, 13 Dec 2018 06:27:53 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE9F145@SHSMSX101.ccr.corp.intel.com>
References: <20181206153427.35260-1-paul.durrant@citrix.com>
 <20181206153427.35260-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mz2v=OW=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gXKTW-0006q6-2i
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 06:27:58 +0000
In-Reply-To: <20181206153427.35260-4-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0NCj4g
U2VudDogVGh1cnNkYXksIERlY2VtYmVyIDYsIDIwMTggMTE6MzQgUE0NCj4gDQo+IFRoaXMgcGF0
Y2ggcmVtb3ZlcyBhbnkgaW1wbGljaXQgZmx1c2hpbmcgdGhhdCBvY2N1cnMgaW4gdGhlIGltcGxl
bWVudGF0aW9uDQo+IG9mIG1hcCBhbmQgdW5tYXAgb3BlcmF0aW9ucyBhbmQgYWRkcyBuZXcgaW9t
bXVfbWFwL3VubWFwKCkNCj4gd3JhcHBlcg0KPiBmdW5jdGlvbnMuIFRvIG1haW50YWluIHNlbWF0
aWNzIG9mIHRoZSBpb21tdV9sZWdhY3lfbWFwL3VubWFwKCkNCj4gd3JhcHBlcg0KPiBmdW5jdGlv
bnMsIHRoZXNlIGFyZSBtb2RpZmllZCB0byBjYWxsIHRoZSBuZXcgd3JhcHBlciBmdW5jdGlvbnMg
YW5kIHRoZW4NCj4gcGVyZm9ybSBhbiBleHBsaWNpdCBmbHVzaCBvcGVyYXRpb24uDQo+IA0KPiBC
ZWNhdXNlIFZULWQgY3VycmVudGx5IHBlcmZvcm1zIHR3byBkaWZmZXJlbnQgdHlwZXMgb2YgZmx1
c2ggZGVwZW5kZW50DQo+IHVwb24NCj4gd2hldGhlciBhIFBURSBpcyBiZWluZyBtb2RpZmllZCB2
ZXJzdXMgbWVyZWx5IGFkZGVkIChpLmUuIHJlcGxhY2luZyBhIG5vbi0NCj4gcHJlc2VudCBQVEUp
ICdpb21tdSBmbHVzaCBmbGFncycgYXJlIGRlZmluZWQgYnkgdGhpcyBwYXRjaCBhbmQgdGhlDQo+
IGlvbW11X29wcyBtYXBfcGFnZSgpIGFuZCB1bm1hcF9wYWdlKCkgbWV0aG9kcyBhcmUgbW9kaWZp
ZWQgdG8gT1INCj4gdGhlIHR5cGUNCj4gb2YgZmx1c2ggbmVjZXNzYXJ5IGZvciB0aGUgUFRFIHRo
YXQgaGFzIGJlZW4gcG9wdWxhdGVkIG9yIGRlcG9wdWxhdGVkIGludG8NCj4gYW4gYWNjdW11bGF0
ZWQgZmxhZ3MgdmFsdWUuIFRoZSBhY2N1bXVsYXRlZCB2YWx1ZSBjYW4gdGhlbiBiZSBwYXNzZWQg
aW50bw0KPiB0aGUgZXhwbGljaXQgZmx1c2ggb3BlcmF0aW9uLg0KPiANCj4gVGhlIEFSTSBTTU1V
IGltcGxlbWVudGF0aW9ucyBvZiBtYXBfcGFnZSgpIGFuZCB1bm1hcF9wYWdlKCkNCj4gY3VycmVu
dGx5DQo+IHBlcmZvcm0gbm8gaW1wbGljaXQgZmx1c2hpbmcgYW5kIHRoZXJlZm9yZSB0aGUgbW9k
aWZpZWQgbWV0aG9kcyBkbyBub3QNCj4gYWRqdXN0IHRoZSBmbHVzaCBmbGFncy4NCj4gDQo+IE5P
VEU6IFRoZSBwZXItY3B1ICdpb21tdV9kb250X2ZsdXNoX2lvdGxiJyBpcyByZXNwZWN0ZWQgYnkg
dGhlDQo+ICAgICAgIGlvbW11X2xlZ2FjeV9tYXAvdW5tYXAoKSB3cmFwcGVyIGZ1bmN0aW9ucyBh
bmQgdGhlcmVmb3JlIHRoaXMgbm93DQo+ICAgICAgIGFwcGxpZXMgdG8gYWxsIElPTU1VIGltcGxl
bWVudGF0aW9ucyByYXRoZXIgdGhhbiBqdXN0IFZULWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2
aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
