From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v6 9/9] common/memory: block
 speculative out-of-bound accesses
Date: Thu, 14 Feb 2019 15:04:35 +0100
Message-ID: <bb477650-afca-2464-71d9-2090690066d4@amazon.de>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-10-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <23D9419E02000017B1E090C7@prv1-mh.provo.novell.com>
 <5C62D8CD0200007800215FA0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSEH=QV=amazon.de=prvs=9419de174=nmanthey@srs-us1.protection.inumbo.net>)
 id 1guHdI-0000Y6-Fi
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 14:04:56 +0000
In-Reply-To: <5C62D8CD0200007800215FA0@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xMi8xOSAxNTozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDIuMTkgYXQg
MTQ6NDQsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBAQCAtMzMsMTAgKzM0LDExIEBA
IHVuc2lnbmVkIGxvbmcgX19yZWFkX21vc3RseSBwZHhfZ3JvdXBfdmFsaWRbQklUU19UT19MT05H
UygKPj4gIAo+PiAgYm9vbCBfX21mbl92YWxpZCh1bnNpZ25lZCBsb25nIG1mbikKPj4gIHsKPj4g
LSAgICByZXR1cm4gbGlrZWx5KG1mbiA8IG1heF9wYWdlKSAmJgo+PiAtICAgICAgICAgICBsaWtl
bHkoIShtZm4gJiBwZm5faG9sZV9tYXNrKSkgJiYKPj4gLSAgICAgICAgICAgbGlrZWx5KHRlc3Rf
Yml0KHBmbl90b19wZHgobWZuKSAvIFBEWF9HUk9VUF9DT1VOVCwKPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBkeF9ncm91cF92YWxpZCkpOwo+PiArICAgIHJldHVybiBldmFsdWF0ZV9u
b3NwZWMoCj4+ICsgICAgICAgIGxpa2VseShtZm4gPCBtYXhfcGFnZSkgJiYKPj4gKyAgICAgICAg
bGlrZWx5KCEobWZuICYgcGZuX2hvbGVfbWFzaykpICYmCj4+ICsgICAgICAgIGxpa2VseSh0ZXN0
X2JpdChwZm5fdG9fcGR4KGFycmF5X2luZGV4X25vc3BlYyhtZm4sIG1heF9wYWdlKSkKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyBQRFhfR1JPVVBfQ09VTlQsIHBkeF9n
cm91cF92YWxpZCkpKTsKPj4gIH0KPiBIb3cgYWJvdXQgdGhpcyBpbnN0ZWFkOgo+Cj4gYm9vbCBf
X21mbl92YWxpZCh1bnNpZ25lZCBsb25nIG1mbikKPiB7Cj4gICAgIGlmICggdW5saWtlbHkoZXZh
bHVhdGVfbm9zcGVjKG1mbiA+PSBtYXhfcGFnZSkpICkKPiAgICAgICAgIHJldHVybiBmYWxzZTsK
PiAgICAgcmV0dXJuIGxpa2VseSghKG1mbiAmIHBmbl9ob2xlX21hc2spKSAmJgo+ICAgICAgICAg
ICAgbGlrZWx5KHRlc3RfYml0KHBmbl90b19wZHgobWZuKSAvIFBEWF9HUk9VUF9DT1VOVCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwZHhfZ3JvdXBfdmFsaWQpKTsKPiB9Cj4KPiBJbml0
aWFsbHkgSSByZWFsbHkganVzdCB3YW50ZWQgdG8gaW1wcm92ZSB0aGUgbGluZSB3cmFwcGluZyAo
YXQgdGhlCj4gdmVyeSBsZWFzdCB0aGUgLyB3YXMgbWlzcGxhY2VkKSwgYnV0IEkgdGhpbmsgdGhp
cyB2YXJpYW50IGd1YXJkcwo+IGFnYWluc3QgYWxsIHRoYXQncyBuZWVkZWQgd2l0aG91dCBldmVu
IGludHJvZHVjaW5nIHdyYXBwaW5nCj4gaGVhZGFjaGVzLgoKVGhhdCB3b3JrcyBhcyB3ZWxsLCBJ
IHdpbGwgYWRhcHQgdGhlIGNvbW1pdCBhY2NvcmRpbmdseS4KCkJlc3QsCk5vcmJlcnQKCj4KPiBK
YW4KPgo+CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5z
dHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdl
ciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFt
dHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
