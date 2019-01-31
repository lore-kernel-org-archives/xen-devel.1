From: Christopher Lameter <cl@linux.com>
Subject: Re: [PATCH v6 14/27] x86/percpu: Adapt percpu for PIE
 support
Date: Thu, 31 Jan 2019 20:57:01 +0000
Message-ID: <01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000__20554.1336488508$1548968292$gmane$org@email.amazonses.com>
References: <20190131192533.34130-1-thgarnie@chromium.org>
 <20190131192533.34130-15-thgarnie@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnsz=QH=amazonses.com=01000168a5b35a86-b79bfe67-191e-43bc-a5c7-0e74eac06195-000000@srs-us1.protection.inumbo.net>)
 id 1gpJOQ-0004Wu-RK
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 20:57:02 +0000
In-Reply-To: <20190131192533.34130-15-thgarnie@chromium.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@chromium.org>
Cc: Michal Hocko <mhocko@suse.com>, Brijesh Singh <brijesh.singh@amd.com>, kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, kristen@linux.intel.com, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Tejun Heo <tj@kernel.org>, Mathieu
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAzMSBKYW4gMjAxOSwgVGhvbWFzIEdhcm5pZXIgd3JvdGU6Cgo+IFBlcnBjdSB1c2Vz
IGEgY2xldmVyIGRlc2lnbiB3aGVyZSB0aGUgLnBlcmN1IEVMRiBzZWN0aW9uIGhhcyBhIHZpcnR1
YWwKPiBhZGRyZXNzIG9mIHplcm8gYW5kIHRoZSBjdXN0b20gbGludXggcmVsb2NhdGlvbiBjb2Rl
IGF2b2lkIHJlbG9jYXRpbmcKPiBzcGVjaWZpYyBzeW1ib2xzLiBJdCBtYWtlcyB0aGUgY29kZSBz
aW1wbGUgYW5kIGVhc2lseSBhZGFwdGFibGUgd2l0aCBvcgo+IHdpdGhvdXQgU01QIHN1cHBvcnQu
CgpXZSB1c3VhbGx5IHRhbGsgYWJvdXQgdGhpcyBhcyBvZmZzZXRzIHJhdGhlciB0aGFuIGFkZHJl
c3Nlc3MuIFRoZSBpbnRlbmQKaGVyZSBpcyB0byBnaXZlIGV2ZXJ5IHByb2Nlc3NvciBpdHMgb3du
IGFkZHJlc3MgdGhhdCBpcyB1bmlxdWUgZm9yIHRoaXMKcHJvY2Vzc29yLiBPcGVyYXRpb25zIGFy
ZSBhbHdheXMgcmVsYXRpdmUgdG8gYSBzZWdtZW50IHJlZ2lzdGVyIGFuZCB0aGUKd2hvbGUgYXJl
YSBjYW4gYmUgcmVsb2NhdGVkIGF0IHdpbGwgYnkgc2ltcGx5IGNoYW5naW5nIHRoZSBzZWdtZW50
CnJlZ2lzdGVyLgoKPiBUaGlzIGRlc2lnbiBpcyBpbmNvbXBhdGlibGUgd2l0aCBQSUUuIFdoaWxl
IGNyZWF0aW5nIGEgUElFIGJpbmFyeSwgdGhlCj4gY29wbWlsZXIgdHJpZXMgdG8gbWFrZSBldmVy
eXRoaW5nIHJlbGF0aXZlLiBUaGUgY29tcGlsZXIgd2lsbCBhdHRlbXB0IHRvCgpUaGlzIGlzIHZl
cnkgY29tcGF0aWJsZSB3aXRoIFBJRSBiZWNhdXNlIGl0IGlzIGFscmVhZHkgcmVsYXRpdmUuCgo+
IGdlbmVyYXRlIGluc3RydWN0aW9ucyB3aXRoIHRoZSBkaXN0YW5jZSBiZXR3ZWVuIHplcm8gYW5k
IGFueSA2NC1iaXQKPiB2aXJ0dWFsIGFkZHJlc3MuIEl0IHdpbGwgZmFpbCBhcyB0aGUgcmVsb2Nh
dGlvbiByYW5nZSBjYW5ub3QgZml0IHdpdGhpbgo+IHRoZSBwb3NzaWJsZSBpbnN0cnVjdGlvbnMg
YWNjZXNzaW5nIGEgc2VnbWVudCByZWdpc3Rlci4KCkxlYXZlIHRoZSBvZmZzZXRzIGFsb25lIGFu
ZCBqdXN0IGNoYW5nZSB0aGUgc2VnbWVudCByZWdpc3RlciBpZiB5b3UgbmVlZAp0byByZWxvY2F0
ZSB0aGUgYXJlYSBvZiBhIHNwZWNpZmljIHByb2Nlc3Nvcj8KCj4gVGhlIGFzc2VtYmx5IGFuZCBQ
RVJfQ1BVIG1hY3JvcyBhcmUgY2hhbmdlZCB0byB1c2UgcmVsYXRpdmUgcmVmZXJlbmNlcwo+IHdo
ZW4gUElFIGlzIGVuYWJsZWQuCgpUaGV5IGFscmVhZHkgdXNlIHJlbGF0aXZlIHJlZmVyZW5jZS4g
V2hhdCBpcyB0aGUgcG9pbnQgaGVyZT8KCj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGVy
Y3B1LmgKPiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZXJjcHUuaAo+IEBAIC01LDkgKzUs
MTEgQEAKPiAgI2lmZGVmIENPTkZJR19YODZfNjQKPiAgI2RlZmluZSBfX3BlcmNwdV9zZWcJCWdz
Cj4gICNkZWZpbmUgX19wZXJjcHVfbW92X29wCQltb3ZxCj4gKyNkZWZpbmUgX19wZXJjcHVfcmVs
CQkoJXJpcCkKClRoZSBwZXJjcHUgc2VjdGlvbiBjYW5ub3QgYmUgSVAgcmVsYXRpdmUgc2luY2Ug
d2UgbmVlZCB0byBoYXZlIHNlcGFyYXRlCmFkZHJlc3Mgc3BhY2VzIHBlciBjcHUuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
