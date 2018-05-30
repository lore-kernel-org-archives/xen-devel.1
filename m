From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] ALSA: xen-front: freeing an error pointer
Date: Wed, 30 May 2018 14:14:58 +0300
Message-ID: <588658f1-520f-be06-3ad5-9b97e3f8e866__18134.1014257216$1527678824$gmane$org@gmail.com>
References: <20180530103655.bnjzq2jpfrjjwvvj@kili.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mt+2=ir=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fNz4J-00020g-LW
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 11:15:03 +0000
Received: by mail-lf0-x241.google.com with SMTP id v135-v6so3659871lfa.9
 for <xen-devel@lists.xenproject.org>; Wed, 30 May 2018 04:15:01 -0700 (PDT)
In-Reply-To: <20180530103655.bnjzq2jpfrjjwvvj@kili.mountain>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMzAvMjAxOCAwMTozNiBQTSwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBrZnJlZSgpIGRv
ZXNuJ3QgYWNjZXB0IGVycm9yIHBvaW50ZXJzIHNvIEkndmUgc2V0ICJzdHIiIHRvIE5VTEwgb24g
dGhlc2UKPiBwYXRocy4KPgo+IEZpeGVzOiBmZDNiMzYwNDVjMmMgKCJBTFNBOiB4ZW4tZnJvbnQ6
IFJlYWQgc291bmQgZHJpdmVyIGNvbmZpZ3VyYXRpb24gZnJvbSBYZW4gc3RvcmUiKQo+IFNpZ25l
ZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPgo+IGRp
ZmYgLS1naXQgYS9zb3VuZC94ZW4veGVuX3NuZF9mcm9udF9jZmcuYyBiL3NvdW5kL3hlbi94ZW5f
c25kX2Zyb250X2NmZy5jCj4gaW5kZXggMzhjN2UxZWVmYmI5Li42OGRjZDdkMWYwOWUgMTAwNjQ0
Cj4gLS0tIGEvc291bmQveGVuL3hlbl9zbmRfZnJvbnRfY2ZnLmMKPiArKysgYi9zb3VuZC94ZW4v
eGVuX3NuZF9mcm9udF9jZmcuYwo+IEBAIC0zMDYsNiArMzA2LDcgQEAgc3RhdGljIGludCBjZmdf
Z2V0X3N0cmVhbV90eXBlKGNvbnN0IGNoYXIgKnBhdGgsIGludCBpbmRleCwKPiAgIAlzdHIgPSB4
ZW5idXNfcmVhZChYQlRfTklMLCBzdHJlYW1fcGF0aCwgWEVOU05EX0ZJRUxEX1RZUEUsIE5VTEwp
Owo+ICAgCWlmIChJU19FUlIoc3RyKSkgewo+ICAgCQlyZXQgPSBQVFJfRVJSKHN0cik7Cj4gKwkJ
c3RyID0gTlVMTDsKPiAgIAkJZ290byBmYWlsOwo+ICAgCX0KPiAgIAo+IEBAIC0zNDcsNiArMzQ4
LDcgQEAgc3RhdGljIGludCBjZmdfc3RyZWFtKHN0cnVjdCB4ZW5fc25kX2Zyb250X2luZm8gKmZy
b250X2luZm8sCj4gICAJc3RyID0geGVuYnVzX3JlYWQoWEJUX05JTCwgc3RyZWFtX3BhdGgsIFhF
TlNORF9GSUVMRF9UWVBFLCBOVUxMKTsKPiAgIAlpZiAoSVNfRVJSKHN0cikpIHsKPiAgIAkJcmV0
ID0gUFRSX0VSUihzdHIpOwo+ICsJCXN0ciA9IE5VTEw7Cj4gICAJCWdvdG8gZmFpbDsKPiAgIAl9
Cj4gICAKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWwKVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLApSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
