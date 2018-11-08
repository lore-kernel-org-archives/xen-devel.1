From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v2 06/11] tools/libvchan: init_xs_srv: Simplify
 error handling (1)
Date: Thu, 8 Nov 2018 17:08:00 +0000
Message-ID: <20181108170805.12774-7-ian.jackson@eu.citrix.com>
References: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t5pf=nt=citrix.com=prvs=843e771e9=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gKnnA-0000dg-OQ
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 17:08:28 +0000
In-Reply-To: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

KiBVc2UgeHNfY2xvc2UgaW5zdGVhZCBvZiB0aGUgZGVwcmVjYXRlZCB4c19kYWVtb25fY2xvc2Uu
CgoqIEluaXRpYWxpc2UgeHMgdG8gTlVMTC4gICAgVGhhdCBtZWFucyB4c19jbG9zZSBjYW4gbm93
IGJlIGNhbGxlZCBpbgogIGFsbCBjYXNlcy4gIE1vdmUgaXQgdG8gdGhlIGZhaWwgY2xhdXNlLgoK
KiBmcmVlKGRvbWlkX3N0cikgaXMgYWxyZWFkeSBzYWZlIGluIGFsbCBjYXNlcyBzaW5jZSBkb21p
ZF9zdHIgaXMKICBpbml0aWFsaXNlZCB0byBOVUxMLiAgTW92ZSBpdCB0byB0aGUgZmFpbCBjbGF1
c2UuCgpObyBvdmVyYWxsIGZ1bmN0aW9uYWwgY2hhbmdlOiB4c19jbG9zZSBpcyB0aGUgc2FtZSBh
cyB4c19kYWVtb25fY2xvc2U7CmFuZCBpdCBhbmQgZnJlZSBhcmUgbm93IHNvbWV0aW1lcyBjYWxs
ZWQgb24gTlVMTCwgYnV0IHRob3NlIGFyZSBuby1vcHMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+CkNDOiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVr
QGludmlzaWJsZXRoaW5nc2xhYi5jb20+Ci0tLQogdG9vbHMvbGlidmNoYW4vaW5pdC5jIHwgNiAr
KystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlidmNoYW4vaW5pdC5jIGIvdG9vbHMvbGlidmNoYW4vaW5pdC5j
CmluZGV4IDE4MDgzM2RjMmYuLjljNjFjNzIwZDEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnZjaGFu
L2luaXQuYworKysgYi90b29scy9saWJ2Y2hhbi9pbml0LmMKQEAgLTI0NSw3ICsyNDUsNyBAQCBm
YWlsOgogc3RhdGljIGludCBpbml0X3hzX3NydihzdHJ1Y3QgbGlieGVudmNoYW4gKmN0cmwsIGlu
dCBkb21haW4sIGNvbnN0IGNoYXIqIHhzX2Jhc2UsIGludCByaW5nX3JlZikKIHsKIAlpbnQgcmV0
ID0gLTE7Ci0Jc3RydWN0IHhzX2hhbmRsZSAqeHM7CisJc3RydWN0IHhzX2hhbmRsZSAqeHMgPSBO
VUxMOwogCXN0cnVjdCB4c19wZXJtaXNzaW9ucyBwZXJtc1syXTsKIAljaGFyIGJ1Zls2NF07CiAJ
Y2hhciByZWZbMTZdOwpAQCAtMjkyLDkgKzI5Miw5IEBAIHJldHJ5X3RyYW5zYWN0aW9uOgogCQly
ZXQgPSAwOwogCX0KICBmYWlsX3hzX29wZW46Ci0JZnJlZShkb21pZF9zdHIpOwotCXhzX2RhZW1v
bl9jbG9zZSh4cyk7CiAgZmFpbDoKKwlmcmVlKGRvbWlkX3N0cik7CisJeHNfY2xvc2UoeHMpOwog
CXJldHVybiByZXQ7CiB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
