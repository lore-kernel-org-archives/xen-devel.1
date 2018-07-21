From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/2] x86/entry/64: Do not clear %rbx under
 Xen
Date: Sat, 21 Jul 2018 17:19:36 -0400
Message-ID: <5a21b844-36a9-8fe4-c6cd-6fade3dfa941__7033.71032509512$1532207916$gmane$org@oracle.com>
References: <20180721194909.23903-1-m.v.b@runbox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xnes=kf=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fgzHm-0003fW-9i
 for xen-devel@lists.xenproject.org; Sat, 21 Jul 2018 21:19:30 +0000
In-Reply-To: <20180721194909.23903-1-m.v.b@runbox.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "M. Vefa Bicakci" <m.v.b@runbox.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Ingo Molnar <mingo@redhat.com>, stable@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjEvMjAxOCAwMzo0OSBQTSwgTS4gVmVmYSBCaWNha2NpIHdyb3RlOgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TIGIvYXJjaC94ODYvZW50cnkvZW50cnlfNjQu
Uwo+IGluZGV4IGM3NDQ5ZjM3N2E3Ny4uOTZlOGZmMzQxMjllIDEwMDY0NAo+IC0tLSBhL2FyY2gv
eDg2L2VudHJ5L2VudHJ5XzY0LlMKPiArKysgYi9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TCj4g
QEAgLTExMjksNyArMTEyOSw3IEBAIEVOVFJZKHhlbl9mYWlsc2FmZV9jYWxsYmFjaykKPiAgCWFk
ZHEJJDB4MzAsICVyc3AKPiAgCVVOV0lORF9ISU5UX0lSRVRfUkVHUwo+ICAJcHVzaHEJJC0xIC8q
IG9yaWdfYXggPSAtMSA9PiBub3QgYSBzeXN0ZW0gY2FsbCAqLwo+IC0JUFVTSF9BTkRfQ0xFQVJf
UkVHUwo+ICsJUFVTSF9BTkRfQ0xFQVJfUkVHUyBjbGVhcl9yYng9MAoKCkRvIHdlIG5lZWQgdGhp
cyBhdCBhbGw/IFdlIGFyZSByZXR1cm5pbmcgZnJvbSB0aGUgaHlwZXJ2aXNvciBoZXJlLgoKLWJv
cmlzCgo+ICAJRU5DT0RFX0ZSQU1FX1BPSU5URVIKPiAgCWptcAllcnJvcl9leGl0Cj4gIEVORCh4
ZW5fZmFpbHNhZmVfY2FsbGJhY2spCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
