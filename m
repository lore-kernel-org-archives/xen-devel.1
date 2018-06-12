From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v4 11/40] hw/xen: Use the IEC
 binary prefix definitions
Date: Tue, 12 Jun 2018 11:10:19 -1000
Message-ID: <8537ca07-2645-6c2c-5945-a91da035b474__6437.9735886634$1528867873$gmane$org@linaro.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
 <20180611011501.10235-12-f4bug@amsat.org>
 <15d222dd-d2e9-4855-62c6-f89f2ee59c52@linaro.org>
 <76aa5170-1d18-8799-6ff1-a7c0dba0b489@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4z3b=i6=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1fSqYc-0003c8-W2
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 21:10:27 +0000
Received: by mail-pl0-x243.google.com with SMTP id t12-v6so190859plo.7
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jun 2018 14:10:25 -0700 (PDT)
In-Reply-To: <76aa5170-1d18-8799-6ff1-a7c0dba0b489@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "open list:Block layer core" <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAxMTowNCBBTSwgRXJpYyBCbGFrZSB3cm90ZToKPiBPbiAwNi8xMi8yMDE4
IDAzOjUxIFBNLCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToKPj4gT24gMDYvMTAvMjAxOCAwMzox
NCBQTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4+PiDCoMKgwqDCoMKgIHhlbl9w
dl9wcmludGYoeGVuZGV2LCAxLCAidHlwZSBcIiVzXCIsIGZpbGVwcm90byBcIiVzXCIsIGZpbGVu
YW1lCj4+PiBcIiVzXCIsIgo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
IiBzaXplICUiIFBSSWQ2NCAiICglIiBQUklkNjQgIiBNQilcbiIsCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiIHNpemUgJSIgUFJJZDY0ICIgKCVsbHUgTUIpXG4iLAo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxrZGV2LT50eXBlLCBi
bGtkZXYtPmZpbGVwcm90bywgYmxrZGV2LT5maWxlbmFtZSwKPj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGJsa2Rldi0+ZmlsZV9zaXplLCBibGtkZXYtPmZpbGVfc2l6ZSA+
PiAyMCk7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBibGtkZXYtPmZp
bGVfc2l6ZSwgYmxrZGV2LT5maWxlX3NpemUgLyBNaUIpOwo+Pgo+PiBIYXZpbmcgdG8gY2hhbmdl
IHByaW50ZiBtYXJrdXAgaXMgZXhhY3RseSB3aHkgeW91IHNob3VsZG4ndCB1c2UgVUxMIGluIE1p
Qi4KPiAKPiBDb252ZXJzZWx5LCBNX0JZVEUgd2FzIGFscmVhZHkgVUxMLCBzbyBpZiB5b3UgZG9u
J3QgdXNlIGl0IGluIE1pQiwgeW91J2xsIGhhdmUKPiB0byBjaGFuZ2Ugb3RoZXIgcHJpbnRmIG1h
cmt1cCB3aGVyZSB5b3Ugd2VyZSBjaGFuZ2luZyB0aG9zZSB1c2VzLgo+IAo+IE9uZSBiZW5lZml0
IG9mIHVzaW5nIHRoZSB3aWRlc3QgcG9zc2libGUgdHlwZTogd2UgYXZvaWQgcmlzayBvZiBzaWxl
bnQKPiB0cnVuY2F0aW9uLsKgIFBvdGVudGlhbCBkb3duc2lkZXM6IHdhc3RlZCBwcm9jZXNzaW5n
IHRpbWUgKHdoZW4gMzIgYml0cyB3YXMKPiBzdWZmaWNpZW50KSwgYW5kIGNvbXBpbGVycyBtaWdo
dCBzdGFydCB3YXJuaW5nIHdoZW4gd2UgbmFycm93IGEgNjQtYml0IHZhbHVlCj4gaW50byBhIDMy
LWJpdCB2YXJpYWJsZSAoYnV0IEkgdGhpbmsgd2UgYWxyZWFkeSBpZ25vcmUgdGhhdCkuCj4gCj4g
T25lIGJlbmVmaXQgb2YgdXNpbmcgdGhlIG5hdHVyYWwgdHlwZSB0aGF0IGhvbGRzIHRoZSB2YWx1
ZTogdXNlIG9mIDY0LWJpdCBtYXRoCj4gaXMgZXhwbGljaXQgYmFzZWQgb24gdGhlIHR5cGUgb2Yg
d2hhdCBlbHNlIGlzIGJlaW5nIG11bHRpcGxpZWQgYnkgdGhlIG1hY3JvLsKgCj4gUG90ZW50aWFs
IGRvd25zaWRlOiAzMiozMiBhc3NpZ25lZCB0byBhIDY0LWJpdCByZXN1bHQgbWF5IGJlIGJvdGNo
ZWQgKGJ1dAo+IGhvcGVmdWxseSBDb3Zlcml0eSB3aWxsIGZsYWcgaXQpLgo+IAo+IFNvIHRoZXJl
J3MgdHJhZGVvZmZzIGVpdGhlciB3YXksIGFuZCB5b3UgYXQgbGVhc3QgbmVlZCB0byBkb2N1bWVu
dCBpbiB5b3VyCj4gY29tbWl0IG1lc3NhZ2VzIHdoYXQgYXVkaXRpbmcgeW91IGhhdmUgZG9uZSB0
aGF0IGFueSB0eXBlIGNoYW5nZXMgaW50cm9kdWNlZCBieQo+IHlvdXIgY2hhbmdlcyBhcmUgc2Fm
ZS4KCkknbSBtb3JlIGNvbmNlcm5lZCBhYm91dCB1bm5lY2Vzc2FyeSBvciB1bmludGVuZGVkIHNp
Z25lZCB2cyB1bnNpZ25lZCBjaGFuZ2VzCnRoYW4gSSBhbSBhYm91dCB3aWR0aC4gIEJ1dCBpZiB3
ZSdyZSBnb2luZyB0byBmb3JjZSBhIDY0LWJpdCB0eXBlLCB1c2UKKGludDY0X3QpMSBub3QgMUxM
LiAgVGhhdCB3YXkgdGhlIHR5cGUgd2lsbCBtYXRjaCB0aGUgZXhpc3RpbmcgUFJJZDY0IHByaW50
ZgptYXJrdXAuCgoKcn4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
