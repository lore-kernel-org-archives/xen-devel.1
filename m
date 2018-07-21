From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 1/2] x86/entry/64: Do not clear %rbx under
 Xen
Date: Sat, 21 Jul 2018 14:45:38 -0700
Message-ID: <CALCETrX435cC7Hi2aTLVrBecZEEeJ3_TgQnTwbObNrt9MKvFzg__14480.2875155166$1532209494$gmane$org@mail.gmail.com>
References: <20180721194909.23903-1-m.v.b@runbox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=j5gm=kf=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1fgzhT-0005t0-IH
 for xen-devel@lists.xenproject.org; Sat, 21 Jul 2018 21:46:03 +0000
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAF1C20873
 for <xen-devel@lists.xenproject.org>; Sat, 21 Jul 2018 21:46:00 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l2-v6so6792300wme.1
 for <xen-devel@lists.xenproject.org>; Sat, 21 Jul 2018 14:46:00 -0700 (PDT)
In-Reply-To: <20180721194909.23903-1-m.v.b@runbox.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "M. Vefa Bicakci" <m.v.b@runbox.com>
Cc: Juergen Gross <jgross@suse.com>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Ingo Molnar <mingo@redhat.com>, stable <stable@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKdWwgMjEsIDIwMTggYXQgMTI6NDkgUE0sIE0uIFZlZmEgQmljYWtjaSA8bS52LmJA
cnVuYm94LmNvbT4gd3JvdGU6Cj4gQ29tbWl0IDNhYzZkOGM3ODdiOCAoIng4Ni9lbnRyeS82NDog
Q2xlYXIgcmVnaXN0ZXJzIGZvcgo+IGV4Y2VwdGlvbnMvaW50ZXJydXB0cywgdG8gcmVkdWNlIHNw
ZWN1bGF0aW9uIGF0dGFjayBzdXJmYWNlIikgdW5pbnRlbmRlZGx5Cj4gYnJva2UgWGVuIFBWIHZp
cnR1YWwgbWFjaGluZXMgYnkgY2xlYXJpbmcgdGhlICVyYnggcmVnaXN0ZXIgYXQgdGhlIGVuZCBv
Zgo+IHhlbl9mYWlsc2FmZV9jYWxsYmFjayBiZWZvcmUgdGhlIGxhdHRlciBqdW1wcyB0byBlcnJv
cl9leGl0Lgo+IGVycm9yX2V4aXQgZXhwZWN0cyB0aGUgJXJieCByZWdpc3RlciB0byBiZSBhIGZs
YWcgaW5kaWNhdGluZyB3aGV0aGVyCj4gdGhlcmUgc2hvdWxkIGJlIGEgcmV0dXJuIHRvIGtlcm5l
bCBtb2RlLgo+Cj4gVGhpcyBjb21taXQgbWFrZXMgc3VyZSB0aGF0IHRoZSAlcmJ4IHJlZ2lzdGVy
IGlzIG5vdCBjbGVhcmVkIGJ5Cj4gdGhlIFBVU0hfQU5EX0NMRUFSX1JFR1MgbWFjcm8sIHdoZW4g
dGhlIG1hY3JvIGluIHF1ZXN0aW9uIGlzIGluc3RhbnRpYXRlZAo+IGJ5IHhlbl9mYWlsc2FmZV9j
YWxsYmFjaywgdG8gYXZvaWQgdGhlIGlzc3VlLgoKU2VlbXMgbGlrZSBhIGdlbnVpbmUgcHJvYmxl
bSwgYnV0OgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvZW50cnkvZW50cnlfNjQuUyBiL2FyY2gv
eDg2L2VudHJ5L2VudHJ5XzY0LlMKPiBpbmRleCBjNzQ0OWYzNzdhNzcuLjk2ZThmZjM0MTI5ZSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TCj4gKysrIGIvYXJjaC94ODYv
ZW50cnkvZW50cnlfNjQuUwo+IEBAIC0xMTI5LDcgKzExMjksNyBAQCBFTlRSWSh4ZW5fZmFpbHNh
ZmVfY2FsbGJhY2spCj4gICAgICAgICBhZGRxICAgICQweDMwLCAlcnNwCj4gICAgICAgICBVTldJ
TkRfSElOVF9JUkVUX1JFR1MKPiAgICAgICAgIHB1c2hxICAgJC0xIC8qIG9yaWdfYXggPSAtMSA9
PiBub3QgYSBzeXN0ZW0gY2FsbCAqLwo+IC0gICAgICAgUFVTSF9BTkRfQ0xFQVJfUkVHUwo+ICsg
ICAgICAgUFVTSF9BTkRfQ0xFQVJfUkVHUyBjbGVhcl9yYng9MAo+ICAgICAgICAgRU5DT0RFX0ZS
QU1FX1BPSU5URVIKPiAgICAgICAgIGptcCAgICAgZXJyb3JfZXhpdAoKVGhlIG9sZCBjb2RlIGZp
cnN0IHNldCBSQlggdG8gemVybyB0aGVuLCBpZiBmcmFtZSBwb2ludGVycyBhcmUgb24sCnNldHMg
aXQgdG8gc29tZSBzcGVjaWFsIG5vbi16ZXJvIHZhbHVlLCB0aGVuIGNyb3NzZXMgaXRzIGZpbmdl
cnMgYW5kCmhvcGVzIGZvciB0aGUgYmVzdC4gIFlvdXIgcGF0Y2hlZCBjb2RlIGp1c3Qgc2tpcHMg
dGhlIHplcm9pbmcgcGFydCwgc28KUkJYIGVpdGhlciBjb250YWlucyB0aGUgRU5DT0RFX0ZSQU1F
X1BPSU5URVIgcmVzdWx0IG9yIGlzCnVuaW5pdGlhbGl6ZWQuCgpIb3cgYWJvdXQgYWN0dWFsbHkg
aW5pdGlhbGl6aW5nIHJieCB0byBzb21ldGhpbmcgc2Vuc2libGUgbGlrZSwgc2F5LCAxPwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
