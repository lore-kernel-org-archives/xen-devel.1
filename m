From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2] x86/xen/efi: Initialize UEFI secure boot
 state during dom0 boot
Date: Wed, 4 Apr 2018 12:38:24 +0200
Message-ID: <20180404103824.GM26100__12123.0228025981$1522838261$gmane$org@olila.local.net-space.pl>
References: <1522766345-4169-1-git-send-email-daniel.kiper@oracle.com>
 <1522770281.4522.14.camel@HansenPartnership.com>
 <20180403160712.GL26100@olila.local.net-space.pl>
 <1522774852.4522.25.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6mmf=gz=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1f3foV-0005AX-JU
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 10:38:47 +0000
Content-Disposition: inline
In-Reply-To: <1522774852.4522.25.camel@HansenPartnership.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: jgross@suse.com, eric.snowberg@oracle.com, linux-efi@vger.kernel.org, ard.biesheuvel@linaro.org, x86@kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMDMsIDIwMTggYXQgMTA6MDA6NTJBTSAtMDcwMCwgSmFtZXMgQm90dG9tbGV5
IHdyb3RlOgo+IE9uIFR1ZSwgMjAxOC0wNC0wMyBhdCAxODowNyArMDIwMCwgRGFuaWVsIEtpcGVy
IHdyb3RlOgo+ID4gT24gVHVlLCBBcHIgMDMsIDIwMTggYXQgMDg6NDQ6NDFBTSAtMDcwMCwgSmFt
ZXMgQm90dG9tbGV5IHdyb3RlOgoKWy4uLl0KCj4gPiA+IFRoaXMgbG9va3MgbGlrZSBhIGJhZCBp
ZGVhOiB5b3UncmUgZHVwbGljYXRpbmcgdGhlIHNlY3VyZSBib290Cj4gPiA+IGNoZWNrIGluCj4g
PiA+Cj4gPiA+IGRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvc2VjdXJlYm9vdC5jCj4gPiA+
Cj4gPiA+IFdoaWNoIGlzIGFuIGltcGxlbWVudGF0aW9uIG9mIHBvbGljeS4gwqBJZiB3ZSBoYXZl
IHRvIGhhdmUgcG9saWN5IGluCj4gPiA+IHRoZSBrZXJuZWwsIGl0IHNob3VsZCByZWFsbHkgb25s
eSBiZSBpbiBvbmUgcGxhY2UgdG8gcHJldmVudCBkcmlmdDsKPiA+ID4gd2h5IGNhbid0IHlvdSBz
aW1wbHkgdXNlIHRoZSBsaWJzdHViIGVmaV9nZXRfc2VjdXJlYm9vdCgpIHNvIHdlJ3JlCj4gPiA+
IG5vdCBkdXBsaWNhdGluZyB0aGUgaW1wbGVtZW50YXRpb24gb2YgcG9saWN5Pwo+ID4KPiA+IFdl
bGwsIGhlcmUgaXMgdGhlIGZpcnN0IHZlcnNpb24gb2YgdGhpcyBwYXRjaDoKPiA+IGh0dHBzOi8v
bGttbC5vcmcvbGttbC8yMDE4LzEvOS80OTYgQXJkIGRpZCBub3QgbGlrZSBpdC4gSSB3YXMgbm90
Cj4gPiBoYXBweSB0b28uIEluIGdlbmVyYWwgYm90aCBhcHByb2FjaGVzIGFyZSBub3QgcGVyZmVj
dC4gTW9yZSB5b3UgY2FuCj4gPiBmaW5kIGluIHRoZSBkaXNjdXNzaW9uIGFyb3VuZCB0aGlzIHBh
dGNoc2V0LiBJZiB5b3UgaGF2ZSBiZXR0ZXIgaWRlYQo+ID4gaG93IHRvIGRvIHRoYXQgSSBhbSBo
YXBweSB0byBpbXBsZW1lbnQgaXQuCj4KPiBPbmUgd2F5IG1pZ2h0IGJlIHNpbXBseSB0byBoYXZl
IHRoZSBwcmUgZXhpdC1ib290LXNlcnZpY2VzIGNvZGUgbGF5Cj4gZG93biBhIHZhcmlhYmxlIGNv
bnRhaW5pbmcgdGhlIHN0YXRlIHdoaWNoIHlvdSBwaWNrIHVwLCByYXRoZXIgdGhhbiB5b3UKCkRv
IHlvdSBtZWFuIHZhcmlhYmxlIGluIGtlcm5lbCBwcm9wZXIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dD8gSWYgeWVzIHRoaXMKaXMgbm90IHBvc3NpYmxlLiBFRkkgTGludXggc3R1YiBpcyBub3QgZXhl
Y3V0ZWQgaW4gWGVuIGRvbTAuIEFsbCBVRUZJCmluZnJhc3RydWN0dXJlIGlzIG93bmVkIGFuZCBv
cGVyYXRlZCBieSBYZW4uIERvbTAga2VybmVsIGNhbiBhY2Nlc3Mgc29tZQpzdHVmZiBpbiBVRUZJ
LCBpbmNsdWRpbmcgdmFyaWFibGVzLCB2aWEgaHlwZXJjYWxsLiBIb3dldmVyLCB3aGVuIGRvbTAK
cnVucyBvbmx5IFVFRkkgcnVudGltZSBzZXJ2aWNlcyBhcmUgYXZhaWxhYmxlLgoKPiBjYWxsaW5n
IGVmaSBjb2RlIHNlcGFyYXRlbHkgYW5kIHRyeWluZyB0byB1c2UgdGhlIGluc2VjdXJlIFJUCgpJ
IGFtIG5vdCBzdXJlIHdoeSB0aGV5IGFyZSBpbnNlY3VyZS4KCj4gdmFyaWFibGVzLiDCoFRoYXQg
d2F5IHRoZXJlJ3MgYSB1bmlmb3JtIHZpZXcgb2YgdGhlIGludGVybmFsIGtlcm5lbAo+IHNlY3Vy
ZSBib290IHN0YXRlIHRoYXQgZXZlcnlvbmUgY2FuIHVzZS4KClRoYXQgd291bGQgYmUgcGVyZmVj
dCBidXQgSSBoYXZlIGEgZmVlbGluZyB0aGF0IGluIGZvcm0gcHJvcG9zZWQgYWJvdmUKaXQgaXMg
bm90IHBvc3NpYmxlLgoKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
