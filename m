From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] xen: xenbus: use put_device() instead of kfree()
Date: Tue,  6 Mar 2018 15:40:37 +0530
Message-ID: <46ec1b05b5643fd6c52ada8c6d8e4a9f1c3f1da8.1520330916.git.arvind.yadav.cs__27842.1801668175$1520331032$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zrtv=f4=gmail.com=arvind.yadav.cs@srs-us1.protection.inumbo.net>)
 id 1et9Z7-0007M9-Cb
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 10:11:25 +0000
Received: by mail-it0-x244.google.com with SMTP id k79so14079356ita.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Mar 2018 02:11:24 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

TmV2ZXIgZGlyZWN0bHkgZnJlZSBAZGV2IGFmdGVyIGNhbGxpbmcgZGV2aWNlX3JlZ2lzdGVyKCks
IGV2ZW4KaWYgaXQgcmV0dXJuZWQgYW4gZXJyb3IhIEFsd2F5cyB1c2UgcHV0X2RldmljZSgpIHRv
IGdpdmUgdXAgdGhlCnJlZmVyZW5jZSBpbml0aWFsaXplZC4KClNpZ25lZC1vZmYtYnk6IEFydmlu
ZCBZYWRhdiA8YXJ2aW5kLnlhZGF2LmNzQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi94ZW5i
dXMveGVuYnVzX3Byb2JlLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1
c19wcm9iZS5jIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCmluZGV4IDc0ODg4
Y2EuLmVjOWViNGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUu
YworKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKQEAgLTQ2Niw4ICs0NjYs
MTEgQEAgaW50IHhlbmJ1c19wcm9iZV9ub2RlKHN0cnVjdCB4ZW5fYnVzX3R5cGUgKmJ1cywKIAog
CS8qIFJlZ2lzdGVyIHdpdGggZ2VuZXJpYyBkZXZpY2UgZnJhbWV3b3JrLiAqLwogCWVyciA9IGRl
dmljZV9yZWdpc3RlcigmeGVuZGV2LT5kZXYpOwotCWlmIChlcnIpCisJaWYgKGVycikgeworCQlw
dXRfZGV2aWNlKCZ4ZW5kZXYtPmRldik7CisJCXhlbmRldiA9IE5VTEw7CiAJCWdvdG8gZmFpbDsK
Kwl9CiAKIAlyZXR1cm4gMDsKIGZhaWw6Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
