From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [PATCH][next] ALSA: xen-front: remove redundant
 error check on ret
Date: Mon, 28 May 2018 07:42:12 +0900
Message-ID: <ee539e2d-568e-4bfa-a4aa-4a9b39bc1bd8__2305.40866400606$1527460893$gmane$org@sakamocchi.jp>
References: <20180527212312.23997-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dzy5=io=sakamocchi.jp=o-takashi@srs-us1.protection.inumbo.net>)
 id 1fN4Ml-0007YC-Tk
 for xen-devel@lists.xenproject.org; Sun, 27 May 2018 22:42:19 +0000
In-Reply-To: <20180527212312.23997-1-colin.king@canonical.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Colin King <colin.king@canonical.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiBNYXkgMjggMjAxOCAwNjoyMywgQ29saW4gS2luZyB3cm90ZToKPiBGcm9tOiBDb2xp
biBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+IFRoZSBlcnJvciBmb3Ig
YSAtdmUgdmFsdWUgaW4gcmV0IGlzIHJlZHVuZGFudCBhcyBhbGwgcHJldmlvdXMKPiBhc3NpZ25t
ZW50cyB0byByZXQgaGF2ZSBhbiBhc3NvY2lhdGVkIC12ZSBjaGVjayBhbmQgaGVuY2UgaXQKPiBp
cyBpbXBvc3NpYmxlIGZvciByZXQgdG8gYmUgbGVzcyB0aGF0IHplcm8gYXQgdGhlIHBvaW50IG9m
IHRoZQo+IGNoZWNrLiAgUmVtb3ZlIHRoaXMgcmVkdW5kYW50IGVycm9yIGNoZWNrLgo+IAo+IERl
dGVjdGVkIGJ5IENvdmVyaXRTY2FuLCBDSUQjMTQ2OTQwNyAoIkxvZ2ljYWxseSBEZWFkIGNvZGUi
KQo+IAo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNh
bC5jb20+Cj4gLS0tCj4gICBzb3VuZC94ZW4veGVuX3NuZF9mcm9udF9ldnRjaG5sLmMgfCAyIC0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc291
bmQveGVuL3hlbl9zbmRfZnJvbnRfZXZ0Y2hubC5jIGIvc291bmQveGVuL3hlbl9zbmRfZnJvbnRf
ZXZ0Y2hubC5jCj4gaW5kZXggZDcwYTYyZTdmOTEwLi4xMDJkNmUwOTZjYzggMTAwNjQ0Cj4gLS0t
IGEvc291bmQveGVuL3hlbl9zbmRfZnJvbnRfZXZ0Y2hubC5jCj4gKysrIGIvc291bmQveGVuL3hl
bl9zbmRfZnJvbnRfZXZ0Y2hubC5jCj4gQEAgLTM1MSw4ICszNTEsNiBAQCBpbnQgeGVuX3NuZF9m
cm9udF9ldnRjaG5sX2NyZWF0ZV9hbGwoc3RydWN0IHhlbl9zbmRfZnJvbnRfaW5mbyAqZnJvbnRf
aW5mbywKPiAgIAkJCX0KPiAgIAkJfQo+ICAgCX0KPiAtCWlmIChyZXQgPCAwKQo+IC0JCWdvdG8g
ZmFpbDsKPiAgIAo+ICAgCWZyb250X2luZm8tPm51bV9ldnRfcGFpcnMgPSBudW1fc3RyZWFtczsK
PiAgIAlyZXR1cm4gMDsKClllcC4gQWxsIGJyYW5jaGVzIGZvciBlcnJvciBwYXRoIG9uIHRoZSBu
ZXN0ZWQgZm9yIGxvb3AgaGF2ZSBnb3RvIApzdGF0ZW1lbnQsIHRodXMgbm8gbmVlZCB0byBjaGVj
ayBlcnJvciBvdXRlciB0aGUgbG9vcC4KClJldmlld2VkLWJ5OiBUYWthc2hpIFNha2Ftb3RvIDxv
LXRha2FzaGlAc2FrYW1vY2NoaS5qcD4KCgpUYWthc2hpIFNha2Ftb3RvCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
