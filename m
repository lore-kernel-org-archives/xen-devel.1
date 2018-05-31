From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 2/8] xen/balloon: Move common memory
 reservation routines to a module
Date: Thu, 31 May 2018 17:29:09 +0300
Message-ID: <4d386f6f-5212-1e42-abf7-1913f6218f05__27843.4972548441$1527776881$gmane$org@gmail.com>
References: <20180525153331.31188-1-andr2000@gmail.com>
 <20180525153331.31188-3-andr2000@gmail.com>
 <59ab73b0-967b-a82f-3b0d-95f1b0dc40a5@oracle.com>
 <89de7bdb-8759-419f-63bf-8ed0d57650f0@gmail.com>
 <edfa937b-3311-98db-2e6f-b4083598f796@oracle.com>
 <6ca7f428-eede-2c14-85fe-da4a20bcea0d@gmail.com>
 <5dd3378d-ac32-691e-1f80-7218a5d07fd6@oracle.com>
 <43c17501-8865-6e1f-1a92-d947755d8fa8@gmail.com>
 <c08c380d-17af-b668-acf2-8d8a94333aca@oracle.com>
 <b9046572-8802-b213-a74f-68f58a58ae6a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z1r2=is=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fOOZm-0005vl-Po
 for xen-devel@lists.xenproject.org; Thu, 31 May 2018 14:29:14 +0000
Received: by mail-lf0-x243.google.com with SMTP id r2-v6so10056438lff.4
 for <xen-devel@lists.xenproject.org>; Thu, 31 May 2018 07:29:13 -0700 (PDT)
In-Reply-To: <b9046572-8802-b213-a74f-68f58a58ae6a@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMzEvMjAxOCAxMDo1MSBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDUvMzAvMjAxOCAxMDoyNCBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwNS8z
MC8yMDE4IDAxOjQ2IFBNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IE9uIDA1
LzMwLzIwMTggMDY6NTQgUE0sIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+Pgo+Pj4+IEJUVywg
SSBhbHNvIHRoaW5rIHlvdSBjYW4gZnVydGhlciBzaW1wbGlmeQo+Pj4+IHhlbm1lbV9yZXNlcnZh
dGlvbl92YV9tYXBwaW5nXyogcm91dGluZXMgYnkgYmFpbGluZyBvdXQgcmlnaHQgYXdheSBpZgo+
Pj4+IHhlbl9mZWF0dXJlKFhFTkZFQVRfYXV0b190cmFuc2xhdGVkX3BoeXNtYXApLiBJbiBmYWN0
LCB5b3UgbWlnaHQgZXZlbgo+Pj4+IG1ha2UgdGhlbSBpbmxpbmVzLCBhbG9uZyB0aGUgbGluZXMg
b2YKPj4+Pgo+Pj4+IGlubGluZSB2b2lkIHhlbm1lbV9yZXNlcnZhdGlvbl92YV9tYXBwaW5nX3Jl
c2V0KHVuc2lnbmVkIGxvbmcgY291bnQsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlICoqcGFnZXMpCj4+Pj4gewo+Pj4+ICNpZmRlZiBD
T05GSUdfWEVOX0hBVkVfUFZNTVUKPj4+PiDCoMKgwqDCoMKgaWYgKCF4ZW5fZmVhdHVyZShYRU5G
RUFUX2F1dG9fdHJhbnNsYXRlZF9waHlzbWFwKSkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIF9feGVu
bWVtX3Jlc2VydmF0aW9uX3ZhX21hcHBpbmdfcmVzZXQoLi4uKQo+Pj4+ICNlbmRpZgo+Pj4+IH0K
Pj4+IEhvdyBhYm91dDoKPj4+Cj4+PiAjaWZkZWYgQ09ORklHX1hFTl9IQVZFX1BWTU1VCj4+PiBz
dGF0aWMgaW5saW5lIF9feGVubWVtX3Jlc2VydmF0aW9uX3ZhX21hcHBpbmdfcmVzZXQoc3RydWN0
IHBhZ2UgKnBhZ2UpCj4+PiB7Cj4+PiBbLi4uXQo+Pj4gfQo+Pj4gI2VuZGlmCj4+Pgo+Pj4gYW5k
Cj4+Pgo+Pj4gdm9pZCB4ZW5tZW1fcmVzZXJ2YXRpb25fdmFfbWFwcGluZ19yZXNldCh1bnNpZ25l
ZCBsb25nIGNvdW50LAo+Pj4gwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
c3RydWN0IHBhZ2UgKipwYWdlcykKPj4+IHsKPj4+ICNpZmRlZiBDT05GSUdfWEVOX0hBVkVfUFZN
TVUKPj4+IMKgwqDCoMKgIGlmICgheGVuX2ZlYXR1cmUoWEVORkVBVF9hdXRvX3RyYW5zbGF0ZWRf
cGh5c21hcCkpIHsKPj4+IMKgwqDCoMKgIMKgwqDCoCBpbnQgaTsKPj4+Cj4+PiDCoMKgwqDCoCDC
oMKgwqAgZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspCj4+PiDCoMKgwqDCoCDCoMKgwqAgwqDC
oMKgIF9feGVubWVtX3Jlc2VydmF0aW9uX3ZhX21hcHBpbmdfcmVzZXQocGFnZXNbaV0pOwo+Pj4g
wqDCoMKgwqAgfQo+Pj4gI2VuZGlmCj4+PiB9Cj4+Pgo+Pj4gVGhpcyB3YXkgSSBjYW4gdXNlIF9f
eGVubWVtX3Jlc2VydmF0aW9uX3ZhX21hcHBpbmdfcmVzZXQocGFnZSk7Cj4+PiBpbnN0ZWFkIG9m
IHhlbm1lbV9yZXNlcnZhdGlvbl92YV9tYXBwaW5nX3Jlc2V0KDEsICZwYWdlKTsKPj4KPj4gU3Vy
ZSwgdGhpcyBhbHNvIHdvcmtzLgo+IENvdWxkIHlvdSBwbGVhc2UgdGFrZSBsb29rIGF0IHRoZSBw
YXRjaCBhdHRhY2hlZCBpZiB0aGlzIGlzIHdoYXQgd2Ugd2FudD8KUGxlYXNlIGlnbm9yZSBpdCwg
aXQgaXMgdWdseSA7KQpJIGhhdmUgaW1wbGVtZW50ZWQgdGhpcyBhcyB5b3Ugc3VnZ2VzdGVkOgoK
c3RhdGljIGlubGluZSB2b2lkCnhlbm1lbV9yZXNlcnZhdGlvbl92YV9tYXBwaW5nX3VwZGF0ZSh1
bnNpZ25lZCBsb25nIGNvdW50LAogwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoMKg
IHN0cnVjdCBwYWdlICoqcGFnZXMsCiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
wqAgeGVuX3Bmbl90ICpmcmFtZXMpCnsKI2lmZGVmIENPTkZJR19YRU5fSEFWRV9QVk1NVQogwqDC
oMKgIGlmICgheGVuX2ZlYXR1cmUoWEVORkVBVF9hdXRvX3RyYW5zbGF0ZWRfcGh5c21hcCkpCiDC
oMKgwqAgwqDCoMKgIF9feGVubWVtX3Jlc2VydmF0aW9uX3ZhX21hcHBpbmdfdXBkYXRlKGNvdW50
LCBwYWdlcywgZnJhbWVzKTsKI2VuZGlmCn0KCj4+IC1ib3Jpcwo+Pgo+IFRoYW5rIHlvdSwKPiBP
bGVrc2FuZHIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
