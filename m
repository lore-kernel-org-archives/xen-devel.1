From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2] public/io/blkif.h: try to fix the
 semantics of sector based quantities
Date: Wed, 3 Apr 2019 09:10:45 +0000
Message-ID: <57d72132b80143cdbbabbba47ba72164@AMSPEX02CL02.citrite.net>
References: <20190402165803.28667-1-paul.durrant@citrix.com>
 <71155af0-8fb5-13aa-94c2-179db9b2b3d1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h7nx=SF=citrix.com=prvs=98918ea3f=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hBbv1-0003Ar-Q9
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 09:10:51 +0000
In-Reply-To: <71155af0-8fb5-13aa-94c2-179db9b2b3d1@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgW21haWx0
bzpqdWxpZW4uZ3JhbGxAYXJtLmNvbV0NCj4gU2VudDogMDMgQXByaWwgMjAxOSAxMDowOA0KPiBU
bzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2ls
a0BvcmFjbGUuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEFu
dGhvbnkNCj4gUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3Bl
ciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXANCj4gPEdlb3JnZS5E
dW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsg
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsNCj4gU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBXZWkg
TGl1DQo+IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBwdWJsaWMvaW8vYmxraWYuaDogdHJ5IHRv
IGZpeCB0aGUgc2VtYW50aWNzIG9mIHNlY3RvciBiYXNlZCBxdWFudGl0aWVzDQo+IA0KPiAoKyBK
dWVyZ2VuIGFzIGhlIG1haW50YWlucyB0aGUgUFYgSS9PIHdpdGggS29ucmFkKQ0KPiANCj4gT24g
MDIvMDQvMjAxOSAxNzo1OCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IFRoaXMgaXMgYWN0dWFs
bHkgdjIgb2YgdGhlIHBhdGNoIHBvc3RlZCBpbiBbMV0uIFBsZWFzZSBzZWUgdGhlIHRocmVhZA0K
PiA+IHN0YXJ0aW5nIHRoZXJlIGZvciBtb3JlIGNvbnRleHQuLi4NCj4gDQo+IFNob3VsZCBub3Qg
dGhpcyBiZWxvbmcgYWZ0ZXIgLS0tPw0KDQpUcnVlLCBpdCBkb2Vzbid0IHJlYWxseSB3YW50IHRv
IGdvIGludG8gdGhlIGNvbW1pdCBjb21tZW50Lg0KDQo+IA0KPiA+DQo+ID4gVGhlIHNlbWFudGlj
cyBvZiBzZWN0b3IgYmFzZWQgcXVhbnRpZXMsIHN1Y2ggYXMgZmlyc3Rfc2VjdCBhbmQgbGFzdF9z
ZWN0IGluDQo+IA0KPiBzL3F1YW50aWVzL3F1YW50aXRpZXMvDQo+IA0KDQpHb29kIHNwb3QuIFRo
YW5rcywNCg0KICBQYXVsDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
