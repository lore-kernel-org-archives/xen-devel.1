From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local
 TLBs concurrently
Date: Mon, 27 May 2019 14:32:06 +0200
Message-ID: <20190527123206.GC2623__42586.7043830053$1558960397$gmane$org@hirez.programming.kicks-ass.net>
References: <20190525082203.6531-1-namit@vmware.com>
 <20190525082203.6531-6-namit@vmware.com>
 <08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
 <20190527094710.GU2623@hirez.programming.kicks-ass.net>
 <e9c0dc1f-799a-b6e3-8d41-58f0a6b693cd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+4ww=T3=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1hVEna-0001Wo-03
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 12:32:18 +0000
Content-Disposition: inline
In-Reply-To: <e9c0dc1f-799a-b6e3-8d41-58f0a6b693cd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org, Nadav Amit <namit@vmware.com>, Thomas Gleixner <tglx@linutronix.de>, "K. Y. Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMTI6MjE6NTlQTSArMDIwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToKPiBPbiAyNy8wNS8xOSAxMTo0NywgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cgo+ID4gLS0t
IGEvYXJjaC94ODYva2VybmVsL2t2bS5jCj4gPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMK
PiA+IEBAIC01ODAsNyArNTgwLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGt2bV9hcGZfdHJhcF9p
bml0KHZvaQo+ID4gIAo+ID4gIHN0YXRpYyBERUZJTkVfUEVSX0NQVShjcHVtYXNrX3Zhcl90LCBf
X3B2X3RsYl9tYXNrKTsKPiA+ICAKPiA+IC1zdGF0aWMgdm9pZCBrdm1fZmx1c2hfdGxiX290aGVy
cyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1bWFzaywKPiA+ICtzdGF0aWMgdm9pZCBrdm1fZmx1
c2hfdGxiX211bHRpKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVtYXNrLAo+ID4gIAkJCWNvbnN0
IHN0cnVjdCBmbHVzaF90bGJfaW5mbyAqaW5mbykKPiA+ICB7Cj4gPiAgCXU4IHN0YXRlOwo+ID4g
QEAgLTU5NCw2ICs1OTQsOSBAQCBzdGF0aWMgdm9pZCBrdm1fZmx1c2hfdGxiX290aGVycyhjb25z
dCBzCj4gPiAgCSAqIHF1ZXVlIGZsdXNoX29uX2VudGVyIGZvciBwcmUtZW1wdGVkIHZDUFVzCj4g
PiAgCSAqLwo+ID4gIAlmb3JfZWFjaF9jcHUoY3B1LCBmbHVzaG1hc2spIHsKPiA+ICsJCWlmIChj
cHUgPT0gc21wX3Byb2Nlc3Nvcl9pZCgpKQo+ID4gKwkJCWNvbnRpbnVlOwo+ID4gKwo+IAo+IEV2
ZW4gdGhpcyB3b3VsZCBiZSBqdXN0IGFuIG9wdGltaXphdGlvbjsgdGhlIHZDUFUgeW91J3JlIHJ1
bm5pbmcgb24KPiBjYW5ub3QgYmUgcHJlZW1wdGVkLiAgWW91IGNhbiBqdXN0IGNoYW5nZSBvdGhl
cnMgdG8gbXVsdGkuCgpZZWFoLCBJIGtub3csIGJ1dCBpdCBmZWx0IHdlaXJkIHNvIEkgYWRkZWQg
dGhlIGV4cGxpY2l0IHNraXAuIE5vIHN0cm9uZwpmZWVsaW5ncyB0aG91Z2guCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
