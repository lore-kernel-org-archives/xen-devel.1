From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v5 0/8] xen: dma-buf support for grant device
Date: Mon, 23 Jul 2018 11:22:59 -0400
Message-ID: <9d2889f6-32d3-03d7-2a6d-341e691287b3__613.009351264004$1532359294$gmane$org@oracle.com>
References: <20180720090150.24560-1-andr2000@gmail.com>
 <019c0eb6-8185-d888-ae6f-305ea2d44124@oracle.com>
 <df3e8c07-c8b4-cb12-32ad-119498be114b@epam.com>
 <80a074ac-91db-82db-d094-660d859cf903@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kryu=kh=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fhcfd-0007a7-Py
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 15:22:45 +0000
In-Reply-To: <80a074ac-91db-82db-d094-660d859cf903@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjMvMjAxOCAwOToyNiBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDcvMjMvMjAxOCAxMTozOCBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+
Cj4+PiBkYXRhL3Vwc3RyZWFtL2xpbnV4LXhlbi9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmM6
IEluIGZ1bmN0aW9uCj4+PiDigJhnbnRkZXZfaW9jdGxfZG1hYnVmX2V4cF9mcm9tX3JlZnPigJk6
Cj4+PiAvZGF0YS91cHN0cmVhbS9saW51eC14ZW4vZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5j
OjUwMzo2OiB3YXJuaW5nOgo+Pj4g4oCYYXJncy5mZOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxp
emVkIGluIHRoaXMgZnVuY3Rpb24KPj4+IFstV21heWJlLXVuaW5pdGlhbGl6ZWRdCj4+PiDCoMKg
ICpmZCA9IGFyZ3MuZmQ7Cj4+PiDCoMKgIH5+fn5efn5+fn5+fn4KPj4+IC9kYXRhL3Vwc3RyZWFt
L2xpbnV4LXhlbi9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmM6NDY3OjM1OiBub3RlOgo+Pj4g
4oCYYXJncy5mZOKAmSB3YXMgZGVjbGFyZWQgaGVyZQo+Pj4gwqDCoCBzdHJ1Y3QgZ250ZGV2X2Rt
YWJ1Zl9leHBvcnRfYXJncyBhcmdzOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+Cj4+IFN0cmFuZ2Vs
eSwgYnV0IG15IGkzODYgYnVpbGQgZ29lcyBzbW9vdGguCj4+IFdoaWNoIHZlcnNpb24gb2YgZ2Nj
IHlvdSB1c2UgYW5kIGNvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBtZSB5b3VyCj4+IC5jb25maWcsIHNv
IEkgY2FuIHRlc3QgdGhlIHNhbWU/Cj4gTm93IEkgc2VlIHRoaXMgd2FybmluZyB3aGljaCBzZWVt
cyB0byBiZSBhIGZhbHNlIHBvc2l0aXZlLgo+IEJvcmlzLCBjb3VsZCB5b3UgcGxlYXNlIGFwcGx5
IHRoZSBmb2xsb3dpbmc6Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1
Zi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jCj4gaW5kZXggZTRjOWYxZjc0NDc2Li4w
NjgwZGJjYmE2MTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jCj4g
KysrIGIvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jCj4gQEAgLTQ5NSw2ICs0OTUsNyBAQCBz
dGF0aWMgaW50IGRtYWJ1Zl9leHBfZnJvbV9yZWZzKHN0cnVjdCBnbnRkZXZfcHJpdgo+ICpwcml2
LCBpbnQgZmxhZ3MsCj4gwqDCoMKgwqDCoMKgwqAgYXJncy5kbWFidWZfcHJpdiA9IHByaXYtPmRt
YWJ1Zl9wcml2Owo+IMKgwqDCoMKgwqDCoMKgIGFyZ3MuY291bnQgPSBtYXAtPmNvdW50Owo+IMKg
wqDCoMKgwqDCoMKgIGFyZ3MucGFnZXMgPSBtYXAtPnBhZ2VzOwo+ICvCoMKgwqDCoMKgwqAgYXJn
cy5mZCA9IC0xOwo+Cj4gwqDCoMKgwqDCoMKgwqAgcmV0ID0gZG1hYnVmX2V4cF9mcm9tX3BhZ2Vz
KCZhcmdzKTsKPiDCoMKgwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkKPgo+IG9yIHBsZWFzZSBsZXQg
bWUga25vdyBpZiB5b3Ugd2FudCBtZSB0byByZXNlbmQgd2l0aCB0aGlzIGZpeD8KCgpNaXNzZWQg
dGhpcyBtZXNzYWdlLiBZZXMsIHRoaXMgb2J2aW91c2x5IGZpeGVzIHRoZSBwcm9ibGVtLiBBbmQg
aXQgaXMKZHVlIHRvIHRoZSBjb2RlIGZyYWdtZW50IHRoYXQgSSBtZW50aW9uZWQgaW4gdGhlIGVh
cmxpZXIgcmVzcG9uc2UuCgpXaGljaCBwYXRjaCBpcyB0aGlzIGZvcj8gSSBjYW4gYWRkIHRoaXMg
d2hlbiBjb21taXR0aW5nLgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
