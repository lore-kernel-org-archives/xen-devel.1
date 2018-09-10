From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: improve vCPU selection in pagetable_dying()
Date: Mon, 10 Sep 2018 08:02:19 -0600
Message-ID: <5B96796B02000078001E6CF4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=emay=ly=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzMlk-0003U4-IF
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 14:02:24 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UmF0aGVyIHRoYW4gdW5jb25kaXRpb25hbGx5IHVzaW5nIHZDUFUgMCwgdXNlIHRoZSBjdXJyZW50
IHZDUFUgaWYgdGhlCnN1YmplY3QgZG9tYWluIGlzIHRoZSBjdXJyZW50IG9uZS4KClNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4
Ni9tbS9wYWdpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMKQEAgLTg1OCw3ICs4
NTgsNyBAQCB2b2lkIHBhZ2V0YWJsZV9keWluZyhzdHJ1Y3QgZG9tYWluICpkLCBwCiAKICAgICBB
U1NFUlQocGFnaW5nX21vZGVfc2hhZG93KGQpKTsKIAotICAgIHYgPSBkLT52Y3B1WzBdOworICAg
IHYgPSAoZCA9PSBjdXJyZW50LT5kb21haW4pID8gY3VycmVudCA6IGQtPnZjcHVbMF07CiAgICAg
di0+YXJjaC5wYWdpbmcubW9kZS0+c2hhZG93LnBhZ2V0YWJsZV9keWluZyh2LCBncGEpOwogI2Vs
c2UKICAgICBCVUcoKTsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
