From: "Nuernberger, Stefan" <snu@amazon.de>
Subject: Re: [PATCH RFC 07/55] x86/mm: add an end_of_loop label
 in map_pages_to_xen
Date: Mon, 18 Mar 2019 21:14:17 +0000
Message-ID: <1552943657.6788.96.camel@amazon.de>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-8-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tBy=RV=amazon.de=prvs=97326004b=snu@srs-us1.protection.inumbo.net>)
 id 1h5zaU-0007nj-BH
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 21:14:26 +0000
In-Reply-To: <20190207164456.9260-8-wei.liu2@citrix.com>
Content-Language: en-US
Content-ID: <1F092A6FEF0D7447837D421C23040FE3@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE5LTAyLTA3IGF0IDE2OjQ0ICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBXZSB3
aWxsIHNvb24gbmVlZCB0byBjbGVhbiB1cCBtYXBwaW5ncyB3aGVuZXZlciB0aGUgb3V0IG1vc3Qg
bG9vcCBpcw0KPiBlbmRlZC4gQWRkIGEgbmV3IGxhYmVsIGFuZCB0dXJuIHJlbGV2YW50IGNvbnRp
bnVlJ3MgaW50byBnb3RvJ3MuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+DQo+IC0tLQ0KDQpJJ20g
bm90IGFzIG9wcG9zZWQgdG8gdGhpcyB1c2Ugb2YgZ290byBhcyBKYW4sIGJ1dCBJJ2QgcHJlZmVy
IHRvIGF0DQpsZWFzdCBjYWxsIHRoZSBsYWJlbCAnY2xlYW51cCcgb3IgJ2NsZWFudXBfbWFwcGlu
Z3MnIHRvIG1ha2UgaXQgY2xlYXINCndoYXQgbmVlZHMgdG8gaGFwcGVuLg0KDQpTdGVmYW4KCgoK
QW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAx
MTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhl
cmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQg
Q2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
