From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH for-4.12] iommu: fix order of arguments in
 iommu_map call at iommu_hwdom_init
Date: Thu, 24 Jan 2019 09:43:00 +0000
Message-ID: <b48d045357b24b75887d308775b3fbc4@AMSPEX02CL03.citrite.net>
References: <20190123180818.78684-1-roger.pau@citrix.com>
 <5C4988310200007800210B94@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nt2y=QA=citrix.com=prvs=920cfe6d7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gmbXM-0003KB-1P
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 09:43:04 +0000
In-Reply-To: <5C4988310200007800210B94@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRv
OkpCZXVsaWNoQHN1c2UuY29tXQ0KPiBTZW50OiAyNCBKYW51YXJ5IDIwMTkgMDk6NDENCj4gVG86
IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IENjOiBQYXVsIER1cnJh
bnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsIDx4ZW4tDQo+IGRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGZvci00LjEyXSBpb21t
dTogZml4IG9yZGVyIG9mIGFyZ3VtZW50cyBpbiBpb21tdV9tYXANCj4gY2FsbCBhdCBpb21tdV9o
d2RvbV9pbml0DQo+IA0KPiA+Pj4gT24gMjMuMDEuMTkgYXQgMTk6MDgsIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4gd3JvdGU6DQo+ID4gVGhlIG9yZGVyIG9mIHRoZSBwYWdlX29yZGVyIGFuZCB0aGUg
ZmxhZ3MgcGFyYW1ldGVycyBhcmUgaW52ZXJ0ZWQgaW4NCj4gPiB0aGUgY2FsbCB0byBpb21tdV9t
YXAgbWFkZSBpbiBpb21tdV9od2RvbV9pbml0Lg0KPiA+DQo+ID4gRml4ZXM6IGU4YWZlMTEyNGNj
MSAoImlvbW11OiBlbGlkZSBmbHVzaGluZyBmb3IgaGlnaGVyIG9yZGVyIG1hcC91bm1hcA0KPiBv
cGVyYXRpb25zIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQo+IA0KPiBJZiB5b3UgZG9uJ3QgbWluZCBJJ2QgY29udmVydCB0byBQQUdFX09S
REVSXzRLIHdoaWxlIGNvbW1pdHRpbmcuDQoNCk5vLCBJIGRvbid0IHRoaW5rIHRoYXQncyBjb3Jy
ZWN0IGlzIGl0PyBUaGlzIGNvZGUgaXMgY29tbW9uLCBub3QgeDg2IHNwZWNpZmljIGFuZCBzbyA0
SyBtYXkgbm90IGJlIHRoZSBiYXNlIG9yZGVyLg0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
