From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86: xen: remove the use of VLAIS
Date: Mon, 8 Jan 2018 17:26:39 +0100
Message-ID: <892cb5f2-367b-cfbd-58b5-3d8711c3ed66__23353.3893981532$1515428753$gmane$org@suse.com>
References: <c2217783-9d18-912f-8c13-996489dbe602@suse.com>
 <1515274788-24548-1-git-send-email-nick.desaulniers@gmail.com>
 <20180108161001.GM32035@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=azyu=ed=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eYaGB-0001nL-GJ
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 16:26:51 +0000
In-Reply-To: <20180108161001.GM32035@hirez.programming.kicks-ass.net>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, ghackmann@google.com, mka@google.com, Ingo Molnar <mingo@redhat.com>, srhines@google.com, kees@google.com, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDEvMTggMTc6MTAsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+IE9uIFNhdCwgSmFuIDA2
LCAyMDE4IGF0IDAxOjM5OjQ4UE0gLTA4MDAsIE5pY2sgRGVzYXVsbmllcnMgd3JvdGU6Cj4+IFZh
cmlhYmxlIExlbmd0aCBBcnJheXMgSW4gU3RydWN0cyAoVkxBSVMpIGlzIG5vdCBzdXBwb3J0ZWQg
YnkgQ2xhbmcsIGFuZAo+PiBmcm93bmVkIHVwb24gYnkgb3RoZXJzLgo+Pgo+PiBodHRwczovL2xr
bWwub3JnL2xrbWwvMjAxMy85LzIzLzUwMAo+Pgo+PiBIZXJlLCB0aGUgVkxBSVMgd2FzIHVzZWQg
YmVjYXVzZSB0aGUgc2l6ZSBvZiB0aGUgYml0bWFwIHJldHVybmVkIGZyb20KPj4geGVuX21jX2Vu
dHJ5KCkgZGVwZW5kZWQgb24gcG9zc2libHkgKGJhc2VkIG9uIGtlcm5lbCBjb25maWd1cmF0aW9u
KQo+PiBydW50aW1lIHNpemVkIGRhdGEuIFJhdGhlciB0aGFuIGRlY2xhcmluZyBhcmdzIGFzIGEg
VkxBSVMgdGhlbiBjYWxsaW5nCj4+IHNpemVvZiBvbiAqYXJncywgd2UgY2FsY3VsYXRlIHRoZSBh
cHByb3ByaWF0ZSBzaXplb2YgYXJncyBtYW51YWxseS4KPj4gRnVydGhlciwgd2UgY2FuIGdldCBy
aWQgb2YgdGhlICNpZmRlZidzIGFuZCByZWx5IG9uIG51bV9wb3NzaWJsZV9jcHVzKCkKPj4gKHRo
YW5rcyB0byBhIGhlbHBmdWwgY2hlY2twYXRjaCB3YXJuaW5nIGZyb20gYW4gZWFybGllciB2ZXJz
aW9uIG9mIHRoaXMKPj4gcGF0Y2gpLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTmljayBEZXNhdWxuaWVycyA8bmlj
ay5kZXNhdWxuaWVyc0BnbWFpbC5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHYyOgo+PiAqIENo
YW5nZSBtYXNrIHRvIHVzIERFQ0xBUkVfQklUTUFQIGluc3RlYWQgb2YgcG9pbnRlciwgYXMgc3Vn
Z2VzdGVkLgo+PiAqIFVwZGF0ZSBjb21taXQgbWVzc2FnZSB0byByZW1vdmUgbWVudGlvbiBvZiBw
b2ludGVyLgo+PiAqIFVwZGF0ZSBzaXplb2YgY2FsY3VsYXRpb24gdG8gd29yayB3aXRoIGFycmF5
IHJhdGhlciB0aGFuIHBvaW50ZXIuCj4+Cj4+ICBhcmNoL3g4Ni94ZW4vbW11X3B2LmMgfCA4ICsr
Ky0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL21tdV9wdi5jIGIvYXJjaC94ODYveGVu
L21tdV9wdi5jCj4+IGluZGV4IDRkNjJjMDcuLmQ4NTA3NjIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
eDg2L3hlbi9tbXVfcHYuYwo+PiArKysgYi9hcmNoL3g4Ni94ZW4vbW11X3B2LmMKPj4gQEAgLTEz
MjUsMjAgKzEzMjUsMTggQEAgc3RhdGljIHZvaWQgeGVuX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qg
c3RydWN0IGNwdW1hc2sgKmNwdXMsCj4+ICB7Cj4+ICAJc3RydWN0IHsKPj4gIAkJc3RydWN0IG1t
dWV4dF9vcCBvcDsKPj4gLSNpZmRlZiBDT05GSUdfU01QCj4+IC0JCURFQ0xBUkVfQklUTUFQKG1h
c2ssIG51bV9wcm9jZXNzb3JzKTsKPj4gLSNlbHNlCj4+ICAJCURFQ0xBUkVfQklUTUFQKG1hc2ss
IE5SX0NQVVMpOwo+PiAtI2VuZGlmCj4+ICAJfSAqYXJnczsKPiAKPiBXaHkgaXMgaXQgT0sgZm9y
IFhlbiB0byBwbGFjZSB0aGlzIGJpdG1hcCBvbi1zdGFjayBpbiB0aGUgZmlyc3QgcGxhY2U/Cj4g
VGhhdCBOUl9DUFVTIHRoaW5nIGNhbiBiZSBmYWlybHkgaHVnZS4KClRoaXMgb25seSBhIHBvaW50
ZXIgdG8gdGhlIGJpdG1hcC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
