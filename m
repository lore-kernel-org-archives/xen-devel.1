From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 23/49] ARM: new VGIC: Add IRQ sorting
Date: Tue, 13 Feb 2018 15:00:22 +0000
Message-ID: <d03f7866-16ad-04c1-d0dd-f93bfb66f8ac@arm.com>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
 <20180209143937.28866-24-andre.przywara@linaro.org>
 <6bd8fa89-99e7-1502-ef43-94233773ce83@arm.com>
 <23856658-34ab-4003-9e0e-c8906aedb4b1@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=nkxj=fh=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1elc4O-0005TZ-7M
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 15:00:32 +0000
In-Reply-To: <23856658-34ab-4003-9e0e-c8906aedb4b1@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMy8wMi8xOCAxNDo1NiwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9saXN0X3NvcnQuYyBiL3hlbi9jb21tb24vbGlzdF9zb3J0LmMKPj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi45YzVjYzU4ZTQzCj4+PiAt
LS0gL2Rldi9udWxsCj4+PiArKysgYi94ZW4vY29tbW9uL2xpc3Rfc29ydC5jCj4+PiBAQCAtMCww
ICsxLDE3MCBAQAo+Pj4gKy8qCj4+PiArICogbGlzdF9zb3J0LmM6IG1lcmdlIHNvcnQgaW1wbGVt
ZW50YXRpb24gZm9yIGxpbmtlZCBsaXN0cwo+Pj4gKyAqIENvcGllZCBmcm9tIHRoZSBMaW51eCBr
ZXJuZWwgKGxpYi9saXN0X3NvcnQuYykKPj4+ICsgKiAod2l0aG91dCBzcGVjaWZpYyBjb3B5cmln
aHQgbm90aWNlIHRoZXJlKQo+Pgo+PiBJIGNhbiBzZWUgeW91IG1vdmVkIGZyb20gTGludXggdG8g
WGVuIGNvZGluZyBzdHlsZS4gSXMgdGhlcmUgYW55IG90aGVyCj4+IGNoYW5nZXMgbWFkZT8KPiAK
PiBKdXN0IHRoZSBsaXN0IG9mIGluY2x1ZGUgZmlsZXMsIGJ1dCBJIGRpZG4ndCB0b3VjaCBhbnkg
YWN0dWFsIGNvZGUuCj4gV2lsbCBtZW50aW9uIHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGZv
ciB0aGlzIHNlcGFyYXRlIHBhdGNoLgoKQ2FuIHlvdSBrZWVwIHRoZSBsaXN0IGNvZGluZyBzdHls
ZSBpbiB0aGF0IGNhc2UgcGxlYXNlPwoKVGhhbmsgeW91LgoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
