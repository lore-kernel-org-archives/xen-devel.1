From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH] x86/entry/64: Remove %ebx handling from
 error_entry/exit
Date: Thu, 16 Aug 2018 08:35:44 -0700
Message-ID: <CALCETrUQSpXMkR6C=zREV_jNJg3iGe0rqHb6owVs7OrhqnASVA__48319.6712252267$1534433701$gmane$org@mail.gmail.com>
References: <6A458833-F161-4C0A-8DFF-8757EDA36D5C@amacapital.net>
 <1533749748-25861-1-git-send-email-srn@prgmr.com>
 <1533818501.5775.4.camel@infradead.org>
 <1f15d219-46fd-fc21-84d5-877a7af4c87e@prgmr.com>
 <20180816151946.GH10648@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=eefs=k7=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1fqKJk-0000Pf-NE
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 15:36:08 +0000
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BF6C20C51
 for <xen-devel@lists.xenproject.org>; Thu, 16 Aug 2018 15:36:06 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id e7-v6so4537588wrs.9
 for <xen-devel@lists.xenproject.org>; Thu, 16 Aug 2018 08:36:06 -0700 (PDT)
In-Reply-To: <20180816151946.GH10648@kroah.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Juergen Gross <jgross@suse.com>, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Gerst <brgerst@gmail.com>, X86 ML <x86@kernel.org>, stable <stable@vger.kernel.org>, "Durand Wesolowski,
 Jimmy" <jdw@amazon.de>, Borislav Petkov <bp@alien8.de>, Dominik Brodowski <linux@dominikbrodowski.net>, Andy Lutomirski <luto@kernel.org>, Sarah Newman <srn@prgmr.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>, Ingo Molnar <mingo@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMTYsIDIwMTggYXQgODoxOSBBTSwgR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+IHdyb3RlOgo+IE9uIEZyaSwgQXVnIDEwLCAyMDE4IGF0IDEyOjIzOjQ1QU0g
LTA3MDAsIFNhcmFoIE5ld21hbiB3cm90ZToKPj4gT24gMDgvMDkvMjAxOCAwNTo0MSBBTSwgRGF2
aWQgV29vZGhvdXNlIHdyb3RlOgo+PiA+IE9uIFdlZCwgMjAxOC0wOC0wOCBhdCAxMDozNSAtMDcw
MCwgU2FyYWggTmV3bWFuIHdyb3RlOgo+PiA+PiBjb21taXQgYjM2ODFkZDU0OGQwNmRlYjJlMTU3
Mzg5MDgyOWRmZjRiMTVhYmY0NiB1cHN0cmVhbS4KPj4gPj4KPj4gPj4gVGhpcyB2ZXJzaW9uIGFw
cGxpZXMgdG8gdjQuOS4KPj4gPgo+PiA+IEkgdGhpbmsgeW91IGNhbiBraWxsIHRoZSAneG9ybCAl
ZWJ4LCVlYngnIGZyb20gZXJyb3JfZW50cnkgdG9vIGJ1dCB5ZXMsCj4+ID4gdGhpcyBkb2VzIHdh
bnQgdG8gZ28gdG8gNC45IGFuZCBlYXJsaWVyIGJlY2F1c2UgdGhlICdGaXhlczonIHRhZyBpcyBh
Cj4+ID4gYml0IG9mIGEgbGllIOKAlCB0aGUgcHJvYmxlbSBleGlzdGVkIGJlZm9yZSB0aGF0LCBh
dCBsZWFzdCBpbiB0aGVvcnkuCj4+Cj4+IFRoZSBjb21taXQgMjE0MGE5OTQyICJ4ODYvZW50cnkv
NjQ6IFJlbGF4IHB2b3BzIHN0dWIgY2xvYmJlcgo+PiBzcGVjaWZpY2F0aW9ucyIgd2FzIHdoYXQg
cmVtb3ZlZCB0aGUgIm1vdmwgJWVieCwgJWVheCIgbGluZSBsYXRlciBvbgo+PiBvcmlnaW5hbGx5
LCBidXQgaXQgd2FzIHRoZSBjb21taXQgM2FjNmQ4Yzc4N2I4IHRoYXQgcmVtb3ZlZCB0aGUKPj4g
J3hvcmwgJWVieCwlZWJ4Jy4gU28gdGhlc2Ugd2VyZW4ndCBtYXRjaGVkLgo+Pgo+PiBJIGRvbid0
IGtub3cgaWYgaXQncyBhIGNvbmNlcm4sIGJ1dCBpZiBzb21lb25lIGhhZCBnb25lIHRvIHRoZSBl
ZmZvcnQgb2YKPj4gYmFja3BvcnRpbmcgdGhlIG9yaWdpbmFsIGNvbW1pdCAzYWM2ZDhjNzg3Yjgz
LCBhZGRpbmcgdGhlIHJlbW92YWwgb2YKPj4gJ3hvcmwgJWVieCwlZWJ4JyB0byB0aGlzIHBhdGNo
IHdvdWxkIGNyZWF0ZSBtZXJnZSBjb25mbGljdHMuCj4+IEZvciB0aGF0IHJlYXNvbiBhbmQgZ2l2
ZW4gdGhlIGxpbmUgaXMgaGFybWxlc3MsIHNob3VsZCBpdCBiZSBsZWZ0IGluPwo+Cj4gSSBuZWVk
IHNvbWUga2luZCBvZiBhZ3JlZW1lbnQgaGVyZSBmb3IgbWUgdG8ga25vdyB3aGF0IHRvIGRvIHdp
dGggdGhpcwo+IHBhdGNoLi4uICB7aGludH0KPgoKSSB3b3VsZCByZW1vdmUgdGhlIHhvcmwuCgpJ
ZiB0aGVyZSdzIGFuIGFjdHVhbCBjYW5kaWRhdGUgcGF0Y2gsIEknZCBiZSBoYXBweSB0byByZWFk
IGl0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
