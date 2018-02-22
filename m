From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 12/17] xen/arm: vpsci: Remove parameter
 'ver' from do_common_cpu
Date: Thu, 22 Feb 2018 16:12:07 +0000
Message-ID: <4a9bf0ce-0e6d-c7e8-8cb9-d5c955b71540@arm.com>
References: <20180215150248.28922-1-julien.grall@arm.com>
 <20180215150248.28922-13-julien.grall@arm.com>
 <6aa791f4-bacc-646f-ba83-e2ce702d7caf@linaro.org>
 <29f98a1b-ff56-b0c3-ed4d-53d9de949110@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <29f98a1b-ff56-b0c3-ed4d-53d9de949110@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, xen-devel@lists.xen.org
Cc: sstabellini@kernel.org, volodymyr_babchuk@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMS8wMi8xOCAxNjozNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDIxLzAy
LzE4IDE2OjI3LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPj4gSGksCj4gCj4gSGksCj4gCj4+IE9u
IDE1LzAyLzE4IDE1OjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBDdXJyZW50bHksIHRoZSBi
ZWhhdmlvciBvZiBkb19jb21tb25fY3B1IHdpbGwgc2xpZ2h0bHkgY2hhbmdlIGRlcGVuZGluZwo+
Pj4gb24gdGhlIFBTQ0kgdmVyc2lvbiBwYXNzZWQgaW4gcGFyYW1ldGVyLiBMb29raW5nIGF0IHRo
ZSBjb2RlLCBtb3JlIHRoZQo+Pj4gc3BlY2lmaWMgMC4yIGJlaGF2aW9yIGNvdWxkIG1vdmUgb3V0
IG9mIHRoZSBmdW5jdGlvbiBvciBhZGFwdGVkIGZvciAwLjE6Cj4+Pgo+Pj4gwqDCoMKgwqAgLSB4
MC9yMCBjYW4gYmUgdXBkYXRlZCBvbiBQU0NJIDAuMSBiZWNhdXNlIGdlbmVyYWwgcHVycG9zZSAK
Pj4+IHJlZ2lzdGVycwo+Pj4gwqDCoMKgwqAgYXJlIHVuZGVmaW5lZCB1cG9uIENQVSBvbi4KPj4K
Pj4gSXMgdGhhdCBleHBsaWNpdGx5IG1lbnRpb25lZCBzb21ld2hlcmUgaW4gdGhlIHNwZWM/IEkg
Y291bGRuJ3QgZmluZAo+PiBhbnl0aGluZyBpbiB0aGUgb3JpZ2luYWwgREVOMDAyMkEuIE9yIGlz
IHRoYXQgYmVjYXVzZSBpdCBkb2VzICpub3QqCj4+IG1lbnRpb24gYW55dGhpbmcgYWJvdXQgdGhl
IEdQUiBzdGF0ZSB0aGF0IHdlIGFyZSBzYWZlIHRvIHB1dCBhbnl0aGluZyBpbgo+PiB0aGVyZT8K
PiAKPiBCZWNhdXNlIG5vdGhpbmcgdGVsbHMgeW91IHdoYXQgaXMgdGhlIEdQUiBzdGF0ZSB3aGVu
IGJvb3RpbmcgYSBzZWNvbmRhcnkgCj4gQ1BVcyBpbiB0aGUgQVJNIEFSTS4gVGhpcyBpcyBkb25l
IHRvIHRoZSBzcGVjaWZpY2F0aW9uIHRvIGRlY2lkZSB3aGF0IAo+IHdvdWxkIGJlIHRoZSB2YWx1
ZS4KPiAKPiBUb2RheSBYZW4gd2lsbCB6ZXJvIHRoZW0sIGJ1dCBpdCBpcyBub3QgYmVjYXVzZSBv
ZiBzcGVjaWZpYyByZXF1aXJlbWVudHMgCj4ganVzdCB0byBhdm9pZCBsZWFrIGh5cGVydmlzb3Ig
Y29udGVudCBpbiB0aG9zZSByZWdpc3RlcnMuCgpJIGhhdmUgYWRkZWQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlOgoiVGhpcyB3YXMgZGVkdWNlZCBmcm9tIHRoZSBzcGVjIG5vdCBtZW50aW9uaW5nIHRo
ZSBzdGF0ZSBvZiBnZW5lcmFsIApwdXJwb3NlIHJlZ2lzdGVycyBvbiBDUFUgb24uIgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
