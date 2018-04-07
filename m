From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [for-4.11][PATCH v7 16/16] xen: Convert page_to_mfn
 and mfn_to_page to use typesafe MFN
Date: Sat, 7 Apr 2018 11:44:21 +0000
Message-ID: <872499b856314cfc9a22255e939ed61a@AMSPEX02CL03.citrite.net>
References: <20180403153251.19595-1-julien.grall@arm.com>
 <20180403153251.19595-17-julien.grall@arm.com>
 <801482b0-519c-44b3-6601-c7e73aecf4f9@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <801482b0-519c-44b3-6601-c7e73aecf4f9@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Ian Jackson <Ian.Jackson@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgW21haWx0
bzpqdWxpZW4uZ3JhbGxAYXJtLmNvbV0NCj4gU2VudDogMDYgQXByaWwgMjAxOCAwOToxOQ0KPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbi5vcmcNCj4gQ2M6IFJhenZhbiBDb2pvY2FydSA8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT47IFBhdWwgRHVycmFudA0KPiA8UGF1bC5EdXJyYW50QGNpdHJp
eC5jb20+OyBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPjsNCj4g
S2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPjsgSmFuDQo+IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsNCj4gVGltIChYZW4ub3JnKSA8dGltQHhlbi5v
cmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiBBbmRy
ZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcA0KPiA8
R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJp
eC5jb20+OyBLb25yYWQNCj4gUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
OyBUYW1hcyBLIExlbmd5ZWwNCj4gPHRhbWFzQHRrbGVuZ3llbC5jb20+OyBTdXJhdmVlIFN1dGhp
a3VscGFuaXQNCj4gPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPjsgSnVuIE5ha2FqaW1h
DQo+IDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsgR2FuZyBXZWkgPGdhbmcud2VpQGludGVsLmNv
bT47IFNoYW5lIFdhbmcNCj4gPHNoYW5lLndhbmdAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTog
W2Zvci00LjExXVtQQVRDSCB2NyAxNi8xNl0geGVuOiBDb252ZXJ0IHBhZ2VfdG9fbWZuIGFuZA0K
PiBtZm5fdG9fcGFnZSB0byB1c2UgdHlwZXNhZmUgTUZODQo+IA0KPiBIaSwNCj4gDQo+IE9uIDA0
LzAzLzIwMTggMDQ6MzIgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gPiAgIHhlbi9hcmNoL3g4
Ni9odm0vaW9yZXEuYyAgICAgICAgICAgICAgICB8ICA0ICsrLS0NCj4gDQo+IFRoZXJlIGlzIGEg
c21hbGwgY2xhc2ggd2l0aCBQYXVsJ3MgR0ZOIHR5cGVzYWZlIGZvciBpb3JlcS4NCj4gUGF1bCwg
ZG8geW91IHdhbnQgbWUgdG8gcmVzZW5kIGEgcGF0Y2ggZm9yIHRoYXQ/DQo+DQoNClNvcnJ5IEkg
d2FzIE9PVE8gb24gRnJpZGF5LiBMb29rcyBsaWtlIEFuZHJldyBoYXMgYWxyZWFkeSBzZW50IGFu
IGFkanVzdG1lbnQgcGF0Y2ggYW55d2F5Lg0KDQogIENoZWVycywNCg0KICAgIFBhdWwNCg0KIA0K
PiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
