From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/8] xen/balloon: Move common memory
 reservation routines to a module
Date: Wed, 30 May 2018 15:24:13 -0400
Message-ID: <c08c380d-17af-b668-acf2-8d8a94333aca__42717.3744458289$1527716582$gmane$org@oracle.com>
References: <20180525153331.31188-1-andr2000@gmail.com>
 <20180525153331.31188-3-andr2000@gmail.com>
 <59ab73b0-967b-a82f-3b0d-95f1b0dc40a5@oracle.com>
 <89de7bdb-8759-419f-63bf-8ed0d57650f0@gmail.com>
 <edfa937b-3311-98db-2e6f-b4083598f796@oracle.com>
 <6ca7f428-eede-2c14-85fe-da4a20bcea0d@gmail.com>
 <5dd3378d-ac32-691e-1f80-7218a5d07fd6@oracle.com>
 <43c17501-8865-6e1f-1a92-d947755d8fa8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z2b3=ir=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fO8tE-0001Qb-0J
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 21:44:16 +0000
In-Reply-To: <43c17501-8865-6e1f-1a92-d947755d8fa8@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMzAvMjAxOCAwMTo0NiBQTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDUvMzAvMjAxOCAwNjo1NCBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pgo+Pgo+PiBC
VFcsIEkgYWxzbyB0aGluayB5b3UgY2FuIGZ1cnRoZXIgc2ltcGxpZnkKPj4geGVubWVtX3Jlc2Vy
dmF0aW9uX3ZhX21hcHBpbmdfKiByb3V0aW5lcyBieSBiYWlsaW5nIG91dCByaWdodCBhd2F5IGlm
Cj4+IHhlbl9mZWF0dXJlKFhFTkZFQVRfYXV0b190cmFuc2xhdGVkX3BoeXNtYXApLiBJbiBmYWN0
LCB5b3UgbWlnaHQgZXZlbgo+PiBtYWtlIHRoZW0gaW5saW5lcywgYWxvbmcgdGhlIGxpbmVzIG9m
Cj4+Cj4+IGlubGluZSB2b2lkIHhlbm1lbV9yZXNlcnZhdGlvbl92YV9tYXBwaW5nX3Jlc2V0KHVu
c2lnbmVkIGxvbmcgY291bnQsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IHBhZ2UgKipwYWdlcykKPj4gewo+PiAjaWZkZWYgQ09ORklHX1hFTl9IQVZF
X1BWTU1VCj4+IMKgwqDCoMKgaWYgKCF4ZW5fZmVhdHVyZShYRU5GRUFUX2F1dG9fdHJhbnNsYXRl
ZF9waHlzbWFwKSkKPj4gwqDCoMKgwqDCoMKgwqAgX194ZW5tZW1fcmVzZXJ2YXRpb25fdmFfbWFw
cGluZ19yZXNldCguLi4pCj4+ICNlbmRpZgo+PiB9Cj4gSG93IGFib3V0Ogo+Cj4gI2lmZGVmIENP
TkZJR19YRU5fSEFWRV9QVk1NVQo+IHN0YXRpYyBpbmxpbmUgX194ZW5tZW1fcmVzZXJ2YXRpb25f
dmFfbWFwcGluZ19yZXNldChzdHJ1Y3QgcGFnZSAqcGFnZSkKPiB7Cj4gWy4uLl0KPiB9Cj4gI2Vu
ZGlmCj4KPiBhbmQKPgo+IHZvaWQgeGVubWVtX3Jlc2VydmF0aW9uX3ZhX21hcHBpbmdfcmVzZXQo
dW5zaWduZWQgbG9uZyBjb3VudCwKPiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgc3RydWN0IHBhZ2UgKipwYWdlcykKPiB7Cj4gI2lmZGVmIENPTkZJR19YRU5fSEFWRV9QVk1N
VQo+IMKgwqDCoCBpZiAoIXhlbl9mZWF0dXJlKFhFTkZFQVRfYXV0b190cmFuc2xhdGVkX3BoeXNt
YXApKSB7Cj4gwqDCoMKgIMKgwqDCoCBpbnQgaTsKPgo+IMKgwqDCoCDCoMKgwqAgZm9yIChpID0g
MDsgaSA8IGNvdW50OyBpKyspCj4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgX194ZW5tZW1fcmVzZXJ2
YXRpb25fdmFfbWFwcGluZ19yZXNldChwYWdlc1tpXSk7Cj4gwqDCoMKgIH0KPiAjZW5kaWYKPiB9
Cj4KPiBUaGlzIHdheSBJIGNhbiB1c2UgX194ZW5tZW1fcmVzZXJ2YXRpb25fdmFfbWFwcGluZ19y
ZXNldChwYWdlKTsKPiBpbnN0ZWFkIG9mIHhlbm1lbV9yZXNlcnZhdGlvbl92YV9tYXBwaW5nX3Jl
c2V0KDEsICZwYWdlKTsKCgpTdXJlLCB0aGlzIGFsc28gd29ya3MuCgotYm9yaXMKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
