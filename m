From: "Shah, Amit" <aams@amazon.de>
Subject: Re: [PATCH] xen/pirq: fix error path cleanup when
	binding MSIs
Date: Thu, 15 Mar 2018 17:07:52 +0000
Message-ID: <1521133672.18764.78.camel__45193.0191521116$1521133611$gmane$org@amazon.com>
References: <20180228091903.99889-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q0ph=gf=amazon.de=prvs=6053dfbd8=aams@srs-us1.protection.inumbo.net>)
 id 1ewWMJ-0001UI-1m
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 17:08:07 +0000
In-Reply-To: <20180228091903.99889-1-roger.pau@citrix.com>
Content-Language: en-US
Content-ID: <9F376E8C3E2D2D4CAC44961614A6CBE3@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Cc: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

DQpPbiBNaSwgMjAxOC0wMi0yOCBhdCAwOToxOSArMDAwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3Rl
Og0KPiBDdXJyZW50IGNsZWFudXAgaW4gdGhlIGVycm9yIHBhdGggb2YgeGVuX2JpbmRfcGlycV9t
c2lfdG9faXJxIGlzDQo+IHdyb25nLiBGaXJzdCBvZiBhbGwgdGhlcmUncyBhbiBvZmYtYnktb25l
IGluIHRoZSBjbGVhbnVwIGxvb3AsIHdoaWNoDQo+IGNhbiBsZWFkIHRvIHVuYmluZGluZyB3cm9u
ZyBJUlFzLg0KPiANCj4gU2Vjb25kbHkgSVJRcyBub3QgYm91bmQgd29uJ3QgYmUgZnJlZWQsIHRo
dXMgbGVha2luZyBJUlEgbnVtYmVycy4NCj4gDQo+IE5vdGUgdGhhdCB0aGVyZSdzIG5vIG5lZWQg
dG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGJvdW5kIGFuZCB1bmJvdW5kDQo+IElSUXMgd2hlbiBm
cmVlaW5nIHRoZW0sIF9fdW5iaW5kX2Zyb21faXJxIHdpbGwgZGVhbCB3aXRoIGJvdGggb2YgdGhl
bQ0KPiBjb3JyZWN0bHkuDQo+IA0KPiBGaXhlczogNDg5MmM5YjRhZGE5ZjkgKCJ4ZW46IGFkZCBz
dXBwb3J0IGZvciBNU0kgbWVzc2FnZSBncm91cHMiKQ0KPiBSZXBvcnRlZC1ieTogSG9vbWFuIE1p
cmhhZGkgPG1pcmhhZGloQGFtYXpvbi5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiAtLS0NCj4gQ2M6IEJvcmlzIE9zdHJvdnNr
eSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+DQo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IENjOiBBbWl0IFNoYWggPGFhbXNAYW1hem9uLmNvbT4NCj4gQ0M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zw0KDQpUaGUgQ0MgdG8gc3RhYmxlIGdvdCBsb3N0IG9uIGNvbW1pdCwgc28gdGhpcyBkaWRuJ3Qg
YWN0dWFsbHkgbWFrZQ0KaXQgdG8gdGhlIHN0YWJsZSBxdWV1ZS4gwqBDYW4geW91IHBsZWFzZSBn
ZXQgaXQgcXVldWVkPw0KDQpUaGFua3MsDQpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1h
bnkgR21iSApCZXJsaW4gLSBEcmVzZGVuIC0gQWFjaGVuCm1haW4gb2ZmaWNlOiBLcmF1c2Vuc3Ry
LiAzOCwgMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBEci4gUmFsZiBIZXJicmljaCwg
Q2hyaXN0aWFuIFNjaGxhZWdlcgpVc3QtSUQ6IERFMjg5MjM3ODc5CkVpbmdldHJhZ2VuIGFtIEFt
dHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
