From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH] xen: Change return type to vm_fault_t
Date: Sun, 15 Apr 2018 00:45:42 +0530
Message-ID: <20180414191542.GA19820@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bk9j=hd=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1f7QcS-0004PB-Va
 for xen-devel@lists.xenproject.org; Sat, 14 Apr 2018 19:13:53 +0000
Received: by mail-pf0-x243.google.com with SMTP id y69so8612307pfb.5
 for <xen-devel@lists.xenproject.org>; Sat, 14 Apr 2018 12:13:51 -0700 (PDT)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, willy@infradead.org
List-Id: xen-devel@lists.xenproject.org

VXNlIG5ldyByZXR1cm4gdHlwZSB2bV9mYXVsdF90IGZvciBmYXVsdCBoYW5kbGVyCmluIHN0cnVj
dCB2bV9vcGVyYXRpb25zX3N0cnVjdC4KClNpZ25lZC1vZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIg
PGpyZHIubGludXhAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogTWF0dGhldyBXaWxjb3ggPG1hd2ls
Y294QG1pY3Jvc29mdC5jb20+Ci0tLQogZHJpdmVycy94ZW4vcHJpdmNtZC5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4vcHJpdmNtZC5jIGIvZHJpdmVycy94ZW4vcHJpdmNtZC5jCmluZGV4IDFjOTA5
MTguLjBhNzc4ZDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3ByaXZjbWQuYworKysgYi9kcml2
ZXJzL3hlbi9wcml2Y21kLmMKQEAgLTgwMSw3ICs4MDEsNyBAQCBzdGF0aWMgdm9pZCBwcml2Y21k
X2Nsb3NlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCWtmcmVlKHBhZ2VzKTsKIH0KCi1z
dGF0aWMgaW50IHByaXZjbWRfZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCitzdGF0aWMgdm1f
ZmF1bHRfdCBwcml2Y21kX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQogewogCXByaW50ayhL
RVJOX0RFQlVHICJwcml2Y21kX2ZhdWx0OiB2bWE9JXAgJWx4LSVseCwgcGdvZmY9JWx4LCB1dj0l
cFxuIiwKIAkgICAgICAgdm1mLT52bWEsIHZtZi0+dm1hLT52bV9zdGFydCwgdm1mLT52bWEtPnZt
X2VuZCwKLS0KMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
