From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 09/11] x86/paravirt: move the Xen-only
 pv_irq_ops under the PARAVIRT_XXL umbrella
Date: Fri, 24 Aug 2018 16:10:45 +0200
Message-ID: <20180824141045.GO24124__15898.7061390237$1535119786$gmane$org@hirez.programming.kicks-ass.net>
References: <20180813073739.26108-1-jgross@suse.com>
 <20180813073739.26108-10-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=e3pb=lh=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1ftCng-0006rL-9J
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 14:10:56 +0000
Content-Disposition: inline
In-Reply-To: <20180813073739.26108-10-jgross@suse.com>
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

T24gTW9uLCBBdWcgMTMsIDIwMTggYXQgMDk6Mzc6MzdBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBTb21lIG9mIHRoZSBwYXJhdmlydCBvcHMgZGVmaW5lZCBpbiBwdl9pcnFfb3BzIGFy
ZSBmb3IgWGVuIFBWIGd1ZXN0cwo+IG9ubHkuIERlZmluZSB0aGVtIG9ubHkgaWYgQ09ORklHX1BB
UkFWSVJUX1hYTCBpcyBzZXQuCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Bh
cmF2aXJ0X3R5cGVzLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBlcy5oCj4g
aW5kZXggZTY1MmVjMjdkOTQ1Li5hZTUzZWUzNmQ4ZmIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYv
aW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaAo+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3BhcmF2aXJ0X3R5cGVzLmgKPiBAQCAtMTk3LDggKzE5NywxMCBAQCBzdHJ1Y3QgcHZfaXJxX29w
cyB7Cj4gIAlzdHJ1Y3QgcGFyYXZpcnRfY2FsbGVlX3NhdmUgaXJxX2Rpc2FibGU7Cj4gIAlzdHJ1
Y3QgcGFyYXZpcnRfY2FsbGVlX3NhdmUgaXJxX2VuYWJsZTsKPiAgCj4gKyNpZmRlZiBDT05GSUdf
UEFSQVZJUlRfWFhMCj4gIAl2b2lkICgqc2FmZV9oYWx0KSh2b2lkKTsKPiAgCXZvaWQgKCpoYWx0
KSh2b2lkKTsKPiArI2VuZGlmCgp0aGF0IG1ha2VzIG1lIHNhZC4uLiBidXQgaXQgYXBwZWFycyBW
U01QIGFsc28gdXNlcyB0aGVtLiBDYW4ndCB5b3UKc2ltcGx5IG1ha2UgVlNNUCBhbHNvIHNlbGVj
dCBYWEwsIEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHVzZWQgcXVpdGUgYXMKbXVjaCBhcyBYZW4gaXMg
Oi0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
