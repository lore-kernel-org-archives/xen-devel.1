From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [VMI] Possible race-condition in altp2m APIs
Date: Fri, 10 May 2019 10:52:11 +0000
Message-ID: <6a1009e7d820c8ef66c0923a2b74d97cb4f8397f.camel@bitdefender.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <CABfawh=_Xg225Tfw-zS9iXXk2pdUG0MyBi3+Co5Urmh6EfTOXw@mail.gmail.com>
 <a8f1adea-9d57-5953-614f-85f7b97be44f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=syrU=TK=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hP38R-0007Nl-RM
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 10:52:15 +0000
In-Reply-To: <a8f1adea-9d57-5953-614f-85f7b97be44f@citrix.com>
Content-Language: en-US
Content-ID: <0F5332E1A9D56A4BBFC67FA0A6AF3DCC@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Mathieu Tarral <mathieu.tarral@protonmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE5LTA1LTA5IGF0IDE5OjAwICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiA+IA0KPiBPbiAwOS8wNS8yMDE5IDE4OjQ2LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQo+ID4g
DQo+IA0KPiBJIGhhdmUgc29tZSBwbGFucyB0byByZXBsYWNlIGl0IHdpdGggc29tZXRoaW5nIGZh
ciBtb3JlIHVzYWJsZSwgYXMNCj4gcGFydA0KPiBvZiB0eWluZyB0b2dldGhlciBzb21lIFhURi1i
YXNlZCBWTUkgdGVzdGluZywgYnV0IG5vbmUgb2YgdGhhdCBpcw0KPiByZW1vdGVseSByZWFkeSB5
ZXQuDQpIaSBBbmRyZXcsDQoNCkRpZCB5b3UgZ2V0IGEgY2hhbmNlIHRvIGxvb2sgYXQgdGhpcyBz
ZXJpZXM/IA0KaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE4LTEyL21zZzAyNDIxLmh0bWwNCg0KSWYgaXQgZG9lbnMndCBtYXRjaCB5b3VyIHJl
cXVpcmVtZW50cywgSSBjYW4gbW9kaWZ5IGl0IGFjY29yZGluZ2x5Lg0KDQpNYW55IHRoYW5rcywN
ClBldHJlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
