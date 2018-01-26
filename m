From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH 2/3] xen/arm: vsmc: Don't implement function
 ID that doesn't exist
Date: Fri, 26 Jan 2018 20:12:18 +0200
Message-ID: <d6afcb5f-d4f2-e589-77c3-5c073386bc19@epam.com>
References: <20180124183445.23705-1-julien.grall@linaro.org>
 <20180124183445.23705-3-julien.grall@linaro.org>
 <994b394e-5851-eb5b-39e5-f58bf94fd460@epam.com>
 <bd753735-bcc8-74b0-1b35-0c9dd0dbdcac@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <bd753735-bcc8-74b0-1b35-0c9dd0dbdcac@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>, xen-devel@lists.xen.org
Cc: sstabellini@kernel.org, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyNi4wMS4xOCAyMDowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDI2LzAx
LzE4IDE4OjAzLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20tYXJtL3NtY2NjLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3NtY2NjLmgKPj4+
IGluZGV4IGY1NDNkZWEwYmIuLjMwMzUxNzQ1OWYgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vaW5jbHVk
ZS9hc20tYXJtL3NtY2NjLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vc21jY2MuaAo+
Pj4gQEAgLTgyLDkgKzgyLDIzIEBAIHN0YXRpYyBpbmxpbmUgdWludDMyX3Qgc21jY2NfZ2V0X293
bmVyKHJlZ2lzdGVyX3QgCj4+PiBmdW5jaWQpCj4+PiDCoCAjZGVmaW5lIEFSTV9TTUNDQ19PV05F
Ul9UUlVTVEVEX09TX0VORMKgIDYzCj4+PiDCoCAvKiBMaXN0IG9mIGdlbmVyaWMgZnVuY3Rpb24g
bnVtYmVycyAqLwo+Pj4gLSNkZWZpbmUgQVJNX1NNQ0NDX0ZVTkNfQ0FMTF9DT1VOVMKgwqDCoMKg
wqDCoCAweEZGMDAKPj4+IC0jZGVmaW5lIEFSTV9TTUNDQ19GVU5DX0NBTExfVUlEwqDCoMKgwqDC
oMKgwqDCoCAweEZGMDEKPj4+IC0jZGVmaW5lIEFSTV9TTUNDQ19GVU5DX0NBTExfUkVWSVNJT07C
oMKgwqAgMHhGRjAzCj4+IFNvLCBJIHRoaW5nIGl0IGlzIGJldHRlIHRvIGxlYXZlCj4+ICNkZWZp
bmUgQVJNX1NNQ0NDX0ZVTkNfQ0FMTF8qCj4+IGFuZCBpbnRyb2R1Y2UKPiAKPiBJIGFtIG9rIHRv
IHVzZSBGSUQsIGJ1dCBJIGRvbid0IHNlZSBhbnkgcmVhc29uIHRvIGtlZXAgQVJNX1NNQ0NDX0ZV
TkNfKiAKPiBvbmUgYXJvdW5kLiBOby1vbmUgY2FuIHVzZSB0aGVtIGRpcmVjdGx5IGluIFhlbiBh
bmQgdGhpcyB3b3VsZCBhZGQgCj4gY29uZnVzaW9uLgoKUmlnaHQuIFNvIHlvdSBjYW4gbnVrZSB0
aGVtLgpBbm90aGVyIGlkZWEgaXMgdG8gbGVhdmUgb25seSBvbmUgZGVmaW5pdGlvbiBhbmQgdXNl
IGl0IGxpa2UgdGhpczoKCiAgQVJNX1NNQ0NDX0ZJRF9DQUxMKENPVU5ULCBIWVBFUlZJU09SKQoK
VGhpcyB3aWxsIHJlZHVjZSBudW1iZXIgb2Ygc2ltaWxhciBtYWNybyBkZWZpbml0aW9ucy4gV2hh
dCBkbyB5b3UgdGhpbms/CgpJJ20gb2theSB3aXRoIGFueSB2YXJpYW50LgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
