From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86: xen: remove the use of VLAIS
Date: Mon, 8 Jan 2018 17:28:05 +0100
Message-ID: <62287687-99c2-b306-d1fc-7dc87fd38eb6__26790.2781175964$1515428837$gmane$org@suse.com>
References: <c2217783-9d18-912f-8c13-996489dbe602@suse.com>
 <1515274788-24548-1-git-send-email-nick.desaulniers@gmail.com>
 <20180108161001.GM32035@hirez.programming.kicks-ass.net>
 <0745372f-93af-3b70-e82d-db75af32742a@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=azyu=ed=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eYaHU-0001wO-AL
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 16:28:12 +0000
In-Reply-To: <0745372f-93af-3b70-e82d-db75af32742a@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, ghackmann@google.com, mka@google.com, Ingo Molnar <mingo@redhat.com>, srhines@google.com, kees@google.com, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDEvMTggMTc6MjAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwMS8wOC8yMDE4
IDExOjEwIEFNLCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPj4gT24gU2F0LCBKYW4gMDYsIDIwMTgg
YXQgMDE6Mzk6NDhQTSAtMDgwMCwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPj4+IFZhcmlhYmxl
IExlbmd0aCBBcnJheXMgSW4gU3RydWN0cyAoVkxBSVMpIGlzIG5vdCBzdXBwb3J0ZWQgYnkgQ2xh
bmcsIGFuZAo+Pj4gZnJvd25lZCB1cG9uIGJ5IG90aGVycy4KPj4+Cj4+PiBodHRwczovL2xrbWwu
b3JnL2xrbWwvMjAxMy85LzIzLzUwMAo+Pj4KPj4+IEhlcmUsIHRoZSBWTEFJUyB3YXMgdXNlZCBi
ZWNhdXNlIHRoZSBzaXplIG9mIHRoZSBiaXRtYXAgcmV0dXJuZWQgZnJvbQo+Pj4geGVuX21jX2Vu
dHJ5KCkgZGVwZW5kZWQgb24gcG9zc2libHkgKGJhc2VkIG9uIGtlcm5lbCBjb25maWd1cmF0aW9u
KQo+Pj4gcnVudGltZSBzaXplZCBkYXRhLiBSYXRoZXIgdGhhbiBkZWNsYXJpbmcgYXJncyBhcyBh
IFZMQUlTIHRoZW4gY2FsbGluZwo+Pj4gc2l6ZW9mIG9uICphcmdzLCB3ZSBjYWxjdWxhdGUgdGhl
IGFwcHJvcHJpYXRlIHNpemVvZiBhcmdzIG1hbnVhbGx5Lgo+Pj4gRnVydGhlciwgd2UgY2FuIGdl
dCByaWQgb2YgdGhlICNpZmRlZidzIGFuZCByZWx5IG9uIG51bV9wb3NzaWJsZV9jcHVzKCkKPj4+
ICh0aGFua3MgdG8gYSBoZWxwZnVsIGNoZWNrcGF0Y2ggd2FybmluZyBmcm9tIGFuIGVhcmxpZXIg
dmVyc2lvbiBvZiB0aGlzCj4+PiBwYXRjaCkuCj4+Pgo+Pj4gU3VnZ2VzdGVkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIERlc2F1bG5p
ZXJzIDxuaWNrLmRlc2F1bG5pZXJzQGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gQ2hhbmdlcyBpbiB2
MjoKPj4+ICogQ2hhbmdlIG1hc2sgdG8gdXMgREVDTEFSRV9CSVRNQVAgaW5zdGVhZCBvZiBwb2lu
dGVyLCBhcyBzdWdnZXN0ZWQuCj4+PiAqIFVwZGF0ZSBjb21taXQgbWVzc2FnZSB0byByZW1vdmUg
bWVudGlvbiBvZiBwb2ludGVyLgo+Pj4gKiBVcGRhdGUgc2l6ZW9mIGNhbGN1bGF0aW9uIHRvIHdv
cmsgd2l0aCBhcnJheSByYXRoZXIgdGhhbiBwb2ludGVyLgo+Pj4KPj4+ICBhcmNoL3g4Ni94ZW4v
bW11X3B2LmMgfCA4ICsrKy0tLS0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL21tdV9w
di5jIGIvYXJjaC94ODYveGVuL21tdV9wdi5jCj4+PiBpbmRleCA0ZDYyYzA3Li5kODUwNzYyIDEw
MDY0NAo+Pj4gLS0tIGEvYXJjaC94ODYveGVuL21tdV9wdi5jCj4+PiArKysgYi9hcmNoL3g4Ni94
ZW4vbW11X3B2LmMKPj4+IEBAIC0xMzI1LDIwICsxMzI1LDE4IEBAIHN0YXRpYyB2b2lkIHhlbl9m
bHVzaF90bGJfb3RoZXJzKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVzLAo+Pj4gIHsKPj4+ICAJ
c3RydWN0IHsKPj4+ICAJCXN0cnVjdCBtbXVleHRfb3Agb3A7Cj4+PiAtI2lmZGVmIENPTkZJR19T
TVAKPj4+IC0JCURFQ0xBUkVfQklUTUFQKG1hc2ssIG51bV9wcm9jZXNzb3JzKTsKPj4+IC0jZWxz
ZQo+Pj4gIAkJREVDTEFSRV9CSVRNQVAobWFzaywgTlJfQ1BVUyk7Cj4+PiAtI2VuZGlmCj4+PiAg
CX0gKmFyZ3M7Cj4+IFdoeSBpcyBpdCBPSyBmb3IgWGVuIHRvIHBsYWNlIHRoaXMgYml0bWFwIG9u
LXN0YWNrIGluIHRoZSBmaXJzdCBwbGFjZT8KPj4gVGhhdCBOUl9DUFVTIHRoaW5nIGNhbiBiZSBm
YWlybHkgaHVnZS4KPiAKPiBFcnIuLi4gcmlnaHQuIE5vdyBpdCdzIGV2ZW4gd29yc2UgdGhhbiBp
dCB3YXMgYmVmb3JlLCB3aGVuIHRoZSBhcnJheSB3YXMKPiBwb3RlbnRpYWxseSBzbWFsbGVyLiBJ
J2xsIGRyb3AgdGhpcy4KCk5vLCBpdHMgb25seSB0aGUgcG9pbnRlciB0byB0aGUgc3RydWN0LCBu
b3QgdGhlIHN0cnVjdCBpdHNlbGYuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
