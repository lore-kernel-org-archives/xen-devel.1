From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/3] xen/arm: vgic-v3-its: Make
 vgic_v3_its_free_domain idempotent
Date: Tue, 25 Sep 2018 13:08:15 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1809251308060.15006@sstabellini-ThinkPad-X260>
References: <20180904192153.17210-1-julien.grall@arm.com>
 <20180904192153.17210-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=498c=mh=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1g4td3-0000IQ-MQ
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 20:08:17 +0000
In-Reply-To: <20180904192153.17210-4-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, shameerali.kolothum.thodi@huawei.com, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA0IFNlcCAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gdmdpY192M19pdHNfZnJl
ZV9kb21haW4gbWF5IGJlIGNhbGxlZCBiZWZvcmUgdmdpY192M19pdHNfaW5pdF9kb21haW4gaWYK
PiB0aGUgdkdJQyB3YXMgZmFpbGluZyB0byBpbml0YWxpemUgaXRzZWxmLiBUaGlzIG1lYW5zIHRo
ZSBsaXN0IHdvdWxkIGJlCj4gdW5pdGlhbGl6ZWQgYW5kIHJlc3VsdCBpbiBhIGNyYXNoLgo+IAo+
IFRoYW5rZnVsbHksIHdlIG9ubHkgYWxsb3cgSVRTIGZvciB0aGUgaGFyZHdhcmUgZG9tYWluLiBT
byB0aGUgY3Jhc2ggaXMKPiBub3QgYSBzZWN1cml0eSBpc3N1ZS4gRml4IGl0IGJ5IGNoZWNraW5n
IHdoZXRoZXIgdGhlIGxpc3QgdGhlIE5VTEwuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAKPiBDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL3ZnaWMt
djMtaXRzLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy12My1pdHMuYyBiL3hlbi9hcmNoL2FybS92
Z2ljLXYzLWl0cy5jCj4gaW5kZXggMzIwNjFjNmIwMy4uOWVkZDk3YzRlNyAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC9hcm0vdmdpYy12My1pdHMuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS92Z2ljLXYz
LWl0cy5jCj4gQEAgLTE1NDgsNiArMTU0OCwxMCBAQCB2b2lkIHZnaWNfdjNfaXRzX2ZyZWVfZG9t
YWluKHN0cnVjdCBkb21haW4gKmQpCj4gIHsKPiAgICAgIHN0cnVjdCB2aXJ0X2l0cyAqcG9zLCAq
dGVtcDsKPiAgCj4gKyAgICAvKiBDb3BlIHdpdGggdW5pdGlhbGl6ZWQgdklUUyAqLwo+ICsgICAg
aWYgKCBsaXN0X2hlYWRfaXNfbnVsbCgmZC0+YXJjaC52Z2ljLnZpdHNfbGlzdCkgKQo+ICsgICAg
ICAgIHJldHVybjsKPiArCj4gICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoIHBvcywgdGVt
cCwgJmQtPmFyY2gudmdpYy52aXRzX2xpc3QsIHZpdHNfbGlzdCApCj4gICAgICB7Cj4gICAgICAg
ICAgbGlzdF9kZWwoJnBvcy0+dml0c19saXN0KTsKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
