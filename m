From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] x86: xen: remove the use of VLAIS
Date: Mon, 8 Jan 2018 11:35:41 -0500
Message-ID: <c311d554-4f77-f7ef-4f37-c2aa3fde783f__22993.5905350887$1515429322$gmane$org@oracle.com>
References: <c2217783-9d18-912f-8c13-996489dbe602@suse.com>
 <1515274788-24548-1-git-send-email-nick.desaulniers@gmail.com>
 <20180108161001.GM32035@hirez.programming.kicks-ass.net>
 <0745372f-93af-3b70-e82d-db75af32742a@oracle.com>
 <62287687-99c2-b306-d1fc-7dc87fd38eb6@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fog3=ed=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eYaPJ-00034e-5T
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 16:36:17 +0000
In-Reply-To: <62287687-99c2-b306-d1fc-7dc87fd38eb6@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: kees@google.com, x86@kernel.org, linux-kernel@vger.kernel.org, ghackmann@google.com, mka@google.com, Ingo Molnar <mingo@redhat.com>, srhines@google.com, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMjAxOCAxMToyOCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwOC8wMS8x
OCAxNzoyMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwMS8wOC8yMDE4IDExOjEwIEFN
LCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPj4+IE9uIFNhdCwgSmFuIDA2LCAyMDE4IGF0IDAxOjM5
OjQ4UE0gLTA4MDAsIE5pY2sgRGVzYXVsbmllcnMgd3JvdGU6Cj4+Pj4gVmFyaWFibGUgTGVuZ3Ro
IEFycmF5cyBJbiBTdHJ1Y3RzIChWTEFJUykgaXMgbm90IHN1cHBvcnRlZCBieSBDbGFuZywgYW5k
Cj4+Pj4gZnJvd25lZCB1cG9uIGJ5IG90aGVycy4KPj4+Pgo+Pj4+IGh0dHBzOi8vbGttbC5vcmcv
bGttbC8yMDEzLzkvMjMvNTAwCj4+Pj4KPj4+PiBIZXJlLCB0aGUgVkxBSVMgd2FzIHVzZWQgYmVj
YXVzZSB0aGUgc2l6ZSBvZiB0aGUgYml0bWFwIHJldHVybmVkIGZyb20KPj4+PiB4ZW5fbWNfZW50
cnkoKSBkZXBlbmRlZCBvbiBwb3NzaWJseSAoYmFzZWQgb24ga2VybmVsIGNvbmZpZ3VyYXRpb24p
Cj4+Pj4gcnVudGltZSBzaXplZCBkYXRhLiBSYXRoZXIgdGhhbiBkZWNsYXJpbmcgYXJncyBhcyBh
IFZMQUlTIHRoZW4gY2FsbGluZwo+Pj4+IHNpemVvZiBvbiAqYXJncywgd2UgY2FsY3VsYXRlIHRo
ZSBhcHByb3ByaWF0ZSBzaXplb2YgYXJncyBtYW51YWxseS4KPj4+PiBGdXJ0aGVyLCB3ZSBjYW4g
Z2V0IHJpZCBvZiB0aGUgI2lmZGVmJ3MgYW5kIHJlbHkgb24gbnVtX3Bvc3NpYmxlX2NwdXMoKQo+
Pj4+ICh0aGFua3MgdG8gYSBoZWxwZnVsIGNoZWNrcGF0Y2ggd2FybmluZyBmcm9tIGFuIGVhcmxp
ZXIgdmVyc2lvbiBvZiB0aGlzCj4+Pj4gcGF0Y2gpLgo+Pj4+Cj4+Pj4gU3VnZ2VzdGVkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTmljayBE
ZXNhdWxuaWVycyA8bmljay5kZXNhdWxuaWVyc0BnbWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gQ2hh
bmdlcyBpbiB2MjoKPj4+PiAqIENoYW5nZSBtYXNrIHRvIHVzIERFQ0xBUkVfQklUTUFQIGluc3Rl
YWQgb2YgcG9pbnRlciwgYXMgc3VnZ2VzdGVkLgo+Pj4+ICogVXBkYXRlIGNvbW1pdCBtZXNzYWdl
IHRvIHJlbW92ZSBtZW50aW9uIG9mIHBvaW50ZXIuCj4+Pj4gKiBVcGRhdGUgc2l6ZW9mIGNhbGN1
bGF0aW9uIHRvIHdvcmsgd2l0aCBhcnJheSByYXRoZXIgdGhhbiBwb2ludGVyLgo+Pj4+Cj4+Pj4g
IGFyY2gveDg2L3hlbi9tbXVfcHYuYyB8IDggKysrLS0tLS0KPj4+PiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9h
cmNoL3g4Ni94ZW4vbW11X3B2LmMgYi9hcmNoL3g4Ni94ZW4vbW11X3B2LmMKPj4+PiBpbmRleCA0
ZDYyYzA3Li5kODUwNzYyIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gveDg2L3hlbi9tbXVfcHYuYwo+
Pj4+ICsrKyBiL2FyY2gveDg2L3hlbi9tbXVfcHYuYwo+Pj4+IEBAIC0xMzI1LDIwICsxMzI1LDE4
IEBAIHN0YXRpYyB2b2lkIHhlbl9mbHVzaF90bGJfb3RoZXJzKGNvbnN0IHN0cnVjdCBjcHVtYXNr
ICpjcHVzLAo+Pj4+ICB7Cj4+Pj4gIAlzdHJ1Y3Qgewo+Pj4+ICAJCXN0cnVjdCBtbXVleHRfb3Ag
b3A7Cj4+Pj4gLSNpZmRlZiBDT05GSUdfU01QCj4+Pj4gLQkJREVDTEFSRV9CSVRNQVAobWFzaywg
bnVtX3Byb2Nlc3NvcnMpOwo+Pj4+IC0jZWxzZQo+Pj4+ICAJCURFQ0xBUkVfQklUTUFQKG1hc2ss
IE5SX0NQVVMpOwo+Pj4+IC0jZW5kaWYKPj4+PiAgCX0gKmFyZ3M7Cj4+PiBXaHkgaXMgaXQgT0sg
Zm9yIFhlbiB0byBwbGFjZSB0aGlzIGJpdG1hcCBvbi1zdGFjayBpbiB0aGUgZmlyc3QgcGxhY2U/
Cj4+PiBUaGF0IE5SX0NQVVMgdGhpbmcgY2FuIGJlIGZhaXJseSBodWdlLgo+PiBFcnIuLi4gcmln
aHQuIE5vdyBpdCdzIGV2ZW4gd29yc2UgdGhhbiBpdCB3YXMgYmVmb3JlLCB3aGVuIHRoZSBhcnJh
eSB3YXMKPj4gcG90ZW50aWFsbHkgc21hbGxlci4gSSdsbCBkcm9wIHRoaXMuCj4gTm8sIGl0cyBv
bmx5IHRoZSBwb2ludGVyIHRvIHRoZSBzdHJ1Y3QsIG5vdCB0aGUgc3RydWN0IGl0c2VsZi4KPgoK
Ckl0J3MgdGhlIGZ1bGwgYXJyYXksIGlzbid0IGl0PwoKI2RlZmluZSBERUNMQVJFX0JJVE1BUChu
YW1lLGJpdHMpIFwKICAgICAgICB1bnNpZ25lZCBsb25nIG5hbWVbQklUU19UT19MT05HUyhiaXRz
KV0KCjxwYXVzZT4KCk9LLCBpdCAqaXMqIGEgcG9pbnRlci4gU2lnaC4uLgoKLWJvcmlzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
