From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/6] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Thu, 8 Mar 2018 12:59:14 +0100
Message-ID: <3430d1f9-cb70-25fc-26a1-8ec1a5cc0f38@suse.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-2-jgross@suse.com>
 <5A9D81DC02000078001AEB68@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=4t3w=f6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1etuCb-0007rz-TU
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 11:59:17 +0000
In-Reply-To: <5A9D81DC02000078001AEB68@prv-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMTggMTc6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjAzLjE4IGF0
IDA5OjEzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L21t
LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPj4gQEAgLTUwOSw2ICs1MDksOCBAQCB2b2lk
IG1ha2VfY3IzKHN0cnVjdCB2Y3B1ICp2LCBtZm5fdCBtZm4pCj4+ICAKPj4gIHZvaWQgd3JpdGVf
cHRiYXNlKHN0cnVjdCB2Y3B1ICp2KQo+PiAgewo+PiArICAgIGdldF9jcHVfaW5mbygpLT5yb290
X3BndF9jaGFuZ2VkID0gdGhpc19jcHUocm9vdF9wZ3QpICYmIGlzX3B2X3ZjcHUodikgJiYKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFpc19wdl8zMmJpdF92Y3B1
KHYpOwo+IAo+IFdoeSBpc19wdl92Y3B1KCkgd2hlbiB5b3UgYWxyZWFkeSBjaGVjayBpc19wdl8z
MmJpdF92Y3B1KCk/Cj4gCj4+IEBAIC0zNzA0LDE4ICszNzA2LDIyIEBAIGxvbmcgZG9fbW11X3Vw
ZGF0ZSgKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAgICAgICAgICAgICAg
ICAgICAgICByYyA9IG1vZF9sNF9lbnRyeSh2YSwgbDRlX2Zyb21faW50cHRlKHJlcS52YWwpLCBt
Zm4sCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNtZCA9PSBNTVVf
UFRfVVBEQVRFX1BSRVNFUlZFX0FELCB2KTsKPj4gLSAgICAgICAgICAgICAgICAgICAgLyoKPj4g
LSAgICAgICAgICAgICAgICAgICAgICogTm8gbmVlZCB0byBzeW5jIGlmIGFsbCB1c2VzIG9mIHRo
ZSBwYWdlIGNhbiBiZSBhY2NvdW50ZWQKPj4gLSAgICAgICAgICAgICAgICAgICAgICogdG8gdGhl
IHBhZ2UgbG9jayB3ZSBob2xkLCBpdHMgcGlubmVkIHN0YXR1cywgYW5kIHVzZXMgb24KPj4gLSAg
ICAgICAgICAgICAgICAgICAgICogdGhpcyAodilDUFUuCj4+IC0gICAgICAgICAgICAgICAgICAg
ICAqLwo+PiAtICAgICAgICAgICAgICAgICAgICBpZiAoICFyYyAmJiAhY3B1X2hhc19ub194cHRp
ICYmCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgKChwYWdlLT51LmludXNlLnR5cGVfaW5m
byAmIFBHVF9jb3VudF9tYXNrKSA+Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICgxICsg
ISEocGFnZS0+dS5pbnVzZS50eXBlX2luZm8gJiBQR1RfcGlubmVkKSArCj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAocGFnZXRhYmxlX2dldF9wZm4oY3Vyci0+YXJjaC5ndWVzdF90YWJs
ZSkgPT0gbWZuKSAKPj4gKwo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgKHBhZ2V0YWJs
ZV9nZXRfcGZuKGN1cnItPmFyY2guZ3Vlc3RfdGFibGVfdXNlcikgPT0KPj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBtZm4pKSkgKQoKSXMgaXQgcmVhbGx5IHBvc3NpYmxlIHRoaXMgY29k
ZSBpcyBydW5uaW5nIHdpdGggdGhlIHVzZXIgcGFnZSB0YWJsZQpiZWluZyBhY3RpdmUgb24gdGhl
IGN1cnJlbnQgY3B1PyBJIHRoaW5rIHRoaXMgdGVzdCBjYW4gYmUgZHJvcHBlZC4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
