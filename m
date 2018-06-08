From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2 7/9] xen/gntdev: Implement dma-buf export
 functionality
Date: Fri, 8 Jun 2018 14:34:39 +0300
Message-ID: <0c820b7d-d9e5-8a60-b9fc-86eb3ca81df8__68.1008947596595$1528457602$gmane$org@gmail.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-8-andr2000@gmail.com>
 <96dd30f5-6ac6-498f-06e7-352e46994576@oracle.com>
 <117e05b3-69f6-b879-50d9-0cddd8e4c313@gmail.com>
 <4b37bbe1-6c5c-1941-bac0-2c7ba88af3e3@oracle.com>
 <d83a356c-f7a5-bce1-cafd-a52e736570fb@gmail.com>
 <b7f27688-f627-3fd9-9298-e02e6f35ca1e@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y3ku=i2=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fRFfI-0006jF-B5
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 11:34:44 +0000
Received: by mail-lf0-x243.google.com with SMTP id u4-v6so19587964lff.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jun 2018 04:34:42 -0700 (PDT)
In-Reply-To: <b7f27688-f627-3fd9-9298-e02e6f35ca1e@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDgvMjAxOCAwMTozMCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA2LzA3
LzIwMTggMDQ6NDQgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBPbiAwNi8w
Ny8yMDE4IDEyOjQ4IEFNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+PiBPbiAwNi8wNi8yMDE4
IDA4OjEwIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiBPbiAwNi8wNS8y
MDE4IDAxOjA3IEFNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Pj4+IE9uIDA2LzAxLzIwMTgg
MDc6NDEgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Pj4+PiArCj4+Pj4+ICtz
dGF0aWMgc3RydWN0IHNnX3RhYmxlICoKPj4+Pj4gK2RtYWJ1Zl9leHBfb3BzX21hcF9kbWFfYnVm
KHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQo+Pj4+PiArewo+Pj4+
PiArwqDCoMKgIHN0cnVjdCBnbnRkZXZfZG1hYnVmX2F0dGFjaG1lbnQgKmdudGRldl9kbWFidWZf
YXR0YWNoID0KPj4+Pj4gYXR0YWNoLT5wcml2Owo+Pj4+PiArwqDCoMKgIHN0cnVjdCBnbnRkZXZf
ZG1hYnVmICpnbnRkZXZfZG1hYnVmID0gYXR0YWNoLT5kbWFidWYtPnByaXY7Cj4+Pj4+ICvCoMKg
wqAgc3RydWN0IHNnX3RhYmxlICpzZ3Q7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBwcl9kZWJ1Zygi
TWFwcGluZyAlZCBwYWdlcyBmb3IgZGV2ICVwXG4iLAo+Pj4+PiBnbnRkZXZfZG1hYnVmLT5ucl9w
YWdlcywKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgYXR0YWNoLT5kZXYpOwo+Pj4+PiArCj4+Pj4+
ICvCoMKgwqAgaWYgKFdBUk5fT04oZGlyID09IERNQV9OT05FIHx8ICFnbnRkZXZfZG1hYnVmX2F0
dGFjaCkpCj4+Pj4+Cj4+Pj4+IFdBUk5fT05fT05DRS4gSGVyZSBhbmQgZWxzZXdoZXJlLgo+Pj4+
IFdoeT8gVGhlIFVBUEkgbWF5IGJlIHVzZWQgYnkgZGlmZmVyZW50IGFwcGxpY2F0aW9ucywgdGh1
cyB3ZSBtaWdodAo+Pj4+IGxvc2Ugd2FybmluZ3MgZm9yIHNvbWUgb2YgdGhlbS4gSGF2aW5nIFdB
Uk5fT04gd2lsbCBzaG93IHByb2JsZW1zCj4+Pj4gZm9yIG11bHRpcGxlIHVzZXJzLCBub3QgZm9y
IHRoZSBmaXJzdCBvbmUuCj4+Pj4gRG9lcyB0aGlzIG1ha2Ugc2Vuc2UgdG8gc3RpbGwgdXNlIFdB
Uk5fT04/Cj4+PiBKdXN0IGFzIHdpdGggcHJfZXJyIGNhbGwgc29tZXdoZXJlIGVsc2UgdGhlIGNv
bmNlcm4gaGVyZSBpcyB0aGF0Cj4+PiB1c2VybGFuZCAod2hpY2ggSSB0aGluayBpcyB3aGVyZSB0
aGlzIGlzIGV2ZW50dWFsbHkgY2FsbGVkIGZyb20/KSBtYXkKPj4+IGludGVudGlvbmFsbHkgdHJp
Z2dlciB0aGUgZXJyb3IsIGZsb29kaW5nIHRoZSBsb2cuCj4+Pgo+Pj4gQW5kIGV2ZW4gdGhpcyBp
cyBub3QgZGlyZWN0bHkgY2FsbGVkIGZyb20gdXNlcmxhbmQgdGhlcmUgaXMgc3RpbGwgYQo+Pj4g
cG9zc2liaWxpdHkgb2YgdHJpZ2dlcmluZyB0aGlzIGVycm9yIG11bHRpcGxlIHRpbWVzLgo+PiBP
aywgd2lsbCB1c2UgV0FSTl9PTl9PTkNFCj4KPiBJbiBmYWN0LCBpcyB0aGVyZSBhIHJlYXNvbiB0
byB1c2UgV0FSTiBhdCBhbGw/IERvZXMgdGhpcyBjb25kaXRpb24KPiBpbmRpY2F0ZSBzb21lIHNv
cnQgb2YgaW50ZXJuYWwgaW5jb25zaXN0ZW5jeS9lcnJvcj8KV2VsbCwgdGhlIGNvcnJlc3BvbmRp
bmcgZXJyb3JzIGFyZSBhbnl3YXlzIGhhbmRsZWQsIHNvIEkgd2lsbCByZW1vdmUgV0FSTgo+IC1i
b3Jpcwo+Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
