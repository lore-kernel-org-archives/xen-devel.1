From: Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v6 14/27] x86/percpu: Adapt percpu for PIE
 support
Date: Thu, 31 Jan 2019 14:49:04 -0800
Message-ID: <CAJcbSZGKR7dKVqNEDEO7Qzf7tnNqmL=p1uVKvsUefS=Hs-=iNA__6001.17017036013$1548975019$gmane$org@mail.gmail.com>
References: <20190131192533.34130-1-thgarnie@chromium.org>
 <20190131192533.34130-15-thgarnie@chromium.org>
 <01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Maf=QH=chromium.org=thgarnie@srs-us1.protection.inumbo.net>)
 id 1gpL96-0007zT-Ad
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 22:49:20 +0000
Received: by mail-it1-x144.google.com with SMTP id g85so6414928ita.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jan 2019 14:49:19 -0800 (PST)
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com.
 [209.85.166.179])
 by smtp.gmail.com with ESMTPSA id t7sm2519090iom.27.2019.01.31.14.49.17
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Jan 2019 14:49:18 -0800 (PST)
Received: by mail-it1-f179.google.com with SMTP id z7so6448069iti.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jan 2019 14:49:17 -0800 (PST)
In-Reply-To: <01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000@email.amazonses.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Lameter <cl@linux.com>
Cc: Michal Hocko <mhocko@suse.com>, Brijesh Singh <brijesh.singh@amd.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, kristen@linux.intel.com, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, LKML <linux-kernel@vger.kernel.org>, Andi
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMTI6NTcgUE0gQ2hyaXN0b3BoZXIgTGFtZXRlciA8Y2xA
bGludXguY29tPiB3cm90ZToKPgo+IE9uIFRodSwgMzEgSmFuIDIwMTksIFRob21hcyBHYXJuaWVy
IHdyb3RlOgo+Cj4gPiBQZXJwY3UgdXNlcyBhIGNsZXZlciBkZXNpZ24gd2hlcmUgdGhlIC5wZXJj
dSBFTEYgc2VjdGlvbiBoYXMgYSB2aXJ0dWFsCj4gPiBhZGRyZXNzIG9mIHplcm8gYW5kIHRoZSBj
dXN0b20gbGludXggcmVsb2NhdGlvbiBjb2RlIGF2b2lkIHJlbG9jYXRpbmcKPiA+IHNwZWNpZmlj
IHN5bWJvbHMuIEl0IG1ha2VzIHRoZSBjb2RlIHNpbXBsZSBhbmQgZWFzaWx5IGFkYXB0YWJsZSB3
aXRoIG9yCj4gPiB3aXRob3V0IFNNUCBzdXBwb3J0Lgo+Cj4gV2UgdXN1YWxseSB0YWxrIGFib3V0
IHRoaXMgYXMgb2Zmc2V0cyByYXRoZXIgdGhhbiBhZGRyZXNzZXNzLiBUaGUgaW50ZW5kCj4gaGVy
ZSBpcyB0byBnaXZlIGV2ZXJ5IHByb2Nlc3NvciBpdHMgb3duIGFkZHJlc3MgdGhhdCBpcyB1bmlx
dWUgZm9yIHRoaXMKPiBwcm9jZXNzb3IuIE9wZXJhdGlvbnMgYXJlIGFsd2F5cyByZWxhdGl2ZSB0
byBhIHNlZ21lbnQgcmVnaXN0ZXIgYW5kIHRoZQo+IHdob2xlIGFyZWEgY2FuIGJlIHJlbG9jYXRl
ZCBhdCB3aWxsIGJ5IHNpbXBseSBjaGFuZ2luZyB0aGUgc2VnbWVudAo+IHJlZ2lzdGVyLgo+Cj4g
PiBUaGlzIGRlc2lnbiBpcyBpbmNvbXBhdGlibGUgd2l0aCBQSUUuIFdoaWxlIGNyZWF0aW5nIGEg
UElFIGJpbmFyeSwgdGhlCj4gPiBjb3BtaWxlciB0cmllcyB0byBtYWtlIGV2ZXJ5dGhpbmcgcmVs
YXRpdmUuIFRoZSBjb21waWxlciB3aWxsIGF0dGVtcHQgdG8KPgo+IFRoaXMgaXMgdmVyeSBjb21w
YXRpYmxlIHdpdGggUElFIGJlY2F1c2UgaXQgaXMgYWxyZWFkeSByZWxhdGl2ZS4KClRoZSBwZXIt
Y3B1IHN5bWJvbHMgYXJlIGluIGEgc2VjdGlvbiB0aGF0IGlzIHplcm8gYmFzZWQgdG8gY3JlYXRl
Cm9mZnNldHMuIFRoZSBjb21waWxlciBkb2Vzbid0IHNlZSB0aGVtIGFzIG9mZnNldHMgYnV0IGFz
IHJlbGF0aXZlCnN5bWJvbCBhbmQgdHJ5IHRvIHJlbG9jYXRlIHRoZW0uIEdpdmVuIHRoZSBkaXN0
YW5jZSBiZXR3ZWVuIHplcm8gYW5kCnRoZSBtYXBwZWQga2VybmVsIGlzIG11Y2ggbGFyZ2VyIHRo
YW4gdGhlIGluc3RydWN0aW9uIG9mZnNldCByYW5nZSwgaXQKZmFpbHMgdG8gZG8gaXQuCgo+Cj4g
PiBnZW5lcmF0ZSBpbnN0cnVjdGlvbnMgd2l0aCB0aGUgZGlzdGFuY2UgYmV0d2VlbiB6ZXJvIGFu
ZCBhbnkgNjQtYml0Cj4gPiB2aXJ0dWFsIGFkZHJlc3MuIEl0IHdpbGwgZmFpbCBhcyB0aGUgcmVs
b2NhdGlvbiByYW5nZSBjYW5ub3QgZml0IHdpdGhpbgo+ID4gdGhlIHBvc3NpYmxlIGluc3RydWN0
aW9ucyBhY2Nlc3NpbmcgYSBzZWdtZW50IHJlZ2lzdGVyLgo+Cj4gTGVhdmUgdGhlIG9mZnNldHMg
YWxvbmUgYW5kIGp1c3QgY2hhbmdlIHRoZSBzZWdtZW50IHJlZ2lzdGVyIGlmIHlvdSBuZWVkCj4g
dG8gcmVsb2NhdGUgdGhlIGFyZWEgb2YgYSBzcGVjaWZpYyBwcm9jZXNzb3I/Cj4KPiA+IFRoZSBh
c3NlbWJseSBhbmQgUEVSX0NQVSBtYWNyb3MgYXJlIGNoYW5nZWQgdG8gdXNlIHJlbGF0aXZlIHJl
ZmVyZW5jZXMKPiA+IHdoZW4gUElFIGlzIGVuYWJsZWQuCj4KPiBUaGV5IGFscmVhZHkgdXNlIHJl
bGF0aXZlIHJlZmVyZW5jZS4gV2hhdCBpcyB0aGUgcG9pbnQgaGVyZT8KPgo+ID4gLS0tIGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vcGVyY3B1LmgKPiA+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3BlcmNwdS5oCj4gPiBAQCAtNSw5ICs1LDExIEBACj4gPiAgI2lmZGVmIENPTkZJR19YODZfNjQK
PiA+ICAjZGVmaW5lIF9fcGVyY3B1X3NlZyAgICAgICAgIGdzCj4gPiAgI2RlZmluZSBfX3BlcmNw
dV9tb3Zfb3AgICAgICAgICAgICAgIG1vdnEKPiA+ICsjZGVmaW5lIF9fcGVyY3B1X3JlbCAgICAg
ICAgICglcmlwKQo+Cj4gVGhlIHBlcmNwdSBzZWN0aW9uIGNhbm5vdCBiZSBJUCByZWxhdGl2ZSBz
aW5jZSB3ZSBuZWVkIHRvIGhhdmUgc2VwYXJhdGUKPiBhZGRyZXNzIHNwYWNlcyBwZXIgY3B1Lgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
