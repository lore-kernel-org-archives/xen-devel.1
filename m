From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 4/8] xen/arm: Add support for read-only
 foreign mappings
Date: Tue, 20 Nov 2018 17:27:43 +0200
Message-ID: <8171af3d-eb71-a74a-fb56-d13ebb63cd78@gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-5-julien.grall@arm.com>
 <CAC1WxdhvbNCfnaj=1pFJmqu-kwMuvvrW77FjOK22xAvaUAPqTA@mail.gmail.com>
 <27feb9a3-ad1b-aed9-7821-6367a3157ce9@arm.com>
 <CAC1Wxdhy1Dnh3_rLFSX0Uj8e4+BLsfWqCQc__U8+bSwd+pCSHg@mail.gmail.com>
 <f9d4248e-485d-e3a8-88bd-6fab6cabe313@arm.com>
 <CAC1Wxdib6qQk=iH9ODr9XuJo39bvY+4RJUXFHsurW77AqekHDg@mail.gmail.com>
 <0ce5b01c-eb4b-348d-6311-271ba1ca7947@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n0tg=n7=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gP7wK-00022h-0C
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 15:27:48 +0000
Received: by mail-ed1-x541.google.com with SMTP id f23so2284517edb.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Nov 2018 07:27:46 -0800 (PST)
In-Reply-To: <0ce5b01c-eb4b-348d-6311-271ba1ca7947@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKCkl0IGlzIG1lIGFnYWluLgoKT24gMTUuMTEuMTggMTc6MDUsIEp1bGll
biBHcmFsbCB3cm90ZToKPiBPbiAxMS8xNS8xOCAxOjE5IFBNLCBBbmRyaWkgQW5pc292IHdyb3Rl
Ogo+Pj4gU28gSSB3b3VsZCBwcmVmZXIgdG8gc3RpY2sgd2l0aCBfdCB3aGljaCBpcyBxdWl0ZSBj
b21tb24gd2l0aGluIHRoZSBwMm0KPj4+IGNvZGUgYmFzZSBzbyBmYXIuCj4+Cj4+IEkndmUgZm91
bmQgYSBzaW1pbGFyIGNvZGUgb25seSBpbiBvbmUgcGxhY2UgLSBwMm1fZ2V0X2VudHJ5KCkKPj4g
ZnVuY3Rpb24uIEFuZCBpdCBpcywgYXQgbGVhc3QsIHNvbWVob3cgY29tbWVudGVkIHRoZXJlOgo+
PiAuLi4KPj4gwqDCoMKgwqAgLyogQWxsb3cgdCB0byBiZSBOVUxMICovCj4+IMKgwqDCoMKgIHQg
PSB0ID86ICZfdDsKPj4KPj4gwqDCoMKgwqAgKnQgPSBwMm1faW52YWxpZDsKPj4gLi4uCj4KPiBB
bmQgaW4geDg2IGNvZGUuLi4KSSd2ZSB0YWtlbiBjYXJlIHRvIGxvb2sgaW50byB0aGUgeDg2IHAy
bSBjb2RlIGFib3V0IHRoYXQgY29uc3RydWN0aW9uLgoKSSd2ZSBmb3VuZCBpdCBpbiB4ODYnc8Kg
IGBwMm1fZ2V0X3BhZ2VfZnJvbV9nZm5gIGZ1bmN0aW9uLiBBbmQgaXQgbG9va3MgCnJlYXNvbmFi
bGUgb3ZlciB0aGVyZS4gQmVjYXVzZSB0aGF0IHZhbHVlIGlzIG5vdCBvbmx5IG1pZ2h0IGJlIHJl
dHVybmVkIAp0byBhIGNhbGxlci4gQnV0IGlzIG5lZWRlZCBieSB0aGUgZnVuY3Rpb24gY29kZSBp
dHNlbGYgdG8gdGFrZSBkZWNpc2lvbnMgCmFuZCBwYXNzaW5nIGl0IHRvIGNhbGxlZCBmdW5jdGlv
bnMgKHdoaWNoIGRvIG5vdCBkbyBhIGNoZWNrIGZvciB0aGUgbnVsbCAKcG9pbnRlcikuCgoKWW91
ciBjb2RlIChhcyB3ZWxsIGFzIGBwMm1fZ2V0X2VudHJ5YCkgZG9lcyBub3QgYWN0dWFsbHkgdXNl
IHRoYXQgdmFsdWUuIApTbyBJIHNlZSBubyBuZWVkIHRvIGNhbGN1bGF0ZSBvciBrZWVwIGl0IGlm
IGl0IGlzIG5vdCBuZWVkZWQgYnkgYSBjYWxsZXIuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5p
c292LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
