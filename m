From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH] x86/altp2m: treat view 0 as the hostp2m in
 p2m_get_mem_access()
Date: Wed,  3 Apr 2019 11:56:37 +0300
Message-ID: <1554281797-21368-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YZkv=SF=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hBbhQ-0001ND-7d
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 08:56:48 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: tamas@tklengyel.com, wei.liu2@citrix.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

cDJtX3NldF9tZW1fYWNjZXNzKCkgKGFuZCBvdGhlciBwbGFjZXMpIHRyZWF0IHZpZXcgMCBhcyB0
aGUKaG9zdHAybSwgYnV0IHAybV9nZXRfbWVtX2FjY2VzcygpIGRvZXMgbm90LiBDb3JyZWN0IHRo
YXQKaW5jb25zaXN0ZW5jeS4KClNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyBiL3hlbi9hcmNoL3g4Ni9tbS9t
ZW1fYWNjZXNzLmMKaW5kZXggNTZjMDZhNC4uYTE0NGJiMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L21tL21lbV9hY2Nlc3MuYworKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCkBA
IC01MDUsNyArNTA1LDcgQEAgaW50IHAybV9nZXRfbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpk
LCBnZm5fdCBnZm4sIHhlbm1lbV9hY2Nlc3NfdCAqYWNjZXNzLAogICAgICAgICBpZiAoIGFsdHAy
bV9pZHggKQogICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgfQotICAgIGVsc2UKKyAg
ICBlbHNlIGlmICggYWx0cDJtX2lkeCApIC8qIGFsdHAybSB2aWV3IDAgaXMgdHJlYXRlZCBhcyB0
aGUgaG9zdHAybSAqLwogICAgIHsKICAgICAgICAgaWYgKCBhbHRwMm1faWR4ID49IE1BWF9BTFRQ
Mk0gfHwKICAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FsdHAybV9pZHhdID09IG1m
bl94KElOVkFMSURfTUZOKSApCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
