From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/HVM: correct an inverted check in hvm_load()
Date: Wed, 01 Aug 2018 09:36:32 -0600
Message-ID: <5B61D38002000078001DA043@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qz6i=kq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fktAy-0006PX-Ml
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 15:36:36 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q2xlYXJseSB3ZSB3YW50IHRvIHB1dCBhIHZDUFUgdG8gc2xlZXAgaWYgaXQgaXMgX25vdF8gYWxy
ZWFkeSBkb3duLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgotLS0KVEJEOiBTaW5jZSB0aGUgZmxhdyBhcHBhcmVudGx5IG5ldmVyIG1hdHRlcmVkLCBJIGlt
cGx5IHRoYXQgdGhlIGZ1bmN0aW9uCiAgICAgaXMgbmV2ZXIgY2FsbGVkIHdpdGggYW55IHZDUFUg
dXAuIEhlbmNlIGFuIGFsdGVybmF0aXZlIG1pZ2h0IGJlIHRvCiAgICAgc2ltcGx5IHJldHVybiBh
biBlcnJvciBpZiBhIHZDUFUgZG9lc24ndCBoYXZlIFZQRl9kb3duIHNldC4KCi0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vc2F2ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jCkBAIC0yNjgs
NyArMjY4LDcgQEAgaW50IGh2bV9sb2FkKHN0cnVjdCBkb21haW4gKmQsIGh2bV9kb21haQogCiAg
ICAgLyogRG93biBhbGwgdGhlIHZjcHVzOiB3ZSBvbmx5IHJlLWVuYWJsZSB0aGUgb25lcyB0aGF0
IGhhZCBzdGF0ZSBzYXZlZC4gKi8KICAgICBmb3JfZWFjaF92Y3B1KGQsIHYpCi0gICAgICAgIGlm
ICggdGVzdF9hbmRfc2V0X2JpdChfVlBGX2Rvd24sICZ2LT5wYXVzZV9mbGFncykgKQorICAgICAg
ICBpZiAoICF0ZXN0X2FuZF9zZXRfYml0KF9WUEZfZG93biwgJnYtPnBhdXNlX2ZsYWdzKSApCiAg
ICAgICAgICAgICB2Y3B1X3NsZWVwX25vc3luYyh2KTsKIAogICAgIGZvciAoIDsgOyApCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
