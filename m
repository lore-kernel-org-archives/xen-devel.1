From: Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v6 14/27] x86/percpu: Adapt percpu for PIE
 support
Date: Fri, 1 Feb 2019 09:13:58 -0800
Message-ID: <CAJcbSZFvafvNX1pS96jaTBGNJad+NszLwSgKnRQgyT70gUGWqQ__42378.6814719037$1549041310$gmane$org@mail.gmail.com>
References: <20190131192533.34130-1-thgarnie@chromium.org>
 <20190131192533.34130-15-thgarnie@chromium.org>
 <01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000@email.amazonses.com>
 <CAJcbSZGKR7dKVqNEDEO7Qzf7tnNqmL=p1uVKvsUefS=Hs-=iNA@mail.gmail.com>
 <01000168a6e5ab88-0deea73f-387f-4941-bd11-d1c161aac88a-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ccuj=QI=chromium.org=thgarnie@srs-us1.protection.inumbo.net>)
 id 1gpcOL-00020B-UK
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 17:14:13 +0000
Received: by mail-it1-x143.google.com with SMTP id b5so10824801iti.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Feb 2019 09:14:12 -0800 (PST)
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id s4sm3384821iom.83.2019.02.01.09.14.10
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Feb 2019 09:14:11 -0800 (PST)
Received: by mail-it1-f180.google.com with SMTP id w18so10236699ite.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Feb 2019 09:14:10 -0800 (PST)
In-Reply-To: <01000168a6e5ab88-0deea73f-387f-4941-bd11-d1c161aac88a-000000@email.amazonses.com>
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

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgNjozMSBQTSBDaHJpc3RvcGhlciBMYW1ldGVyIDxjbEBs
aW51eC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAzMSBKYW4gMjAxOSwgVGhvbWFzIEdhcm5pZXIg
d3JvdGU6Cj4KPiA+IFRoZSBwZXItY3B1IHN5bWJvbHMgYXJlIGluIGEgc2VjdGlvbiB0aGF0IGlz
IHplcm8gYmFzZWQgdG8gY3JlYXRlCj4gPiBvZmZzZXRzLiBUaGUgY29tcGlsZXIgZG9lc24ndCBz
ZWUgdGhlbSBhcyBvZmZzZXRzIGJ1dCBhcyByZWxhdGl2ZQo+ID4gc3ltYm9sIGFuZCB0cnkgdG8g
cmVsb2NhdGUgdGhlbS4gR2l2ZW4gdGhlIGRpc3RhbmNlIGJldHdlZW4gemVybyBhbmQKPiA+IHRo
ZSBtYXBwZWQga2VybmVsIGlzIG11Y2ggbGFyZ2VyIHRoYW4gdGhlIGluc3RydWN0aW9uIG9mZnNl
dCByYW5nZSwgaXQKPiA+IGZhaWxzIHRvIGRvIGl0Lgo+Cj4gV2Ugc3dpdGNoIHRoYXQgb2ZmIGlu
IHRoZSBsaW5rZXIuIElmIHRoYXQgZG9lcyBub3Qgd29yayB3aXRoIHlvdXIKPiBtb2RpZmljYXRp
b25zIHRoZW4geW91IG5lZWQgdG8gZmlndXJlIG91dCBob3cgdG8gdXBkYXRlIHRoZSBsaW5rCj4g
Y29uZmlndXJhdGlvbi4KPgoKSXQgZGlkbid0IHdvcmsgb3JpZ2luYWxseSBidXQgSSB3aWxsIHJl
dmlzaXQgdG8gc2VlIGlmIEkgbWlzc2VkIHNvbWV0aGluZy4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
