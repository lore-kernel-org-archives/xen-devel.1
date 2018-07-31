From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools/gdbsx: fix 'g' packet response for
 64bit guests
Date: Tue, 31 Jul 2018 17:29:26 +0100
Message-ID: <3336b030-347a-89f4-a27d-c48a5f680c02@citrix.com>
References: <20180731023042.19031-1-marmarek@invisiblethingslab.com>
 <20180731090024.xbovqmyfrj6xiaid@citrix.com> <20180731161007.GR1371@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180731161007.GR1371@mail-itl>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDcvMTggMTc6MTAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPiBP
biBUdWUsIEp1bCAzMSwgMjAxOCBhdCAxMDowMDoyNEFNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+
PiBPbiBUdWUsIEp1bCAzMSwgMjAxOCBhdCAwNDozMDo0MkFNICswMjAwLCBNYXJlayBNYXJjenlr
b3dza2ktR8OzcmVja2kgd3JvdGU6Cj4+PiAtLS0gYS90b29scy9kZWJ1Z2dlci9nZGJzeC9neC9n
eF9sb2NhbC5jCj4+PiArKysgYi90b29scy9kZWJ1Z2dlci9nZGJzeC9neC9neF9sb2NhbC5jCj4+
PiBAQCAtNDUsOCArNDUsOCBAQCBwcm50XzMycmVncyhzdHJ1Y3QgeGdfZ2RiX3JlZ3MzMiAqcjMy
cCkKPj4+ICBzdGF0aWMgdm9pZAo+Pj4gIHBybnRfNjRyZWdzKHN0cnVjdCB4Z19nZGJfcmVnczY0
ICpyNjRwKQo+Pj4gIHsKPj4+IC0gICAgcHJpbnRmKCJyaXA6IlhHRjY0IiByc3A6IlhHRjY0IiBm
bGFnczoiWEdGNjQiXG4iLCByNjRwLT5yaXAsIHI2NHAtPnJzcCwKPj4+IC0gICAgICAgICAgIHI2
NHAtPnJmbGFncyk7Cj4+PiArICAgIHByaW50ZigicmlwOiJYR0Y2NCIgcnNwOiJYR0Y2NCIgZmxh
Z3M6JTA4eFxuIiwgcjY0cC0+cmlwLCByNjRwLT5yc3AsCj4+PiArICAgICAgICAgICByNjRwLT5l
ZmxhZ3MpOwo+PiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBpbnRyb2R1Y2UgWEdGMzIg
YW5kIFhHRk0zMiBpbiB0aGUgaGVhZGVyLgo+IEkgd2FzIGluc3BpcmVkIGJ5IHBybnRfMzJyZWdz
IGZ1bmN0aW9uLCB3aGljaCB1c2UgZXhwbGljaXQgJTA4eC4gU2hvdWxkCj4gaXQgYmUgY2hhbmdl
ZCB0aGVyZSB0b28gKHRvIFBSSXgzMik/IE90aGVyd2lzZSB0aGF0IHdvdWxkIGJlCj4gaW5jb25z
aXN0ZW50IChhbmQgbWF5YmUgd2FycmFudCBhIHRvdGFsbHkgc2VwYXJhdGUgY2xlYW51cCkuCgpU
YmgsIEknZCBzdGljayB3aXRoICUwOHggYmVjYXVzZSB0aGF0J3Mgd2hhdCB3ZSdkIGV4cGVjdCBp
biB0aGUKaHlwZXJ2aXNvci7CoCBJZiB5b3UnZCBsaWtlIGNsZWFuIHRoaW5ncyB1cCB0aGVuIHBs
ZWFzZSBkbywgYnV0IGl0IHdvdWxkCmJlIHJ1ZGUgdG8gYmxvY2sgdGhpcyBidWdmaXggb24gY2xl
YW51cC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
