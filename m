From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 4/4] x86/IRQ: ACKTYPE_NONE cannot make it
 into irq_guest_eoi_timer_fn()
Date: Thu, 16 May 2019 15:52:08 +0200
Message-ID: <20190516135208.h4njprgd477gfww2@Air-de-Roger>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2D010020000780022CCCC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wixq=TQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hRGnz-0001kS-1N
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:52:19 +0000
Content-Disposition: inline
In-Reply-To: <5CD2D010020000780022CCCC@prv1-mh.provo.novell.com>
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

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDY6NDg6MTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gYWN0aW9uLT5hY2tfdHlwZSBpcyBzZXQgb25jZSBiZWZvcmUgdGhlIHRpbWVyIGV2ZW4g
Z2V0cyBpbml0aWFsaXplZCwgYW5kCj4gaXMgbmV2ZXIgY2hhbmdlZCBsYXRlci4gVGhlIHRpbWVy
IGdldHMgYWN0aXZhdGVkIG9ubHkgZm9yIEVPSSBhbmQgVU5NQVNLCj4gdHlwZXMuIEhlbmNlIHRo
ZXJlJ3Mgbm8gbmVlZCB0byBoYXZlIGEgcmVzcGVjdGl2ZSBpZigpIGluIHRoZXJlLiBSZXBsYWNl
Cj4gaXQgYnkgYW4gQVNTRVJUKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgoKSnVzdCBvbmUgY29tbWVudCBiZWxvdyB3aGljaCBJJ20gbm90IG92ZXJs
eSBmdXNzZWQgYWJvdXQuCgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9pcnEuYwo+IEBAIC0xMTAzLDcgKzExMDMsNyBAQCBzdGF0aWMgdm9pZCBzZXRf
ZW9pX3JlYWR5KHZvaWQgKmRhdGEpOwo+ICBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3RfZW9pX3RpbWVy
X2ZuKHZvaWQgKmRhdGEpCj4gIHsKPiAgICAgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYyA9IGRhdGE7
Cj4gLSAgICB1bnNpZ25lZCBpbnQgaXJxID0gZGVzYyAtIGlycV9kZXNjOwo+ICsgICAgdW5zaWdu
ZWQgaW50IGksIGlycSA9IGRlc2MgLSBpcnFfZGVzYzsKPiAgICAgIGlycV9ndWVzdF9hY3Rpb25f
dCAqYWN0aW9uOwo+ICAgICAgY3B1bWFza190IGNwdV9lb2lfbWFwOwo+ICAKPiBAQCAtMTExNCwx
OSArMTExNCwxOCBAQCBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuKHZvaWQKPiAg
Cj4gICAgICBhY3Rpb24gPSAoaXJxX2d1ZXN0X2FjdGlvbl90ICopZGVzYy0+YWN0aW9uOwo+ICAK
PiArICAgIEFTU0VSVChhY3Rpb24tPmFja190eXBlICE9IEFDS1RZUEVfTk9ORSk7Cj4gKwo+ICAg
ICAgaWYgKCAhYWN0aW9uLT5pbl9mbGlnaHQgfHwgdGltZXJfaXNfYWN0aXZlKCZhY3Rpb24tPmVv
aV90aW1lcikgKQo+ICAgICAgICAgIGdvdG8gb3V0Owo+ICAKPiAtICAgIGlmICggYWN0aW9uLT5h
Y2tfdHlwZSAhPSBBQ0tUWVBFX05PTkUgKQo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBhY3Rpb24t
Pm5yX2d1ZXN0czsgaSsrICkKPiAgICAgIHsKPiAtICAgICAgICB1bnNpZ25lZCBpbnQgaTsKPiAt
ICAgICAgICBmb3IgKCBpID0gMDsgaSA8IGFjdGlvbi0+bnJfZ3Vlc3RzOyBpKysgKQo+IC0gICAg
ICAgIHsKPiAtICAgICAgICAgICAgc3RydWN0IGRvbWFpbiAqZCA9IGFjdGlvbi0+Z3Vlc3RbaV07
CgpJIHRoaW5rIHlvdSBjb3VsZCBjb25zdGlmeSBkIGhlcmUuCgpUaGFua3MuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
