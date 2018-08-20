From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/mm: re-arrange get_page_from_l<N>e() vs
 pv_l1tf_check_l<N>e
Date: Mon, 20 Aug 2018 10:59:36 +0100
Message-ID: <20180820095936.agibjjgo2qswfmwz@citrix.com>
References: <5B766E5702000078001DF307@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qa+b=ld=citrix.com=prvs=763aa43e8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1frgyK-00060i-Ao
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 09:59:40 +0000
Content-Disposition: inline
In-Reply-To: <5B766E5702000078001DF307@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMTI6NDI6MzFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUmVzdG9yZSBzeW1tZXRyeSBiZXR3ZWVuIGdldF9wYWdlX2Zyb21fbDxOPmUoKTogcHZf
bDF0Zl9jaGVja19sPE4+ZSBpcwo+IHVuaWZvcm1seSBpbnZva2VkIGZyb20gb3V0c2lkZSBvZiB0
aGVtLiBUaGV5J3JlIG5vIGxvbmdlciBnZXR0aW5nIGNhbGxlZAo+IGZvciBub24tcHJlc2VudCBQ
VEVzLiBUaGlzIHdheSB0aGUgc2xpZ2h0bHkgb2RkIHRocmVlLXdheSByZXR1cm4gdmFsdWUKPiBt
ZWFuaW5nIG9mIHRoZSBoaWdoZXIgbGV2ZWwgb25lcyBjYW4gYWxzbyBiZSBnb3QgcmlkIG9mLgo+
IAo+IEludHJvZHVjZSBsb2NhbCB2YXJpYWJsZXMgaG9sZGluZyB0aGUgcGFnZSB0YWJsZSBlbnRy
aWVzIHByb2Nlc3NlZCwgYW5kCj4gdXNlIHRoZW0gdGhyb3VnaG91dCB0aGUgbG9vcCBib2RpZXMg
aW5zdGVhZCBvZiByZS1yZWFkaW5nIHRoZW0gZnJvbSB0aGUKPiBwYWdlIHRhYmxlIHNldmVyYWwg
dGltZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMK
PiBAQCAtOTAwLDggKzkwMCwxMSBAQCBnZXRfcGFnZV9mcm9tX2wxZSgKPiAgICAgIHN0cnVjdCBk
b21haW4gKnJlYWxfcGdfb3duZXI7Cj4gICAgICBib29sIHdyaXRlOwo+ICAKPiAtICAgIGlmICgg
IShsMWYgJiBfUEFHRV9QUkVTRU5UKSApCj4gKyAgICBpZiAoIHVubGlrZWx5KCEobDFmICYgX1BB
R0VfUFJFU0VOVCkpICkKPiArICAgIHsKPiArICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsK
PiAgICAgICAgICByZXR1cm4gMDsKPiArICAgIH0KCldoeSBpcyB0aGlzIG5lZWRlZCBoZXJlPyBB
Y2NvcmRpbmcgdG8gY29tbWl0IG1lc3NhZ2UgZ2V0X3BhZ2VfZnJvbV9sMWUKc2hvdWxkbid0IGJl
IGNhbGxlZCB3aXRoIG5vbi1wcmVzZW50IGwxZS4KCkdvaW5nIHRocm91Z2ggdGhlIGNvZGUsIGJv
dGggb2YgdGhlIHNoYWRvdyBwYXRoIGFuZCAocG9zdC1tb2RpZmljYXRpb24pCnB2IG1tIHBhdGgg
d29uJ3QgY2FsbCBnZXRfcGFnZV9mcm9tX2wxZSB3aXRoIG5vbi1wcmVzZW50IGwxZSBBRkFJQ1Qu
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
