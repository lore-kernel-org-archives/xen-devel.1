From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] x86: remove redundant 'default n' from
 Kconfig-s
Date: Wed, 17 Oct 2018 10:33:49 +0200
Message-ID: <20181017083349.GC22535__12099.7684578926$1539765180$gmane$org@zn.tnic>
References: <CGME20181016134217eucas1p2102984488b89178a865162553369025b@eucas1p2.samsung.com>
 <20181016134217eucas1p2102984488b89178a865162553369025b~eGpI5NlJo0851008510eucas1p2D@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gn5w=m5=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1gChHR-0001Tz-Uh
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 08:34:13 +0000
Content-Disposition: inline
In-Reply-To: <20181016134217eucas1p2102984488b89178a865162553369025b~eGpI5NlJo0851008510eucas1p2D@eucas1p2.samsung.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.co>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

SGkgQmFydCwKCk9uIFR1ZSwgT2N0IDE2LCAyMDE4IGF0IDAzOjQyOjE2UE0gKzAyMDAsIEJhcnRs
b21pZWogWm9sbmllcmtpZXdpY3ogd3JvdGU6Cj4gJ2RlZmF1bHQgbicgaXMgdGhlIGRlZmF1bHQg
dmFsdWUgZm9yIGFueSBib29sIG9yIHRyaXN0YXRlIEtjb25maWcKPiBzZXR0aW5nIHNvIHRoZXJl
IGlzIG5vIG5lZWQgdG8gd3JpdGUgaXQgZXhwbGljaXRseS4KPiAKPiBBbHNvIHNpbmNlIGNvbW1p
dCBmNDY3YzU2NDBjMjkgKCJrY29uZmlnOiBvbmx5IHdyaXRlICcjIENPTkZJR19GT08KPiBpcyBu
b3Qgc2V0JyBmb3IgdmlzaWJsZSBzeW1ib2xzIikgdGhlIEtjb25maWcgYmVoYXZpb3IgaXMgdGhl
IHNhbWUKPiByZWdhcmRsZXNzIG9mICdkZWZhdWx0IG4nIGJlaW5nIHByZXNlbnQgb3Igbm90Ogo+
IAo+ICAgICAuLi4KPiAgICAgT25lIHNpZGUgZWZmZWN0IG9mIChhbmQgdGhlIG1haW4gbW90aXZh
dGlvbiBmb3IpIHRoaXMgY2hhbmdlIGlzIG1ha2luZwo+ICAgICB0aGUgZm9sbG93aW5nIHR3byBk
ZWZpbml0aW9ucyBiZWhhdmUgZXhhY3RseSB0aGUgc2FtZToKPiAgICAgCj4gICAgICAgICBjb25m
aWcgRk9PCj4gICAgICAgICAgICAgICAgIGJvb2wKPiAgICAgCj4gICAgICAgICBjb25maWcgRk9P
Cj4gICAgICAgICAgICAgICAgIGJvb2wKPiAgICAgICAgICAgICAgICAgZGVmYXVsdCBuCj4gICAg
IAo+ICAgICBXaXRoIHRoaXMgY2hhbmdlLCBuZWl0aGVyIG9mIHRoZXNlIHdpbGwgZ2VuZXJhdGUg
YQo+ICAgICAnIyBDT05GSUdfRk9PIGlzIG5vdCBzZXQnIGxpbmUgKGFzc3VtaW5nIEZPTyBpc24n
dCBzZWxlY3RlZC9pbXBsaWVkKS4KPiAgICAgVGhhdCBtaWdodCBtYWtlIGl0IGNsZWFyZXIgdG8g
cGVvcGxlIHRoYXQgYSBiYXJlICdkZWZhdWx0IG4nIGlzCj4gICAgIHJlZHVuZGFudC4KPiAgICAg
Li4uCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xu
aWVya2llQHNhbXN1bmcuY29tPgo+IC0tLQo+ICBhcmNoL3g4Ni9LY29uZmlnICAgICAgIHwgICAg
NyAtLS0tLS0tCj4gIGFyY2gveDg2L0tjb25maWcuZGVidWcgfCAgICAxIC0KPiAgYXJjaC94ODYv
eGVuL0tjb25maWcgICB8ICAgIDEgLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0p
Cgpsb29rcyBnb29kLCBubyBkaWZmZXJlbmNlIG9mIGFsbG1vZGNvbmZpZ3MgYmVmb3JlIGFuZCBh
ZnRlci4KCkJ1dCB0aGF0IGNsb3NlIGJlZm9yZSB0aGUgbWVyZ2Ugd2luZG93IGFuZCBpdCBub3Qg
YmVpbmcgdXJnZW50LCBJJ2xsCnF1ZXVlIGl0IGFmdGVyIHRoZSBtZXJnZSB3aW5kb3cuCgpUaHgu
CgotLSAKUmVnYXJkcy9HcnVzcywKICAgIEJvcmlzLgoKR29vZCBtYWlsaW5nIHByYWN0aWNlcyBm
b3IgNDAwOiBhdm9pZCB0b3AtcG9zdGluZyBhbmQgdHJpbSB0aGUgcmVwbHkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
