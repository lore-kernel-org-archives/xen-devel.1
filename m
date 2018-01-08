From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] x86: xen: remove the use of VLAIS
Date: Mon, 8 Jan 2018 11:20:58 -0500
Message-ID: <0745372f-93af-3b70-e82d-db75af32742a__24557.2445485324$1515428441$gmane$org@oracle.com>
References: <c2217783-9d18-912f-8c13-996489dbe602@suse.com>
 <1515274788-24548-1-git-send-email-nick.desaulniers@gmail.com>
 <20180108161001.GM32035@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fog3=ed=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eYaB1-0001aP-Iq
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 16:21:31 +0000
In-Reply-To: <20180108161001.GM32035@hirez.programming.kicks-ass.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, ghackmann@google.com, mka@google.com, Ingo Molnar <mingo@redhat.com>, srhines@google.com, kees@google.com, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMjAxOCAxMToxMCBBTSwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gT24gU2F0LCBK
YW4gMDYsIDIwMTggYXQgMDE6Mzk6NDhQTSAtMDgwMCwgTmljayBEZXNhdWxuaWVycyB3cm90ZToK
Pj4gVmFyaWFibGUgTGVuZ3RoIEFycmF5cyBJbiBTdHJ1Y3RzIChWTEFJUykgaXMgbm90IHN1cHBv
cnRlZCBieSBDbGFuZywgYW5kCj4+IGZyb3duZWQgdXBvbiBieSBvdGhlcnMuCj4+Cj4+IGh0dHBz
Oi8vbGttbC5vcmcvbGttbC8yMDEzLzkvMjMvNTAwCj4+Cj4+IEhlcmUsIHRoZSBWTEFJUyB3YXMg
dXNlZCBiZWNhdXNlIHRoZSBzaXplIG9mIHRoZSBiaXRtYXAgcmV0dXJuZWQgZnJvbQo+PiB4ZW5f
bWNfZW50cnkoKSBkZXBlbmRlZCBvbiBwb3NzaWJseSAoYmFzZWQgb24ga2VybmVsIGNvbmZpZ3Vy
YXRpb24pCj4+IHJ1bnRpbWUgc2l6ZWQgZGF0YS4gUmF0aGVyIHRoYW4gZGVjbGFyaW5nIGFyZ3Mg
YXMgYSBWTEFJUyB0aGVuIGNhbGxpbmcKPj4gc2l6ZW9mIG9uICphcmdzLCB3ZSBjYWxjdWxhdGUg
dGhlIGFwcHJvcHJpYXRlIHNpemVvZiBhcmdzIG1hbnVhbGx5Lgo+PiBGdXJ0aGVyLCB3ZSBjYW4g
Z2V0IHJpZCBvZiB0aGUgI2lmZGVmJ3MgYW5kIHJlbHkgb24gbnVtX3Bvc3NpYmxlX2NwdXMoKQo+
PiAodGhhbmtzIHRvIGEgaGVscGZ1bCBjaGVja3BhdGNoIHdhcm5pbmcgZnJvbSBhbiBlYXJsaWVy
IHZlcnNpb24gb2YgdGhpcwo+PiBwYXRjaCkuCj4+Cj4+IFN1Z2dlc3RlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIERlc2F1bG5pZXJz
IDxuaWNrLmRlc2F1bG5pZXJzQGdtYWlsLmNvbT4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjI6Cj4+
ICogQ2hhbmdlIG1hc2sgdG8gdXMgREVDTEFSRV9CSVRNQVAgaW5zdGVhZCBvZiBwb2ludGVyLCBh
cyBzdWdnZXN0ZWQuCj4+ICogVXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIHJlbW92ZSBtZW50aW9u
IG9mIHBvaW50ZXIuCj4+ICogVXBkYXRlIHNpemVvZiBjYWxjdWxhdGlvbiB0byB3b3JrIHdpdGgg
YXJyYXkgcmF0aGVyIHRoYW4gcG9pbnRlci4KPj4KPj4gIGFyY2gveDg2L3hlbi9tbXVfcHYuYyB8
IDggKysrLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vbW11X3B2LmMgYi9hcmNoL3g4
Ni94ZW4vbW11X3B2LmMKPj4gaW5kZXggNGQ2MmMwNy4uZDg1MDc2MiAxMDA2NDQKPj4gLS0tIGEv
YXJjaC94ODYveGVuL21tdV9wdi5jCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9tbXVfcHYuYwo+PiBA
QCAtMTMyNSwyMCArMTMyNSwxOCBAQCBzdGF0aWMgdm9pZCB4ZW5fZmx1c2hfdGxiX290aGVycyhj
b25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywKPj4gIHsKPj4gIAlzdHJ1Y3Qgewo+PiAgCQlzdHJ1
Y3QgbW11ZXh0X29wIG9wOwo+PiAtI2lmZGVmIENPTkZJR19TTVAKPj4gLQkJREVDTEFSRV9CSVRN
QVAobWFzaywgbnVtX3Byb2Nlc3NvcnMpOwo+PiAtI2Vsc2UKPj4gIAkJREVDTEFSRV9CSVRNQVAo
bWFzaywgTlJfQ1BVUyk7Cj4+IC0jZW5kaWYKPj4gIAl9ICphcmdzOwo+IFdoeSBpcyBpdCBPSyBm
b3IgWGVuIHRvIHBsYWNlIHRoaXMgYml0bWFwIG9uLXN0YWNrIGluIHRoZSBmaXJzdCBwbGFjZT8K
PiBUaGF0IE5SX0NQVVMgdGhpbmcgY2FuIGJlIGZhaXJseSBodWdlLgoKRXJyLi4uIHJpZ2h0LiBO
b3cgaXQncyBldmVuIHdvcnNlIHRoYW4gaXQgd2FzIGJlZm9yZSwgd2hlbiB0aGUgYXJyYXkgd2Fz
CnBvdGVudGlhbGx5IHNtYWxsZXIuIEknbGwgZHJvcCB0aGlzLgoKLWJvcmlzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
