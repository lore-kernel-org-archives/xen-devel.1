From: Thomas Garnier <thgarnie@google.com>
Subject: Re: [PATCH v4 14/27] x86/percpu: Adapt percpu for PIE
 support
Date: Tue, 29 May 2018 16:08:24 -0700
Message-ID: <CAJcbSZF_MUpG37e7rt67pfNOT+m3ed2L+jRgvQ2Enb0wVLdOcg__2951.62141924283$1527635253$gmane$org@mail.gmail.com>
References: <20180529221625.33541-1-thgarnie@google.com>
 <20180529221625.33541-15-thgarnie@google.com>
 <01000163ae145cac-5ac07b51-8f08-4da5-bb93-0238d59756d3-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nupj=iq=google.com=thgarnie@srs-us1.protection.inumbo.net>)
 id 1fNnjK-0006KI-48
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 23:08:38 +0000
Received: by mail-it0-x243.google.com with SMTP id j186-v6so21028826ita.5
 for <xen-devel@lists.xenproject.org>; Tue, 29 May 2018 16:08:36 -0700 (PDT)
In-Reply-To: <01000163ae145cac-5ac07b51-8f08-4da5-bb93-0238d59756d3-000000@email.amazonses.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Lameter <cl@linux.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, xen-devel <xen-devel@lists.xenproject.org>, Borislav Petkov <bp@suse.de>, Alexey Dobriyan <adobriyan@gmail.com>, Tom Lendacky <thomas.lendacky@amd.com>, Kees Cook <keescook@chromium.org>, Skip Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Tejun Heo <tj@kernel.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Skip Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@red>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMjksIDIwMTggYXQgMzo0NiBQTSBDaHJpc3RvcGhlciBMYW1ldGVyIDxjbEBs
aW51eC5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIDI5IE1heSAyMDE4LCBUaG9tYXMgR2FybmllciB3
cm90ZToKCj4gPiBQZXJwY3UgdXNlcyBhIGNsZXZlciBkZXNpZ24gd2hlcmUgdGhlIC5wZXJjdSBF
TEYgc2VjdGlvbiBoYXMgYSB2aXJ0dWFsCj4gPiBhZGRyZXNzIG9mIHplcm8gYW5kIHRoZSByZWxv
Y2F0aW9uIGNvZGUgYXZvaWQgcmVsb2NhdGluZyBzcGVjaWZpYwo+ID4gc3ltYm9scy4gSXQgbWFr
ZXMgdGhlIGNvZGUgc2ltcGxlIGFuZCBlYXNpbHkgYWRhcHRhYmxlIHdpdGggb3Igd2l0aG91dAo+
ID4gU01QIHN1cHBvcnQuCj4gPgo+ID4gVGhpcyBkZXNpZ24gaXMgaW5jb21wYXRpYmxlIHdpdGgg
UElFIGJlY2F1c2UgZ2VuZXJhdGVkIGNvZGUgYWx3YXlzIHRyeQp0bwo+ID4gYWNjZXNzIHRoZSB6
ZXJvIHZpcnR1YWwgYWRkcmVzcyByZWxhdGl2ZSB0byB0aGUgZGVmYXVsdCBtYXBwaW5nIGFkZHJl
c3MuCgo+IFdlIGFsd2F5cyBhY2Nlc3MgcmVsYXRpdmUgdG8gdGhlICJzZWdtZW50IHJlZ2lzdGVy
Ii4KCj4gWW91IGNhbiBhbHJlYWR5IGNoYW5nZSB0aGUgc2VnbWVudCByZWdpc3RlciB0byByZWxv
Y2F0ZSB0aGUgcGVyIGNwdQo+IHNlY3Rpb25zIGFyYml0cmFyaWx5IHNpbmNlIGFsbCBwZXIgY3B1
ICJhZGRyZXNzZXMiIGFyZSBvZmZzZXRzIHJlbGF0aXZlIHRvCj4gdGhlIHNlZ21lbnQgcmVnaXN0
ZXIuIEkgYW0gbm90IHN1cmUgd2hhdCBleGFjdGx5IHlvdSBhcmUgdHJ5aW5nIHRvCj4gYWNjb21w
bGlzaCBoZXJlPwoKV2hlbiBidWlsZGluZyB3aXRoIFBJRSwgdGhlIGNvbXBpbGVyIHdhbnRzIHRo
ZSBjb2RlIHRvIGJlIHJlbG9jYXRhYmxlCmFueXdoZXJlIGluIHRoZSA2NC1iaXQgVkEgc3BhY2Uu
IEluc3RlYWQgb2YgdGFraW5nIHRoZSBzZWdtZW50IHJlZ2lzdGVyIGFzCmFuIGltbWVkaWF0ZSB2
YWx1ZSwgaXQgdGFrZXMgaXQgYXMgVkEgdGhhdCBuZWVkIHRvIGJlIHJlbG9jYXRlZCByZWxhdGl2
ZSB0bwp3aGVyZSB0aGUga2VybmVsIGlzIG1hcHBlZC4gVGhlIHBlci1jcHUgc2VjdGlvbiBWQSBp
cyB6ZXJvIHRvIGNyZWF0ZSB0aGUKcHJvcGVyIG9mZnNldCB0byB0aGUgZGlmZmVyZW50IHZhcmlh
YmxlLiBUaGUga2VybmVsIGNvdWxkIGJlIGF0IHRoZSB0b3Agb2YKdGhlIDY0LWJpdCBWQSBzcGFj
ZS4gUElFIHdpbGwgdHJ5IHRvIGNyZWF0ZSB0aGUgZGVsdGEgYmV0d2VlbiBhbnkgVkEgYW5kCnpl
cm8gYW5kIGZhaWwgYmVjYXVzZSBzZWdtZW50IHJlZ2lzdGVyIGJhc2VkIG9wZXJhdGlvbnMgZG8g
bm90IGhhdmUgZnVsbAo2NC1iaXQgVkEgcmFuZ2UuIERvZXMgaXQgbWFrZSBzZW5zZT8KCkZvciBQ
SUUgb25seSwgdGhpcyBjaGFuZ2Ugd2lsbCByZW1vdmUgdGhlIHBlci1jcHUgc2VjdGlvbiBWQSBv
ZiB6ZXJvLiBOb3cKdGhlIGRpc3RhbmNlIGJldHdlZW4gdGhlIHBlci1jcHUgc3ltYm9sIGFuZCB0
aGUga2VybmVsIGJhc2UgVkEgY2FuIGZpdCBpbgp0aGUgZ2VuZXJhdGVkIGluc3RydWN0aW9ucy4K
Cgo+IE1heWJlIHlvdSBuZWVkIHRvIGV4cGxhaW4gaXQgYmV0dGVyPwoKSSB3aWxsIHRyeSBkbyBl
eHBsYWluIGl0IGJldHRlciBvbiB0aGUgbmV4dCBwYXRjaCBzZXQuCgoKCgotLSAKVGhvbWFzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
