From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [goto-label v2] memory: fix label syntax
Date: Tue, 31 Jul 2018 03:27:03 -0600
Message-ID: <5B602B6702000078001D9521@prv1-mh.provo.novell.com>
References: <5B60210E02000078001D9489@prv1-mh.provo.novell.com>
 <1533027369-16597-1-git-send-email-nmanthey@amazon.de>
 <5B601EC50200002B04CC06FC@prv1-mh.provo.novell.com>
 <5B60210E02000078001D9489@prv1-mh.provo.novell.com>
 <5B60243D0200005904CC0BD5@prv1-mh.provo.novell.com>
 <5B60297B02000078001D9505@prv1-mh.provo.novell.com>
 <20180731092407.kspimrsqq2wplf5m@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3hbq=kp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fkQvs-0001UM-Uc
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 09:27:08 +0000
In-Reply-To: <20180731092407.kspimrsqq2wplf5m@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Elizabeth Polgreen <polgreen@amazon.de>, nmanthey@amazon.de, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA3LjE4IGF0IDExOjI0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDM6MTg6NTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAzMS4wNy4xOCBhdCAxMDo1NiwgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3Jv
dGU6Cj4+ID4gV2hlbiBjb21waWxpbmcgdGhpcyBmaWxlIHdpdGggZ2NjLCB0aGUgY29tcGlsZXIg
aGFwcGlseSBhY2NlcHRzIHRoZQo+PiA+IHNlcXVlbmNlIG9mIGEgbGFiZWwgZm9sbG93ZWQgYnkg
YW4gYXR0cmlidXRlLiBIb3dldmVyLCB0aGlzIHNlcXVlbmNlIGRvZXMKPj4gPiBub3QgZm9sbG93
IHRoZSBnY2MgZG9jdW1lbnRhdGlvbi4gSGVuY2UsIG90aGVyIGNvbXBpbGVycyBtaWdodCBzdHVt
YmxlCj4+ID4gdXBvbiB0aGlzIHN0YXRlbWVudC4KPj4gPiAKPj4gPiBUbyBiZSBhYmxlIHRvIGNv
bXBpbGUgWGVuIHdpdGggZ290by1jYyAodGhlIGNvbXBpbGVyIG9mIHRoZSBDUFJPVkVSIHRvb2wK
Pj4gPiBzdWl0ZSksIHRoZSBtaXNzaW5nIHNlbWljb2xvbiBpcyBhZGRlZCBpbiB0aGlzIGNvbW1p
dC4KPj4gPiAKPj4gPiBSZXBvcnRlZC1ieTogRWxpemFiZXRoIFBvbGdyZWVuIDxwb2xncmVlbkBh
bWF6b24uZGU+Cj4+ID4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBh
bWF6b24uZGU+Cj4+IAo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+PiAKPj4gQnR3IC0geW91IHN0aWxsIGRpZG4ndCBDYyBhbGwgcmVsZXZhbnQgbWFpbnRh
aW5lcnMsIGJ1dCBJJ20gc3VyZSBubyBvbmUKPj4gb2YgdGhlbSB3b3VsZCBvYmplY3QgdG8gYSBj
aGFuZ2UgbGlrZSB0aGlzLgo+IAo+IFN0cmFuZ2VseSB0aGlzIHBhdGNoIG5ldmVyIHNob3dlZCB1
cCBpbiBteSBpbmJveCBvciB4ZW4tZGV2ZWwgYXJjaGl2ZS4KPiAKPiBOb3JiZXJ0LCBJIHdvbmRl
ciBpZiB0aGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2l0aCB5b3VyIGVtYWlsIHNldHRpbmc/CgpQ
ZXJoYXBzIGl0J3Mgc3RpbGwgaW4gbW9kZXJhdGlvbj8KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
