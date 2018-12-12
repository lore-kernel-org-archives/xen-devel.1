From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v9 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Wed, 12 Dec 2018 21:39:02 +0100
Message-ID: <20181212203901.GI6653__12488.7753780515$1544647086$gmane$org@zn.tnic>
References: <1544468734-32763-1-git-send-email-maran.wilson@oracle.com>
 <20181211131825.GD27375@zn.tnic>
 <5fc083d4-1dbd-f2f9-3059-0e3e8dda9b25@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JVIU=OV=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1gXBHg-0005TS-WF
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 20:39:09 +0000
Content-Disposition: inline
In-Reply-To: <5fc083d4-1dbd-f2f9-3059-0e3e8dda9b25@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, boris.ostrovsky@oracle.com, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, jgross@suse.com, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMTE6Mjk6MjFBTSAtMDgwMCwgTWFyYW4gV2lsc29uIHdy
b3RlOgo+IElzIHlvdXIgcXVlc3Rpb24gYWJvdXQgd2hhdCBvcHRpb25zIHlvdSBuZWVkIHRvIHBy
b3ZpZGUgdG8gUWVtdT8gT3IgaXMgeW91cgo+IHF1ZXN0aW9uIGFib3V0IHRoZSBTVyBpbXBsZW1l
bnRhdGlvbiBjaG9pY2VzPwo+IAo+IEFzc3VtaW5nIHRoZSBmb3JtZXIuLi4KClllYWgsIHRoYXQn
cyB3aGF0IEkgd2FudGVkIHRvIGtub3cuIEJ1dCBsb29raW5nIGF0IGl0LCBJJ20gYm9vdGluZwpi
ekltYWdlIGhlcmUganVzdCBhcyBxdWlja2x5IGFuZCBhcyBmbGV4aWJsZSBzbyBJIGRvbid0IHNl
ZSB0aGUKYWR2YW50YWdlIG9mIHRoaXMgbmV3IG1ldGhvZCBmb3IgbXkgdXNlIGNhc2UgaGVyZSBv
ZiBib290aW5nIGtlcm5lbHMKaW4gcWVtdS4KCkJ1dCBtYXliZSB0aGVyZSdzIGEgZ29vZCB1c2Ug
Y2FzZSB3aGVyZSBmaXJtd2FyZSBpcyBzbG93IGFuZCBvbmUgZG9lc24ndApyZWFsbHkgd2FubmEg
bm9vZGxlIHRocm91Z2ggaXQgb3Igd2hlbiBvbmUgZG9lcyBzdGFydCBhIGdhemlsbGlvbiBWTXMK
cGVyIHNlY29uZCBvciB3aGF0ZXZlci4uLgoKVGh4LgoKLS0gClJlZ2FyZHMvR3J1c3MsCiAgICBC
b3Jpcy4KCkdvb2QgbWFpbGluZyBwcmFjdGljZXMgZm9yIDQwMDogYXZvaWQgdG9wLXBvc3Rpbmcg
YW5kIHRyaW0gdGhlIHJlcGx5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
