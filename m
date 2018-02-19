From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 30/49] ARM: new VGIC: Add ENABLE
	registers handlers
Date: Mon, 19 Feb 2018 14:13:59 +0000
Message-ID: <40bf0aed-6005-b5b8-bc02-5a1f775ce469@arm.com>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
 <20180209143937.28866-31-andre.przywara@linaro.org>
 <0af8db8c-25f2-2472-5c36-e2891c53eec5@arm.com>
 <13390e85-23d5-a9d3-bab8-9ef4a3cc9d8f@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xtql=fn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1enmCl-0000i7-Uk
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 14:14:07 +0000
In-Reply-To: <13390e85-23d5-a9d3-bab8-9ef4a3cc9d8f@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxOS8wMi8xOCAxMjo0MSwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gSGksCgpIaSwKCj4g
T24gMTYvMDIvMTggMTY6NTcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMDkvMDIvMTggMTQ6
MzksIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+Pj4gK8KgwqDCoCBzcGluX2xvY2tfaXJxc2F2ZSgm
ZGVzYy0+bG9jaywgZmxhZ3MpOwo+Pj4gK8KgwqDCoCBpZiAoIGVuYWJsZSApCj4+PiArwqDCoMKg
IHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBnaWNfc2V0X2lycV90eXBlKGRlc2MsIGlycV90eXBlID09
IFZHSUNfQ09ORklHX0xFVkVMID8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBJUlFfVFlQRV9MRVZFTF9ISUdIIDogSVJRX1RZUEVfRURHRV9SSVNJTkcpOwo+Pgo+PiBJbmRl
bnRhdGlvbiBhbmQgSSB3b3VsZCBwcmVmZXIgYSBoZWxwZXIgdG8gY29udmVydCBiZXR3ZWVuIHRo
ZSB2Z2ljCj4+IHZhbHVlIGFuZCB0aGUgSVJRX1RZUEUuIFRoaXMgd291bGQgbWFrZSB0aGUgY29k
ZSBlYXNpZXIgdG8gcmVhZC4KPj4KPj4gQWxzbywgdGhpcyBjb2RlIGRvZXMgbm90IHJlcGxpY2F0
ZSBjb3JyZWN0bHkgdGhlIGN1cnJlbnQgdkdJQy4KPj4gZ2ljX3NldF9pcnFfdHlwZSBpcyBvbmx5
IGFsbG93ZWQgdG8gYmUgdXNlZCB3aGVuCj4+IGlycV9zZXRfdHlwZV9ieV9kb21haW4oZCkgcmV0
dXJucyB0cnVlLiBJZiB5b3UgY29uc2lkZXIgdGhpcyBjaGFuZ2UKPj4gdmFsaWQsIHRoZW4gSSB3
b3VsZCBsaWtlIHRvIGtub3cgd2h5Lgo+IAo+IFNvIHdoYXQgaXMvd2FzIHRoZSByYXRpb25hbGUg
Zm9yIG5vdCBhbGxvd2luZyBJUlEgdHlwZSBjaGFuZ2VzIGZvcgo+IG5vbi1wcml2aWxlZ2VkIGd1
ZXN0cz8gSWYgeW91IGFsbG93IHRvIHBhc3MgdGhyb3VnaCBhbiBoYXJkd2FyZSBJUlEgdG8gYQo+
IGd1ZXN0ICh3aGljaCBpcyB0aGUgY2FzZSB0aGlzIGZ1bmN0aW9uIGhhbmRsZXMpLCB0aGVuIEkg
ZG9uJ3Qgc2VlIHdoeSBhCj4gZ3Vlc3Qgd291bGQgbm90IGJlIGFsbG93ZWQgdG8gY2hhbmdlIHRo
ZSBjb25maWd1cmF0aW9uPyBJdCBzZWVtcyByYXRoZXIKPiBvZGQsIEkgZ3Vlc3MgaXQncyB1cCB0
byB0aGUgZ3Vlc3QgdG8ga25vdyB3aGljaCB0eXBlIG9mIElSUSB0aGlzIGlzPwoKSWYgeW91IGNh
biBhbnN3ZXIgdGhlIHF1ZXN0aW9uIG9uIHRvcCBvZiBpcnFfdHlwZV9zZXRfYnlfZG9tYWluIChp
LmUgCiJTZWUgd2hldGhlciBpdCBpcyBwb3NzaWJsZSB0byBsZXQgYW55IGRvbWFpbiBjb25maWd1
cmUgdGhlIHR5cGUpIHRoZW4gCndlIGNhbiByZW1vdmUgaXQuIFdlIGRlY2lkZWQgdG8gb25seSBh
bGxvdyBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiAKYmVjYXVzZSB3ZSB0cnVzdCBpdC4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
