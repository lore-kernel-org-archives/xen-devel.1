From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH 3/3] xen/arm: vpsci: Move PSCI function
 dispatching from vsmc.c to vpsci.c
Date: Wed, 31 Jan 2018 14:54:40 +0000
Message-ID: <da7adce5-ef8f-a5c6-125e-1d37663afcab@linaro.org>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d0fa1a65-48e0-866a-d941-ae5071e72025@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@linaro.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAzMS8wMS8xOCAxNDoyOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gSGksCgpIaSBW
b2xvZHlteXIsCgo+IE9uIDMxLjAxLjE4IDEzOjM2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhp
LAo+Pgo+PiBPbiAzMS8wMS8xOCAxMTozMiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4g
SSB0aG91Z2h0IGFib3V0IHZwc2NpLmgsIGJ1dCBiYXNpY2FsbHkgeW91IHdpbGwgaGF2ZSBvbmx5
IDIgCj4+Pj4gZnVuY3Rpb25zIGluIGl0IGFuZAo+Pj4+IHRoZSBudW1iZXIgb2YgUFNDSSBjYWxs
cy4gVGhhdCdzIGl0Lgo+Pj4KPj4+IElzwqAgdGhpcyByZWFsbHkgYSBwcm9ibGVtPyBJdCBpcyBx
dWl0ZSBuYXR1cmFsIHRvIGZpbmQgZGVjbGFyYXRpb25zIAo+Pj4gZm9yIHNvbWV0aGluZy5jIGlu
IHNvbWV0aGluZy5oLiBCeSBtb3ZpbmcgZGVjbGFyYXRpb24gaW50byBkaWZmZXJlbnQgCj4+PiBm
aWxlLCB5b3UgYXJlIGhpZGluZyBpdCBmcm9tIGFueW9uZSB3aG8gZG9lcyBub3QgY2Fycnkgc2Fj
cmVkIAo+Pj4ga25vd2xlZGdlIChvciB1c2UgZ3JlcC9jc2NvcGUsIHllcykuCj4+PiBBbmQgdGhl
biwgd2hlbiBwZW9wbGUgZGVjaWRlIHRvIGV4dGVuZCBzb21ldGhpbmcuYyB0aGV5IGNvbnRpbnVl
IHRvIAo+Pj4gcHV0IGRlY2xhcmF0aW9ucyBpbnRvIGluYXBwcm9wcmlhdGUuaC4gSnVzdCBsb29r
IGF0IHByb2Nlc3Nvci5oIGFzIGEgCj4+PiBnb29kIGV4YW1wbGUuIEFsbCBmdW5jdGlvbnMgaXQg
ZGVmaW5lIGFyZSBpbXBsZW1lbnRlZCBlaXRoZXIgaW4gCj4+PiB0cmFwcy5jIG9yIGRvbWFpbi5j
LiBCdXQgZnVuY3Rpb25zIGZyb20gcHJvY2Vzc29yLmMgYXJlIGRlZmluZWQgaW4gCj4+PiBwcm9j
aW5mby5oLgo+Pj4gSSBjYW4gdGVsbCBmb3Igc3VyZSwgdGhhdCB0aGlzIGNvbmZ1c2VzIG5ld2Jp
ZXMuCj4+Pgo+Pj4KPj4+PiBTbyBpdCBpcyBub3QgZ29pbmcgdG8gaGVscCB0byB1cGRhdGUgYmVj
YXVzZSB0aGUgaGVhZGVyIHdpbGwgCj4+Pj4gdW5saWtlbHkgbmVlZCB0bwo+Pj4+IGNoYW5nZSB3
aGVuIGFkZGluZyBuZXcgUFNDSSBjYWxsLgo+Pj4KPj4+IFllcy4gQnV0IGF0IGxlYXN0IHdlIGNh
biBwdXQgY29tbWVudCBhYm92ZSBzd2l0Y2goZmlkKToKPj4+Cj4+PiAvKiBQbGVhc2UgZG9uJ3Qg
Zm9yZ2V0IHRvIHVwZGF0ZSBjYWxsIGNvdW50IGluICh2KXBzY2kuaCAqLwo+Pgo+PiBTZWUgbXkg
YW5zd2VyIG9uIG15IG93biBlLW1haWwgSSBzZW50IGZldyBtaW51dGVzIGFnby4gSSBzYWlkIEkg
d2lsbCAKPj4gY3JlYXRlIGEgdGhlIHZwc2NpLmguCj4+Cj4gCj4gSSBjYW4ndCBmaW5kIGl0IGFu
eXdoZXJlLiBJIGV2ZW4gdHJpZWQgTWFya21haWwuIFdvdWxkIHlvdSBwbGVhc2UgcG9pbnQgCj4g
aXQgdG8gbWU/CgpJIHdyb3RlIGl0IHNvbWV3aGVyZSBhbmQgdGhvdWdodCBJIHNlbnQgYnV0IEkg
Y2FuJ3QgZmluZCBpdCA6Ly4gU29ycnkgCmZvciB0aGF0LgoKSSB3YXMgc2F5aW5nIGFmdGVyIHNv
bWUgdGhvdWdodCwgSSB3aWxsIGNyZWF0ZSBhIGhlYWRlciB2cHNpYy5oIHdpdGggCm51bWJlciBp
biBpdC4KCkkgd2lsbCBhbHNvIGFkZCBhIGNvbW1lbnQgYXMgeW91IHN1Z2dlc3RlZC4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
