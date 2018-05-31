From: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH v2 00/10] Intel Processor Trace
 virtulization enabling
Date: Thu, 31 May 2018 09:21:01 +0000
Message-ID: <82D7661F83C1A047AF7DC287873BF1E167FE2919@SHSMSX101.ccr.corp.intel.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <d4123fb7-293f-bf0e-1e7d-0d3184829023@arm.com>
 <82D7661F83C1A047AF7DC287873BF1E167FE1A5C@SHSMSX101.ccr.corp.intel.com>
 <c0275588-9bcf-6ad1-e63a-03c38d836fca@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c0275588-9bcf-6ad1-e63a-03c38d836fca@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, "tim@xen.org" <tim@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwg
W21haWx0bzpqdWxpZW4uZ3JhbGxAYXJtLmNvbV0NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBNYXkg
MzAsIDIwMTggMTE6MTUgUE0NCj4gPj4gVG86IEthbmcsIEx1d2VpIDxsdXdlaS5rYW5nQGludGVs
LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW4ub3JnDQo+ID4+IENjOiBhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tOyBHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb207DQo+ID4+IGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb207IGpiZXVsaWNoQHN1c2UuY29tOyBrb25yYWQud2lsa0BvcmFjbGUuY29t
Ow0KPiA+PiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyB0aW1AeGVuLm9yZzsgd2VpLmxpdTJAY2l0
cml4LmNvbTsgTmFrYWppbWEsDQo+ID4+IEp1biA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IFRp
YW4sIEtldmluIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAwMC8xMF0gSW50ZWwgUHJvY2Vzc29yIFRyYWNlIHZpcnR1bGl6YXRpb24NCj4gPj4gZW5h
YmxpbmcNCj4gPj4NCj4gPj4gSGksDQo+ID4+DQo+ID4+IENhbiB5b3UgcGxlYXNlIGF2b2lkIEND
IGV2ZXJ5b25lIG9uIGVhY2ggcGF0Y2g/IFlvdSBjYW4gdXNlDQo+ID4+IHNjcmlwdHMvZ2V0X21h
aW50YWluZXJzLnBsIG9uIGVhY2ggcGF0Y2ggdG8gc2VlIHdobyBpcyByZXF1aXJlZCB0byBiZSBD
Q2VkLg0KPiA+DQo+ID4gT0ssIGdldCBpdC4gSSB1c2Ugc2NyaXB0L2dldF9tYWludGFpbmVycy5w
bCB0byBnZXQgdGhlIHBlb3BsZSB3aG8gbmVlZCB0byBiZSBDQyBhbmQgaW5kZWVkIGRpZmZlcmVu
dCBwYXRjaCBtYXkgaW5jbHVkZSBkaWZmZXJlbnQNCj4gcGVvcGxlcy4gSWYgc29tZWJvZHkgIGp1
c3QgcmVjZWl2ZSBvbmUgcGF0Y2ggb2YgdGhpcyBwYXRjaCBzZXQgbWF5IGZlZWwgYSBsaXR0bGUg
c3RyYW5nZSBhbmQgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgY29udGV4dC4gU28gSSBDQyBhbGwNCj4g
dGhlIHBlb3BsZXMgd2hvIGlzIG1lbnRpb25lZCBpbiB0aGlzIHBhdGNoIHNldC4NCj4gDQo+IFRo
YXQncyB1c3VhbGx5IHdoeSBJIENDIGV2ZXJ5b25lIG9uIHRoZSBjb3ZlciBsZXR0ZXIuIFRoZW4g
Zm9yIGVhY2ggcGF0Y2ggSSBDQyBvbmx5IHRoZSBuZWNlc3NhcnkgcGVyc29uLg0KPiANCj4gVGhp
cyBhdm9pZHMgbWFpbnRhaW5lcnMgdG8gaGF2ZSB0byBsb29rIGZvciB3aGF0IHRoZXkgc2hvdWxk
IHJldmlldy9hY2suDQoNCkdldCBpdC4gVGhpcyBpcyBhIGdvb2Qgd2F5IHRvIG1lLiAgVGhhbmtz
Lg0KDQpMdXdlaSBLYW5nDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
