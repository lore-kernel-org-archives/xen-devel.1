From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
Date: Tue, 30 Apr 2019 02:28:46 -0600
Message-ID: <CABfawhnjK-6KtLQx_bKngHg6+nHdjEMDYoSGErOGL5581JyZHw@mail.gmail.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
 <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9xZw=TA=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLO8m-0008Cm-KF
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 08:29:28 +0000
Received: by mail-wm1-f41.google.com with SMTP id y197so2852979wmd.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2019 01:29:23 -0700 (PDT)
In-Reply-To: <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMToxNSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI5LjA0LjE5IGF0IDE4OjM1LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBNb24sIEFwciAyOSwgMjAxOSBhdCA5OjE4IEFNIEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4gPj4+IE9uIDI2LjA0LjE5IGF0
IDE5OjIxLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4gPj4gPiAtLS0gYS94ZW4vYXJj
aC94ODYvbW0uYwo+ID4+ID4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiA+PiA+IEBAIC0yMDMw
LDEyICsyMDMwLDExIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBjdXJyZW50X2xvY2tlZF9wYWdlX25l
X2NoZWNrKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpIHsKPiA+PiA+ICAjZGVmaW5lIGN1cnJlbnRf
bG9ja2VkX3BhZ2VfbmVfY2hlY2soeCkgdHJ1ZQo+ID4+ID4gICNlbmRpZgo+ID4+ID4KPiA+PiA+
IC1pbnQgcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCj4gPj4gPiArI2lmIGRlZmlu
ZWQoQ09ORklHX1BWKSB8fCBkZWZpbmVkKENPTkZJR19IQVNfTUVNX1NIQVJJTkcpCj4gPj4gPiAr
c3RhdGljIGludCBfcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCj4gPj4KPiA+PiBB
cyBwZXIgYWJvdmUsIHBlcnNvbmFsbHkgSSdtIGFnYWluc3QgaW50cm9kdWNpbmcKPiA+PiBwYWdl
X3ssdW59bG9ja19tZW1zaHIoKSwgYXMgdGhhdCBtYWtlcyB0aGUgYWJ1c2UgZXZlbiBtb3JlCj4g
Pj4gbG9vayBsaWtlIHByb3BlciB1c2UuIEJ1dCBpZiB0aGlzIHdhcyB0byBiZSBrZXB0IHRoaXMg
d2F5LCBtYXkgSQo+ID4+IGFzayB0aGF0IHlvdSBzd2l0Y2ggaW50IC0+IGJvb2wgaW4gdGhlIHJl
dHVybiB0eXBlcyBhdCB0aGlzIG9jY2FzaW9uPwo+ID4KPiA+IFN3aXRjaGluZyB0aGVtIHRvIGJv
b2wgd291bGQgYmUgZmluZS4gUmVwbGFjaW5nIHRoZW0gd2l0aCBzb21ldGhpbmcKPiA+IHNhbmVy
IGlzIHVuZm9ydHVuYXRlbHkgb3V0LW9mLXNjb3BlIGF0IHRoZSBtb21lbnQuIFVubGVzcyBzb21l
b25lIGhhcwo+ID4gYSBzcGVjaWZpYyBzb2x1dGlvbiB0aGF0IGNhbiBiZSBwdXQgaW4gcGxhY2Uu
IEkgZG9uJ3QgaGF2ZSBvbmUuCj4KPiBJJ3ZlIG91dGxpbmVkIGEgc29sdXRpb24gYWxyZWFkeTog
TWFrZSBhIG1lbS1zaGFyaW5nIHByaXZhdGUgdmFyaWFudAo+IG9mIHBhZ2Vfeyx1bn1sb2NrKCks
IGRlcml2ZWQgZnJvbSB0aGUgUFYgb25lcyAoYnV0IHdpdGggcGllY2VzCj4gZHJvcHBlZCB5b3Ug
ZG9uJ3Qgd2FudC9uZWVkKS4KCldlbGwsIHRoYXQncyB3aGF0IEkgYWxyZWFkeSBkaWQgaGVyZSBp
biB0aGlzIHBhdGNoLiBObz8KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
