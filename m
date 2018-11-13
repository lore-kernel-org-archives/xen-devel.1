From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/HVM: __hvm_copy() should not write
 to p2m_ioreq_server pages
Date: Tue, 13 Nov 2018 10:47:23 +0000
Message-ID: <450a6b67-a896-7324-cb68-4611d110e0e6@citrix.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAA3DA02000078001FB5CB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fay+=ny=citrix.com=prvs=848d83c09=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gMWED-00059q-8u
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:47:29 +0000
In-Reply-To: <5BEAA3DA02000078001FB5CB@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMTEvMTggMTA6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCAzYmRlYzUzMGE1
ICgieDg2L0hWTTogc3BsaXQgcGFnZSBzdHJhZGRsaW5nIGVtdWxhdGVkIGFjY2Vzc2VzIGluCj4g
bW9yZSBjYXNlcyIpIGludHJvZHVjZWQgYSBodm1fY29weV90b19ndWVzdF9saW5lYXIoKSBhdHRl
bXB0IGJlZm9yZQo+IGZhbGxpbmcgYmFjayB0byBodm1lbXVsX2xpbmVhcl9tbWlvX3dyaXRlKCku
IFRoaXMgaXMgd3JvbmcgZm9yIHRoZQo+IHAybV9pb3JlcV9zZXJ2ZXIgc3BlY2lhbCBjYXNlLiBU
aGF0IGNoYW5nZSB3aWRlbmVkIGEgcHJlLWV4aXN0aW5nIGlzc3VlCj4gdGhvdWdoOiBPdGhlciB3
cml0ZXMgdG8gc3VjaCBwYWdlcyBhbHNvIG5lZWQgdG8gYmUgZmFpbGVkIChvciBmb3JjZWQKPiB0
aHJvdWdoIGVtdWxhdGlvbiksIGluIHBhcnRpY3VsYXIgaHlwZXJjYWxsIGJ1ZmZlciB3cml0ZXMu
Cj4KPiBSZXBvcnRlZC1ieTogPz8/IDw/Pz9AY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZt
L2h2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+IEBAIC0zMjAyLDYgKzMyMDIs
MTIgQEAgc3RhdGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBfX2h2bQo+ICAgICAgICAg
IGlmICggcmVzICE9IEhWTVRSQU5TX29rYXkgKQo+ICAgICAgICAgICAgICByZXR1cm4gcmVzOwo+
ICAKPiArICAgICAgICBpZiAoIChmbGFncyAmIEhWTUNPUFlfdG9fZ3Vlc3QpICYmIHAybXQgPT0g
cDJtX2lvcmVxX3NlcnZlciApCgpXaGlsZSB0aGlzIGRvZXMgYWRkcmVzcyB0aGUgaXNzdWUsIEkn
bSBjb25jZXJuZWQgYWJvdXQgaGFyZGNvZGluZyB0aGUKYmVoYXZpb3VyIGhlcmUuCgpwMm1faW9y
ZXFfc2VydmVyIGRvZXNuJ3QgbWVhbiAiSSB3YW50IHNoYWRvd2luZyBwcm9wZXJ0aWVzIi4gSXQg
aGFzIGFuCmFzLXlldCB1bnNwZWNpZmllZCBwZXItaW9yZXEtY2xpZW50IG1lYW5pbmcuCgpXZSBl
aXRoZXIgd2FudCB0byByZW5hbWUgcDJtX2lvcmVxX3NlcnZlciB0byBzb21ldGhpbmcgd2hpY2gg
aW5kaWNhdGVzCml0cyAiYWxsb3ctcmVhZHMvZW11bGF0ZSB3cml0ZXMiIGJlaGF2aW91ciwgb3Ig
ZGVzaWduIGEgd2F5IGZvciB0aGUKaW9yZXEgY2xpZW50IHRvIHNwZWNpZnkgdGhlIGJlaGF2aW91
ciBpdCB3YW50cy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
