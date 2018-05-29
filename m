From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: xen: ensure
 nul-terminated device name
Date: Tue, 29 May 2018 08:48:51 +0300
Message-ID: <2469af3f-df85-fbca-a486-566f9aaa436d__481.638956307684$1527572870$gmane$org@gmail.com>
References: <20180528160011.2989632-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=iox3=iq=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fNXVA-0003Et-QX
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 05:48:56 +0000
Received: by mail-wr0-x241.google.com with SMTP id l41-v6so23305153wre.7
 for <xen-devel@lists.xenproject.org>; Mon, 28 May 2018 22:48:55 -0700 (PDT)
In-Reply-To: <20180528160011.2989632-1-arnd@arndb.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjgvMjAxOCAwNjo1OSBQTSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBnY2MtOCB3YXJu
cyB0aGF0IHBjbV9pbnN0YW5jZS0+bmFtZSBpcyBub3QgbmVjZXNzYXJpbHkgdGVybWluYXRlZCBj
b3JyZWN0bHkKPiBpZiB0aGUgaW5wdXQgaXMgbW9yZSB0aGFuIDgwIGNoYXJhY3RlcnMgbG9uZyBv
ciBsYWNrcyBhIHRlcm1pbmF0aW9uIGJ5dGUKPiBpdHNlbGY6Cj4KPiBJbiBmdW5jdGlvbiAnc3Ry
bmNweScsCj4gICAgICBpbmxpbmVkIGZyb20gJ2NmZ19kZXZpY2UnIGF0IHNvdW5kL3hlbi94ZW5f
c25kX2Zyb250X2NmZy5jOjM5OTozLAo+ICAgICAgaW5saW5lZCBmcm9tICd4ZW5fc25kX2Zyb250
X2NmZ19jYXJkJyBhdCBzb3VuZC94ZW4veGVuX3NuZF9mcm9udF9jZmcuYzo1MDk6OToKPiBpbmNs
dWRlL2xpbnV4L3N0cmluZy5oOjI1NDo5OiBlcnJvcjogJ19fYnVpbHRpbl9zdHJuY3B5JyBzcGVj
aWZpZWQgYm91bmQgODAgZXF1YWxzIGRlc3RpbmF0aW9uIHNpemUgWy1XZXJyb3I9c3RyaW5nb3At
dHJ1bmNhdGlvbl0KPiAgICByZXR1cm4gX19idWlsdGluX3N0cm5jcHkocCwgcSwgc2l6ZSk7Cj4K
PiBVc2luZyBzdHJsY3B5KCkgaW5zdGVhZCBvZiBzdHJuY3B5KCkgbWFrZXMgdGhpcyBhIGJpdCBz
YWZlci4KPgo+IEZpeGVzOiBmZDNiMzYwNDVjMmMgKCJBTFNBOiB4ZW4tZnJvbnQ6IFJlYWQgc291
bmQgZHJpdmVyIGNvbmZpZ3VyYXRpb24gZnJvbSBYZW4gc3RvcmUiKQo+IFNpZ25lZC1vZmYtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gICBzb3VuZC94ZW4veGVuX3Nu
ZF9mcm9udF9jZmcuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250X2Nm
Zy5jIGIvc291bmQveGVuL3hlbl9zbmRfZnJvbnRfY2ZnLmMKPiBpbmRleCAzOGM3ZTFlZWZiYjku
LjY4NGI1ZjFkNTFhYyAxMDA2NDQKPiAtLS0gYS9zb3VuZC94ZW4veGVuX3NuZF9mcm9udF9jZmcu
Ywo+ICsrKyBiL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250X2NmZy5jCj4gQEAgLTM5Niw3ICszOTYs
NyBAQCBzdGF0aWMgaW50IGNmZ19kZXZpY2Uoc3RydWN0IHhlbl9zbmRfZnJvbnRfaW5mbyAqZnJv
bnRfaW5mbywKPiAgIAo+ICAgCXN0ciA9IHhlbmJ1c19yZWFkKFhCVF9OSUwsIGRldmljZV9wYXRo
LCBYRU5TTkRfRklFTERfREVWSUNFX05BTUUsIE5VTEwpOwo+ICAgCWlmICghSVNfRVJSKHN0cikp
IHsKPiAtCQlzdHJuY3B5KHBjbV9pbnN0YW5jZS0+bmFtZSwgc3RyLCBzaXplb2YocGNtX2luc3Rh
bmNlLT5uYW1lKSk7Cj4gKwkJc3RybGNweShwY21faW5zdGFuY2UtPm5hbWUsIHN0ciwgc2l6ZW9m
KHBjbV9pbnN0YW5jZS0+bmFtZSkpOwo+ICAgCQlrZnJlZShzdHIpOwo+ICAgCX0KPiAgIApUaGFu
ayB5b3UgZm9yIHlvdXIgcGF0Y2gsClJldmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
