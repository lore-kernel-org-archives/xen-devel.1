From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 10/11] x86/paravirt: move the Xen-only
 pv_mmu_ops under the PARAVIRT_XXL umbrella
Date: Fri, 24 Aug 2018 16:12:18 +0200
Message-ID: <20180824141218.GP24124__37915.8033211299$1535119863$gmane$org@hirez.programming.kicks-ass.net>
References: <20180813073739.26108-1-jgross@suse.com>
 <20180813073739.26108-11-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=e3pb=lh=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1ftCp6-0007EV-Um
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 14:12:24 +0000
Content-Disposition: inline
In-Reply-To: <20180813073739.26108-11-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: rusty@rustcorp.com.au, x86@kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, mingo@redhat.com, tglx@linutronix.de, hpa@zytor.com, xen-devel@lists.xenproject.org, akataria@vmware.com, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMTMsIDIwMTggYXQgMDk6Mzc6MzhBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiAgc3RydWN0IHB2X21tdV9vcHMgewo+ICsJLyogVExCIG9wZXJhdGlvbnMgKi8KPiAr
CXZvaWQgKCpmbHVzaF90bGJfdXNlcikodm9pZCk7Cj4gKwl2b2lkICgqZmx1c2hfdGxiX2tlcm5l
bCkodm9pZCk7Cj4gKwl2b2lkICgqZmx1c2hfdGxiX29uZV91c2VyKSh1bnNpZ25lZCBsb25nIGFk
ZHIpOwo+ICsJdm9pZCAoKmZsdXNoX3RsYl9vdGhlcnMpKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpj
cHVzLAo+ICsJCQkJIGNvbnN0IHN0cnVjdCBmbHVzaF90bGJfaW5mbyAqaW5mbyk7Cj4gKwo+ICsJ
LyogSG9vayBmb3IgaW50ZXJjZXB0aW5nIHRoZSBkZXN0cnVjdGlvbiBvZiBhbiBtbV9zdHJ1Y3Qu
ICovCj4gKwl2b2lkICgqZXhpdF9tbWFwKShzdHJ1Y3QgbW1fc3RydWN0ICptbSk7CgpSaWdodCwg
c28gSSBqdXN0IHdyZWNrZWQgdGhhdCBmb3IgeW91IGJ5IGFkZGluZyBhIG5ldzoKdGxiX3JlbW92
ZV90YWJsZSB2aXJ0IGZ1bmN0aW9uLiBCdXQgSSBkb24ndCBzdXBwb3NlIHRoYXQncyBhIGRpZmZp
Y3VsdAp0aGluZyB0byBmaXggdXAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
