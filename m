From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local
 TLBs concurrently
Date: Mon, 27 May 2019 14:45:17 +0200
Message-ID: <81a67fa3-309d-79cc-5009-5c4908b18ba3__29408.1740475789$1558961190$gmane$org@redhat.com>
References: <20190525082203.6531-1-namit@vmware.com>
 <20190525082203.6531-6-namit@vmware.com>
 <08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
 <20190527094710.GU2623@hirez.programming.kicks-ass.net>
 <e9c0dc1f-799a-b6e3-8d41-58f0a6b693cd@redhat.com>
 <20190527123206.GC2623@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tdqI=T3=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1hVF0E-0002VC-FI
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 12:45:22 +0000
Received: by mail-wr1-f68.google.com with SMTP id e2so8044215wrv.6
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2019 05:45:20 -0700 (PDT)
In-Reply-To: <20190527123206.GC2623@hirez.programming.kicks-ass.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org, Nadav Amit <namit@vmware.com>, Thomas Gleixner <tglx@linutronix.de>, "K. Y. Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDUvMTkgMTQ6MzIsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+IE9uIE1vbiwgTWF5IDI3
LCAyMDE5IGF0IDEyOjIxOjU5UE0gKzAyMDAsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4+IE9uIDI3
LzA1LzE5IDExOjQ3LCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiAKPj4+IC0tLSBhL2FyY2gveDg2
L2tlcm5lbC9rdm0uYwo+Pj4gKysrIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCj4+PiBAQCAtNTgw
LDcgKzU4MCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBrdm1fYXBmX3RyYXBfaW5pdCh2b2kKPj4+
ICAKPj4+ICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoY3B1bWFza192YXJfdCwgX19wdl90bGJfbWFz
ayk7Cj4+PiAgCj4+PiAtc3RhdGljIHZvaWQga3ZtX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qgc3Ry
dWN0IGNwdW1hc2sgKmNwdW1hc2ssCj4+PiArc3RhdGljIHZvaWQga3ZtX2ZsdXNoX3RsYl9tdWx0
aShjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1bWFzaywKPj4+ICAJCQljb25zdCBzdHJ1Y3QgZmx1
c2hfdGxiX2luZm8gKmluZm8pCj4+PiAgewo+Pj4gIAl1OCBzdGF0ZTsKPj4+IEBAIC01OTQsNiAr
NTk0LDkgQEAgc3RhdGljIHZvaWQga3ZtX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qgcwo+Pj4gIAkg
KiBxdWV1ZSBmbHVzaF9vbl9lbnRlciBmb3IgcHJlLWVtcHRlZCB2Q1BVcwo+Pj4gIAkgKi8KPj4+
ICAJZm9yX2VhY2hfY3B1KGNwdSwgZmx1c2htYXNrKSB7Cj4+PiArCQlpZiAoY3B1ID09IHNtcF9w
cm9jZXNzb3JfaWQoKSkKPj4+ICsJCQljb250aW51ZTsKPj4+ICsKPj4KPj4gRXZlbiB0aGlzIHdv
dWxkIGJlIGp1c3QgYW4gb3B0aW1pemF0aW9uOyB0aGUgdkNQVSB5b3UncmUgcnVubmluZyBvbgo+
PiBjYW5ub3QgYmUgcHJlZW1wdGVkLiAgWW91IGNhbiBqdXN0IGNoYW5nZSBvdGhlcnMgdG8gbXVs
dGkuCj4gCj4gWWVhaCwgSSBrbm93LCBidXQgaXQgZmVsdCB3ZWlyZCBzbyBJIGFkZGVkIHRoZSBl
eHBsaWNpdCBza2lwLiBObyBzdHJvbmcKPiBmZWVsaW5ncyB0aG91Z2guCgpOZWl0aGVyIGhlcmUs
IGFuZCBpdCB3b3VsZCBpbmRlZWQgZGVzZXJ2ZSBhIGNvbW1lbnQgaWYgeW91IGxlZnQgdGhlIGlm
IG91dC4KClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
