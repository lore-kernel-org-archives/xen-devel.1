From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: vpsci: Move PSCI function
 dispatching from vsmc.c to vpsci.c
Date: Wed, 31 Jan 2018 16:57:00 +0200
Message-ID: <bda47e33-5fbc-b110-91c5-f7200bd42285@epam.com>
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
 <d0fa1a65-48e0-866a-d941-ae5071e72025@epam.com>
 <da7adce5-ef8f-a5c6-125e-1d37663afcab@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <da7adce5-ef8f-a5c6-125e-1d37663afcab@linaro.org>
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

CgpPbiAzMS4wMS4xOCAxNjo1NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgoKPj4+IE9uIDMxLzAxLzE4
IDExOjMyLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+Pj4gSSB0aG91Z2h0IGFib3V0IHZw
c2NpLmgsIGJ1dCBiYXNpY2FsbHkgeW91IHdpbGwgaGF2ZSBvbmx5IDIgCj4+Pj4+IGZ1bmN0aW9u
cyBpbiBpdCBhbmQKPj4+Pj4gdGhlIG51bWJlciBvZiBQU0NJIGNhbGxzLiBUaGF0J3MgaXQuCj4+
Pj4KPj4+PiBJc8KgIHRoaXMgcmVhbGx5IGEgcHJvYmxlbT8gSXQgaXMgcXVpdGUgbmF0dXJhbCB0
byBmaW5kIGRlY2xhcmF0aW9ucyAKPj4+PiBmb3Igc29tZXRoaW5nLmMgaW4gc29tZXRoaW5nLmgu
IEJ5IG1vdmluZyBkZWNsYXJhdGlvbiBpbnRvIGRpZmZlcmVudCAKPj4+PiBmaWxlLCB5b3UgYXJl
IGhpZGluZyBpdCBmcm9tIGFueW9uZSB3aG8gZG9lcyBub3QgY2Fycnkgc2FjcmVkIAo+Pj4+IGtu
b3dsZWRnZSAob3IgdXNlIGdyZXAvY3Njb3BlLCB5ZXMpLgo+Pj4+IEFuZCB0aGVuLCB3aGVuIHBl
b3BsZSBkZWNpZGUgdG8gZXh0ZW5kIHNvbWV0aGluZy5jIHRoZXkgY29udGludWUgdG8gCj4+Pj4g
cHV0IGRlY2xhcmF0aW9ucyBpbnRvIGluYXBwcm9wcmlhdGUuaC4gSnVzdCBsb29rIGF0IHByb2Nl
c3Nvci5oIGFzIGEgCj4+Pj4gZ29vZCBleGFtcGxlLiBBbGwgZnVuY3Rpb25zIGl0IGRlZmluZSBh
cmUgaW1wbGVtZW50ZWQgZWl0aGVyIGluIAo+Pj4+IHRyYXBzLmMgb3IgZG9tYWluLmMuIEJ1dCBm
dW5jdGlvbnMgZnJvbSBwcm9jZXNzb3IuYyBhcmUgZGVmaW5lZCBpbiAKPj4+PiBwcm9jaW5mby5o
Lgo+Pj4+IEkgY2FuIHRlbGwgZm9yIHN1cmUsIHRoYXQgdGhpcyBjb25mdXNlcyBuZXdiaWVzLgo+
Pj4+Cj4+Pj4KPj4+Pj4gU28gaXQgaXMgbm90IGdvaW5nIHRvIGhlbHAgdG8gdXBkYXRlIGJlY2F1
c2UgdGhlIGhlYWRlciB3aWxsIAo+Pj4+PiB1bmxpa2VseSBuZWVkIHRvCj4+Pj4+IGNoYW5nZSB3
aGVuIGFkZGluZyBuZXcgUFNDSSBjYWxsLgo+Pj4+Cj4+Pj4gWWVzLiBCdXQgYXQgbGVhc3Qgd2Ug
Y2FuIHB1dCBjb21tZW50IGFib3ZlIHN3aXRjaChmaWQpOgo+Pj4+Cj4+Pj4gLyogUGxlYXNlIGRv
bid0IGZvcmdldCB0byB1cGRhdGUgY2FsbCBjb3VudCBpbiAodilwc2NpLmggKi8KPj4+Cj4+PiBT
ZWUgbXkgYW5zd2VyIG9uIG15IG93biBlLW1haWwgSSBzZW50IGZldyBtaW51dGVzIGFnby4gSSBz
YWlkIEkgd2lsbCAKPj4+IGNyZWF0ZSBhIHRoZSB2cHNjaS5oLgo+Pj4KPj4KPj4gSSBjYW4ndCBm
aW5kIGl0IGFueXdoZXJlLiBJIGV2ZW4gdHJpZWQgTWFya21haWwuIFdvdWxkIHlvdSBwbGVhc2Ug
Cj4+IHBvaW50IGl0IHRvIG1lPwo+IAo+IEkgd3JvdGUgaXQgc29tZXdoZXJlIGFuZCB0aG91Z2h0
IEkgc2VudCBidXQgSSBjYW4ndCBmaW5kIGl0IDovLiBTb3JyeSAKPiBmb3IgdGhhdC4KPiAKQWgs
IEkgc2VlLiBJdCBpcyBva2F5LgoKPiBJIHdhcyBzYXlpbmcgYWZ0ZXIgc29tZSB0aG91Z2h0LCBJ
IHdpbGwgY3JlYXRlIGEgaGVhZGVyIHZwc2ljLmggd2l0aCAKPiBudW1iZXIgaW4gaXQuCj4gCj4g
SSB3aWxsIGFsc28gYWRkIGEgY29tbWVudCBhcyB5b3Ugc3VnZ2VzdGVkLgoKVGhhbmtzLiBJJ20g
ZmluZSB3aXRoIHRoaXMuCgoKCi0tIApWb2xvZHlteXIgQmFiY2h1awoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
