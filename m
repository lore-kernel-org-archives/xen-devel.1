From: Thomas Garnier <thgarnie@google.com>
Subject: Re: [PATCH v3 09/27] x86/acpi: Adapt assembly for PIE
 support
Date: Thu, 24 May 2018 09:35:42 -0700
Message-ID: <CAJcbSZFJ84+VC5xDQZGHctupdqwmMBgqzLzFRqCTBpi5t-2Gvw__47262.1638015427$1527179696$gmane$org@mail.gmail.com>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-10-thgarnie@google.com>
 <20180524110306.GA20225@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mvh5=il=google.com=thgarnie@srs-us1.protection.inumbo.net>)
 id 1fLtDY-0003oi-K7
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 16:35:56 +0000
Received: by mail-it0-x244.google.com with SMTP id q4-v6so3183969ite.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 May 2018 09:35:55 -0700 (PDT)
In-Reply-To: <20180524110306.GA20225@amd>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, the arch/x86 maintainers <x86@kernel.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Petr Mladek <pmladek@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, Yonghong Song <yhs@fb.com>, Christopher Li <sparse@chrisli.org>, Dave Hansen <dave.hansen@linux.intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jan Beulich <JBeulich@suse.com>, "H . Peter Anvin" <hpa@zytor.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Christoph Lameter <cl@linux.com>, Alok Kataria <akataria@vmware.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Herbert Xu <herbert@gondor.a>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMjQsIDIwMTggYXQgNDowMyBBTSBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5j
ej4gd3JvdGU6Cgo+IE9uIFdlZCAyMDE4LTA1LTIzIDEyOjU0OjAzLCBUaG9tYXMgR2FybmllciB3
cm90ZToKPiA+IENoYW5nZSB0aGUgYXNzZW1ibHkgY29kZSB0byB1c2Ugb25seSByZWxhdGl2ZSBy
ZWZlcmVuY2VzIG9mIHN5bWJvbHMgZm9yCnRoZQo+ID4ga2VybmVsIHRvIGJlIFBJRSBjb21wYXRp
YmxlLgo+ID4KPiA+IFBvc2l0aW9uIEluZGVwZW5kZW50IEV4ZWN1dGFibGUgKFBJRSkgc3VwcG9y
dCB3aWxsIGFsbG93IHRvIGV4dGVuZGVkIHRoZQo+ID4gS0FTTFIgcmFuZG9taXphdGlvbiByYW5n
ZSBiZWxvdyB0aGUgLTJHIG1lbW9yeSBsaW1pdC4KCj4gV2hhdCB0ZXN0aW5nIGRpZCB0aGlzIGdl
dD8KClRlc3RlZCBib290LCBoaWJlcm5hdGlvbiBhbmQgcGVyZm9ybWFuY2Ugb24gcWVtdSBhbmQg
ZGVkaWNhdGVkIG1hY2hpbmUuCgoKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvYWNw
aS93YWtldXBfNjQuUwpiL2FyY2gveDg2L2tlcm5lbC9hY3BpL3dha2V1cF82NC5TCj4gPiBpbmRl
eCA1MGI4ZWQwMzE3YTMuLjQ3MjY1OWMwZjgxMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gveDg2L2tl
cm5lbC9hY3BpL3dha2V1cF82NC5TCj4gPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvYWNwaS93YWtl
dXBfNjQuUwo+ID4gQEAgLTE0LDcgKzE0LDcgQEAKPiA+ICAgICAgICAqIEhvb3JheSwgd2UgYXJl
IGluIExvbmcgNjQtYml0IG1vZGUgKGJ1dCBzdGlsbCBydW5uaW5nIGluIGxvdwptZW1vcnkpCj4g
PiAgICAgICAgKi8KPiA+ICBFTlRSWSh3YWtldXBfbG9uZzY0KQo+ID4gLSAgICAgbW92cSAgICBz
YXZlZF9tYWdpYywgJXJheAo+ID4gKyAgICAgbW92cSAgICBzYXZlZF9tYWdpYyglcmlwKSwgJXJh
eAo+ID4gICAgICAgbW92cSAgICAkMHgxMjM0NTY3ODlhYmNkZWYwLCAlcmR4Cj4gPiAgICAgICBj
bXBxICAgICVyZHgsICVyYXgKPiA+ICAgICAgIGpuZSAgICAgYm9ndXNfNjRfbWFnaWMKCj4gQmVj
YXVzZSwgYXMgY29tbWVudCBzYXlzLCB0aGlzIGlzIHJhdGhlciB0cmlja3kgY29kZS4KCkkgYWdy
ZWUsIEkgdGhpbmsgbWFpbnRhaW5lcnMgZmVlZGJhY2sgaXMgdmVyeSBpbXBvcnRhbnQgZm9yIHRo
aXMgcGF0Y2hzZXQuCgoKUGF2ZWwKCj4gLS0KPiAoZW5nbGlzaCkgaHR0cDovL3d3dy5saXZlam91
cm5hbC5jb20vfnBhdmVsbWFjaGVrCj4gKGNlc2t5LCBwaWN0dXJlcykKaHR0cDovL2F0cmV5Lmth
cmxpbi5tZmYuY3VuaS5jei9+cGF2ZWwvcGljdHVyZS9ob3JzZXMvYmxvZy5odG1sCgoKCi0tIApU
aG9tYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
