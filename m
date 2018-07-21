From: "M. Vefa Bicakci" <m.v.b@runbox.com>
Subject: Re: [PATCH 1/2] x86/entry/64: Do not clear %rbx under
 Xen
Date: Sat, 21 Jul 2018 19:18:42 -0400
Message-ID: <6426e7a4-2da0-9a36-298a-89e956e98812__20709.0938500643$1532215061$gmane$org@runbox.com>
References: <20180721194909.23903-1-m.v.b@runbox.com>
 <5a21b844-36a9-8fe4-c6cd-6fade3dfa941@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ktyp=kf=runbox.com=m.v.b@srs-us1.protection.inumbo.net>)
 id 1fh19T-0003s7-0K
 for xen-devel@lists.xenproject.org; Sat, 21 Jul 2018 23:19:03 +0000
In-Reply-To: <5a21b844-36a9-8fe4-c6cd-6fade3dfa941@oracle.com>
Content-Language: en-CA
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Ingo Molnar <mingo@redhat.com>, stable@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjEvMjAxOCAwNToxOSBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA3LzIx
LzIwMTggMDM6NDkgUE0sIE0uIFZlZmEgQmljYWtjaSB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2VudHJ5L2VudHJ5XzY0LlMgYi9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TCj4+IGlu
ZGV4IGM3NDQ5ZjM3N2E3Ny4uOTZlOGZmMzQxMjllIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni9l
bnRyeS9lbnRyeV82NC5TCj4+ICsrKyBiL2FyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlMKPj4gQEAg
LTExMjksNyArMTEyOSw3IEBAIEVOVFJZKHhlbl9mYWlsc2FmZV9jYWxsYmFjaykKPj4gICAJYWRk
cQkkMHgzMCwgJXJzcAo+PiAgIAlVTldJTkRfSElOVF9JUkVUX1JFR1MKPj4gICAJcHVzaHEJJC0x
IC8qIG9yaWdfYXggPSAtMSA9PiBub3QgYSBzeXN0ZW0gY2FsbCAqLwo+PiAtCVBVU0hfQU5EX0NM
RUFSX1JFR1MKPj4gKwlQVVNIX0FORF9DTEVBUl9SRUdTIGNsZWFyX3JieD0wCj4gCj4gCj4gRG8g
d2UgbmVlZCB0aGlzIGF0IGFsbD8gV2UgYXJlIHJldHVybmluZyBmcm9tIHRoZSBoeXBlcnZpc29y
IGhlcmUuCj4gCj4gLWJvcmlzCj4gCj4+ICAgCUVOQ09ERV9GUkFNRV9QT0lOVEVSCj4+ICAgCWpt
cAllcnJvcl9leGl0Cj4+ICAgRU5EKHhlbl9mYWlsc2FmZV9jYWxsYmFjaykKCkhlbGxvIEJvcmlz
LAoKSWYgeW91IGFyZSByZWZlcnJpbmcgdG8gdGhlIFBVU0hfQU5EX0NMRUFSX1JFR1MgbWFjcm8g
aXRzZWxmLCBJIGFtIG5vdCBzdXJlOwpob3dldmVyLCBub3QgY2xlYXJpbmcgdGhlIFJCWCByZWdp
c3RlciBzZWVtZWQgdG8gcmVzb2x2ZSB0aGUgaXNzdWVzIG1lbnRpb25lZAppbiB0aGUgY29tbWl0
IG1lc3NhZ2UgZm9yIG1lLiBHaXZlbiBBbmR5J3MgY29tbWVudCB0aG91Z2gsIEkgYmVsaWV2ZSB0
aGF0IHRoZQphcHByb2FjaCBpbiB0aGlzIHBhdGNoIG1heSBub3QgYmUgY29ycmVjdC4KClRoYW5r
IHlvdSwKClZlZmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
