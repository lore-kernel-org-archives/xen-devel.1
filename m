From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC 10/16] gic:vgic:gic-vgic: introduce non-atomic
 bitops
Date: Mon, 3 Dec 2018 15:05:30 +0200
Message-ID: <5864e1ee-3a2c-e408-fe2f-28ccc5afcbd0@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-11-git-send-email-andrii.anisov@gmail.com>
 <20181129121416.222da0d5@donnerap.cambridge.arm.com>
 <f71bead8-4450-7f51-06d4-f4f6021df8d6@gmail.com>
 <0225bd51-824f-2f98-afa5-c4f5e9456885@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=siql=om=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gTnup-000487-1b
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 13:05:35 +0000
Received: by mail-lj1-x241.google.com with SMTP id n18-v6so11290947lji.7
 for <xen-devel@lists.xenproject.org>; Mon, 03 Dec 2018 05:05:34 -0800 (PST)
In-Reply-To: <0225bd51-824f-2f98-afa5-c4f5e9456885@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMDMuMTIuMTggMTQ6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGF0J3MgbWljcm8gb3B0aW1pemluZyBYZW4uLi4gdGhlcmUgYXJlIGJldHRlciAoYW5kIGxlc3Mg
cmlza3kpIHBsYWNlIAo+IHRvIGxvb2sgZm9yIG9wdGltaXphdGlvbi4KSSB3b3VsZCBhcHByZWNp
YXRlIHlvdSBwb2ludCBtZSB0aG9zZSBwbGFjZXMuCgo+IEtub3dpbmcgaG93IGZyYWdpbGUgdGhl
IGxvY2tpbmcgaXMgb24gdGhlIG9sZCB2R0lDLCB0aGUgcmlzayBvZiAKPiBtaWNyby1vcHRpbWl6
aW5nIGlzIG5vdCB3b3J0aCBpdC4gSWYgeW91IGNhbiBwcm92aWRlIG51bWJlciB0aGF0IHNob3dz
IAo+IHlvdSBjYW4gaW1wcm92ZSBwZXJmb3JtYW5jZSBieSBtb3JlIHRoYW4gMTAlIGluIGNvbW1v
biBjYXNlIHdpdGggdGhpcyAKPiBwYXRjaCBvbmx5LCB0aGVuIEkgd2lsbCByZWNvbnNpZGVyIG15
IHBvc2l0aW9uLgpJIGdvdCBpdC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
