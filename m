From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 03/14] xen/x86: Make mfn_to_gfn typesafe
Date: Fri, 10 May 2019 05:35:42 -0600
Message-ID: <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP3oY-0002NG-98
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 11:35:46 +0000
In-Reply-To: <20190507151458.29350-4-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4gQEAgLTQ3NCw3ICs0NzQsOCBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgdHJhY2VfcmVzeW5jKGludCBldmVudCwgbWZuX3QgZ21mbikKPiAgICAgIGlmICggdGJf
aW5pdF9kb25lICkKPiAgICAgIHsKPiAgICAgICAgICAvKiBDb252ZXJ0IGdtZm4gdG8gZ2ZuICov
Cj4gLSAgICAgICAgdW5zaWduZWQgbG9uZyBnZm4gPSBtZm5fdG9fZ2ZuKGN1cnJlbnQtPmRvbWFp
biwgZ21mbik7Cj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBnZm4gPSBnZm5feChtZm5fdG9fZ2Zu
KGN1cnJlbnQtPmRvbWFpbiwgZ21mbikpOwo+ICsKPiAgICAgICAgICBfX3RyYWNlX3ZhcihldmVu
dCwgMC8qIXRzYyovLCBzaXplb2YoZ2ZuKSwgJmdmbik7Cj4gICAgICB9CgpDYW4ndCB5b3UgdXNl
IGdmbl90IGhlcmUsIGFuZCBoZW5jZSBhdm9pZCB0aGUgZ2ZuX3goKT8gU2FtZSBhZ2FpbiBmdXJ0
aGVyCmRvd24uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
