From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v2] x86/xen/efi: Initialize UEFI secure boot
 state during dom0 boot
Date: Mon, 16 Apr 2018 10:15:15 +0200
Message-ID: <CAKv+Gu_1ydqYS+TBgYVEH9jTDEjSecBYxJbq_28mZJ9G3-T8EA__2591.06196831471$1523866441$gmane$org@mail.gmail.com>
References: <1522766345-4169-1-git-send-email-daniel.kiper@oracle.com>
 <1522770281.4522.14.camel@HansenPartnership.com>
 <20180403160712.GL26100@olila.local.net-space.pl>
 <1522774852.4522.25.camel@HansenPartnership.com>
 <20180404103824.GM26100@olila.local.net-space.pl>
 <20180411085620.GI26100@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=npgy=hf=linaro.org=ard.biesheuvel@srs-us1.protection.inumbo.net>)
 id 1f7zIE-0002UQ-2z
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 08:15:18 +0000
Received: by mail-it0-x244.google.com with SMTP id n81-v6so3784086ita.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Apr 2018 01:15:16 -0700 (PDT)
In-Reply-To: <20180411085620.GI26100@olila.local.net-space.pl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, eric.snowberg@oracle.com, linux-efi@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Bottomley <james.bottomley@hansenpartnership.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTEgQXByaWwgMjAxOCBhdCAxMDo1NiwgRGFuaWVsIEtpcGVyIDxkYW5pZWwua2lwZXJAb3Jh
Y2xlLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBBcHIgMDQsIDIwMTggYXQgMTI6Mzg6MjRQTSArMDIw
MCwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+PiBPbiBUdWUsIEFwciAwMywgMjAxOCBhdCAxMDowMDo1
MkFNIC0wNzAwLCBKYW1lcyBCb3R0b21sZXkgd3JvdGU6Cj4+ID4gT24gVHVlLCAyMDE4LTA0LTAz
IGF0IDE4OjA3ICswMjAwLCBEYW5pZWwgS2lwZXIgd3JvdGU6Cj4+ID4gPiBPbiBUdWUsIEFwciAw
MywgMjAxOCBhdCAwODo0NDo0MUFNIC0wNzAwLCBKYW1lcyBCb3R0b21sZXkgd3JvdGU6Cj4+Cj4+
IFsuLi5dCj4+Cj4+ID4gPiA+IFRoaXMgbG9va3MgbGlrZSBhIGJhZCBpZGVhOiB5b3UncmUgZHVw
bGljYXRpbmcgdGhlIHNlY3VyZSBib290Cj4+ID4gPiA+IGNoZWNrIGluCj4+ID4gPiA+Cj4+ID4g
PiA+IGRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvc2VjdXJlYm9vdC5jCj4+ID4gPiA+Cj4+
ID4gPiA+IFdoaWNoIGlzIGFuIGltcGxlbWVudGF0aW9uIG9mIHBvbGljeS4gIElmIHdlIGhhdmUg
dG8gaGF2ZSBwb2xpY3kgaW4KPj4gPiA+ID4gdGhlIGtlcm5lbCwgaXQgc2hvdWxkIHJlYWxseSBv
bmx5IGJlIGluIG9uZSBwbGFjZSB0byBwcmV2ZW50IGRyaWZ0Owo+PiA+ID4gPiB3aHkgY2FuJ3Qg
eW91IHNpbXBseSB1c2UgdGhlIGxpYnN0dWIgZWZpX2dldF9zZWN1cmVib290KCkgc28gd2UncmUK
Pj4gPiA+ID4gbm90IGR1cGxpY2F0aW5nIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBwb2xpY3k/Cj4+
ID4gPgo+PiA+ID4gV2VsbCwgaGVyZSBpcyB0aGUgZmlyc3QgdmVyc2lvbiBvZiB0aGlzIHBhdGNo
Ogo+PiA+ID4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvMS85LzQ5NiBBcmQgZGlkIG5vdCBs
aWtlIGl0LiBJIHdhcyBub3QKPj4gPiA+IGhhcHB5IHRvby4gSW4gZ2VuZXJhbCBib3RoIGFwcHJv
YWNoZXMgYXJlIG5vdCBwZXJmZWN0LiBNb3JlIHlvdSBjYW4KPj4gPiA+IGZpbmQgaW4gdGhlIGRp
c2N1c3Npb24gYXJvdW5kIHRoaXMgcGF0Y2hzZXQuIElmIHlvdSBoYXZlIGJldHRlciBpZGVhCj4+
ID4gPiBob3cgdG8gZG8gdGhhdCBJIGFtIGhhcHB5IHRvIGltcGxlbWVudCBpdC4KPj4gPgo+PiA+
IE9uZSB3YXkgbWlnaHQgYmUgc2ltcGx5IHRvIGhhdmUgdGhlIHByZSBleGl0LWJvb3Qtc2Vydmlj
ZXMgY29kZSBsYXkKPj4gPiBkb3duIGEgdmFyaWFibGUgY29udGFpbmluZyB0aGUgc3RhdGUgd2hp
Y2ggeW91IHBpY2sgdXAsIHJhdGhlciB0aGFuIHlvdQo+Pgo+PiBEbyB5b3UgbWVhbiB2YXJpYWJs
ZSBpbiBrZXJuZWwgcHJvcGVyIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQ/IElmIHllcyB0aGlzCj4+
IGlzIG5vdCBwb3NzaWJsZS4gRUZJIExpbnV4IHN0dWIgaXMgbm90IGV4ZWN1dGVkIGluIFhlbiBk
b20wLiBBbGwgVUVGSQo+PiBpbmZyYXN0cnVjdHVyZSBpcyBvd25lZCBhbmQgb3BlcmF0ZWQgYnkg
WGVuLiBEb20wIGtlcm5lbCBjYW4gYWNjZXNzIHNvbWUKPj4gc3R1ZmYgaW4gVUVGSSwgaW5jbHVk
aW5nIHZhcmlhYmxlcywgdmlhIGh5cGVyY2FsbC4gSG93ZXZlciwgd2hlbiBkb20wCj4+IHJ1bnMg
b25seSBVRUZJIHJ1bnRpbWUgc2VydmljZXMgYXJlIGF2YWlsYWJsZS4KPj4KPj4gPiBjYWxsaW5n
IGVmaSBjb2RlIHNlcGFyYXRlbHkgYW5kIHRyeWluZyB0byB1c2UgdGhlIGluc2VjdXJlIFJUCj4+
Cj4+IEkgYW0gbm90IHN1cmUgd2h5IHRoZXkgYXJlIGluc2VjdXJlLgo+Pgo+PiA+IHZhcmlhYmxl
cy4gIFRoYXQgd2F5IHRoZXJlJ3MgYSB1bmlmb3JtIHZpZXcgb2YgdGhlIGludGVybmFsIGtlcm5l
bAo+PiA+IHNlY3VyZSBib290IHN0YXRlIHRoYXQgZXZlcnlvbmUgY2FuIHVzZS4KPj4KPj4gVGhh
dCB3b3VsZCBiZSBwZXJmZWN0IGJ1dCBJIGhhdmUgYSBmZWVsaW5nIHRoYXQgaW4gZm9ybSBwcm9w
b3NlZCBhYm92ZQo+PiBpdCBpcyBub3QgcG9zc2libGUuCj4KPiBQaW5nPwo+CgooYXBvbG9naWVz
IGlmIHRoaXMgaXMgYSBkdXBsaWNhdGUgZW1haWwgLSBJIHRob3VnaHQgSSBoYWQgcmVwbGllZAph
bHJlYWR5IGJ1dCBJIGRvbid0IHNlZSBpdCBpbiBteSBzZW50IGZvbGRlcikKClF1ZXVlZCBpbiBl
ZmkvbmV4dCAtIHRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
