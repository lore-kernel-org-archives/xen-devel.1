From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: Suspicious code in p2m_set_altp2m_mem_access
Date: Wed, 3 Apr 2019 15:17:52 +0000
Message-ID: <736EACB7-5B17-4CBB-B91C-EC81F3F41E9E@citrix.com>
References: <b9e22669-5330-06fa-9799-7ccbc8955703@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fXex=SF=citrix.com=prvs=9896080f8=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hBhrt-0001Md-3r
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 15:32:01 +0000
In-Reply-To: <b9e22669-5330-06fa-9799-7ccbc8955703@bitdefender.com>
Content-Language: en-US
Content-ID: <90EC4C502DDDCB4AB13D2C74146DF69F@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "tamas@tklengyel.com" <tamas@tklengyel.com>, George Dunlap <George.Dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gQXByIDMsIDIwMTksIGF0IDM6NTIgUE0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxB
IDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBhbGwsDQo+IA0KPiBJ
IGNhbWUgYWNyb3NzIHNvbWUgY29kZSBpbiB0aGUgcDJtX3NldF9hbHRwMm1fbWVtX2FjY2Vzcygp
IHRoYXQgZG9lcyBub3QgDQo+IHNlZW0gcmlnaHQuIE9uIHRoZSBpbnZhbGlkIG1mbiBicmFuY2gg
dGhlcmUgaXMgYSB0cnkgdG8gc2V0X2VudHJ5KCkgYW5kIA0KPiBpZiB0aGF0IGlzIG5vdCBzdWNj
ZXNzZnVsIHRoZW4gdGhlIGZ1bmN0aW9uIGRvZXMgbm90IHJldHVybiBhbmQgY2FsbHMgDQo+IHNl
dF9lbnRyeSBhZ2FpbiBmb3IgUEFHRV9PUkRFUl80SyBldmVuIGlmIHRoZXJlIHdhcyBhIGNoZWNr
IHRoYXQgcGFnZSANCj4gb3JkZXIgaXMgZGlmZmVyZW50IGZyb20gUEFHRV9PUkRFUl80Sy4NCj4g
DQo+IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9eGVu
L2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYztoPWExNDRiYjBjZTQ5NDMxOGIwNDkzZGNmZjMxYmI1
ZTRlOGE3NDI5Njk7aGI9cmVmcy9oZWFkcy9zdGFnaW5nI2wyNzINCj4gDQo+IElzIHRoaXMgYmVo
YXZpb3Igd2FudGVkPw0KDQpZZXMuDQoNClRoZSBjb2RlIGNoZWNrcyB0byBzZWUgaWYgdGhlICph
bHRwMm0qIGZvciB0aGF0IGVudHJ5IGlzIGludmFsaWQuICBJZiBzbywgaXQgdGhlbiBnb2VzIGFu
ZCByZWFkcyB0aGUgKmhvc3RwMm0qLiAgSWYgdGhlIGFsdHAybSBlbnRyeSBpcyBpbnZhbGlkLCBh
bmQgdGhlIGhvc3RwMm0gZW50cnkgaXMgdmFsaWQsICphbmQqIHRoZSBob3N0cDJtIGVudHJ5IGlz
ID4gNGsgKHNheSwgMk1pQiksIHRoZW4gaXQgZmlyc3QgbWFrZXMgYSBjb21wbGV0ZSBjb3B5IG9m
IHRoZSBob3N0cDJtIGVudHJ5LCB0aGVuIGRvZXMgdGhlIG9yaWdpbmFsbHktcmVxdWVzdGVkICg0
aykgd3JpdGUuDQoNClRoZSByZXN1bHQgb2YgdGhlIGZpcnN0IHdyaXRlIHdpbGwgYmUgYSAyTWlC
IGVudHJ5IHRoYXTigJlzIGEgY29weSBvZiB0aGUgaG9zdHBtOyB0aGUgcmVzdWx0IG9mIHRoZSBz
ZWNvbmQgd3JpdGUgd2lsbCBiZSB0byBicmVhayB0aGF0IDJNaUIgZW50cnkgaW50byA0ayBlbnRy
aWVzLCB0aGVuIG92ZXJ3cml0ZSB0aGF0IHNpbmdsZSBlbnRyeS4NCg0KIC1HZW9yZ2UNCg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
