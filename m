From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/2] x86/entry/64: Do not clear %rbx under
 Xen
Date: Mon, 23 Jul 2018 10:56:28 -0400
Message-ID: <15aa906e-0e42-31ce-f3d3-167d263e9226__37654.8841516071$1532357710$gmane$org@oracle.com>
References: <20180721194909.23903-1-m.v.b@runbox.com>
 <5a21b844-36a9-8fe4-c6cd-6fade3dfa941@oracle.com>
 <6426e7a4-2da0-9a36-298a-89e956e98812@runbox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kryu=kh=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fhcG6-0004uZ-2z
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 14:56:22 +0000
In-Reply-To: <6426e7a4-2da0-9a36-298a-89e956e98812@runbox.com>
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

T24gMDcvMjEvMjAxOCAwNzoxOCBQTSwgTS4gVmVmYSBCaWNha2NpIHdyb3RlOgo+IE9uIDA3LzIx
LzIwMTggMDU6MTkgUE0sIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gMDcvMjEvMjAxOCAw
Mzo0OSBQTSwgTS4gVmVmYSBCaWNha2NpIHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L2VudHJ5L2VudHJ5XzY0LlMgYi9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TCj4+PiBpbmRleCBj
NzQ0OWYzNzdhNzcuLjk2ZThmZjM0MTI5ZSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gveDg2L2VudHJ5
L2VudHJ5XzY0LlMKPj4+ICsrKyBiL2FyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlMKPj4+IEBAIC0x
MTI5LDcgKzExMjksNyBAQCBFTlRSWSh4ZW5fZmFpbHNhZmVfY2FsbGJhY2spCj4+PiDCoMKgwqDC
oMKgIGFkZHHCoMKgwqAgJDB4MzAsICVyc3AKPj4+IMKgwqDCoMKgwqAgVU5XSU5EX0hJTlRfSVJF
VF9SRUdTCj4+PiDCoMKgwqDCoMKgIHB1c2hxwqDCoMKgICQtMSAvKiBvcmlnX2F4ID0gLTEgPT4g
bm90IGEgc3lzdGVtIGNhbGwgKi8KPj4+IC3CoMKgwqAgUFVTSF9BTkRfQ0xFQVJfUkVHUwo+Pj4g
K8KgwqDCoCBQVVNIX0FORF9DTEVBUl9SRUdTIGNsZWFyX3JieD0wCj4+Cj4+Cj4+IERvIHdlIG5l
ZWQgdGhpcyBhdCBhbGw/IFdlIGFyZSByZXR1cm5pbmcgZnJvbSB0aGUgaHlwZXJ2aXNvciBoZXJl
Lgo+Pgo+PiAtYm9yaXMKPj4KPj4+IMKgwqDCoMKgwqAgRU5DT0RFX0ZSQU1FX1BPSU5URVIKPj4+
IMKgwqDCoMKgwqAgam1wwqDCoMKgIGVycm9yX2V4aXQKPj4+IMKgIEVORCh4ZW5fZmFpbHNhZmVf
Y2FsbGJhY2spCj4KPiBIZWxsbyBCb3JpcywKPgo+IElmIHlvdSBhcmUgcmVmZXJyaW5nIHRvIHRo
ZSBQVVNIX0FORF9DTEVBUl9SRUdTIG1hY3JvIGl0c2VsZiwgSSBhbSBub3QKPiBzdXJlOwo+IGhv
d2V2ZXIsIG5vdCBjbGVhcmluZyB0aGUgUkJYIHJlZ2lzdGVyIHNlZW1lZCB0byByZXNvbHZlIHRo
ZSBpc3N1ZXMKPiBtZW50aW9uZWQKPiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgZm9yIG1lLiBHaXZl
biBBbmR5J3MgY29tbWVudCB0aG91Z2gsIEkgYmVsaWV2ZQo+IHRoYXQgdGhlCj4gYXBwcm9hY2gg
aW4gdGhpcyBwYXRjaCBtYXkgbm90IGJlIGNvcnJlY3QuCgoKSSB3YXMgb25seSByZWZlcnJpbmcg
dG8gcmVnaXN0ZXIgY2xlYXJpbmcgcGFydCBvZiBQVVNIX0FORF9DTEVBUl9SRUdTLgoKCi1ib3Jp
cwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
