From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH 1/6] xen/arm: gic: Fix indentation in
	gic_update_one_lr
Date: Sat, 10 Mar 2018 16:53:33 +0100
Message-ID: <361db868-eb1d-ccad-80cc-c8b90e251bb4@arm.com>
References: <20180309163511.18808-1-julien.grall@arm.com>
 <20180309163511.18808-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ypli=ga=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eugr8-000563-7M
 for xen-devel@lists.xenproject.org; Sat, 10 Mar 2018 15:56:22 +0000
In-Reply-To: <20180309163511.18808-2-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDMvMTggMTc6MzUsIGp1bGllbi5ncmFsbEBhcm0uY29tIHdyb3RlOgo+IEZyb206IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZSBQcnp5
d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KCkNoZWVycywKQW5kcmUuCgo+IC0tLQo+ICB4
ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
Z2ljLXZnaWMuYyBiL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCj4gaW5kZXggNjFmMDkzZGI1MC4u
ZTNjYjQ3ZTgwZSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwo+ICsrKyBi
L3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCj4gQEAgLTE5Nyw4ICsxOTcsOCBAQCBzdGF0aWMgdm9p
ZCBnaWNfdXBkYXRlX29uZV9scihzdHJ1Y3QgdmNwdSAqdiwgaW50IGkpCj4gICAgICAgICAgewo+
ICAgICAgICAgICAgICBpZiAoIHAtPmRlc2MgPT0gTlVMTCApCj4gICAgICAgICAgICAgIHsKPiAt
ICAgICAgICAgICAgICAgICBscl92YWwuc3RhdGUgfD0gR0lDSF9MUl9QRU5ESU5HOwo+IC0gICAg
ICAgICAgICAgICAgIGdpY19od19vcHMtPndyaXRlX2xyKGksICZscl92YWwpOwo+ICsgICAgICAg
ICAgICAgICAgbHJfdmFsLnN0YXRlIHw9IEdJQ0hfTFJfUEVORElORzsKPiArICAgICAgICAgICAg
ICAgIGdpY19od19vcHMtPndyaXRlX2xyKGksICZscl92YWwpOwo+ICAgICAgICAgICAgICB9Cj4g
ICAgICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJO
SU5HLCAidW5hYmxlIHRvIGluamVjdCBodyBpcnE9JWQgaW50byBkJWR2JWQ6IGFscmVhZHkgYWN0
aXZlIGluIExSJWRcbiIsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
