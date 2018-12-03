From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC 10/16] gic:vgic:gic-vgic: introduce non-atomic
 bitops
Date: Mon, 3 Dec 2018 14:33:08 +0200
Message-ID: <f71bead8-4450-7f51-06d4-f4f6021df8d6@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-11-git-send-email-andrii.anisov@gmail.com>
 <20181129121416.222da0d5@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=siql=om=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gTnPU-000151-N8
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 12:33:12 +0000
Received: by mail-lf1-x144.google.com with SMTP id z13so8966356lfe.11
 for <xen-devel@lists.xenproject.org>; Mon, 03 Dec 2018 04:33:11 -0800 (PST)
In-Reply-To: <20181129121416.222da0d5@donnerap.cambridge.arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gQW5kcmUsCgpPbiAyOS4xMS4xOCAxNDoxNCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4g
TmFoLCBwbGVhc2UgZG9uJ3QgZG8gdGhpcy4KU29ycnkgZm9yIG1ha2luZyB5b3UgY3J5aW5nIGxv
b2tpbmcgYXQgdGhpcyBjb2RlLgpJdCdzIHRlcnJpYmxlLCBJIGtub3cuIEl0J3MgcmF0aGVyIGFu
IGlkZWEuCgo+IENhbiB5b3Ugc2hvdyB0aGF0IGF0b21pYyBiaXQgb3BzIGFyZSBhCj4gcHJvYmxl
bT8gVGhleSBzaG91bGRuJ3QgYmUgZXhwZW5zaXZlIHVubGVzcyBjb250ZW5kZWQsIGFsc28gcHJl
dHR5Cj4gbGlnaHR3ZWlnaHQgb24gc21hbGwgc3lzdGVtcyAoc2luZ2xlIGNsdXN0ZXIpLgpZZXAs
IGJ1dCBzdGlsbCBpdCBpcyBhIGNhbGwgdG8gYSBmdW5jdGlvbiBvZiAxMCBvcGVyYXRpb25zIGlu
c3RlYWQgb2YgCm9uZSBgb3JyYCBmb3Igc2V0X2JpdCgpLiBUYWtpbmcgaW4gYWNjb3VudCBhIGhl
YXZ5IHVzYWdlIG9mIGJpdG9wcyBpbiAKdGhlIG9sZCB2Z2ljIGNvZGUsIHRoaXMgc2hvdWxkIGJl
bmVmaXQgbGF0ZW5jeS4KCj4gQnV0IGlmIHlvdSByZWFsbHkgdGhpbmsgdGhpcyBpcyB1c2VmdWws
IHdoeSBub3QgZ28gd2l0aCB0aGUgTGludXggd2F5Cj4gb2YgdXNpbmcgX19zZXRfYml0IHRvIHBy
b3ZpZGUgYSBub24tYXRvbWljIHZlcnNpb24/Cj4gVGhpcyB3b3VsZCBoYXZlIHRoZSBiaWcgYWR2
YW50YWdlIHRoYXQgeW91IGNhbiByZXBsYWNlIHRoZW0gb24gYQo+IGNhc2UtYnktY2FzZSBiYXNl
LCB3aGljaCBpcyBtdWNoIGxlc3Mgcmlza3kgdGhhbiB1bmNvbmRpdGlvbmFsbHkKPiByZXBsYWNp
bmcgZXZlcnkgKGV2ZW4gZnV0dXJlISkgdXNhZ2UgaW4gdGhlIHdob2xlIGZpbGUuCldoYXRldmVy
IHlvdSBwcmVmZXIgOikKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
