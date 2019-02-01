From: Christopher Lameter <cl@linux.com>
Subject: Re: [PATCH v6 14/27] x86/percpu: Adapt percpu for PIE
 support
Date: Fri, 1 Feb 2019 02:31:36 +0000
Message-ID: <01000168a6e5ab88-0deea73f-387f-4941-bd11-d1c161aac88a-000000__42474.6432270453$1548988375$gmane$org@email.amazonses.com>
References: <20190131192533.34130-1-thgarnie@chromium.org>
 <20190131192533.34130-15-thgarnie@chromium.org>
 <01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000@email.amazonses.com>
 <CAJcbSZGKR7dKVqNEDEO7Qzf7tnNqmL=p1uVKvsUefS=Hs-=iNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nDKM=QI=amazonses.com=01000168a6e5ab88-0deea73f-387f-4941-bd11-d1c161aac88a-000000@srs-us1.protection.inumbo.net>)
 id 1gpOcE-0004k1-CT
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 02:31:38 +0000
In-Reply-To: <CAJcbSZGKR7dKVqNEDEO7Qzf7tnNqmL=p1uVKvsUefS=Hs-=iNA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@chromium.org>
Cc: Michal Hocko <mhocko@suse.com>, Brijesh Singh <brijesh.singh@amd.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, kristen@linux.intel.com, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, LKML <linux-kernel@vger.kernel.org>, Andi
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAzMSBKYW4gMjAxOSwgVGhvbWFzIEdhcm5pZXIgd3JvdGU6Cgo+IFRoZSBwZXItY3B1
IHN5bWJvbHMgYXJlIGluIGEgc2VjdGlvbiB0aGF0IGlzIHplcm8gYmFzZWQgdG8gY3JlYXRlCj4g
b2Zmc2V0cy4gVGhlIGNvbXBpbGVyIGRvZXNuJ3Qgc2VlIHRoZW0gYXMgb2Zmc2V0cyBidXQgYXMg
cmVsYXRpdmUKPiBzeW1ib2wgYW5kIHRyeSB0byByZWxvY2F0ZSB0aGVtLiBHaXZlbiB0aGUgZGlz
dGFuY2UgYmV0d2VlbiB6ZXJvIGFuZAo+IHRoZSBtYXBwZWQga2VybmVsIGlzIG11Y2ggbGFyZ2Vy
IHRoYW4gdGhlIGluc3RydWN0aW9uIG9mZnNldCByYW5nZSwgaXQKPiBmYWlscyB0byBkbyBpdC4K
CldlIHN3aXRjaCB0aGF0IG9mZiBpbiB0aGUgbGlua2VyLiBJZiB0aGF0IGRvZXMgbm90IHdvcmsg
d2l0aCB5b3VyCm1vZGlmaWNhdGlvbnMgdGhlbiB5b3UgbmVlZCB0byBmaWd1cmUgb3V0IGhvdyB0
byB1cGRhdGUgdGhlIGxpbmsKY29uZmlndXJhdGlvbi4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
