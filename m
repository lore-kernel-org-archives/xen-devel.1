From: Christopher Lameter <cl@linux.com>
Subject: Re: [PATCH v6 14/27] x86/percpu: Adapt percpu for PIE
 support
Date: Mon, 8 Apr 2019 17:56:20 +0000
Message-ID: <01000169fe18026e-a0951268-516c-4604-a4c3-140f3cbb6f7a-000000__42102.2260956065$1554746234$gmane$org@email.amazonses.com>
References: <20190131192533.34130-1-thgarnie@chromium.org>
 <20190131192533.34130-15-thgarnie@chromium.org>
 <01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000@email.amazonses.com>
 <CAJcbSZGKR7dKVqNEDEO7Qzf7tnNqmL=p1uVKvsUefS=Hs-=iNA@mail.gmail.com>
 <01000168a6e5ab88-0deea73f-387f-4941-bd11-d1c161aac88a-000000@email.amazonses.com>
 <CAJcbSZFvafvNX1pS96jaTBGNJad+NszLwSgKnRQgyT70gUGWqQ@mail.gmail.com>
 <CAJcbSZETNhr=Pv+0daEWUsD2=qnZxT9rbmFaE+y7ag-xKOs89w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ak9=SK=amazonses.com=01000169fe18026e-a0951268-516c-4604-a4c3-140f3cbb6f7a-000000@srs-us1.protection.inumbo.net>)
 id 1hDYVJ-0005pv-TQ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 17:56:21 +0000
In-Reply-To: <CAJcbSZETNhr=Pv+0daEWUsD2=qnZxT9rbmFaE+y7ag-xKOs89w@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@chromium.org>
Cc: Michal Hocko <mhocko@suse.com>, Brijesh Singh <brijesh.singh@amd.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, LKML <linux-kern>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCA4IEFwciAyMDE5LCBUaG9tYXMgR2FybmllciB3cm90ZToKCj4gPiBJdCBkaWRuJ3Qg
d29yayBvcmlnaW5hbGx5IGJ1dCBJIHdpbGwgcmV2aXNpdCB0byBzZWUgaWYgSSBtaXNzZWQgc29t
ZXRoaW5nLgo+Cj4gSSByZXZpc2l0ZWQgYW5kIGNvdWxkbid0IGZpbmQgYSB3YXkgdG8gcHJldmVu
dCByZWxvY2F0aW9ucyB0byB0aGUKPiBwZXJjcHUgc2VjdGlvbi4gV2l0aG91dCBQSUUsIHlvdSBj
YW4gcmVmZXJlbmNlIGFic29sdXRlIGFkZHJlc3Mgd2hpY2gKPiB3YXMgY29udmVuaWVudCBmb3Ig
cGVyY3B1LgoKQ2FuIHlvdSBzd2l0Y2ggUElFIG9mZiBmb3IgdGhlIHBlcmNwdSBzZWN0aW9uPyBJ
ZiBub3QgbWF5YmUgdGhlIGxpbmtlcgpuZWVkcyB0byBoYXZlIGFuIGFkZGl0aW9uYWwgb3B0aW9u
PwoKQ2Fubm90IGltYWdpbmUgdGhhdCB0aGlzIGlzIG5vdCBwb3NzaWJsZS4gWW91IG5lZWVkIHRv
IGJlIGFibGUgdG8KcmVmZXJlbmNlIHJlZ2lzdGVycyB0aGF0IGFyZSBpbiBmaXhlZCBtZW1vcnkg
bG9jYXRpb25zLgoKCj4gQ2hyaXN0b3BoZXI6IERpZCB5b3UgaGF2ZSBzb21ldGhpbmcgc3BlY2lm
aWMgaW4gbWluZD8KCkkgdGhvdWdodCB0aGF0IHdlIGp1c3QgbGVhdmUgaXQgYXMgaXMuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
