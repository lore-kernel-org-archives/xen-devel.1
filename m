From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v6 1/9] xen/evtchn: block
 speculative out-of-bound accesses
Date: Thu, 14 Feb 2019 06:20:43 -0700
Message-ID: <5C656B2B0200007800216B55@prv1-mh.provo.novell.com>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-2-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CCEAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <5C62C5640200007800215E66@prv1-mh.provo.novell.com>
 <7fc2567a-03f8-2175-ae0e-b1e453bbe069@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guGwY-0004nQ-It
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 13:20:46 +0000
In-Reply-To: <7fc2567a-03f8-2175-ae0e-b1e453bbe069@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAyLjE5IGF0IDE0OjEwLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAyLzEyLzE5IDE0OjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDguMDIuMTkgYXQg
MTQ6NDQsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+Pj4gQEAgLTk1NSwyMiArOTY3LDIy
IEBAIGxvbmcgZXZ0Y2huX2JpbmRfdmNwdSh1bnNpZ25lZCBpbnQgcG9ydCwgdW5zaWduZWQgaW50
IHZjcHVfaWQpCj4+PiAgICAgIHsKPj4+ICAgICAgY2FzZSBFQ1NfVklSUToKPj4+ICAgICAgICAg
IGlmICggdmlycV9pc19nbG9iYWwoY2huLT51LnZpcnEpICkKPj4+IC0gICAgICAgICAgICBjaG4t
Pm5vdGlmeV92Y3B1X2lkID0gdmNwdV9pZDsKPj4+ICsgICAgICAgICAgICBjaG4tPm5vdGlmeV92
Y3B1X2lkID0gdi0+dmNwdV9pZDsKPj4+ICAgICAgICAgIGVsc2UKPj4+ICAgICAgICAgICAgICBy
YyA9IC1FSU5WQUw7Cj4+PiAgICAgICAgICBicmVhazsKPj4+ICAgICAgY2FzZSBFQ1NfVU5CT1VO
RDoKPj4+ICAgICAgY2FzZSBFQ1NfSU5URVJET01BSU46Cj4+PiAtICAgICAgICBjaG4tPm5vdGlm
eV92Y3B1X2lkID0gdmNwdV9pZDsKPj4+ICsgICAgICAgIGNobi0+bm90aWZ5X3ZjcHVfaWQgPSB2
LT52Y3B1X2lkOwo+Pj4gICAgICAgICAgYnJlYWs7Cj4+PiAgICAgIGNhc2UgRUNTX1BJUlE6Cj4+
PiAtICAgICAgICBpZiAoIGNobi0+bm90aWZ5X3ZjcHVfaWQgPT0gdmNwdV9pZCApCj4+PiArICAg
ICAgICBpZiAoIGNobi0+bm90aWZ5X3ZjcHVfaWQgPT0gdi0+dmNwdV9pZCApCj4+PiAgICAgICAg
ICAgICAgYnJlYWs7Cj4+PiAgICAgICAgICB1bmxpbmtfcGlycV9wb3J0KGNobiwgZC0+dmNwdVtj
aG4tPm5vdGlmeV92Y3B1X2lkXSk7Cj4+PiAtICAgICAgICBjaG4tPm5vdGlmeV92Y3B1X2lkID0g
dmNwdV9pZDsKPj4+ICsgICAgICAgIGNobi0+bm90aWZ5X3ZjcHVfaWQgPSB2LT52Y3B1X2lkOwo+
PiBSaWdodCBub3cgd2UgdW5kZXJzdGFuZCB3aHkgYWxsIG9mIHRoZXNlIGNoYW5nZXMgYXJlIGRv
bmUsIGJ1dAo+PiB3aXRob3V0IGEgY29tbWVudCB0aGlzIGlzIGxpYWJsZSB0byBiZSBjb252ZXJ0
ZWQgYmFjayBhcyBhbgo+PiBvcHRpbWl6YXRpb24gZG93biB0aGUgcm9hZC4KPiAKPiBJIHdpbGwg
ZXh0ZW5kIHRoZSBjb21taXQgbWVzc2FnZSBhY2NvcmRpbmdseS4KCkFjdHVhbGx5IHRoZSByZXF1
ZXN0IHdhcyBmb3IgYSBjb21tZW50IGFkZGl0aW9uLCBub3QgZm9yIGEgY29tbWl0Cm1lc3NhZ2Ug
YWRqdXN0bWVudC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
