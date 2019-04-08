From: Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v6 14/27] x86/percpu: Adapt percpu for PIE
 support
Date: Mon, 8 Apr 2019 08:58:54 -0700
Message-ID: <CAJcbSZETNhr=Pv+0daEWUsD2=qnZxT9rbmFaE+y7ag-xKOs89w__19423.1248738774$1554739579$gmane$org@mail.gmail.com>
References: <20190131192533.34130-1-thgarnie@chromium.org>
 <20190131192533.34130-15-thgarnie@chromium.org>
 <01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000@email.amazonses.com>
 <CAJcbSZGKR7dKVqNEDEO7Qzf7tnNqmL=p1uVKvsUefS=Hs-=iNA@mail.gmail.com>
 <01000168a6e5ab88-0deea73f-387f-4941-bd11-d1c161aac88a-000000@email.amazonses.com>
 <CAJcbSZFvafvNX1pS96jaTBGNJad+NszLwSgKnRQgyT70gUGWqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4iMB=SK=chromium.org=thgarnie@srs-us1.protection.inumbo.net>)
 id 1hDWlp-0004oH-EY
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 16:05:17 +0000
Received: by mail-io1-xd41.google.com with SMTP id d201so11501583iof.7
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 09:05:16 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id c200sm5209349itc.43.2019.04.08.09.05.15
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Apr 2019 09:05:15 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id e13so11491057ioq.6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 09:05:15 -0700 (PDT)
In-Reply-To: <CAJcbSZFvafvNX1pS96jaTBGNJad+NszLwSgKnRQgyT70gUGWqQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Lameter <cl@linux.com>
Cc: Michal Hocko <mhocko@suse.com>, Brijesh Singh <brijesh.singh@amd.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, LKML <linux-kern>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMSwgMjAxOSBhdCA5OjEzIEFNIFRob21hcyBHYXJuaWVyIDx0aGdhcm5pZUBj
aHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgNjozMSBQTSBD
aHJpc3RvcGhlciBMYW1ldGVyIDxjbEBsaW51eC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwg
MzEgSmFuIDIwMTksIFRob21hcyBHYXJuaWVyIHdyb3RlOgo+ID4KPiA+ID4gVGhlIHBlci1jcHUg
c3ltYm9scyBhcmUgaW4gYSBzZWN0aW9uIHRoYXQgaXMgemVybyBiYXNlZCB0byBjcmVhdGUKPiA+
ID4gb2Zmc2V0cy4gVGhlIGNvbXBpbGVyIGRvZXNuJ3Qgc2VlIHRoZW0gYXMgb2Zmc2V0cyBidXQg
YXMgcmVsYXRpdmUKPiA+ID4gc3ltYm9sIGFuZCB0cnkgdG8gcmVsb2NhdGUgdGhlbS4gR2l2ZW4g
dGhlIGRpc3RhbmNlIGJldHdlZW4gemVybyBhbmQKPiA+ID4gdGhlIG1hcHBlZCBrZXJuZWwgaXMg
bXVjaCBsYXJnZXIgdGhhbiB0aGUgaW5zdHJ1Y3Rpb24gb2Zmc2V0IHJhbmdlLCBpdAo+ID4gPiBm
YWlscyB0byBkbyBpdC4KPiA+Cj4gPiBXZSBzd2l0Y2ggdGhhdCBvZmYgaW4gdGhlIGxpbmtlci4g
SWYgdGhhdCBkb2VzIG5vdCB3b3JrIHdpdGggeW91cgo+ID4gbW9kaWZpY2F0aW9ucyB0aGVuIHlv
dSBuZWVkIHRvIGZpZ3VyZSBvdXQgaG93IHRvIHVwZGF0ZSB0aGUgbGluawo+ID4gY29uZmlndXJh
dGlvbi4KPiA+Cj4KPiBJdCBkaWRuJ3Qgd29yayBvcmlnaW5hbGx5IGJ1dCBJIHdpbGwgcmV2aXNp
dCB0byBzZWUgaWYgSSBtaXNzZWQgc29tZXRoaW5nLgoKSSByZXZpc2l0ZWQgYW5kIGNvdWxkbid0
IGZpbmQgYSB3YXkgdG8gcHJldmVudCByZWxvY2F0aW9ucyB0byB0aGUKcGVyY3B1IHNlY3Rpb24u
IFdpdGhvdXQgUElFLCB5b3UgY2FuIHJlZmVyZW5jZSBhYnNvbHV0ZSBhZGRyZXNzIHdoaWNoCndh
cyBjb252ZW5pZW50IGZvciBwZXJjcHUuCgpDaHJpc3RvcGhlcjogRGlkIHlvdSBoYXZlIHNvbWV0
aGluZyBzcGVjaWZpYyBpbiBtaW5kPwoKSSBjaGVja2VkIHRoZSBmb2xsb3dpbmc6CiAtIENoYW5n
aW5nIHRoZSBGTEFHUygpIG9uIHRoZSBQSERSUy4KIC0gdXNpbmcgLXogbm9yZWxvYy1vdmVyZmxv
dyB3aGljaCBhY3R1YWxseSBkb2Vzbid0IHNlZW0gdG8gYXBwbHkgdG8KUEMzMiByZWxvY2F0aW9u
cy4KIC0gTG9vayBhdCBhbGwgbGlua2VyIG9wdGlvbnMgYW5kIHNjcmlwdCBmb3JtYXQgZm9yIGFu
eXRoaW5nIGFyb3VuZCB0aGF0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
