From: Andy Lutomirski <luto@kernel.org>
Subject: Re: Patch "x86/entry/64: Remove %ebx handling from
 error_entry/exit" has been added to the 4.9-stable tree
Date: Thu, 6 Dec 2018 10:49:53 -0800
Message-ID: <CALCETrW_F=DOKCbE5=wdFSUbKPGPbGw3whu-GruNH0qAR0doEQ__14733.6944159635$1544122138$gmane$org@mail.gmail.com>
References: <153492235124199@kroah.com>
 <5b11beecd1491a3b4441e277240c00c8d0ea965f.camel@infradead.org>
 <D7629DC3-8AB2-4E7D-89A2-96B0DB87AD4E@amacapital.net>
 <b26bfff712aa646f108d4e9eecf73e8707522488.camel@infradead.org>
 <30630129-c017-2b90-45da-2dfda6cf062b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TaIL=OP=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1gUyiw-0004YT-Dn
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 18:50:10 +0000
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 762AA214DB
 for <xen-devel@lists.xenproject.org>; Thu,  6 Dec 2018 18:50:08 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id c14so1562710wrr.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Dec 2018 10:50:08 -0800 (PST)
In-Reply-To: <30630129-c017-2b90-45da-2dfda6cf062b@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Denys Vlasenko <dvlasenk@redhat.com>, Sarah Newman <srn@prgmr.com>, Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, "M. Vefa Bicakci" <m.v.b@runbox.com>, Brian Gerst <brgerst@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, stable <stable@vger.kernel.org>, Andrew Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: xen-devel@lists.xenproject.org

PiBPbiBEZWMgNiwgMjAxOCwgYXQgOTozNiBBTSwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPj4gT24gMDYvMTIvMjAxOCAxNzoxMCwgRGF2aWQgV29v
ZGhvdXNlIHdyb3RlOgo+PiBPbiBXZWQsIDIwMTgtMTEtMjggYXQgMDg6NDQgLTA4MDAsIEFuZHkg
THV0b21pcnNraSB3cm90ZToKPj4+PiBDYW4gd2UgYXNzdW1lIGl0J3MgYWx3YXlzIGZyb20ga2Vy
bmVsPyBUaGUgWGVuIGNvZGUgZGVmaW5pdGVseSBzZWVtcyB0bwo+Pj4+IGhhbmRsZSBpbnZva2lu
ZyB0aGlzIGZyb20gYm90aCBrZXJuZWwgYW5kIHVzZXJzcGFjZSBjb250ZXh0cy4KPj4+IEkgbGVh
cm5lZCB0aGF0IG15IGNvbW1lbnQgaGVyZSB3YXMgd3Jvbmcgc2hvcnRseSBhZnRlciB0aGUgcGF0
Y2ggbGFuZGVkIDooCj4+IFR1cm5zIG91dCB0aGUgb25seSBwbGFjZSBJIHNlZSBpdCBnZXR0aW5n
IGNhbGxlZCBmcm9tIGlzIHVuZGVyCj4+IF9fY29udGV4dF9zd2l0Y2goKS4KPj4KPj4gIzcgW2Zm
ZmY4ODAxMTQ0YTdjZjBdIG5ld194ZW5fZmFpbHNhZmVfY2FsbGJhY2sgYXQgZmZmZmZmZmZhMDI4
MDI4YSBba21vZF9lYnhmaXhdCj4+ICM4IFtmZmZmODgwMTE0NGE3ZDkwXSB4ZW5faHlwZXJjYWxs
X3VwZGF0ZV9kZXNjcmlwdG9yIGF0IGZmZmZmZmZmODEwMDExNGEKPj4gIzkgW2ZmZmY4ODAxMTQ0
YTdkYjhdIHhlbl9oeXBlcmNhbGxfdXBkYXRlX2Rlc2NyaXB0b3IgYXQgZmZmZmZmZmY4MTAwMTE0
YQo+PiAjMTAgW2ZmZmY4ODAxMTQ0YTdkZjBdIHhlbl9tY19mbHVzaCBhdCBmZmZmZmZmZjgxMDA2
YWI5Cj4+ICMxMSBbZmZmZjg4MDExNDRhN2UzMF0geGVuX2VuZF9jb250ZXh0X3N3aXRjaCBhdCBm
ZmZmZmZmZjgxMDA0ZTEyCj4+ICMxMiBbZmZmZjg4MDExNDRhN2U0OF0gX19zd2l0Y2hfdG8gYXQg
ZmZmZmZmZmY4MTAxNjU4Mgo+PiAjMTMgW2ZmZmY4ODAxMTQ0YTdlYTBdIF9fc2NoZWR1bGUgYXQg
ZmZmZmZmZmY4MTVkMmIzNwo+Pgo+PiBUaGF0IOKApjExNGEgaW4geGVuX2h5cGVyY2FsbF91cGRh
dGVfZGVzY3JpcHRvciBpcyB0aGUgJ3BvcCcgaW5zdHJ1Y3Rpb24KPj4gcmlnaHQgYWZ0ZXIgdGhl
IHN5c2NhbGw7IGl0J3MgaGFwcGVuaW5nIHdoZW4gWGVuIGlzIHByZWVtcHRpbmcgdGhlCj4+IGRv
bWFpbiBpbiB0aGUgaHlwZXJjYWxsIGFuZCB0aGVuIHJlbG9hZHMgdGhlIHNlZ21lbnQgcmVnaXN0
ZXJzIHRvIHJ1bgo+PiB0aGF0IHZDUFUgYWdhaW4gbGF0ZXIuCj4+Cj4+IFsgIDQ0MTg1LjIyNTI4
OV0gICBXQVJOOiBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJE
STogMDAwMDAwMGFiYmQ3NjA2MAo+Pgo+PiBUaGUgdXBkYXRlX2Rlc2NyaXB0b3IgaHlwZXJjYWxs
IGFyZ3MgKHJkaSwgcnNpKSB3ZXJlIDB4YWJiZDc2MDYwIGFuZCAwCj4+IHJlc3BlY3RpdmVseSDi
gJQgaXQgd2FzIHNldHRpbmcgYSBkZXNjcmlwdG9yIGF0IHRoYXQgYWRkcmVzcywgdG8gemVyby4K
Pj4KPj4gWGVuIHRoZW4gZmFpbGVkIHRvIGxvYWQgdGhlIHNlbGVjdG9yIDB4NjMgaW50byB0aGUg
JWdzIHJlZ2lzdGVyIChzaW5jZQo+PiB0aGF0IGRlc2NyaXB0b3IgaGFzIGp1c3QgYmVlbiB3aXBl
ZD8pLCBsZWF2aW5nIGl0IHplcm8uCj4+Cj4+IFsgIDQ0MTg1LjIyNTI1Nl0gICBXQVJOOiB4ZW5f
ZmFpbHNhZmVfY2FsbGJhY2sgZnJvbSB4ZW5faHlwZXJjYWxsX3VwZGF0ZV9kZXNjcmlwdG9yKzB4
YS8weDQwCj4+IFsgIDQ0MTg1LjIyNTI2M10gICBXQVJOOiBEUzogMmIvMmIgRVM6IDJiLzJiIEZT
OiAwLzAgR1M6MC82Mwo+Pgo+PiBUaGlzIGlzIG9uIGNvbnRleHQgc3dpdGNoIGZyb20gYSAzMi1i
aXQgdGFzayB0byBpZGxlLiBTbwo+PiB4ZW5fZmFpbHNhZmVfY2FsbGJhY2sgaXMgcmV0dXJuaW5n
IHRvIHRoZSAiZmF1bHRpbmciIGluc3RydWN0aW9uLCB3aXRoCj4+IGEgY29tbWVudCBzYXlpbmcg
IlJldHJ5IHRoZSBJUkVUIiwgYnV0IGluIGZhY3QgaXMganVzdCBjb250aW51aW5nIG9uCj4+IGl0
cyBtZXJyeSB3YXkgd2l0aCAlZ3MgdW5leHBlY3RlZGx5IHNldCB0byB6ZXJvLgo+Pgo+PiBJbiBm
YWN0IEkgdGhpbmsgdGhpcyBpcyBwcm9iYWJseSBmaW5lIGluIHByYWN0aWNlLCBzaW5jZSBpdCdz
IGFib3V0IHRvCj4+IGdldCBleHBsaWNpdGx5IHNldCBhIGZldyBsaW5lcyBmdXJ0aGVyIGRvd24g
aW4gX19jb250ZXh0X3N3aXRjaCgpLiBCdXQKPj4gaXQncyBvZGQgZW5vdWdoLCBhbmQgZmFyIGVu
b3VnaCBhd2F5IGZyb20gd2hhdCdzIGFjdHVhbGx5IHNhaWQgYnkgdGhlCj4+IGNvbW1lbnRzLCB0
aGF0IEknbSB1dHRlcmx5IHVuc3VyZS4KPj4KPj4gSW4geGVuX2xvYWRfdGxzKCkgd2UgZXhwbGlj
aXRseSBvbmx5IGRvIHRoZSBsYXp5X2xvYWRfZ3MoMCkgZm9yIHRoZQo+PiAzMi1iaXQga2VybmVs
LiBJcyB0aGF0IHJlYWxseSByaWdodD8KPgo+IEJhc2ljYWxseSAtIHdoYXQgaXMgaGFwcGVuaW5n
IGlzIHRoYXQgeGVuX2xvYWRfdGxzKCkgaXMgaW52YWxpZGF0aW5nIHRoZQo+ICVncyBzZWxlY3Rv
ciB3aGlsZSAlZ3MgaXMgc3RpbGwgbm9uLU5VTC4KPgo+IElmIHRoaXMgaGFwcGVucyB0byBpbnRl
cnNlY3Qgd2l0aCBhIHZjcHUgcmVzY2hlZHVsZSwgJWdzIChiZWluZyBub24tTlVMKQo+IHRha2Vz
IHByZWNlZGVuY2Ugb3ZlciBLRVJOR1NCQVNFLCBhbmQgZmF1bHRzIHdoZW4gWGVuIHRyaWVzIHRv
IHJlbG9hZAo+IGl0LiAgVGhpcyByZXN1bHRzIGluIHRoZSBmYWlsc2FmZSBjYWxsYmFjayBiZWlu
ZyBpbnZva2VkLgo+Cj4gSSB0aGluayB0aGUgY29ycmVjdCBjb3Vyc2Ugb2YgYWN0aW9uIGlzIHRv
IHVzZSB4ZW5fbG9hZF9nc19pbmRleCgwKQo+IChwb29ybHkgbmFtZWQgLSBpdCBpcyBhIGh5cGVy
Y2FsbCB3aGljaCBkb2VzIHN3YXBnczsgbW92IHRvICVnczsgc3dhcGdzKQo+IGJlZm9yZSB1c2lu
ZyB1cGRhdGVfZGVzY3JpcHRvcigpIHRvIGludmFsaWRhdGUgdGhlIHNlZ21lbnQuCj4KPiBUaGF0
IHdpbGwgcmVzZXQgJWdzIHRvIDAgd2l0aG91dCB0b3VjaGluZyBLRVJOR1NCQVNFLCBhbmQgY2Fu
IGJlIHF1ZXVlZAo+IGluIHRoZSBzYW1lIG11bHRpY2FsbCBhcyB0aGUgdXBkYXRlX2Rlc2NyaXB0
b3IoKSBoeXBlcmNhbGwuCgpTb3VuZHMgZ29vZCB0byBtZSBhcyBsb25nIGFzIHdlIHNraXAgaXQg
b24gbmF0aXZlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
