From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] ALSA: xen-front: fix a loop timeout
Date: Thu, 31 May 2018 09:44:39 +0300
Message-ID: <ff39a5c2-545a-3017-71c4-d8dca73e8129__40283.7006994106$1527749033$gmane$org@epam.com>
References: <20180531062507.ajgs4splaboukp2v@kili.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pwod=is=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fOHKO-0005ZD-Pu
 for xen-devel@lists.xenproject.org; Thu, 31 May 2018 06:44:52 +0000
In-Reply-To: <20180531062507.ajgs4splaboukp2v@kili.mountain>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMzEvMjAxOCAwOToyNSBBTSwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBXZSB3YW50IHRo
ZSBsb29wIHRvIGV4aXQgd2hlbiAidG8iIGlzIHNldCB0byB6ZXJvLCBidXQgaW4gdGhlIGN1cnJl
bnQKPiBjb2RlIGl0J3Mgc2V0IHRvIC0xLiAgQWxzbyBJIHR3ZWFrZWQgdGhlIGluZGVudGluZyBz
byBpdCBkb2Vzbid0IGxvb2sKPiBsaWtlIHdlJ3JlIHBhc3NpbmcgIi0tdG8iIHRvIHhlbmJ1c19y
ZWFkX3Vuc2lnbmVkKCkuCj4KPiBGaXhlczogY2MzMTk2YWUxOTdjICgiQUxTQTogeGVuLWZyb250
OiBJbnRyb2R1Y2UgWGVuIHBhcmEtdmlydHVhbGl6ZWQgc291bmQgZnJvbnRlbmQgZHJpdmVyIikK
PiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+
Cj4KPiBkaWZmIC0tZ2l0IGEvc291bmQveGVuL3hlbl9zbmRfZnJvbnQuYyBiL3NvdW5kL3hlbi94
ZW5fc25kX2Zyb250LmMKPiBpbmRleCBjMTg5NzNhOWJjOWIuLmIwODliMTNiNTE2MCAxMDA2NDQK
PiAtLS0gYS9zb3VuZC94ZW4veGVuX3NuZF9mcm9udC5jCj4gKysrIGIvc291bmQveGVuL3hlbl9z
bmRfZnJvbnQuYwo+IEBAIC0zMzQsNyArMzM0LDcgQEAgc3RhdGljIGludCB4ZW5fZHJ2X3JlbW92
ZShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KQo+ICAgCSAqLwo+ICAgCXdoaWxlICgoeGVuYnVz
X3JlYWRfdW5zaWduZWQoZnJvbnRfaW5mby0+eGJfZGV2LT5vdGhlcmVuZCwgInN0YXRlIiwKPiAg
IAkJCQkgICAgIFhlbmJ1c1N0YXRlVW5rbm93bikgIT0gWGVuYnVzU3RhdGVJbml0V2FpdCkgJiYK
PiAtCQkJCSAgICAgdG8tLSkKPiArCSAgICAgICAtLXRvKQo+ICAgCQltc2xlZXAoMTApOwo+ICAg
Cj4gICAJaWYgKCF0bykgewpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2gsClJldmlld2VkLWJ5OiBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
