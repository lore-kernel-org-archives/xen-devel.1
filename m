From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: rename paging function
Date: Tue, 11 Dec 2018 08:08:51 -0700
Message-ID: <5C0FD3030200007800205203@prv1-mh.provo.novell.com>
References: <20181205145500.11989-1-roger.pau@citrix.com>
 <20181205145500.11989-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWjee-0007y6-P6
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:09:00 +0000
In-Reply-To: <20181205145500.11989-2-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEyLjE4IGF0IDE1OjU0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRvIG5vdGUgaXQncyBjYWxjdWxhdGluZyB0aGUgYXBwcm94aW1hdGUgYW1vdW50IG9mIG1lbW9y
eSByZXF1aXJlZCBieQo+IHNoYWRvdyBwYWdpbmcuCgpJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBs
b2dpYywgYW5kIC4uLgoKPiBAQCAtMzI1LDcgKzMyNSw3IEBAIHVuc2lnbmVkIGxvbmcgX19pbml0
IGRvbTBfY29tcHV0ZV9ucl9wYWdlcygKPiAgICAgICAgICAgICAgYnJlYWs7Cj4gIAo+ICAgICAg
ICAgIC8qIFJlc2VydmUgbWVtb3J5IGZvciBzaGFkb3cgb3IgSEFQLiAqLwo+IC0gICAgICAgIGF2
YWlsIC09IGRvbTBfcGFnaW5nX3BhZ2VzKGQsIG5yX3BhZ2VzKTsKPiArICAgICAgICBhdmFpbCAt
PSBkb20wX3NoYWRvd19wYWdlcyhkLCBucl9wYWdlcyk7Cj4gICAgICB9CgouLi4gdGhlIGNvbW1l
bnQgaGVyZSAoYW5kIGxhY2sgb2YgY29uZGl0aW9uYWwgcmVzdHJpY3RpbmcgdGhlCmNvZGUgdG8g
c2hhZG93IG1vZGUpIGFwcGVhciB0byBzdXBwb3J0IG1lOiBIYXZlIHlvdQpiZWVuIG1pc2xlYWQg
YnkgdGhlIGZ1bmN0aW9uIGhhdmluZyBhIGNvbW1lbnQgcmVmZXJyaW5nCnRvIGxpYnhsX2dldF9y
ZXF1aXJlZF9zaGFkb3dfbWVtb3J5KCk/IEkgdGhpbmsgaWYgYW55dGhpbmcKdGhhdCBsaWJ4bCBm
dW5jdGlvbiB3b3VsZCB3YW50IHRvIGJlIHJlbmFtZWQgKHRvIHJlcGxhY2UKInNoYWRvdyIgYnkg
c29tZXRoaW5nIG1vcmUgZ2VuZXJpYyBpbiBpdHMgbmFtZSkuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
