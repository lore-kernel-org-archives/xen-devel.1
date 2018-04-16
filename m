From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2] x86/xen/efi: Initialize UEFI secure boot
 state during dom0 boot
Date: Mon, 16 Apr 2018 11:04:52 +0200
Message-ID: <20180416090452.GQ26100__15616.6431647309$1523869462$gmane$org@olila.local.net-space.pl>
References: <1522766345-4169-1-git-send-email-daniel.kiper@oracle.com>
 <1522770281.4522.14.camel@HansenPartnership.com>
 <20180403160712.GL26100@olila.local.net-space.pl>
 <1522774852.4522.25.camel@HansenPartnership.com>
 <20180404103824.GM26100@olila.local.net-space.pl>
 <20180411085620.GI26100@olila.local.net-space.pl>
 <CAKv+Gu_1ydqYS+TBgYVEH9jTDEjSecBYxJbq_28mZJ9G3-T8EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rotr=hf=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1f804e-00064M-3H
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 09:05:20 +0000
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_1ydqYS+TBgYVEH9jTDEjSecBYxJbq_28mZJ9G3-T8EA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Juergen Gross <jgross@suse.com>, eric.snowberg@oracle.com, linux-efi@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Bottomley <james.bottomley@hansenpartnership.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMTYsIDIwMTggYXQgMTA6MTU6MTVBTSArMDIwMCwgQXJkIEJpZXNoZXV2ZWwg
d3JvdGU6Cj4gT24gMTEgQXByaWwgMjAxOCBhdCAxMDo1NiwgRGFuaWVsIEtpcGVyIDxkYW5pZWwu
a2lwZXJAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gPiBPbiBXZWQsIEFwciAwNCwgMjAxOCBhdCAxMjoz
ODoyNFBNICswMjAwLCBEYW5pZWwgS2lwZXIgd3JvdGU6Cj4gPj4gT24gVHVlLCBBcHIgMDMsIDIw
MTggYXQgMTA6MDA6NTJBTSAtMDcwMCwgSmFtZXMgQm90dG9tbGV5IHdyb3RlOgo+ID4+ID4gT24g
VHVlLCAyMDE4LTA0LTAzIGF0IDE4OjA3ICswMjAwLCBEYW5pZWwgS2lwZXIgd3JvdGU6Cj4gPj4g
PiA+IE9uIFR1ZSwgQXByIDAzLCAyMDE4IGF0IDA4OjQ0OjQxQU0gLTA3MDAsIEphbWVzIEJvdHRv
bWxleSB3cm90ZToKPiA+Pgo+ID4+IFsuLi5dCj4gPj4KPiA+PiA+ID4gPiBUaGlzIGxvb2tzIGxp
a2UgYSBiYWQgaWRlYTogeW91J3JlIGR1cGxpY2F0aW5nIHRoZSBzZWN1cmUgYm9vdAo+ID4+ID4g
PiA+IGNoZWNrIGluCj4gPj4gPiA+ID4KPiA+PiA+ID4gPiBkcml2ZXJzL2Zpcm13YXJlL2VmaS9s
aWJzdHViL3NlY3VyZWJvb3QuYwo+ID4+ID4gPiA+Cj4gPj4gPiA+ID4gV2hpY2ggaXMgYW4gaW1w
bGVtZW50YXRpb24gb2YgcG9saWN5LiAgSWYgd2UgaGF2ZSB0byBoYXZlIHBvbGljeSBpbgo+ID4+
ID4gPiA+IHRoZSBrZXJuZWwsIGl0IHNob3VsZCByZWFsbHkgb25seSBiZSBpbiBvbmUgcGxhY2Ug
dG8gcHJldmVudCBkcmlmdDsKPiA+PiA+ID4gPiB3aHkgY2FuJ3QgeW91IHNpbXBseSB1c2UgdGhl
IGxpYnN0dWIgZWZpX2dldF9zZWN1cmVib290KCkgc28gd2UncmUKPiA+PiA+ID4gPiBub3QgZHVw
bGljYXRpbmcgdGhlIGltcGxlbWVudGF0aW9uIG9mIHBvbGljeT8KPiA+PiA+ID4KPiA+PiA+ID4g
V2VsbCwgaGVyZSBpcyB0aGUgZmlyc3QgdmVyc2lvbiBvZiB0aGlzIHBhdGNoOgo+ID4+ID4gPiBo
dHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC8xLzkvNDk2IEFyZCBkaWQgbm90IGxpa2UgaXQuIEkg
d2FzIG5vdAo+ID4+ID4gPiBoYXBweSB0b28uIEluIGdlbmVyYWwgYm90aCBhcHByb2FjaGVzIGFy
ZSBub3QgcGVyZmVjdC4gTW9yZSB5b3UgY2FuCj4gPj4gPiA+IGZpbmQgaW4gdGhlIGRpc2N1c3Np
b24gYXJvdW5kIHRoaXMgcGF0Y2hzZXQuIElmIHlvdSBoYXZlIGJldHRlciBpZGVhCj4gPj4gPiA+
IGhvdyB0byBkbyB0aGF0IEkgYW0gaGFwcHkgdG8gaW1wbGVtZW50IGl0Lgo+ID4+ID4KPiA+PiA+
IE9uZSB3YXkgbWlnaHQgYmUgc2ltcGx5IHRvIGhhdmUgdGhlIHByZSBleGl0LWJvb3Qtc2Vydmlj
ZXMgY29kZSBsYXkKPiA+PiA+IGRvd24gYSB2YXJpYWJsZSBjb250YWluaW5nIHRoZSBzdGF0ZSB3
aGljaCB5b3UgcGljayB1cCwgcmF0aGVyIHRoYW4geW91Cj4gPj4KPiA+PiBEbyB5b3UgbWVhbiB2
YXJpYWJsZSBpbiBrZXJuZWwgcHJvcGVyIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQ/IElmIHllcyB0
aGlzCj4gPj4gaXMgbm90IHBvc3NpYmxlLiBFRkkgTGludXggc3R1YiBpcyBub3QgZXhlY3V0ZWQg
aW4gWGVuIGRvbTAuIEFsbCBVRUZJCj4gPj4gaW5mcmFzdHJ1Y3R1cmUgaXMgb3duZWQgYW5kIG9w
ZXJhdGVkIGJ5IFhlbi4gRG9tMCBrZXJuZWwgY2FuIGFjY2VzcyBzb21lCj4gPj4gc3R1ZmYgaW4g
VUVGSSwgaW5jbHVkaW5nIHZhcmlhYmxlcywgdmlhIGh5cGVyY2FsbC4gSG93ZXZlciwgd2hlbiBk
b20wCj4gPj4gcnVucyBvbmx5IFVFRkkgcnVudGltZSBzZXJ2aWNlcyBhcmUgYXZhaWxhYmxlLgo+
ID4+Cj4gPj4gPiBjYWxsaW5nIGVmaSBjb2RlIHNlcGFyYXRlbHkgYW5kIHRyeWluZyB0byB1c2Ug
dGhlIGluc2VjdXJlIFJUCj4gPj4KPiA+PiBJIGFtIG5vdCBzdXJlIHdoeSB0aGV5IGFyZSBpbnNl
Y3VyZS4KPiA+Pgo+ID4+ID4gdmFyaWFibGVzLiAgVGhhdCB3YXkgdGhlcmUncyBhIHVuaWZvcm0g
dmlldyBvZiB0aGUgaW50ZXJuYWwga2VybmVsCj4gPj4gPiBzZWN1cmUgYm9vdCBzdGF0ZSB0aGF0
IGV2ZXJ5b25lIGNhbiB1c2UuCj4gPj4KPiA+PiBUaGF0IHdvdWxkIGJlIHBlcmZlY3QgYnV0IEkg
aGF2ZSBhIGZlZWxpbmcgdGhhdCBpbiBmb3JtIHByb3Bvc2VkIGFib3ZlCj4gPj4gaXQgaXMgbm90
IHBvc3NpYmxlLgo+ID4KPiA+IFBpbmc/Cj4gPgo+Cj4gKGFwb2xvZ2llcyBpZiB0aGlzIGlzIGEg
ZHVwbGljYXRlIGVtYWlsIC0gSSB0aG91Z2h0IEkgaGFkIHJlcGxpZWQKPiBhbHJlYWR5IGJ1dCBJ
IGRvbid0IHNlZSBpdCBpbiBteSBzZW50IGZvbGRlcikKPgo+IFF1ZXVlZCBpbiBlZmkvbmV4dCAt
IHRoYW5rcy4KClRoYW5rcyBhIGxvdCEKCkRhbmllbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
