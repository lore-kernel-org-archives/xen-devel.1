From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v6 3/9] x86/hvm: block
 speculative out-of-bound accesses
Date: Tue, 12 Feb 2019 06:25:52 -0700
Message-ID: <5C62C9600200007800215EA7@prv1-mh.provo.novell.com>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-4-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CE6AAF02000039B1E090C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtY4T-0000Pn-Ko
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 13:25:57 +0000
In-Reply-To: <01CE6AAF02000039B1E090C7@prv1-mh.provo.novell.com>
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

Pj4+IE9uIDA4LjAyLjE5IGF0IDE0OjQ0LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBA
QCAtMzQ1Myw3ICszNDU2LDggQEAgaW50IGh2bV9tc3JfcmVhZF9pbnRlcmNlcHQodW5zaWduZWQg
aW50IG1zciwgdWludDY0X3QgKm1zcl9jb250ZW50KQo+ICAgICAgICAgIGlmICggKGluZGV4IC8g
MikgPj0KPiAgICAgICAgICAgICAgIE1BU0tfRVhUUih2LT5hcmNoLmh2bS5tdHJyLm10cnJfY2Fw
LCBNVFJSY2FwX1ZDTlQpICkKPiAgICAgICAgICAgICAgZ290byBncF9mYXVsdDsKPiAtICAgICAg
ICAqbXNyX2NvbnRlbnQgPSB2YXJfcmFuZ2VfYmFzZVtpbmRleF07Cj4gKyAgICAgICAgKm1zcl9j
b250ZW50ID0gdmFyX3JhbmdlX2Jhc2VbYXJyYXlfaW5kZXhfbm9zcGVjKGluZGV4LAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAyKk1BU0tfRVhUUih2LT5hcmNoLmh2bS5tdHJyLm10cnJfY2Fw
LCBNVFJSY2FwX1ZDTlQpKV07CgpNaXNzaW5nIGJsYW5rcyBhcm91bmQgKi4gVGhpcyBhbG9uZSB3
b3VsZCBiZSBlYXN5IHRvIGFkanVzdCB3aGlsZQpjb21taXR0aW5nLCBidXQgdGhlcmUncyBzdGls
bCB0aGUgb25seSBwYXJ0aWFsbHkgZGlzY3Vzc2VkIHF1ZXN0aW9uCnJlZ2FyZGluZyAuLi4KCj4g
QEAgLTQxMDQsNiArNDEwOCwxMiBAQCBzdGF0aWMgaW50IGh2bW9wX3NldF9wYXJhbSgKPiAgICAg
IGlmICggYS5pbmRleCA+PSBIVk1fTlJfUEFSQU1TICkKPiAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiAgCj4gKyAgICAvKgo+ICsgICAgICogTWFrZSBzdXJlIHRoZSBndWVzdCBjb250cm9sbGVk
IHZhbHVlIGEuaW5kZXggaXMgYm91bmRlZCBldmVuIGR1cmluZwo+ICsgICAgICogc3BlY3VsYXRp
dmUgZXhlY3V0aW9uLgo+ICsgICAgICovCj4gKyAgICBhLmluZGV4ID0gYXJyYXlfaW5kZXhfbm9z
cGVjKGEuaW5kZXgsIEhWTV9OUl9QQVJBTVMpOwo+ICsKPiAgICAgIGQgPSByY3VfbG9ja19kb21h
aW5fYnlfYW55X2lkKGEuZG9taWQpOwo+ICAgICAgaWYgKCBkID09IE5VTEwgKQo+ICAgICAgICAg
IHJldHVybiAtRVNSQ0g7Cj4gQEAgLTQzNzAsNiArNDM4MCwxMiBAQCBzdGF0aWMgaW50IGh2bW9w
X2dldF9wYXJhbSgKPiAgICAgIGlmICggYS5pbmRleCA+PSBIVk1fTlJfUEFSQU1TICkKPiAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPiAgCj4gKyAgICAvKgo+ICsgICAgICogTWFrZSBzdXJlIHRo
ZSBndWVzdCBjb250cm9sbGVkIHZhbHVlIGEuaW5kZXggaXMgYm91bmRlZCBldmVuIGR1cmluZwo+
ICsgICAgICogc3BlY3VsYXRpdmUgZXhlY3V0aW9uLgo+ICsgICAgICovCj4gKyAgICBhLmluZGV4
ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGEuaW5kZXgsIEhWTV9OUl9QQVJBTVMpOwoKLi4uIHRoZSB1
c2VmdWxuZXNzIG9mIHRoZXNlIHR3by4gVG8gbWFrZSBmb3J3YXJkIHByb2dyZXNzIGl0IG1heQpi
ZSB3b3J0aHdoaWxlIHRvIHNwbGl0IG9mZiB0aGVzZSB0d28gY2hhbmdlcyBpbnRvIGEgc2VwYXJh
dGUgcGF0Y2guCklmIHlvdSdyZSBmaW5lIHdpdGggdGhpcywgSSBjb3VsZCBzdHJpcCB0aGVzZSB0
d28gYmVmb3JlIGNvbW1pdHRpbmcsCmluIHdoaWNoIGNhc2UgdGhlIHJlbWFpbmluZyBjaGFuZ2Ug
aXMKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
