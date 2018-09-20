From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 7/7] amd-iommu: add lookup_page method to
 iommu_ops
Date: Thu, 20 Sep 2018 15:41:40 +0000
Message-ID: <ed31e7eac6214876ac48ae1b2ca86632@AMSPEX02CL03.citrite.net>
References: <20180920141149.1643-1-paul.durrant@citrix.com>
 <20180920141149.1643-8-paul.durrant@citrix.com>
 <5BA3B6CC02000078001EA54F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vqbt=mc=citrix.com=prvs=7948b9fa5=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g31lG-0000m5-56
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 16:25:02 +0000
In-Reply-To: <5BA3B6CC02000078001EA54F@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmDQo+IE9mIEph
biBCZXVsaWNoDQo+IFNlbnQ6IDIwIFNlcHRlbWJlciAyMDE4IDE2OjA0DQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogQW5kcmV3IENvb3BlciA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEJyaWFuIFdvb2RzDQo+IDxicmlhbi53b29kc0BhbWQu
Y29tPjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IFN1cmF2ZWUNCj4gU3V0aGlrdWxw
YW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0NCj4g
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBb
UEFUQ0ggNy83XSBhbWQtaW9tbXU6IGFkZCBsb29rdXBfcGFnZSBtZXRob2QgdG8NCj4gaW9tbXVf
b3BzDQo+IA0KPiA+Pj4gT24gMjAuMDkuMTggYXQgMTY6MTEsIDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4gd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IG1ldGhvZCB0byB0aGUgQU1E
IElPTU1VIGltcGxlbWVudGF0aW9uIHRvIGZpbmQgdGhlDQo+ID4gTUZOIGN1cnJlbnRseSBtYXBw
ZWQgYnkgdGhlIHNwZWNpZmllZCBERk4uIFRoaXMgaXMgYW5hbG9nb3VzIHRvIHRoZQ0KPiA+IG1l
dGhvZCBhZGRlZCBmb3IgVlQtZCBJT01NVSBieSBjb21taXQgNDNkMTYyMmIuDQo+IA0KPiBQbGVh
c2UgZG9uJ3QgcHJvdmlkZSBjb21taXQgSURzIGZyb20gKHByZXN1bWFibHkpIHlvdXIgcHJpdmF0
ZSByZXBvLA0KPiB0aGUgbW9yZSB3aXRob3V0IGEgdGl0bGUgcXVvdGVkIG5leHQgdG8gaXQuIEF0
IGxlYXN0IHBhdGNoZXMgMSBhbmQgNg0KPiBoYXZlIHRoZSBzYW1lIGlzc3VlLg0KDQpPSy4uLiBz
b3JyeSBnZXR0aW5nIGFoZWFkIG9mIG15c2VsZi4gTmVlZCB0byB3YWl0IGZvciB0aGUgcHJlLXJl
cSBzZXJpZXMgdG8gZ28gaW4uDQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCj4gDQo+IA0KPiANCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRl
dmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
