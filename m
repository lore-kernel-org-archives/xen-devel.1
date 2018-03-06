From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 24/57] ARM: timer: Handle level triggered
	IRQs correctly
Date: Tue, 6 Mar 2018 17:20:32 +0000
Message-ID: <6e53f2ad-20f7-2af0-0cb4-61706cfa67ed@arm.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-25-andre.przywara@linaro.org>
 <fd911249-cc73-977b-9176-b5a20ae569ef@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lh2b=f4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1etGGX-0002dp-1k
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 17:20:41 +0000
In-Reply-To: <fd911249-cc73-977b-9176-b5a20ae569ef@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDMvMTggMTc6MTUsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBPbiAwNS8wMy8xOCAxNjow
MywgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4+IMKgIC8qCj4+IMKgwqAgKiBBcmNoIHRpbWVyIGlu
dGVycnVwdCByZWFsbHkgb3VnaHQgdG8gYmUgbGV2ZWwgdHJpZ2dlcmVkLCBzaW5jZSB0aGUKPj4g
wqDCoCAqIGRlc2lnbiBvZiB0aGUgdGltZXIvY29tcGFyYXRvciBtZWNoYW5pc20gaXMgYmFzZWQg
YXJvdW5kIHRoYXQKPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2Fy
Y2gvYXJtL3RyYXBzLmMKPj4gaW5kZXggNzQxMWJmZjdhNy4uMDcxMzcyM2JiNyAxMDA2NDQKPj4g
LS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMK
Pj4gQEAgLTIwMjQsNiArMjAyNCwxMiBAQCBzdGF0aWMgdm9pZCBlbnRlcl9oeXBlcnZpc29yX2hl
YWQoc3RydWN0IAo+PiBjcHVfdXNlcl9yZWdzICpyZWdzKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKCBjdXJyZW50LT5hcmNoLmhjcl9lbDIgJiBIQ1JfVkEgKQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjdXJyZW50LT5hcmNoLmhjcl9lbDIgPSBSRUFEX1NZU1JFRyhIQ1JfRUwyKTsK
Pj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogV2UgbmVlZCB0byB1
cGRhdGUgdGhlIHN0YXRlIG9mIG91ciBlbXVsYXRlZCBkZXZpY2VzIHVzaW5nIAo+PiBsZXZlbAo+
PiArwqDCoMKgwqDCoMKgwqDCoCAqIHRyaWdnZXJlZCBpbnRlcnJ1cHRzIGJlZm9yZSBzeW5jaW5n
IGJhY2sgdGhlIFZHSUMgc3RhdGUuCj4+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4+ICvCoMKgwqDC
oMKgwqDCoCB2dGltZXJfc3luYyhjdXJyZW50KTsKPiAKPiBBbSBJIHdvbmRlcmluZyBpZiBpdCB3
b3VsZCBiZSB3b3J0aCB0byAjaWZkZWYgdGhlIGNvZGUgc28gaXQgaXMgb25seSAKPiB1c2VkIGZv
ciB0aGUgbmV3IHZHSUM/IEFmdGVyIGFsbCwgdGhpcyB3aWxsIGJlIGEgbm9wIGZvciBpdCwgcmln
aHQ/CgpBbHNvLCBJIHdvdWxkIGxpa2UgdG8gc2VlIGEgVE9ETyBpbiB0aGUgY29kZSBhbmQgdGhl
IGNvdmVyIGxldHRlciBhYm91dCAKb3B0aW1pemluZyB0aGlzIChzZWUgUkZDIHBhdGNoICMxNyk6
CgoiSSBhbSBhIGJpdCB3b3JyeSBhYm91dCByZS1zYW1wbGluZyB0aGUgdmlydHVhbCBpbnRlcnJ1
cHQgc3RhdGUgYXQgZXZlcnkgCnRyYXBzLiBJdCBtaWdodCBiZSB3b3J0aCB0aGlua2luZyB0byBk
byB0aGUgcmUtc2FtcGxlIHdoZW4gc3luY2luZyB0aGUgCkxScyAoYXMgeW91IGRvIGZvciBIVyBs
ZXZlbCBpbnRlcnJ1cHQgaW4gcGF0Y2ggIzI1KS4gUHJvYmFibHkgb25jZSB3ZSAKZ2V0IHRoZSBu
ZXcgdkdJQyBtZXJnZWQuIgoKSXQgaXMgbm90IGEgZGVhbCBicmVha2VyIHJpZ2h0IG5vdy4gQnV0
IEkgZG9uJ3Qgd2FudCBzZWUgdG8gYmUgZm9yZ290dGVuIApvbmNlIGFmdGVyIHdlIG1lcmdlIGl0
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
