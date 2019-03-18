From: "Nuernberger, Stefan" <snu@amazon.de>
Subject: Re: [PATCH RFC 14/55] x86/mm: rewrite xen_to_virt_l2e
Date: Mon, 18 Mar 2019 21:14:19 +0000
Message-ID: <1552943659.6788.97.camel@amazon.de>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-15-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tBy=RV=amazon.de=prvs=97326004b=snu@srs-us1.protection.inumbo.net>)
 id 1h5zaR-0007ll-Ev
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 21:14:23 +0000
In-Reply-To: <20190207164456.9260-15-wei.liu2@citrix.com>
Content-Language: en-US
Content-ID: <69798BEE52776B4A957429C6B2D15DF2@amazon.com>
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

T24gVGh1LCAyMDE5LTAyLTA3IGF0IDE2OjQ0ICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBSZXdy
aXRlIHRoYXQgZnVuY3Rpb24gdG8gdXNlIHRoZSBuZXcgQVBJcy4gTW9kaWZ5IGl0cyBjYWxsZXJz
IHRvDQo+IHVubWFwDQo+IHRoZSBwb2ludGVyIHJldHVybmVkLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4NCj4gLS0tDQoNCm5pdDogdGhlIGNvbW1p
dCB0aXRsZSBzaG91bGQgYmUgJ3ZpcnRfdG9feGVuX2wyZScgbm90ICd4ZW5fdG9fdmlydC4uLicN
Cg0KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4g
MzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBS
YWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dl
cmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
