From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 7/9] xen/gntdev: Implement dma-buf export
 functionality
Date: Thu, 7 Jun 2018 18:30:06 -0400
Message-ID: <b7f27688-f627-3fd9-9298-e02e6f35ca1e__26617.278942331$1528410303$gmane$org@oracle.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-8-andr2000@gmail.com>
 <96dd30f5-6ac6-498f-06e7-352e46994576@oracle.com>
 <117e05b3-69f6-b879-50d9-0cddd8e4c313@gmail.com>
 <4b37bbe1-6c5c-1941-bac0-2c7ba88af3e3@oracle.com>
 <d83a356c-f7a5-bce1-cafd-a52e736570fb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6krd=iz=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fR3MP-0007Ry-6p
 for xen-devel@lists.xenproject.org; Thu, 07 Jun 2018 22:26:25 +0000
In-Reply-To: <d83a356c-f7a5-bce1-cafd-a52e736570fb@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDcvMjAxOCAwNDo0NCBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDYvMDcvMjAxOCAxMjo0OCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwNi8w
Ni8yMDE4IDA4OjEwIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IE9uIDA2
LzA1LzIwMTggMDE6MDcgQU0sIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+PiBPbiAwNi8wMS8y
MDE4IDA3OjQxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4KPj4+PiArCj4+
Pj4gK3N0YXRpYyBzdHJ1Y3Qgc2dfdGFibGUgKgo+Pj4+ICtkbWFidWZfZXhwX29wc19tYXBfZG1h
X2J1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQo+Pj4+ICt7Cj4+
Pj4gK8KgwqDCoCBzdHJ1Y3QgZ250ZGV2X2RtYWJ1Zl9hdHRhY2htZW50ICpnbnRkZXZfZG1hYnVm
X2F0dGFjaCA9Cj4+Pj4gYXR0YWNoLT5wcml2Owo+Pj4+ICvCoMKgwqAgc3RydWN0IGdudGRldl9k
bWFidWYgKmdudGRldl9kbWFidWYgPSBhdHRhY2gtPmRtYWJ1Zi0+cHJpdjsKPj4+PiArwqDCoMKg
IHN0cnVjdCBzZ190YWJsZSAqc2d0Owo+Pj4+ICsKPj4+PiArwqDCoMKgIHByX2RlYnVnKCJNYXBw
aW5nICVkIHBhZ2VzIGZvciBkZXYgJXBcbiIsCj4+Pj4gZ250ZGV2X2RtYWJ1Zi0+bnJfcGFnZXMs
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgYXR0YWNoLT5kZXYpOwo+Pj4+ICsKPj4+PiArwqDCoMKg
IGlmIChXQVJOX09OKGRpciA9PSBETUFfTk9ORSB8fCAhZ250ZGV2X2RtYWJ1Zl9hdHRhY2gpKQo+
Pj4+Cj4+Pj4gV0FSTl9PTl9PTkNFLiBIZXJlIGFuZCBlbHNld2hlcmUuCj4+PiBXaHk/IFRoZSBV
QVBJIG1heSBiZSB1c2VkIGJ5IGRpZmZlcmVudCBhcHBsaWNhdGlvbnMsIHRodXMgd2UgbWlnaHQK
Pj4+IGxvc2Ugd2FybmluZ3MgZm9yIHNvbWUgb2YgdGhlbS4gSGF2aW5nIFdBUk5fT04gd2lsbCBz
aG93IHByb2JsZW1zCj4+PiBmb3IgbXVsdGlwbGUgdXNlcnMsIG5vdCBmb3IgdGhlIGZpcnN0IG9u
ZS4KPj4+IERvZXMgdGhpcyBtYWtlIHNlbnNlIHRvIHN0aWxsIHVzZSBXQVJOX09OPwo+Pgo+PiBK
dXN0IGFzIHdpdGggcHJfZXJyIGNhbGwgc29tZXdoZXJlIGVsc2UgdGhlIGNvbmNlcm4gaGVyZSBp
cyB0aGF0Cj4+IHVzZXJsYW5kICh3aGljaCBJIHRoaW5rIGlzIHdoZXJlIHRoaXMgaXMgZXZlbnR1
YWxseSBjYWxsZWQgZnJvbT8pIG1heQo+PiBpbnRlbnRpb25hbGx5IHRyaWdnZXIgdGhlIGVycm9y
LCBmbG9vZGluZyB0aGUgbG9nLgo+Pgo+PiBBbmQgZXZlbiB0aGlzIGlzIG5vdCBkaXJlY3RseSBj
YWxsZWQgZnJvbSB1c2VybGFuZCB0aGVyZSBpcyBzdGlsbCBhCj4+IHBvc3NpYmlsaXR5IG9mIHRy
aWdnZXJpbmcgdGhpcyBlcnJvciBtdWx0aXBsZSB0aW1lcy4KPiBPaywgd2lsbCB1c2UgV0FSTl9P
Tl9PTkNFCgoKSW4gZmFjdCwgaXMgdGhlcmUgYSByZWFzb24gdG8gdXNlIFdBUk4gYXQgYWxsPyBE
b2VzIHRoaXMgY29uZGl0aW9uCmluZGljYXRlIHNvbWUgc29ydCBvZiBpbnRlcm5hbCBpbmNvbnNp
c3RlbmN5L2Vycm9yPwoKLWJvcmlzCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
