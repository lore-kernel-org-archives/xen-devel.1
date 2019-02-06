From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v5 9/9] common/memory: block
 speculative out-of-bound accesses
Date: Wed, 06 Feb 2019 08:25:35 -0700
Message-ID: <5C5AFC6F020000780021459B@prv1-mh.provo.novell.com>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-10-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <20F3469E02000096B1E090C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grP56-0004N1-Ty
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 15:25:44 +0000
In-Reply-To: <20F3469E02000096B1E090C7@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAxLjE5IGF0IDE1OjQzLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBA
QCAtMzMsMTAgKzM0LDEwIEBAIHVuc2lnbmVkIGxvbmcgX19yZWFkX21vc3RseSBwZHhfZ3JvdXBf
dmFsaWRbQklUU19UT19MT05HUygKPiAgCj4gIGJvb2wgX19tZm5fdmFsaWQodW5zaWduZWQgbG9u
ZyBtZm4pCj4gIHsKPiAtICAgIHJldHVybiBsaWtlbHkobWZuIDwgbWF4X3BhZ2UpICYmCj4gLSAg
ICAgICAgICAgbGlrZWx5KCEobWZuICYgcGZuX2hvbGVfbWFzaykpICYmCj4gLSAgICAgICAgICAg
bGlrZWx5KHRlc3RfYml0KHBmbl90b19wZHgobWZuKSAvIFBEWF9HUk9VUF9DT1VOVCwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGR4X2dyb3VwX3ZhbGlkKSk7Cj4gKyAgICByZXR1cm4g
ZXZhbHVhdGVfbm9zcGVjKGxpa2VseShtZm4gPCBtYXhfcGFnZSkgJiYKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbGlrZWx5KCEobWZuICYgcGZuX2hvbGVfbWFzaykpICYmCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxpa2VseSh0ZXN0X2JpdChwZm5fdG9fcGR4KG1mbikgLyBQ
RFhfR1JPVVBfQ09VTlQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwZHhfZ3JvdXBfdmFsaWQpKSk7CgpPdGhlciB0aGFuIGluIHRoZSBxdWVzdGlvbmFibGUg
Z3JhbnQgdGFibGUgY2FzZSwgaGVyZSBJIGFncmVlIHRoYXQKeW91IHdhbnQgdG8gd3JhcCB0aGUg
ZW50aXJlIGNvbnN0cnVjdC4gVGhpcyBoYXMgYW4gdW53YW50ZWQgZWZmZWN0CnRob3VnaDogVGhl
IHRlc3RfYml0KCkgbWF5IHN0aWxsIGJlIHNwZWN1bGF0ZWQgaW50byB3aXRoIGFuIG91dC1vZi0K
Ym91bmRzIG1mbi4gKEFzIG1lbnRpb25lZCBlbHNld2hlcmUsIG9wZXJhdGlvbnMgb24gYml0IGFy
cmF5cyBhcmUKYW4gb3BlbiBpc3N1ZSBhbHRvZ2V0aGVyLikgSSB0aGVyZWZvcmUgdGhpbmsgeW91
IHdhbnQgdG8gc3BsaXQgdGhpcyBpbnRvCnR3bzoKCmJvb2wgX19tZm5fdmFsaWQodW5zaWduZWQg
bG9uZyBtZm4pCnsKICAgIHJldHVybiBsaWtlbHkoZXZhbHVhdGVfbm9zcGVjKG1mbiA8IG1heF9w
YWdlKSkgJiYKICAgICAgICAgICBldmFsdWF0ZV9ub3NwZWMobGlrZWx5KCEobWZuICYgcGZuX2hv
bGVfbWFzaykpICYmCiAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpa2VseSh0ZXN0X2JpdChw
Zm5fdG9fcGR4KG1mbikgLyBQRFhfR1JPVVBfQ09VTlQsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwZHhfZ3JvdXBfdmFsaWQpKSk7Cn0KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
