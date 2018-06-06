From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v6 8/8] x86/domctl: Don't pause the whole
 domain if only getting vcpu state
Date: Wed, 6 Jun 2018 14:12:50 +0000
Message-ID: <1528294370.25123.32.camel@bitdefender.com>
References: <1528287897-3414-1-git-send-email-aisaila@bitdefender.com>
 <1528287897-3414-8-git-send-email-aisaila@bitdefender.com>
 <5B17D5C502000078001C8B49@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B17D5C502000078001C8B49@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <649D34130A741D40A0E03EBCC7B257CD@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "JBeulich@suse.com" <JBeulich@suse.com>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "Ian.Jackson@eu.citrix.com" <Ian.Jackson@eu.citrix.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTWksIDIwMTgtMDYtMDYgYXQgMDY6MzggLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+
DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBPbiAwNi4wNi4xOCBhdCAxNDoyNCwgPGFpc2FpbGFA
Yml0ZGVmZW5kZXIuY29tPiB3cm90ZToNCj4gPiBAQCAtMzk0LDcgKzM4MCw3IEBAIHN0YXRpYyBp
bnQgdm1jZV9sb2FkX3ZjcHVfY3R4dChzdHJ1Y3QgZG9tYWluDQo+ID4gKmQsIGh2bV9kb21haW5f
Y29udGV4dF90ICpoKQ0KPiA+ICAgICAgcmV0dXJuIGVyciA/OiB2bWNlX3Jlc3RvcmVfdmNwdSh2
LCAmY3R4dCk7DQo+ID4gIH0NCj4gPg0KPiA+IC1IVk1fUkVHSVNURVJfU0FWRV9SRVNUT1JFKFZN
Q0VfVkNQVSwgdm1jZV9zYXZlX3ZjcHVfY3R4dCwNCj4gPiArSFZNX1JFR0lTVEVSX1NBVkVfUkVT
VE9SRShWTUNFX1ZDUFUsIHZtY2Vfc2F2ZV92Y3B1X2N0eHRfb25lLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHZtY2VfbG9hZF92Y3B1X2N0eHQsIDEsIEhWTVNSX1BFUl9WQ1BVKTsN
Cj4gQWxzbywgSSdtIGluY2xpbmVkIHRvIHNheSAib2YgY291cnNlIiwgdGhlIGZ1bmN0aW9ucyBz
aG91bGRuJ3QgaGF2ZSBhDQo+IF9vbmUNCj4gc3VmZml4IGFueW1vcmUgYnkgdGhlIGVuZCBvZiB0
aGlzIHNlcmllcywgcG9zc2libHkgZXZlbiBtYWtpbmcgaXQNCj4gdW5uZWNlc3NhcnkgdG8gdG91
Y2ggdGhpcyBhbmQgdGhlIG90aGVyIHNpbWlsYXIgY29uc3RydWN0cyBhdCBhbGwuDQo+DQpPaywg
SSdsbCBmaXggdGhpcyBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpDYW4geW91IGdpdmUgbWUgYW4g
aW5zaWdodCBpbnRvIGhvdyB5b3Ugc2VlIHRoZSBzcGxpdHRpbmcgb2YgdGhpcyBwYXRjaA0KZnVy
dGhlcj8NCg0KVGhhbmtzLA0KQWxleA0KDQpfX19fX19fX19fX19fX19fX19fX19fX18NClRoaXMg
ZW1haWwgd2FzIHNjYW5uZWQgYnkgQml0ZGVmZW5kZXINCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
