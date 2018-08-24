From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 09/11] x86/paravirt: move the Xen-only
 pv_irq_ops under the PARAVIRT_XXL umbrella
Date: Fri, 24 Aug 2018 16:13:43 +0200
Message-ID: <4477edae-e7c0-dcad-0621-824d55e97eaf__8852.80516599796$1535119949$gmane$org@suse.com>
References: <20180813073739.26108-1-jgross@suse.com>
 <20180813073739.26108-10-jgross@suse.com>
 <20180824141045.GO24124@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=l5ae=lh=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ftCqR-0007NZ-A3
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 14:13:47 +0000
In-Reply-To: <20180824141045.GO24124@hirez.programming.kicks-ass.net>
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

T24gMjQvMDgvMTggMTY6MTAsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDEz
LCAyMDE4IGF0IDA5OjM3OjM3QU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFNvbWUg
b2YgdGhlIHBhcmF2aXJ0IG9wcyBkZWZpbmVkIGluIHB2X2lycV9vcHMgYXJlIGZvciBYZW4gUFYg
Z3Vlc3RzCj4+IG9ubHkuIERlZmluZSB0aGVtIG9ubHkgaWYgQ09ORklHX1BBUkFWSVJUX1hYTCBp
cyBzZXQuCj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBl
cy5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaAo+PiBpbmRleCBlNjUy
ZWMyN2Q5NDUuLmFlNTNlZTM2ZDhmYiAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9h
c20vcGFyYXZpcnRfdHlwZXMuaAo+PiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmly
dF90eXBlcy5oCj4+IEBAIC0xOTcsOCArMTk3LDEwIEBAIHN0cnVjdCBwdl9pcnFfb3BzIHsKPj4g
IAlzdHJ1Y3QgcGFyYXZpcnRfY2FsbGVlX3NhdmUgaXJxX2Rpc2FibGU7Cj4+ICAJc3RydWN0IHBh
cmF2aXJ0X2NhbGxlZV9zYXZlIGlycV9lbmFibGU7Cj4+ICAKPj4gKyNpZmRlZiBDT05GSUdfUEFS
QVZJUlRfWFhMCj4+ICAJdm9pZCAoKnNhZmVfaGFsdCkodm9pZCk7Cj4+ICAJdm9pZCAoKmhhbHQp
KHZvaWQpOwo+PiArI2VuZGlmCj4gCj4gdGhhdCBtYWtlcyBtZSBzYWQuLi4gYnV0IGl0IGFwcGVh
cnMgVlNNUCBhbHNvIHVzZXMgdGhlbS4gQ2FuJ3QgeW91Cj4gc2ltcGx5IG1ha2UgVlNNUCBhbHNv
IHNlbGVjdCBYWEwsIEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHVzZWQgcXVpdGUgYXMKPiBtdWNoIGFz
IFhlbiBpcyA6LSkKPiAKClN1cmUsIHdoeSBub3Q/CgpBbnkgb2JqZWN0aW9ucz8KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
