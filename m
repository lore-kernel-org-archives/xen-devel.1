From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2] x86: xen: remove the use of VLAIS
Date: Mon, 8 Jan 2018 17:10:01 +0100
Message-ID: <20180108161001.GM32035__14689.3950332471$1515427760$gmane$org@hirez.programming.kicks-ass.net>
References: <c2217783-9d18-912f-8c13-996489dbe602@suse.com>
 <1515274788-24548-1-git-send-email-nick.desaulniers@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ulit=ed=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1eYa06-0000St-7w
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 16:10:14 +0000
Content-Disposition: inline
In-Reply-To: <1515274788-24548-1-git-send-email-nick.desaulniers@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, ghackmann@google.com, mka@google.com, Ingo Molnar <mingo@redhat.com>, srhines@google.com, kees@google.com, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKYW4gMDYsIDIwMTggYXQgMDE6Mzk6NDhQTSAtMDgwMCwgTmljayBEZXNhdWxuaWVy
cyB3cm90ZToKPiBWYXJpYWJsZSBMZW5ndGggQXJyYXlzIEluIFN0cnVjdHMgKFZMQUlTKSBpcyBu
b3Qgc3VwcG9ydGVkIGJ5IENsYW5nLCBhbmQKPiBmcm93bmVkIHVwb24gYnkgb3RoZXJzLgo+IAo+
IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDEzLzkvMjMvNTAwCj4gCj4gSGVyZSwgdGhlIFZMQUlT
IHdhcyB1c2VkIGJlY2F1c2UgdGhlIHNpemUgb2YgdGhlIGJpdG1hcCByZXR1cm5lZCBmcm9tCj4g
eGVuX21jX2VudHJ5KCkgZGVwZW5kZWQgb24gcG9zc2libHkgKGJhc2VkIG9uIGtlcm5lbCBjb25m
aWd1cmF0aW9uKQo+IHJ1bnRpbWUgc2l6ZWQgZGF0YS4gUmF0aGVyIHRoYW4gZGVjbGFyaW5nIGFy
Z3MgYXMgYSBWTEFJUyB0aGVuIGNhbGxpbmcKPiBzaXplb2Ygb24gKmFyZ3MsIHdlIGNhbGN1bGF0
ZSB0aGUgYXBwcm9wcmlhdGUgc2l6ZW9mIGFyZ3MgbWFudWFsbHkuCj4gRnVydGhlciwgd2UgY2Fu
IGdldCByaWQgb2YgdGhlICNpZmRlZidzIGFuZCByZWx5IG9uIG51bV9wb3NzaWJsZV9jcHVzKCkK
PiAodGhhbmtzIHRvIGEgaGVscGZ1bCBjaGVja3BhdGNoIHdhcm5pbmcgZnJvbSBhbiBlYXJsaWVy
IHZlcnNpb24gb2YgdGhpcwo+IHBhdGNoKS4KPiAKPiBTdWdnZXN0ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxu
aWNrLmRlc2F1bG5pZXJzQGdtYWlsLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+ICogQ2hh
bmdlIG1hc2sgdG8gdXMgREVDTEFSRV9CSVRNQVAgaW5zdGVhZCBvZiBwb2ludGVyLCBhcyBzdWdn
ZXN0ZWQuCj4gKiBVcGRhdGUgY29tbWl0IG1lc3NhZ2UgdG8gcmVtb3ZlIG1lbnRpb24gb2YgcG9p
bnRlci4KPiAqIFVwZGF0ZSBzaXplb2YgY2FsY3VsYXRpb24gdG8gd29yayB3aXRoIGFycmF5IHJh
dGhlciB0aGFuIHBvaW50ZXIuCj4gCj4gIGFyY2gveDg2L3hlbi9tbXVfcHYuYyB8IDggKysrLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL21tdV9wdi5jIGIvYXJjaC94ODYveGVuL21tdV9w
di5jCj4gaW5kZXggNGQ2MmMwNy4uZDg1MDc2MiAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni94ZW4v
bW11X3B2LmMKPiArKysgYi9hcmNoL3g4Ni94ZW4vbW11X3B2LmMKPiBAQCAtMTMyNSwyMCArMTMy
NSwxOCBAQCBzdGF0aWMgdm9pZCB4ZW5fZmx1c2hfdGxiX290aGVycyhjb25zdCBzdHJ1Y3QgY3B1
bWFzayAqY3B1cywKPiAgewo+ICAJc3RydWN0IHsKPiAgCQlzdHJ1Y3QgbW11ZXh0X29wIG9wOwo+
IC0jaWZkZWYgQ09ORklHX1NNUAo+IC0JCURFQ0xBUkVfQklUTUFQKG1hc2ssIG51bV9wcm9jZXNz
b3JzKTsKPiAtI2Vsc2UKPiAgCQlERUNMQVJFX0JJVE1BUChtYXNrLCBOUl9DUFVTKTsKPiAtI2Vu
ZGlmCj4gIAl9ICphcmdzOwoKV2h5IGlzIGl0IE9LIGZvciBYZW4gdG8gcGxhY2UgdGhpcyBiaXRt
YXAgb24tc3RhY2sgaW4gdGhlIGZpcnN0IHBsYWNlPwpUaGF0IE5SX0NQVVMgdGhpbmcgY2FuIGJl
IGZhaXJseSBodWdlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
