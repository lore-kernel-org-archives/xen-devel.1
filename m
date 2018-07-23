From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 0/8] xen: dma-buf support for grant device
Date: Mon, 23 Jul 2018 18:50:56 +0300
Message-ID: <5fc34b4b-3587-791a-d17c-7da955b393bd__44440.9460797489$1532361017$gmane$org@epam.com>
References: <20180720090150.24560-1-andr2000@gmail.com>
 <019c0eb6-8185-d888-ae6f-305ea2d44124@oracle.com>
 <df3e8c07-c8b4-cb12-32ad-119498be114b@epam.com>
 <80a074ac-91db-82db-d094-660d859cf903@epam.com>
 <9d2889f6-32d3-03d7-2a6d-341e691287b3@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ic5z=kh=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fhd7S-0001Ne-KU
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 15:51:31 +0000
In-Reply-To: <9d2889f6-32d3-03d7-2a6d-341e691287b3@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjMvMjAxOCAwNjoyMiBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA3LzIz
LzIwMTggMDk6MjYgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBPbiAwNy8y
My8yMDE4IDExOjM4IEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiBkYXRh
L3Vwc3RyZWFtL2xpbnV4LXhlbi9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmM6IEluIGZ1bmN0
aW9uCj4+Pj4g4oCYZ250ZGV2X2lvY3RsX2RtYWJ1Zl9leHBfZnJvbV9yZWZz4oCZOgo+Pj4+IC9k
YXRhL3Vwc3RyZWFtL2xpbnV4LXhlbi9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmM6NTAzOjY6
IHdhcm5pbmc6Cj4+Pj4g4oCYYXJncy5mZOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGlu
IHRoaXMgZnVuY3Rpb24KPj4+PiBbLVdtYXliZS11bmluaXRpYWxpemVkXQo+Pj4+ICDCoMKgICpm
ZCA9IGFyZ3MuZmQ7Cj4+Pj4gIMKgwqAgfn5+fl5+fn5+fn5+fgo+Pj4+IC9kYXRhL3Vwc3RyZWFt
L2xpbnV4LXhlbi9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmM6NDY3OjM1OiBub3RlOgo+Pj4+
IOKAmGFyZ3MuZmTigJkgd2FzIGRlY2xhcmVkIGhlcmUKPj4+PiAgwqDCoCBzdHJ1Y3QgZ250ZGV2
X2RtYWJ1Zl9leHBvcnRfYXJncyBhcmdzOwo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn4KPj4+IFN0
cmFuZ2VseSwgYnV0IG15IGkzODYgYnVpbGQgZ29lcyBzbW9vdGguCj4+PiBXaGljaCB2ZXJzaW9u
IG9mIGdjYyB5b3UgdXNlIGFuZCBjb3VsZCB5b3UgcGxlYXNlIGdpdmUgbWUgeW91cgo+Pj4gLmNv
bmZpZywgc28gSSBjYW4gdGVzdCB0aGUgc2FtZT8KPj4gTm93IEkgc2VlIHRoaXMgd2FybmluZyB3
aGljaCBzZWVtcyB0byBiZSBhIGZhbHNlIHBvc2l0aXZlLgo+PiBCb3JpcywgY291bGQgeW91IHBs
ZWFzZSBhcHBseSB0aGUgZm9sbG93aW5nOgo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4v
Z250ZGV2LWRtYWJ1Zi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jCj4+IGluZGV4IGU0
YzlmMWY3NDQ3Ni4uMDY4MGRiY2JhNjE2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3hlbi9nbnRk
ZXYtZG1hYnVmLmMKPj4gKysrIGIvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jCj4+IEBAIC00
OTUsNiArNDk1LDcgQEAgc3RhdGljIGludCBkbWFidWZfZXhwX2Zyb21fcmVmcyhzdHJ1Y3QgZ250
ZGV2X3ByaXYKPj4gKnByaXYsIGludCBmbGFncywKPj4gIMKgwqDCoMKgwqDCoMKgIGFyZ3MuZG1h
YnVmX3ByaXYgPSBwcml2LT5kbWFidWZfcHJpdjsKPj4gIMKgwqDCoMKgwqDCoMKgIGFyZ3MuY291
bnQgPSBtYXAtPmNvdW50Owo+PiAgwqDCoMKgwqDCoMKgwqAgYXJncy5wYWdlcyA9IG1hcC0+cGFn
ZXM7Cj4+ICvCoMKgwqDCoMKgwqAgYXJncy5mZCA9IC0xOwo+Pgo+PiAgwqDCoMKgwqDCoMKgwqAg
cmV0ID0gZG1hYnVmX2V4cF9mcm9tX3BhZ2VzKCZhcmdzKTsKPj4gIMKgwqDCoMKgwqDCoMKgIGlm
IChyZXQgPCAwKQo+Pgo+PiBvciBwbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHdhbnQgbWUgdG8g
cmVzZW5kIHdpdGggdGhpcyBmaXg/Cj4KPiBNaXNzZWQgdGhpcyBtZXNzYWdlLiBZZXMsIHRoaXMg
b2J2aW91c2x5IGZpeGVzIHRoZSBwcm9ibGVtLiBBbmQgaXQgaXMKPiBkdWUgdG8gdGhlIGNvZGUg
ZnJhZ21lbnQgdGhhdCBJIG1lbnRpb25lZCBpbiB0aGUgZWFybGllciByZXNwb25zZS4KPgo+IFdo
aWNoIHBhdGNoIGlzIHRoaXMgZm9yPyBJIGNhbiBhZGQgdGhpcyB3aGVuIGNvbW1pdHRpbmcuClRo
YW5rIHlvdSwgdGhpcyBpcyBmb3IgIltQQVRDSCB2NSA3LzhdIHhlbi9nbnRkZXY6IEltcGxlbWVu
dCBkbWEtYnVmIApleHBvcnQgZnVuY3Rpb25hbGl0eSIKPiAtYm9yaXMKVGhhbmsgeW91LApPbGVr
c2FuZHIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
