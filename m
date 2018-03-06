From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC 06/11] fwnode xen spacific changes
Date: Tue, 6 Mar 2018 14:22:55 +0000
Message-ID: <602c0ad9-2868-0720-8937-ec6b9e924de0@linaro.org>
References: <20180102092809.1841-1-manish.jaggi@linaro.org>
 <20180102092809.1841-7-manish.jaggi@linaro.org>
 <521998b8-1179-bc87-db7b-a4e3aee0c644@linaro.org>
 <e83d1ac0-48c1-92f9-590f-b894bc1f43f0@linaro.org>
 <b9b897e0-a02a-f95a-fd7a-7b367cb6ed5b@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=z3td=f4=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1etDUa-0000Zg-PE
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 14:23:00 +0000
Received: by mail-wm0-x241.google.com with SMTP id z81so23097214wmb.4
 for <xen-devel@lists.xenproject.org>; Tue, 06 Mar 2018 06:22:59 -0800 (PST)
In-Reply-To: <b9b897e0-a02a-f95a-fd7a-7b367cb6ed5b@caviumnetworks.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>, Manish Jaggi <manish.jaggi@linaro.org>, xen-devel@lists.xenproject.org, sameer.goel@linaro.org, andre.przywara@linaro.org
Cc: Jan Beulich <JBeulich@suse.com>, manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNi8wMy8xOCAxMzo0NCwgTWFuaXNoIEphZ2dpIHdyb3RlOgo+IEhpIEp1bGllbiwKPiAK
PiAKPiBPbiAwMS8xOS8yMDE4IDEyOjIxIEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9kZXZpY2UuaCBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vZGV2aWNlLmgKPj4+IGluZGV4IDY3MzRhZThlZmQuLmY3ODQ4MmNhMGMgMTAwNjQ0Cj4+PiAt
LS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2RldmljZS5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS9h
c20tYXJtL2RldmljZS5oCj4+PiBAQCAtNiw2ICs2LDggQEAKPj4+IMKgIGVudW0gZGV2aWNlX3R5
cGUKPj4+IMKgIHsKPj4+IMKgwqDCoMKgwqAgREVWX0RULAo+Pj4gK8KgwqDCoCBERVZfQUNQSSwK
Pj4KPj4gWW91IGRvbid0IHVzZSBERVZfQUNQSSBpbiB0aGlzIHBhdGNoLiBTbyB3aHkgaXMgdGhl
cmU/Cj4+Cj4+PiArwqDCoMKgIERFVl9QQ0ksCj4+PiDCoCB9Owo+Pj4gwqAgwqAgc3RydWN0IGRl
dl9hcmNoZGF0YSB7Cj4+PiBAQCAtMTgsOCArMjAsMTMgQEAgc3RydWN0IGRldmljZQo+Pj4gwqDC
oMKgwqDCoCBlbnVtIGRldmljZV90eXBlIHR5cGU7Cj4+PiDCoCAjaWZkZWYgQ09ORklHX0hBU19E
RVZJQ0VfVFJFRQo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm9mX25vZGU7
IC8qIFVzZWQgYnkgZHJpdmVycyBpbXBvcnRlZCAKPj4+IGZyb20gTGludXggKi8KPj4KPj4gQXMg
c2FpZCBvbiBTYW1lZXIncyBwYXRjaGVzLCBJIHdhcyBleHBlY3RpbmcgYSB0b2RvIGluIHRoZSBj
b2RlIGFmdGVyIAo+PiB0aGUgZGlzY3Vzc2lvbiBhYm91dCBsZWF2ZSBvZl9ub2RlIGhlcmUuIAo+
IEkgdGhpbmsgeW91IGFyZSByZWZlcnJpbmcgdG8gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wYXRjaC85OTYzMTA5Lwo+IENvdWxkIHlvdSBwbGVhc2UgYWRkIHdoYXQgVE9ETyB5b3Ugd2lz
aCB0byBhZGQgPwo+IAo+IEkgY291bGQgbm90IGZpbmTCoCBhbnkgZGlzY3Vzc2lvbiBvbiBvZl9u
b2RlIGluIHRoZSBtYWlsIGNoYWluClVzdWFsbHkgd2hlbiBJIHNheTogIkkgd2FzIGV4cGVjdGlu
ZyAuLi4iIGl0IG1lYW5zIHRoYXQgd2FzIGRpc2N1c3NlZCBvbiAKYSBwcmV2aW91cyB2ZXJzaW9u
LiBJbiB0aGF0IGNhc2UgaXQgaXMgIltSRkMgMi82XSBhcm02NDogQWRkIGRlZmluaXRpb25zIApm
b3IgZndub2RlX2hhbmRsZSIuCgpCZWxvdyB0aGUgY29udmVyc2F0aW9uOgoKTWU6IEkgYW0gYSBi
aXQgc3VycHJpc2VkIHlvdSBkb24ndCByZXdvcmsgc3RydWN0IGRldi4gQXMgb2Zfbm9kZSBpcyBu
b3cgCnJlZHVuZGFudCB3aXRoIGZ3bm9kZS4KClNhbWVlcjogSSBhZ3JlZSB0aGF0IHRoaXMgd2ls
bCBldmVudHVhbGx5IGJlIHJlbW92ZWQuIEkgaGF2ZSBrZXB0IHRoaXMgCmluIG5vdyBqdXN0IHRv
IG1haW50YWluIGNvbXBhdGliaWxpdHkKKGNvbXBpbGF0aW9uIGFuZCBvdGhlcndpc2UpIHdpdGgg
c21tdXYyIGRyaXZlci4gSSB3aWxsIGFkZCBhIGNvbW1lbnQgdG8gCmluZGljYXRlIHRoaXMuIFNv
IHRoYXQgaXQgY2FuCmJlIGVhc2lseSBpZGVudGlmaWVkIGFuZCByZW1vdmUgd2hlbiB3ZSBkbyBh
IGZpbmFsIGNsZWFudXAuIENhbiBJIHByZWZpeCAKdGhlIGNvbW1lbnQgd2l0aCB3aXRoIFhFTjpU
T0RPOj8KCk1lOiBBIFRPRE8gd291bGQgYmUgbmljZSwgYnV0IHdobyBpcyBnb2luZyB0byBkbyB0
aGUgcmV3b3JrPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
