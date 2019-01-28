From: Juergen Gross <jgross@suse.com>
Subject: Re: SpectreV1+L1TF Patch Series
Date: Mon, 28 Jan 2019 09:47:42 +0100
Message-ID: <9a0f161e-f6fb-2e10-3b94-232554b3c5a8@suse.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <5C4EBD1A0200007800211954@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Swqu=QE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1go2a3-0002WK-5M
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 08:47:47 +0000
In-Reply-To: <5C4EBD1A0200007800211954@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDEvMjAxOSAwOToyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSsO8cmdlbiwKPiAKPj4+
PiBPbiAyMy4wMS4xOSBhdCAxMjo1MSwgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+IFRo
aXMgcGF0Y2ggc2VyaWVzIGF0dGVtcHRzIHRvIG1pdGlnYXRlIHRoZSBpc3N1ZSB0aGF0IGhhdmUg
YmVlbiByYWlzZWQgaW4gdGhlCj4+IFhTQS0yODkgKGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL3hz
YS9hZHZpc29yeS0yODkuaHRtbCkuIFRvIGJsb2NrIHNwZWN1bGF0aXZlCj4+IGV4ZWN1dGlvbiBv
biBJbnRlbCBoYXJkd2FyZSwgYW4gbGZlbmNlIGluc3RydWN0aW9uIGlzIHJlcXVpcmVkIHRvIG1h
a2Ugc3VyZQo+PiB0aGF0IHNlbGVjdGVkIGNoZWNrcyBhcmUgbm90IGJ5cGFzc2VkLiBTcGVjdWxh
dGl2ZSBvdXQtb2YtYm91bmQgYWNjZXNzZXMgY2FuCj4+IGJlIHByZXZlbnRlZCBieSB1c2luZyB0
aGUgYXJyYXlfaW5kZXhfbm9zcGVjIG1hY3JvLgo+Pgo+PiBUaGUgbGZlbmNlIGluc3RydWN0aW9u
IHNob3VsZCBiZSBhZGRlZCBvbiB4ODYgcGxhdGZvcm1zIG9ubHkuIFRvIG5vdCBhZmZlY3QKPj4g
cGxhdGZvcm1zIHRoYXQgYXJlIG5vdCBhZmZlY3RlZCBieSB0aGUgTDFURiB2dWxuZXJhYmlsaXR5
LCB0aGUgbGZlbmNlCj4+IGluc3RydWN0aW9uIGlzIHBhdGNoZWQgaW4gdmlhIGFsdGVybmF0aXZl
IHBhdGNoaW5nIG9uIEludGVsIENQVXMgb25seS4KPj4gRnVydGhlcm1vcmUsIHRoZSBjb21waWxl
IHRpbWUgY29uZmlndXJhdGlvbiBhbGxvd3MgdG8gY2hvb3NlIGhvdyB0byBwcm90ZWN0IHRoZQo+
PiBldmFsdWF0aW9uIG9mIGNvbmRpdGlvbnMgd2l0aCB0aGUgbGZlbmNlIGluc3RydWN0aW9uLgo+
IAo+IEkndmUgbm90aWNlZCBvbmx5IG5vdyB0aGF0IHlvdSB3ZXJlbid0IENjLWVkIG9uIHRoaXMg
c2VyaWVzLiBJdAo+IGNsZWFybHkgaXMgc29tZXRoaW5nIHRvIGF0IGxlYXN0IGJlIGNvbnNpZGVy
ZWQgZm9yIDQuMTIuIE1heSBJCj4gYXNrIHdoYXQgeW91ciB2aWV3IG9uIHRoaXMgaXM/IFBlcmhh
cHMgaW4gcGFydGljdWxhciB3aGV0aGVyCj4geW91IHdvdWxkIHdhbnQgdG8gc2V0IHNvbWUgYm91
bmRhcnkgaW4gdGltZSB1bnRpbCB3aGljaCBwaWVjZXMKPiBvZiBpdCAoYXMgdGhleSBiZWNvbWUg
cmVhZHksIHdoaWNoIGxvb2tzIHRvIGJlIHRoZSBjYXNlIGZvcgo+IHBhdGNoZXMgMTAgYW5kIDEx
IGF0IHRoaXMgcG9pbnQgaW4gdGltZSkgbWF5IGdvIGluPwoKSSdkIHNheSB1bnRpbCBSQzMgdGhl
eSBhcmUgZmluZSB0byBnbyBpbiB3aGVuIHJlYWR5LiBBZnRlciB0aGF0IEknZCBsaWtlCnRvIGRl
Y2lkZSBvbiBhIGNhc2UtYnktY2FzZSBiYXNpcy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
