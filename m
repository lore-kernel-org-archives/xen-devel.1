From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [RFC 10/16] gic:vgic:gic-vgic: introduce non-atomic
 bitops
Date: Mon, 3 Dec 2018 16:37:50 +0000
Message-ID: <20181203163750.42ea79c1@donnerap.cambridge.arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-11-git-send-email-andrii.anisov@gmail.com>
 <20181129121416.222da0d5@donnerap.cambridge.arm.com>
 <f71bead8-4450-7f51-06d4-f4f6021df8d6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=91nf=OM=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1gTrEK-00074h-7G
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 16:37:56 +0000
In-Reply-To: <f71bead8-4450-7f51-06d4-f4f6021df8d6@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAzIERlYyAyMDE4IDE0OjMzOjA4ICswMjAwCkFuZHJpaSBBbmlzb3YgPGFuZHJpaS5h
bmlzb3ZAZ21haWwuY29tPiB3cm90ZToKCkhpIEFuZHJpaSwKCj4gT24gMjkuMTEuMTggMTQ6MTQs
IEFuZHJlIFByenl3YXJhIHdyb3RlOgo+ID4gTmFoLCBwbGVhc2UgZG9uJ3QgZG8gdGhpcy4gIAo+
IFNvcnJ5IGZvciBtYWtpbmcgeW91IGNyeWluZyBsb29raW5nIGF0IHRoaXMgY29kZS4KPiBJdCdz
IHRlcnJpYmxlLCBJIGtub3cuIEl0J3MgcmF0aGVyIGFuIGlkZWEuCj4gCj4gPiBDYW4geW91IHNo
b3cgdGhhdCBhdG9taWMgYml0IG9wcyBhcmUgYQo+ID4gcHJvYmxlbT8gVGhleSBzaG91bGRuJ3Qg
YmUgZXhwZW5zaXZlIHVubGVzcyBjb250ZW5kZWQsIGFsc28gcHJldHR5Cj4gPiBsaWdodHdlaWdo
dCBvbiBzbWFsbCBzeXN0ZW1zIChzaW5nbGUgY2x1c3RlcikuICAKPiBZZXAsIGJ1dCBzdGlsbCBp
dCBpcyBhIGNhbGwgdG8gYSBmdW5jdGlvbiBvZiAxMCBvcGVyYXRpb25zIGluc3RlYWQgb2YgCj4g
b25lIGBvcnJgIGZvciBzZXRfYml0KCkuIFRha2luZyBpbiBhY2NvdW50IGEgaGVhdnkgdXNhZ2Ug
b2YgYml0b3BzIGluIAo+IHRoZSBvbGQgdmdpYyBjb2RlLCB0aGlzIHNob3VsZCBiZW5lZml0IGxh
dGVuY3kuCgpQbGVhc2UgYmUgY2FyZWZ1bCB3aXRoIGFueSBlc3RpbWF0ZSBvbiAiY29zdCIgd2hl
biBqdXN0IGxvb2tpbmcgYXQgdGhlCm51bWJlciBvZiBpbnN0cnVjdGlvbnMuIFRoZSBjb3N0bHkg
cGFydCBpbiBib3RoIG9wZXJhdGlvbnMgaXMgdGhlCm1lbW9yeSBhY2Nlc3MsIGlmIHRoYXQgbWlz
c2VzIGFueSBjYWNoZXMsIGl0IGNhbiBlYXNpbHkgY29zdCBtdWx0aXBsZQpodW5kcmVkIGN5Y2xl
cywgdGhlbiBkb2luZyB0ZW4gbW9yZSByZWdpc3Rlci1vbmx5IGluc3RydWN0aW9ucyBiZWZvcmUK
b3IgYWZ0ZXIgZG9lc24ndCByZWFsbHkgbWF0dGVyIGFueW1vcmUuClBsdXMgX19zZXRfYml0IHdv
dWxkIGJlIGEgImxkci1vcnItc3RyIiBzZXF1ZW5jZSwgbm90IGp1c3QgYW4gb3JyLCBhcwp0aGlz
IHdvdWxkIG5lZWQgdG8gYmUgYSByZWFkLW1vZGlmeS13cml0ZSBzZXF1ZW5jZS4gU28gdGhlIGRp
ZmZlcmVuY2UKaXMgbm90IHRvbyBtdWNoLgoKQ2hlZXJzLApBbmRyZS4KCj4gPiBCdXQgaWYgeW91
IHJlYWxseSB0aGluayB0aGlzIGlzIHVzZWZ1bCwgd2h5IG5vdCBnbyB3aXRoIHRoZSBMaW51eAo+
ID4gd2F5IG9mIHVzaW5nIF9fc2V0X2JpdCB0byBwcm92aWRlIGEgbm9uLWF0b21pYyB2ZXJzaW9u
Pwo+ID4gVGhpcyB3b3VsZCBoYXZlIHRoZSBiaWcgYWR2YW50YWdlIHRoYXQgeW91IGNhbiByZXBs
YWNlIHRoZW0gb24gYQo+ID4gY2FzZS1ieS1jYXNlIGJhc2UsIHdoaWNoIGlzIG11Y2ggbGVzcyBy
aXNreSB0aGFuIHVuY29uZGl0aW9uYWxseQo+ID4gcmVwbGFjaW5nIGV2ZXJ5IChldmVuIGZ1dHVy
ZSEpIHVzYWdlIGluIHRoZSB3aG9sZSBmaWxlLiAgCj4gV2hhdGV2ZXIgeW91IHByZWZlciA6KQo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
