From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v6 5/9] nospec: introduce
 evaluate_nospec
Date: Thu, 14 Feb 2019 14:42:45 +0100
Message-ID: <49f80999-a034-1342-9a79-ae9a88a4bd43@amazon.de>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-6-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CFEAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <5C62D4380200007800215F53@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSEH=QV=amazon.de=prvs=9419de174=nmanthey@srs-us1.protection.inumbo.net>)
 id 1guHI7-0006mS-2a
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 13:43:03 +0000
In-Reply-To: <5C62D4380200007800215F53@prv1-mh.provo.novell.com>
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

T24gMi8xMi8xOSAxNToxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDIuMTkgYXQg
MTQ6NDQsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiAtLS0gL2Rldi9udWxsCj4+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbm9zcGVjLmgKPj4gQEAgLTAsMCArMSwzOSBAQAo+PiAr
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4gKy8qIENvcHlyaWdodCAy
MDE4IEFtYXpvbi5jb20sIEluYy4gb3IgaXRzIGFmZmlsaWF0ZXMuIEFsbCBSaWdodHMgUmVzZXJ2
ZWQuIAo+PiAqLwo+PiArCj4+ICsjaWZuZGVmIF9BU01fWDg2X05PU1BFQ19ICj4+ICsjZGVmaW5l
IF9BU01fWDg2X05PU1BFQ19ICj4+ICsKPj4gKyNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4K
Pj4gKyNpbmNsdWRlIDxhc20vc3lzdGVtLmg+Cj4gSXNuJ3QgdGhlIGxhdHRlciB1bm5lY2Vzc2Fy
eSBub3c/IFlvdSBkb24ndCB1c2UgYW55ICptYigpIGNvbnN0cnVjdAo+IGFueW1vcmUuCgpUcnVl
LCBJIGRlbGV0ZWQgdGhpcyBpbmNsdWRlLgoKQmVzdCwKTm9yYmVydAoKPgo+IEphbgo+Cj4KCgoK
QW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAx
MTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhl
cmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQg
Q2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
