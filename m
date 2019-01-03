From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [PATCH XTF v2 3/4] xtf: Add monitor test class
Date: Thu, 3 Jan 2019 11:47:54 +0000
Message-ID: <d87a0489044f76011310cabafd11ddebadfeb49a.camel@bitdefender.com>
References: <cover.1546021481.git.ppircalabu@bitdefender.com>
 <d1cf4cfa626395288b9540a9a1edd7add1a1d045.1546021481.git.ppircalabu@bitdefender.com>
 <20190102134304.hig74gw4l5b2gpkl@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ujg2=PL=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1gf1Tn-0005BM-IB
 for xen-devel@lists.xenproject.org; Thu, 03 Jan 2019 11:48:03 +0000
In-Reply-To: <20190102134304.hig74gw4l5b2gpkl@zion.uk.xensource.com>
Content-Language: en-US
Content-ID: <38707024714A6F4297452FD40D0EA437@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMDE5LTAxLTAyIGF0IDEzOjQzICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBPbiBG
cmksIERlYyAyOCwgMjAxOCBhdCAwODo0Mjo0MVBNICswMjAwLCBQZXRyZSBQaXJjYWxhYnUgd3Jv
dGU6DQo+ID4gDQo+ID4gIA0KPiA+ICBkZWZpbmUgYWxsX3NvdXJjZXMNCj4gPiAtCWZpbmQgaW5j
bHVkZS8gYXJjaC8gY29tbW9uLyB0ZXN0cy8gLW5hbWUgIiouW2hjc1NdIg0KPiA+ICsJZmluZCBp
bmNsdWRlLyBhcmNoLyBjb21tb24vIHRlc3RzLyBtb25pdG9yLyAtbmFtZSAiKi5baGNzU10iDQo+
ID4gIGVuZGVmDQo+IA0KPiBOb3QgYSBtYWludGFpbmVyIG9mIHh0ZiwgYnV0IEkgZmluZCB0aGlz
IGNvZGUgcGxhY2VtZW50IHN0cmFuZ2UuIElmDQo+ICJtb25pdG9yIiBpcyBhIGp1c3QgeWV0IG9u
ZSBjYXRlZ29yeSBvZiB0ZXN0cywgd2h5IGlzIGl0IG5vdCBwbGFjZWQNCj4gdW5kZXIgdGVzdHMv
ID8NCkhlcmUgKGluIHRoZSBzcmMgcm9vdCBkaXIpIHRoZSBtb25pdG9yIHN1YmRpcmVjdG9yeSBj
b250YWlucyB0aGUgY29tbW9uDQpjb2RlIHdoaWNoIHdpbGwgYmUgcmV1c2VkIGZvciBhbGwgdGVz
dHMuDQo+IA0KPiA+ICANCj4gPiAgLlBIT05ZOiBjc2NvcGUNCj4gPiBkaWZmIC0tZ2l0IGEvYnVp
bGQvY29tbW9uLm1rIGIvYnVpbGQvY29tbW9uLm1rDQo+ID4gaW5kZXggYjc4NmRkZi4uMWVjMGZh
NCAxMDA2NDQNCj4gPiAtLS0gYS9idWlsZC9jb21tb24ubWsNCj4gPiArKysgYi9idWlsZC9jb21t
b24ubWsNCj4gPiBAQCAtMSw0ICsxLDQgQEANCj4gPiAtQUxMX0NBVEVHT1JJRVMgICAgIDo9IHNw
ZWNpYWwgZnVuY3Rpb25hbCB4c2EgdXRpbGl0eSBpbi0NCj4gPiBkZXZlbG9wbWVudA0KPiA+ICtB
TExfQ0FURUdPUklFUyAgICAgOj0gc3BlY2lhbCBmdW5jdGlvbmFsIHhzYSB1dGlsaXR5IGluLQ0K
PiA+IGRldmVsb3BtZW50IG1vbml0b3INCj4gDQo+IFlvdSB1c2UgIm1vbml0b3IiIGhlcmUgYnV0
ICJob3N0IiBpbiBwcmV2aW91cyBwYXRjaC4gVGhleSBkb24ndA0KPiBtYXRjaC4NCj4gDQo+IFdl
aS4NClRoZSAibW9uaXRvciIgdGVzdCBjbGFzcyBpcyBhIGNvbXBvdW5kIHRlc3Qgd2hpY2ggZXhl
Y3V0ZXMgaW4gcGFyYWxlbCBhDQoiY2xhc2ljIiB4dGYgdGVzdCAobG9hZHMgRG9tVSBhbmQgcnVu
cyB0byBjb21wbGV0aW9uKSBhbmQgYSAiaG9zdCIgdGVzdA0Kd2hpY2ggcnVucyBhbiBleGVjdXRh
YmxlIG9uIERvbTAuIFRoZSBmaW5hbCByZXN1bHQgaXMgY29tcHV0ZWQgYnkNCmV4YW1pbmluZyBi
b3RoIGV4aXQgY29kZXMuIA0KSW4gYnVpbGQvY29tbW9uLm1rIG9ubHkgdGhlICJtb25pdG9yIiBj
bGFzcyBpcyBhZGRlZCB0byBBTExfQ0FURUdPUklFUywNCmJlY2F1c2UsIGF0IGxlYXN0IGZvciBu
b3csIEkgZG9uJ3QgaGF2ZSBhbiB1c2UtY2FzZSBmb3IgYSAiaG9zdCIgb25seQ0KdGVzdC4NCg0K
SG9wZSBpdCBjbGFyaWZpZXMgdGhlIGRpZmZlcmVuY2UsDQpQZXRyZQ0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
