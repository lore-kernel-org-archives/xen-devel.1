From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v4 1/4] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
Date: Tue, 9 Apr 2019 03:10:39 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C9D56D0@SHSMSX104.ccr.corp.intel.com>
References: <20190314135125.1958-1-paul.durrant@citrix.com>
 <20190314135125.1958-2-paul.durrant@citrix.com>
 <5CA73C2E0200007800224D98@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X9g6=SL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hDh9o-0006Yh-Rq
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:10:44 +0000
In-Reply-To: <5CA73C2E0200007800224D98@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQ0KPiBTZW50OiBG
cmlkYXksIEFwcmlsIDUsIDIwMTkgNzozMCBQTQ0KPiANCj4gPj4+IE9uIDE0LjAzLjE5IGF0IDE0
OjUxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOg0KPiA+IFNhdmluZyBhbmQgcmVz
dG9yaW5nIHRoZSB2YWx1ZSBvZiB0aGlzIE1TUiBpcyBjdXJyZW50bHkgaGFuZGxlZCBieQ0KPiA+
IGltcGxlbWVudGF0aW9uLXNwZWNpZmljIGNvZGUgZGVzcGl0ZSBpdCBiZWluZyBhcmNoaXRlY3R1
cmFsLiBUaGlzIHBhdGNoDQo+ID4gbW92ZXMgaGFuZGxpbmcgb2YgYWNjZXNzZXMgdG8gdGhpcyBN
U1IgZnJvbSBodm0uYyBpbnRvIHRoZSBtc3IuYywgdGh1cw0KPiA+IGFsbG93aW5nIHRoZSBjb21t
b24gTVNSIHNhdmUvcmVzdG9yZSBjb2RlIHRvIGhhbmRsZSBpdC4NCj4gPg0KPiA+IE5PVEU6IEJl
Y2F1c2Ugdm14X2dldC9zZXRfZ3Vlc3RfYm5kY2ZncygpIGNhbGwgdm14X3ZtY3NfZW50ZXIoKSwg
dGhlDQo+ID4gICAgICAgc3RydWN0IHZjcHUgcG9pbnRlciBwYXNzZWQgaW4sIGFuZCBoZW5jZSB0
aGUgdmNwdSBwb2ludGVyIHBhc3NlZCB0bw0KPiA+ICAgICAgIGd1ZXN0X3JkbXNyKCkgY2Fubm90
IGJlIGNvbnN0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4NCj4gPiAtLS0NCj4gPiBDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlh
bkBpbnRlbC5jb20+DQo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPiBDYzog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4NCj4gPiBDYzogIlJvZ2VyIFBhdSBNb25uw6ki
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPiBDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWpp
bWFAaW50ZWwuY29tPg0KPiA+DQo+ID4gdjQ6DQo+ID4gIC0gQ29zbWV0aWMgcmUtYXJyYW5nZW1l
bnRzIGFuZCBhbiBhZGRpdGlvbmFsIEFTU0VSVCByZXF1ZXN0ZWQgYnkgSmFuDQo+ID4NCj4gPiB2
MzoNCj4gPiAgLSBBZGRyZXNzIGZ1cnRoZXIgY29tbWVudHMgZnJvbSBKYW4NCj4gPiAgLSBEcm9w
cGVkIEtldmluJ3MgUi1iIGJlY2F1c2Ugb2YgY2hhbmdlIHRvIHZteC5jDQo+IA0KPiBLZXZpbiwN
Cj4gDQo+IHlvdSBtYXkgbm90IGhhdmUgbm90aWNlZCB0aGUgYWJvdmUuDQo+IA0KDQp5ZXMgaW5k
ZWVkLiBUaGFua3MgZm9yIHJlbWluZCENCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
