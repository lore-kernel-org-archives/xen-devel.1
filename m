From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 2/9] libxl: Move dm user determination logic
 into a helper function
Date: Fri, 30 Nov 2018 12:46:55 +0000
Message-ID: <C02A048E-F438-48AE-BC72-C8512887B977@citrix.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-2-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ngE=OJ=citrix.com=prvs=86598431a=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gSiCB-0002Lp-EB
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 12:46:59 +0000
In-Reply-To: <20181123171502.29519-2-george.dunlap@citrix.com>
Content-Language: en-US
Content-ID: <0AD7EAC2DB51A54C97314AC99FA24A67@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gTm92IDIzLCAyMDE4LCBhdCA1OjE0IFBNLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oDQo+IGluZGV4
IGU0OTg0MzVlMTYuLmEzNzBkZTU0ZWQgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2ludGVybmFsLmgNCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaA0KPiBAQCAt
MTEzNSw2ICsxMTM1LDggQEAgdHlwZWRlZiBzdHJ1Y3Qgew0KPiAgICAgY29uc3QgY2hhciAqIHNo
aW1fY21kbGluZTsNCj4gICAgIGNvbnN0IGNoYXIgKiBwdl9jbWRsaW5lOw0KPiANCj4gKyAgICBj
aGFyICogZG1fcnVuYXM7DQoNCknigJl2ZSByZW1vdmVkIHRoZSBzcGFjZSBib3RoIGhlcmUsIGFu
ZCBpbiB0aGUgYWJvdmUgY2hhciAqIGVsZW1lbnRzLiBJ4oCZbGwgcmV0YWluIGJvdGggb2YgeW91
ciBBY2tzIHVubGVzcyBJIGhlYXIgb3RoZXJ3aXNlLg0KDQogLUdlb3JnZQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
