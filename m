From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next] xen-netfront: mark expected switch
 fall-through
Date: Tue, 16 Apr 2019 21:03:20 -0700 (PDT)
Message-ID: <20190416.210320.978265746268686181.davem__28604.3288697087$1555473865$gmane$org@davemloft.net>
References: <20190415211141.GA1732@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lkvo=ST=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1hGbn8-0001Ck-Op
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 04:03:22 +0000
In-Reply-To: <20190415211141.GA1732@embeddedor>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: gustavo@embeddedor.com
Cc: jgross@suse.com, sstabellini@kernel.org, keescook@chromium.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogIkd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPg0KRGF0
ZTogTW9uLCAxNSBBcHIgMjAxOSAxNjoxMTo0MSAtMDUwMA0KDQo+IEluIHByZXBhcmF0aW9uIHRv
IGVuYWJsaW5nIC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIG1hcmsgc3dpdGNoDQo+IGNhc2VzIHdo
ZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLg0KPiANCj4gVGhpcyBwYXRjaCBm
aXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6DQo+IA0KPiBkcml2ZXJzL25ldC94ZW4tbmV0ZnJv
bnQuYzogSW4gZnVuY3Rpb24g4oCYbmV0YmFja19jaGFuZ2Vk4oCZOg0KPiBkcml2ZXJzL25ldC94
ZW4tbmV0ZnJvbnQuYzoyMDM4OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRo
cm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQ0KPiAgICBpZiAoZGV2LT5zdGF0ZSA9PSBY
ZW5idXNTdGF0ZUNsb3NlZCkNCj4gICAgICAgXg0KPiBkcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQu
YzoyMDQxOjI6IG5vdGU6IGhlcmUNCj4gICBjYXNlIFhlbmJ1c1N0YXRlQ2xvc2luZzoNCj4gICBe
fn5+DQo+IA0KPiBXYXJuaW5nIGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91
Z2g9Mw0KPiANCj4gTm90aWNlIHRoYXQsIGluIHRoaXMgcGFydGljdWxhciBjYXNlLCB0aGUgY29k
ZSBjb21tZW50IGlzIG1vZGlmaWVkDQo+IGluIGFjY29yZGFuY2Ugd2l0aCB3aGF0IEdDQyBpcyBl
eHBlY3RpbmcgdG8gZmluZC4NCj4gDQo+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2lu
ZyBlZmZvcnRzIHRvIGVuYWJsZQ0KPiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4N
Cg0KQXBwbGllZC4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
