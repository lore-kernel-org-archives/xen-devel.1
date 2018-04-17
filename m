From: Laura Abbott <labbott@redhat.com>
Subject: Re: [PATCH] x86/xen: Remove use of VLAs
Date: Tue, 17 Apr 2018 16:33:57 -0700
Message-ID: <9fe26cf5-01dc-1fb0-25fd-29bf8615047f__15996.7145220891$1524007997$gmane$org@redhat.com>
References: <20180413221146.28476-1-labbott@redhat.com>
 <7cf66c00-74c2-62bb-81f5-4332313a5a6e@oracle.com>
 <e63f261b-9ef3-5750-20df-555291a8a0d8@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ru88=hg=redhat.com=labbott@srs-us1.protection.inumbo.net>)
 id 1f8a6r-0000H1-LY
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 23:34:01 +0000
Received: by mail-ot0-f195.google.com with SMTP id p33-v6so23304152otp.11
 for <xen-devel@lists.xenproject.org>; Tue, 17 Apr 2018 16:34:00 -0700 (PDT)
In-Reply-To: <e63f261b-9ef3-5750-20df-555291a8a0d8@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-hardening@lists.openwall.com, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTcvMjAxOCAxMjoxNiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNi8wNC8x
OCAxNToyNywgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwNC8xMy8yMDE4IDA2OjExIFBN
LCBMYXVyYSBBYmJvdHQgd3JvdGU6Cj4+PiBUaGVyZSdzIGFuIG9uZ29pbmcgZWZmb3J0IHRvIHJl
bW92ZSBWTEFzWzFdIGZyb20gdGhlIGtlcm5lbCB0byBldmVudHVhbGx5Cj4+PiB0dXJuIG9uIC1X
dmxhLiBUaGUgZmV3IFZMQXMgaW4gdXNlIGhhdmUgYW4gdXBwZXIgYm91bmQgYmFzZWQgb24gYSBz
aXplCj4+PiBvZiA2NEsuIFRoaXMgZG9lc24ndCBwcm9kdWNlIGFuIGV4Y2Vzc2l2ZWx5IGxhcmdl
IHN0YWNrIHNvIGp1c3Qgc3dpdGNoCj4+PiB0aGUgdXBwZXIgYm91bmQuCj4+Pgo+Pj4gWzFdIGh0
dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzMvNy82MjEKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBM
YXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pj4gICBhcmNoL3g4Ni94
ZW4vZW5saWdodGVuX3B2LmMgfCA2ICsrLS0tLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94
ZW4vZW5saWdodGVuX3B2LmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPj4+IGluZGV4
IGMzNmQyM2FhNmMzNS4uZDk2YTVhNTM1Y2JiIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9wdi5jCj4+PiArKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPj4+
IEBAIC00MjEsOCArNDIxLDcgQEAgc3RhdGljIHZvaWQgeGVuX2xvYWRfZ2R0KGNvbnN0IHN0cnVj
dCBkZXNjX3B0ciAqZHRyKQo+Pj4gICB7Cj4+PiAgIAl1bnNpZ25lZCBsb25nIHZhID0gZHRyLT5h
ZGRyZXNzOwo+Pj4gICAJdW5zaWduZWQgaW50IHNpemUgPSBkdHItPnNpemUgKyAxOwo+Pj4gLQl1
bnNpZ25lZCBwYWdlcyA9IERJVl9ST1VORF9VUChzaXplLCBQQUdFX1NJWkUpOwo+Pgo+Pgo+Pgo+
PiBJc24ndCBkdHItPnNpemUgYWx3YXlzIGVpdGhlciBHRFRfU0laRSBvciAwPwo+IAo+IEdEVF9T
SVpFIC0gMSA6LSkKPiAKPj4+IC0JdW5zaWduZWQgbG9uZyBmcmFtZXNbcGFnZXNdOwo+Pj4gKwl1
bnNpZ25lZCBsb25nIGZyYW1lc1tESVZfUk9VTkRfVVAoU1pfNjRLLCBQQUdFX1NJWkUpXTsKPiAK
PiBTbyB3ZSBjb3VsZCBqdXN0IGdvIHdpdGggb25lIGZyYW1lIGFuZCBtb2RpZnkgdGhlIEJVR19P
TigpIGZ1cnRoZXIgYmVsb3cKPiBhY2NvcmRpbmdseS4KPiAKCkRvIHlvdSB3YW50IHRvIGp1c3Qg
cmVtb3ZlIHRoZSBsb29wIGFzIHdlbGwgc2luY2Ugd2UncmUgbmV2ZXIgZ29pbmcKdG8gZG8gbW9y
ZSB0aGFuIG9uZSBmcmFtZT8gV2UgZW5kIHVwIHdpdGggbmV0IGNvZGUgZGVsZXRpb24uCgpUaGFu
a3MsCkxhdXJhCgo+IAo+IEp1ZXJnZW4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
