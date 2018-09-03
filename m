From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 3/7] xen/hvm: Rename d->arch.hvm_domain to
 d->arch.hvm
Date: Mon, 3 Sep 2018 08:11:39 +0000
Message-ID: <f2d3b207c4f84bed82b09aa6c11ee6aa@AMSPEX02CL03.citrite.net>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535477946-17892-4-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWls
dG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0NCj4gU2VudDogMjggQXVndXN0IDIwMTggMTg6
MzkNCj4gVG86IFhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbi5vcmc+DQo+IENjOiBBbmRy
ZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgSmFuIEJldWxpY2gNCj4gPEpC
ZXVsaWNoQHN1c2UuY29tPjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IFJvZ2VyIFBh
dSBNb25uZQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVu
Lm9yZz47IEdlb3JnZSBEdW5sYXANCj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Ow0KPiBSYXp2YW4gQ29qb2NhcnUgPHJj
b2pvY2FydUBiaXRkZWZlbmRlci5jb20+OyBUYW1hcyBLIExlbmd5ZWwNCj4gPHRhbWFzQHRrbGVu
Z3llbC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBK
dWxpZW4NCj4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgSnVuIE5ha2FqaW1hIDxqdW4u
bmFrYWppbWFAaW50ZWwuY29tPjsNCj4gS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
OyBCb3JpcyBPc3Ryb3Zza3kNCj4gPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPjsgU3VyYXZl
ZSBTdXRoaWt1bHBhbml0DQo+IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT47IEJyaWFu
IFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMy83XSB4ZW4v
aHZtOiBSZW5hbWUgZC0+YXJjaC5odm1fZG9tYWluIHRvIGQtDQo+ID5hcmNoLmh2bQ0KPiANCj4g
VGhlIHRyYWlsaW5nIF9kb21haW4gc3VmZml4IGlzIHJlZHVuZGFudCwgYnV0IGFkZHMgdG8gY29k
ZSB2b2x1bWUuICBEcm9wIGl0Lg0KPiANCj4gUmVmbG93IGxpbmVzIGFzIGFwcHJvcHJpYXRlLCBh
bmQgc3dpdGNoIHRvIHVzaW5nIHRoZSBuZXcgWEZSRUUvZXRjIHdyYXBwZXJzDQo+IHdoZXJlIGFw
cGxpY2FibGUuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
