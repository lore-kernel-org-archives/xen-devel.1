From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: vpsci: Move PSCI function
 dispatching from vsmc.c to vpsci.c
Date: Wed, 31 Jan 2018 16:29:18 +0200
Message-ID: <d0fa1a65-48e0-866a-d941-ae5071e72025@epam.com>
References: <20180124183445.23705-1-julien.grall@linaro.org>
 <20180124183445.23705-4-julien.grall@linaro.org>
 <b60c341e-c3bc-8fe4-a7fd-96be076f8ebf@epam.com>
 <96603159-92dc-aabb-4f13-61730b4f3c54@linaro.org>
 <8c4765dc-c22f-8159-6145-d98dd9070222@epam.com>
 <4a1be819-7e7c-e37c-574e-5d3eb5e76dec@linaro.org>
 <c1db35c3-fdde-a6f0-589d-981569d57f99@epam.com>
 <da92d21d-6346-bd34-9f26-e8b2b1033b56@linaro.org>
 <8e999880-9d28-981e-465e-7b9d25ce5c37@epam.com>
 <CAEC2Cxrs+4-kbEofcp2NMuYH-qx2cyXpzJJ5nzoRBwGFGUynhw@mail.gmail.com>
 <852b174e-0c3d-e541-2de0-21361b0685b3@epam.com>
 <58fbf816-1c73-5f4e-a747-4d4520f55503@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <58fbf816-1c73-5f4e-a747-4d4520f55503@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@linaro.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzMS4wMS4xOCAxMzozNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDMxLzAxLzE4IDExOjMyLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+IEkgdGhvdWdodCBh
Ym91dCB2cHNjaS5oLCBidXQgYmFzaWNhbGx5IHlvdSB3aWxsIGhhdmUgb25seSAyIGZ1bmN0aW9u
cyAKPj4+IGluIGl0IGFuZAo+Pj4gdGhlIG51bWJlciBvZiBQU0NJIGNhbGxzLiBUaGF0J3MgaXQu
Cj4+Cj4+IElzwqAgdGhpcyByZWFsbHkgYSBwcm9ibGVtPyBJdCBpcyBxdWl0ZSBuYXR1cmFsIHRv
IGZpbmQgZGVjbGFyYXRpb25zIAo+PiBmb3Igc29tZXRoaW5nLmMgaW4gc29tZXRoaW5nLmguIEJ5
IG1vdmluZyBkZWNsYXJhdGlvbiBpbnRvIGRpZmZlcmVudCAKPj4gZmlsZSwgeW91IGFyZSBoaWRp
bmcgaXQgZnJvbSBhbnlvbmUgd2hvIGRvZXMgbm90IGNhcnJ5IHNhY3JlZCAKPj4ga25vd2xlZGdl
IChvciB1c2UgZ3JlcC9jc2NvcGUsIHllcykuCj4+IEFuZCB0aGVuLCB3aGVuIHBlb3BsZSBkZWNp
ZGUgdG8gZXh0ZW5kIHNvbWV0aGluZy5jIHRoZXkgY29udGludWUgdG8gCj4+IHB1dCBkZWNsYXJh
dGlvbnMgaW50byBpbmFwcHJvcHJpYXRlLmguIEp1c3QgbG9vayBhdCBwcm9jZXNzb3IuaCBhcyBh
IAo+PiBnb29kIGV4YW1wbGUuIEFsbCBmdW5jdGlvbnMgaXQgZGVmaW5lIGFyZSBpbXBsZW1lbnRl
ZCBlaXRoZXIgaW4gCj4+IHRyYXBzLmMgb3IgZG9tYWluLmMuIEJ1dCBmdW5jdGlvbnMgZnJvbSBw
cm9jZXNzb3IuYyBhcmUgZGVmaW5lZCBpbiAKPj4gcHJvY2luZm8uaC4KPj4gSSBjYW4gdGVsbCBm
b3Igc3VyZSwgdGhhdCB0aGlzIGNvbmZ1c2VzIG5ld2JpZXMuCj4+Cj4+Cj4+PiBTbyBpdCBpcyBu
b3QgZ29pbmcgdG8gaGVscCB0byB1cGRhdGUgYmVjYXVzZSB0aGUgaGVhZGVyIHdpbGwgdW5saWtl
bHkgCj4+PiBuZWVkIHRvCj4+PiBjaGFuZ2Ugd2hlbiBhZGRpbmcgbmV3IFBTQ0kgY2FsbC4KPj4K
Pj4gWWVzLiBCdXQgYXQgbGVhc3Qgd2UgY2FuIHB1dCBjb21tZW50IGFib3ZlIHN3aXRjaChmaWQp
Ogo+Pgo+PiAvKiBQbGVhc2UgZG9uJ3QgZm9yZ2V0IHRvIHVwZGF0ZSBjYWxsIGNvdW50IGluICh2
KXBzY2kuaCAqLwo+IAo+IFNlZSBteSBhbnN3ZXIgb24gbXkgb3duIGUtbWFpbCBJIHNlbnQgZmV3
IG1pbnV0ZXMgYWdvLiBJIHNhaWQgSSB3aWxsIAo+IGNyZWF0ZSBhIHRoZSB2cHNjaS5oLgo+IAoK
SSBjYW4ndCBmaW5kIGl0IGFueXdoZXJlLiBJIGV2ZW4gdHJpZWQgTWFya21haWwuIFdvdWxkIHlv
dSBwbGVhc2UgcG9pbnQgCml0IHRvIG1lPwoKWy4uLl0KCi0tIApWb2xvZHlteXIgQmFiY2h1awoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
