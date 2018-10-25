From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [v3 04/12] x86/fsgsbase/64: Enable FSGSBASE
 instructions in the helper functions
Date: Thu, 25 Oct 2018 16:00:35 -0700
Message-ID: <CALCETrVdxKsSgU8zeyn7DO-1toO770yZbEAPTGOtF0FvPfQOXg__41601.529919035$1540508394$gmane$org@mail.gmail.com>
References: <20181023184234.14025-1-chang.seok.bae@intel.com>
 <20181023184234.14025-5-chang.seok.bae@intel.com>
 <CALCETrVcJ08c6yf6y3ruOA_Hx_7srkHw5iYfx1c2p8_ySiL2WA@mail.gmail.com>
 <1EE75BE7-12C6-4BD9-9D31-E9C396D2015B@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q57w=nf=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1gFocV-0001Nf-AF
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 23:00:51 +0000
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5774620848
 for <xen-devel@lists.xenproject.org>; Thu, 25 Oct 2018 23:00:48 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d2-v6so10944350wro.7
 for <xen-devel@lists.xenproject.org>; Thu, 25 Oct 2018 16:00:48 -0700 (PDT)
In-Reply-To: <1EE75BE7-12C6-4BD9-9D31-E9C396D2015B@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Bae, Chang Seok" <chang.seok.bae@intel.com>
Cc: Juergen Gross <jgross@suse.com>, "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, "Metzger, Markus T" <markus.t.metzger@intel.com>, Ingo Molnar <mingo@kernel.org>, Andrew Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBPY3QgMjUsIDIwMTggYXQgMTI6MzIgQU0gQmFlLCBDaGFuZyBTZW9rCjxjaGFuZy5z
ZW9rLmJhZUBpbnRlbC5jb20+IHdyb3RlOgo+Cj4KPiA+IE9uIE9jdCAyNCwgMjAxOCwgYXQgMTI6
MTYsIEFuZHkgTHV0b21pcnNraSA8bHV0b0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBU
dWUsIE9jdCAyMywgMjAxOCBhdCAxMTo0MyBBTSBDaGFuZyBTLiBCYWUgPGNoYW5nLnNlb2suYmFl
QGludGVsLmNvbT4gd3JvdGU6Cj4gPj4gdm9pZCB4ODZfZnNiYXNlX3dyaXRlX2NwdSh1bnNpZ25l
ZCBsb25nIGZzYmFzZSkKPiA+PiB7Cj4gPj4gLSAgICAgICAvKgo+ID4+IC0gICAgICAgICogU2V0
IHRoZSBzZWxlY3RvciB0byAwIGFzIGEgbm90aW9uLCB0aGF0IHRoZSBzZWdtZW50IGJhc2UgaXMK
PiA+PiAtICAgICAgICAqIG92ZXJ3cml0dGVuLCB3aGljaCB3aWxsIGJlIGNoZWNrZWQgZm9yIHNr
aXBwaW5nIHRoZSBzZWdtZW50IGxvYWQKPiA+PiAtICAgICAgICAqIGR1cmluZyBjb250ZXh0IHN3
aXRjaC4KPiA+PiAtICAgICAgICAqLwo+ID4+IC0gICAgICAgbG9hZHNlZyhGUywgMCk7Cj4gPj4g
LSAgICAgICB3cm1zcmwoTVNSX0ZTX0JBU0UsIGZzYmFzZSk7Cj4gPj4gKyAgICAgICBpZiAoc3Rh
dGljX2NwdV9oYXMoWDg2X0ZFQVRVUkVfRlNHU0JBU0UpKSB7Cj4gPj4gKyAgICAgICAgICAgICAg
IHdyZnNiYXNlKGZzYmFzZSk7Cj4gPj4gKyAgICAgICB9IGVsc2Ugewo+ID4+ICsgICAgICAgICAg
ICAgICAvKgo+ID4+ICsgICAgICAgICAgICAgICAgKiBTZXQgdGhlIHNlbGVjdG9yIHRvIDAgYXMg
YSBub3Rpb24sIHRoYXQgdGhlIHNlZ21lbnQgYmFzZSBpcwo+ID4+ICsgICAgICAgICAgICAgICAg
KiBvdmVyd3JpdHRlbiwgd2hpY2ggd2lsbCBiZSBjaGVja2VkIGZvciBza2lwcGluZyB0aGUgc2Vn
bWVudCBsb2FkCj4gPj4gKyAgICAgICAgICAgICAgICAqIGR1cmluZyBjb250ZXh0IHN3aXRjaC4K
PiA+PiArICAgICAgICAgICAgICAgICovCj4gPj4gKyAgICAgICAgICAgICAgIGxvYWRzZWcoRlMs
IDApOwo+ID4+ICsgICAgICAgICAgICAgICB3cm1zcmwoTVNSX0ZTX0JBU0UsIGZzYmFzZSk7Cj4g
Pj4gKyAgICAgICB9Cj4gPj4gfQo+ID4+Cj4gPj4gdm9pZCB4ODZfZ3NiYXNlX3dyaXRlX2NwdV9p
bmFjdGl2ZSh1bnNpZ25lZCBsb25nIGdzYmFzZSkKPiA+PiB7Cj4gPj4gLSAgICAgICAvKiBTZXQg
dGhlIHNlbGVjdG9yIHRvIDAgZm9yIHRoZSBzYW1lIHJlYXNvbiBhcyAlZnMgYWJvdmUuICovCj4g
Pj4gLSAgICAgICBsb2Fkc2VnKEdTLCAwKTsKPiA+PiAtICAgICAgIHdybXNybChNU1JfS0VSTkVM
X0dTX0JBU0UsIGdzYmFzZSk7Cj4gPj4gKyAgICAgICBpZiAoc3RhdGljX2NwdV9oYXMoWDg2X0ZF
QVRVUkVfRlNHU0JBU0UpKSB7Cj4gPj4gKyAgICAgICAgICAgICAgIHdyX2luYWN0aXZlX2dzYmFz
ZShnc2Jhc2UpOwo+ID4+ICsgICAgICAgfSBlbHNlIHsKPiA+PiArICAgICAgICAgICAgICAgLyog
U2V0IHRoZSBzZWxlY3RvciB0byAwIGZvciB0aGUgc2FtZSByZWFzb24gYXMgJWZzIGFib3ZlLiAq
Lwo+ID4+ICsgICAgICAgICAgICAgICBsb2Fkc2VnKEdTLCAwKTsKPiA+PiArICAgICAgICAgICAg
ICAgd3Jtc3JsKE1TUl9LRVJORUxfR1NfQkFTRSwgZ3NiYXNlKTsKPiA+Cj4gPiBJIHN0aWxsIGRv
bid0IGdldCB3aGF0IHRoaXMgY29kZSBpcyB0cnlpbmcgdG8gZG8uICBTZWUgb3RoZXIgZW1haWwu
ICBJCj4gPiB0aGluayBpdCB3aWxsIHN0cmFpZ2h0IHVwIGNyYXNoIHRoZSBrZXJuZWwgb24gc29t
ZSBDUFVzLCBzaW5jZSB3cml0aW5nCj4gPiAwIHRvICUlZ3Mgd2lsbCB6ZXJvIG91dCB0aGUgKmFj
dGl2ZSogYmFzZSBvbiBzb21lIENQVXMuCj4gPgo+Cj4gT24gdGhvc2UgQ1BVcywgaG93IHRoZSBv
bGQgZG9fYXJjaF9wcmN0bF82NCgpIHdvcmtlZD8KPiBsb2Fkc2VnKEdTLCAwKSBldmVudHVhbGx5
IGhpdHMgdGhlIG5hdGl2ZV9sb2FkX2dzX2luZGV4IGVudHJ5LCB3aGVyZSBhY3R1YWwKPiBtb3Yg
4oCmLCAlZ3MgaXMgd3JhcHBlZCBieSB0d28gU1dBUEdTZXMuIFNvLCBpdCB3b27igJl0IGNhdXNl
IHRoZSBzaWRlIGVmZmVjdAo+IG9mIG92ZXJ3cml0aW5nIHRoZSAqYWN0aXZlKiBiYXNlLCBJIHRo
aW5rLgo+Cj4gPiBJIHRoaW5rIHRoYXQsIGlmIHlvdSByZWFsbHkgd2FudCBzb21lIGZhbmN5IG9w
dGltaXphdGlvbiBmb3IgdGhlCj4gPiBub24tRlNHU0JBU0UgY2FzZSwgeW91IG5lZWQgdG8gcHVs
bCB0aGF0IG91dCBpbnRvIHRoZSBjYWxsZXJzIG9mIHRoZXNlCj4gPiBoZWxwZXJzLgo+CgpJIHdh
cyB0aGlua2luZyBvZiBsb2Fkc2VnbWVudCwgbm90IGxvYWRzZWcuICBTb3JyeSEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
