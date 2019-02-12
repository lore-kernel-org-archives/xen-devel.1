From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v6 9/9] common/memory: block
 speculative out-of-bound accesses
Date: Tue, 12 Feb 2019 07:31:41 -0700
Message-ID: <5C62D8CD0200007800215FA0@prv1-mh.provo.novell.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtZ6B-0006oW-Ts
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 14:31:47 +0000
In-Reply-To: <23D9419E02000017B1E090C7@prv1-mh.provo.novell.com>
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
QCAtMzMsMTAgKzM0LDExIEBAIHVuc2lnbmVkIGxvbmcgX19yZWFkX21vc3RseSBwZHhfZ3JvdXBf
dmFsaWRbQklUU19UT19MT05HUygKPiAgCj4gIGJvb2wgX19tZm5fdmFsaWQodW5zaWduZWQgbG9u
ZyBtZm4pCj4gIHsKPiAtICAgIHJldHVybiBsaWtlbHkobWZuIDwgbWF4X3BhZ2UpICYmCj4gLSAg
ICAgICAgICAgbGlrZWx5KCEobWZuICYgcGZuX2hvbGVfbWFzaykpICYmCj4gLSAgICAgICAgICAg
bGlrZWx5KHRlc3RfYml0KHBmbl90b19wZHgobWZuKSAvIFBEWF9HUk9VUF9DT1VOVCwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGR4X2dyb3VwX3ZhbGlkKSk7Cj4gKyAgICByZXR1cm4g
ZXZhbHVhdGVfbm9zcGVjKAo+ICsgICAgICAgIGxpa2VseShtZm4gPCBtYXhfcGFnZSkgJiYKPiAr
ICAgICAgICBsaWtlbHkoIShtZm4gJiBwZm5faG9sZV9tYXNrKSkgJiYKPiArICAgICAgICBsaWtl
bHkodGVzdF9iaXQocGZuX3RvX3BkeChhcnJheV9pbmRleF9ub3NwZWMobWZuLCBtYXhfcGFnZSkp
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyBQRFhfR1JPVVBfQ09VTlQs
IHBkeF9ncm91cF92YWxpZCkpKTsKPiAgfQoKSG93IGFib3V0IHRoaXMgaW5zdGVhZDoKCmJvb2wg
X19tZm5fdmFsaWQodW5zaWduZWQgbG9uZyBtZm4pCnsKICAgIGlmICggdW5saWtlbHkoZXZhbHVh
dGVfbm9zcGVjKG1mbiA+PSBtYXhfcGFnZSkpICkKICAgICAgICByZXR1cm4gZmFsc2U7CiAgICBy
ZXR1cm4gbGlrZWx5KCEobWZuICYgcGZuX2hvbGVfbWFzaykpICYmCiAgICAgICAgICAgbGlrZWx5
KHRlc3RfYml0KHBmbl90b19wZHgobWZuKSAvIFBEWF9HUk9VUF9DT1VOVCwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGR4X2dyb3VwX3ZhbGlkKSk7Cn0KCkluaXRpYWxseSBJIHJlYWxseSBq
dXN0IHdhbnRlZCB0byBpbXByb3ZlIHRoZSBsaW5lIHdyYXBwaW5nIChhdCB0aGUKdmVyeSBsZWFz
dCB0aGUgLyB3YXMgbWlzcGxhY2VkKSwgYnV0IEkgdGhpbmsgdGhpcyB2YXJpYW50IGd1YXJkcwph
Z2FpbnN0IGFsbCB0aGF0J3MgbmVlZGVkIHdpdGhvdXQgZXZlbiBpbnRyb2R1Y2luZyB3cmFwcGlu
ZwpoZWFkYWNoZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
