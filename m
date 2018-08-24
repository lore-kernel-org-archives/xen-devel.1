From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 10/11] x86/paravirt: move the Xen-only
 pv_mmu_ops under the PARAVIRT_XXL umbrella
Date: Fri, 24 Aug 2018 16:15:08 +0200
Message-ID: <e4862ca0-ccff-1662-0db2-86891b95f598__48837.0391809896$1535120032$gmane$org@suse.com>
References: <20180813073739.26108-1-jgross@suse.com>
 <20180813073739.26108-11-jgross@suse.com>
 <20180824141218.GP24124@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=l5ae=lh=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ftCrn-0007W4-H1
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 14:15:11 +0000
In-Reply-To: <20180824141218.GP24124@hirez.programming.kicks-ass.net>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: rusty@rustcorp.com.au, x86@kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, mingo@redhat.com, tglx@linutronix.de, hpa@zytor.com, xen-devel@lists.xenproject.org, akataria@vmware.com, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDgvMTggMTY6MTIsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDEz
LCAyMDE4IGF0IDA5OjM3OjM4QU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+ICBzdHJ1
Y3QgcHZfbW11X29wcyB7Cj4+ICsJLyogVExCIG9wZXJhdGlvbnMgKi8KPj4gKwl2b2lkICgqZmx1
c2hfdGxiX3VzZXIpKHZvaWQpOwo+PiArCXZvaWQgKCpmbHVzaF90bGJfa2VybmVsKSh2b2lkKTsK
Pj4gKwl2b2lkICgqZmx1c2hfdGxiX29uZV91c2VyKSh1bnNpZ25lZCBsb25nIGFkZHIpOwo+PiAr
CXZvaWQgKCpmbHVzaF90bGJfb3RoZXJzKShjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywKPj4g
KwkJCQkgY29uc3Qgc3RydWN0IGZsdXNoX3RsYl9pbmZvICppbmZvKTsKPj4gKwo+PiArCS8qIEhv
b2sgZm9yIGludGVyY2VwdGluZyB0aGUgZGVzdHJ1Y3Rpb24gb2YgYW4gbW1fc3RydWN0LiAqLwo+
PiArCXZvaWQgKCpleGl0X21tYXApKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKTsKPiAKPiBSaWdodCwg
c28gSSBqdXN0IHdyZWNrZWQgdGhhdCBmb3IgeW91IGJ5IGFkZGluZyBhIG5ldzoKPiB0bGJfcmVt
b3ZlX3RhYmxlIHZpcnQgZnVuY3Rpb24uIEJ1dCBJIGRvbid0IHN1cHBvc2UgdGhhdCdzIGEgZGlm
ZmljdWx0Cj4gdGhpbmcgdG8gZml4IHVwLgoKUmlnaHQuIFRoaXMgd2lsbCBzdGF5IG91dHNpZGUg
b2YgWFhMLCBJIHRoaW5rLiA6LSkKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
