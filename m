From: Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v6 14/27] x86/percpu: Adapt percpu for PIE
 support
Date: Mon, 8 Apr 2019 11:08:58 -0700
Message-ID: <CAJcbSZFVnJ6qYNsGipf6foa8dtsX_RDykRWK-edP85ySQacsVg@mail.gmail.com>
References: <20190131192533.34130-1-thgarnie@chromium.org>
 <20190131192533.34130-15-thgarnie@chromium.org>
 <01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000@email.amazonses.com>
 <CAJcbSZGKR7dKVqNEDEO7Qzf7tnNqmL=p1uVKvsUefS=Hs-=iNA@mail.gmail.com>
 <01000168a6e5ab88-0deea73f-387f-4941-bd11-d1c161aac88a-000000@email.amazonses.com>
 <CAJcbSZFvafvNX1pS96jaTBGNJad+NszLwSgKnRQgyT70gUGWqQ@mail.gmail.com>
 <CAJcbSZETNhr=Pv+0daEWUsD2=qnZxT9rbmFaE+y7ag-xKOs89w@mail.gmail.com>
 <01000169fe18026e-a0951268-516c-4604-a4c3-140f3cbb6f7a-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4iMB=SK=chromium.org=thgarnie@srs-us1.protection.inumbo.net>)
 id 1hDYhn-0006t6-0t
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 18:09:15 +0000
Received: by mail-io1-xd42.google.com with SMTP id v4so11877757ioj.5
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 11:09:13 -0700 (PDT)
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id b1sm11244503ioj.82.2019.04.08.11.09.11
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Apr 2019 11:09:12 -0700 (PDT)
Received: by mail-it1-f175.google.com with SMTP id q14so634808itk.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 11:09:11 -0700 (PDT)
In-Reply-To: <01000169fe18026e-a0951268-516c-4604-a4c3-140f3cbb6f7a-000000@email.amazonses.com>
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

T24gTW9uLCBBcHIgOCwgMjAxOSBhdCAxMDo1NiBBTSBDaHJpc3RvcGhlciBMYW1ldGVyIDxjbEBs
aW51eC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCA4IEFwciAyMDE5LCBUaG9tYXMgR2FybmllciB3
cm90ZToKPgo+ID4gPiBJdCBkaWRuJ3Qgd29yayBvcmlnaW5hbGx5IGJ1dCBJIHdpbGwgcmV2aXNp
dCB0byBzZWUgaWYgSSBtaXNzZWQgc29tZXRoaW5nLgo+ID4KPiA+IEkgcmV2aXNpdGVkIGFuZCBj
b3VsZG4ndCBmaW5kIGEgd2F5IHRvIHByZXZlbnQgcmVsb2NhdGlvbnMgdG8gdGhlCj4gPiBwZXJj
cHUgc2VjdGlvbi4gV2l0aG91dCBQSUUsIHlvdSBjYW4gcmVmZXJlbmNlIGFic29sdXRlIGFkZHJl
c3Mgd2hpY2gKPiA+IHdhcyBjb252ZW5pZW50IGZvciBwZXJjcHUuCj4KPiBDYW4geW91IHN3aXRj
aCBQSUUgb2ZmIGZvciB0aGUgcGVyY3B1IHNlY3Rpb24/IElmIG5vdCBtYXliZSB0aGUgbGlua2Vy
Cj4gbmVlZHMgdG8gaGF2ZSBhbiBhZGRpdGlvbmFsIG9wdGlvbj8KCkkgZG9uJ3QgdGhpbmsgc28g
b3IgSSBkaWRuJ3QgZmluZCBhbnkgb3B0aW9uIHRvIGRvIHRoYXQuIENoYW5naW5nIHRoZQpsaW5r
ZXIgbWlnaHQgYmUgYSBiaXQgdG9vIG11Y2ggaWYgd2UgaGF2ZSBhIHNvZnR3YXJlIHNvbHV0aW9u
IHdoaWNoCmRvZXNuJ3QgaW1wYWN0IHBlcmZvcm1hbmNlLgoKPgo+IENhbm5vdCBpbWFnaW5lIHRo
YXQgdGhpcyBpcyBub3QgcG9zc2libGUuIFlvdSBuZWVlZCB0byBiZSBhYmxlIHRvCj4gcmVmZXJl
bmNlIHJlZ2lzdGVycyB0aGF0IGFyZSBpbiBmaXhlZCBtZW1vcnkgbG9jYXRpb25zLgo+Cj4KPiA+
IENocmlzdG9waGVyOiBEaWQgeW91IGhhdmUgc29tZXRoaW5nIHNwZWNpZmljIGluIG1pbmQ/Cj4K
PiBJIHRob3VnaHQgdGhhdCB3ZSBqdXN0IGxlYXZlIGl0IGFzIGlzLgoKSSB3b3VsZCBsaWtlIHRv
IGFzIHdlbGwuIEkgd2lsbCB0cnkgY291cGxlIHRoaW5ncyBhdCB0aGUgYXNzZW1ibHkKbGV2ZWwg
aW5zdGVhZCBvZiB0aGUgbGlua2VyIGFuZCBjb21lIGJhY2sgdG8gdGhpcyB0aHJlYWQuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
