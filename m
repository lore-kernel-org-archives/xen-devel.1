From: Christopher Lameter <cl@linux.com>
Subject: Re: [PATCH v4 14/27] x86/percpu: Adapt percpu for PIE
 support
Date: Tue, 29 May 2018 22:46:00 +0000
Message-ID: <01000163ae145cac-5ac07b51-8f08-4da5-bb93-0238d59756d3-000000__24915.2144337588$1527634398$gmane$org@email.amazonses.com>
References: <20180529221625.33541-1-thgarnie@google.com>
 <20180529221625.33541-15-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yb6/=iq=amazonses.com=01000163ae145cac-5ac07b51-8f08-4da5-bb93-0238d59756d3-000000@srs-us1.protection.inumbo.net>)
 id 1fNnVd-0005G8-Pt
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 22:54:29 +0000
In-Reply-To: <20180529221625.33541-15-thgarnie@google.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@google.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>, Skip Dave Hansen <dave.hansen@linux.intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Borislav Petkov <bp@suse.de>, Alexey Dobriyan <adobriyan@gmail.com>, Skip Tom Lendacky <thomas.lendacky@amd.com>, Skip Kees Cook <keescook@chromium.org>, Skip Frederic Weisbecker <frederic@kernel.org>, Skip Nicholas Piggin <npiggin@gmail.com>, Tejun Heo <tj@kernel.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Skip Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Boris Ostrovsky <boris.ostrov>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyOSBNYXkgMjAxOCwgVGhvbWFzIEdhcm5pZXIgd3JvdGU6Cgo+IFBlcnBjdSB1c2Vz
IGEgY2xldmVyIGRlc2lnbiB3aGVyZSB0aGUgLnBlcmN1IEVMRiBzZWN0aW9uIGhhcyBhIHZpcnR1
YWwKPiBhZGRyZXNzIG9mIHplcm8gYW5kIHRoZSByZWxvY2F0aW9uIGNvZGUgYXZvaWQgcmVsb2Nh
dGluZyBzcGVjaWZpYwo+IHN5bWJvbHMuIEl0IG1ha2VzIHRoZSBjb2RlIHNpbXBsZSBhbmQgZWFz
aWx5IGFkYXB0YWJsZSB3aXRoIG9yIHdpdGhvdXQKPiBTTVAgc3VwcG9ydC4KPgo+IFRoaXMgZGVz
aWduIGlzIGluY29tcGF0aWJsZSB3aXRoIFBJRSBiZWNhdXNlIGdlbmVyYXRlZCBjb2RlIGFsd2F5
cyB0cnkgdG8KPiBhY2Nlc3MgdGhlIHplcm8gdmlydHVhbCBhZGRyZXNzIHJlbGF0aXZlIHRvIHRo
ZSBkZWZhdWx0IG1hcHBpbmcgYWRkcmVzcy4KCldlIGFsd2F5cyBhY2Nlc3MgcmVsYXRpdmUgdG8g
dGhlICJzZWdtZW50IHJlZ2lzdGVyIi4KCllvdSBjYW4gYWxyZWFkeSBjaGFuZ2UgdGhlIHNlZ21l
bnQgcmVnaXN0ZXIgdG8gcmVsb2NhdGUgdGhlIHBlciBjcHUKc2VjdGlvbnMgYXJiaXRyYXJpbHkg
c2luY2UgYWxsIHBlciBjcHUgImFkZHJlc3NlcyIgYXJlIG9mZnNldHMgcmVsYXRpdmUgdG8KdGhl
IHNlZ21lbnQgcmVnaXN0ZXIuIEkgYW0gbm90IHN1cmUgd2hhdCBleGFjdGx5IHlvdSBhcmUgdHJ5
aW5nIHRvCmFjY29tcGxpc2ggaGVyZT8KCk1heWJlIHlvdSBuZWVkIHRvIGV4cGxhaW4gaXQgYmV0
dGVyPwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
