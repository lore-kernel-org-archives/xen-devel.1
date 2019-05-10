From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 03/14] xen/x86: Make mfn_to_gfn typesafe
Date: Fri, 10 May 2019 07:24:08 -0600
Message-ID: <5CD57B78020000780022D888@prv1-mh.provo.novell.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-4-julien.grall@arm.com>
 <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
 <4cef7816-74da-b6e6-6f7d-e327edb083da@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP5VS-0003Bw-Aq
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:24:10 +0000
In-Reply-To: <4cef7816-74da-b6e6-6f7d-e327edb083da@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA1LjE5IGF0IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgoK
PiAKPiBPbiAxMC8wNS8yMDE5IDEyOjM1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDcu
MDUuMTkgYXQgMTc6MTQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiAtLS0gYS94
ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0v
c2hhZG93L2NvbW1vbi5jCj4+PiBAQCAtNDc0LDcgKzQ3NCw4IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCB0cmFjZV9yZXN5bmMoaW50IGV2ZW50LCBtZm5fdCBnbWZuKQo+Pj4gICAgICAgaWYgKCB0Yl9p
bml0X2RvbmUgKQo+Pj4gICAgICAgewo+Pj4gICAgICAgICAgIC8qIENvbnZlcnQgZ21mbiB0byBn
Zm4gKi8KPj4+IC0gICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuID0gbWZuX3RvX2dmbihjdXJyZW50
LT5kb21haW4sIGdtZm4pOwo+Pj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBnZm4gPSBnZm5feCht
Zm5fdG9fZ2ZuKGN1cnJlbnQtPmRvbWFpbiwgZ21mbikpOwo+Pj4gKwo+Pj4gICAgICAgICAgIF9f
dHJhY2VfdmFyKGV2ZW50LCAwLyohdHNjKi8sIHNpemVvZihnZm4pLCAmZ2ZuKTsKPj4+ICAgICAg
IH0KPj4gCj4+IENhbid0IHlvdSB1c2UgZ2ZuX3QgaGVyZSwgYW5kIGhlbmNlIGF2b2lkIHRoZSBn
Zm5feCgpPyBTYW1lIGFnYWluIGZ1cnRoZXIKPj4gZG93bi4KPiBCZWNhdXNlIF9fdHJhY2VfdmFy
IHdpbGwgZXhwb3J0IHRoZSB2YWx1ZSB0byB0aGUgZ3Vlc3QuIEkgd2Fzbid0IHN1cmUgCj4gd2hl
dGhlciB3ZSAKPiBjYW4gc2FmZWx5IGNvbnNpZGVyIHRoYXQgZ2ZuX3QgaXMgZXhhY3RseSB0aGUg
c2FtZSBhcyB1bnNpZ25lZCBsb25nIGluIAo+IGRlYnVnLWJ1aWxkLgoKSG1tLCB3ZWxsIC0gc2Vl
IHRoZSBkZWZpbml0aW9uIG9mIGdmbl90LiBHZW9yZ2UsIHdoYXQgZG8geW91IHRoaW5rPwoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
