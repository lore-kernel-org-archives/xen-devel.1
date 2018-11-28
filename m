From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH 41/41] scsi: xen-scsifront: mark expected switch
 fall-through
Date: Tue, 27 Nov 2018 22:34:35 -0600
Message-ID: <00c2a9d45e39fb294f4995b07a9b7547206c3085.1543374820.git.gustavo__35769.7768755772$1543379605$gmane$org@embeddedor.com>
References: <cover.1543374820.git.gustavo@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cqcj=oh=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1gRrYe-0001LZ-Mj
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 04:34:40 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id C5CA2400CE4D8
 for <xen-devel@lists.xenproject.org>; Tue, 27 Nov 2018 21:44:11 -0600 (CST)
Content-Disposition: inline
In-Reply-To: <cover.1543374820.git.gustavo@embeddedor.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2ggY2FzZXMKd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpOb3Rp
Y2UgdGhhdCwgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIEkgcmVwbGFjZWQKIk1pc3NlZCB0aGUg
YmFja2VuZCdzIENsb3Npbmcgc3RhdGUgLS0gZmFsbHRocm91Z2giIHdpdGgKImZhbGwgdGhyb3Vn
aCAtIE1pc3NlZCB0aGUgYmFja2VuZCdzIENsb3Npbmcgc3RhdGUiLCB3aGljaApjb250YWlucyB0
aGUgImZhbGwgdGhyb3VnaCIgYW5ub3RhdGlvbiBhdCB0aGUgYmVnaW5uaWcgb2YKdGhlIGNvZGUg
Y29tbWVudCwgd2hpY2ggaXMgd2hhdCBHQ0MgaXMgZXhwZWN0aW5nIHRvIGZpbmQuCgpTaWduZWQt
b2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgotLS0K
IGRyaXZlcnMvc2NzaS94ZW4tc2NzaWZyb250LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kveGVu
LXNjc2lmcm9udC5jIGIvZHJpdmVycy9zY3NpL3hlbi1zY3NpZnJvbnQuYwppbmRleCA2MTM4OWJk
Yzc5MjYuLmJiNzZkMGQyMDIyYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zY3NpL3hlbi1zY3NpZnJv
bnQuYworKysgYi9kcml2ZXJzL3Njc2kveGVuLXNjc2lmcm9udC5jCkBAIC0xMTEyLDcgKzExMTIs
NyBAQCBzdGF0aWMgdm9pZCBzY3NpZnJvbnRfYmFja2VuZF9jaGFuZ2VkKHN0cnVjdCB4ZW5idXNf
ZGV2aWNlICpkZXYsCiAJY2FzZSBYZW5idXNTdGF0ZUNsb3NlZDoKIAkJaWYgKGRldi0+c3RhdGUg
PT0gWGVuYnVzU3RhdGVDbG9zZWQpCiAJCQlicmVhazsKLQkJLyogTWlzc2VkIHRoZSBiYWNrZW5k
J3MgQ2xvc2luZyBzdGF0ZSAtLSBmYWxsdGhyb3VnaCAqLworCQkvKiBmYWxsIHRocm91Z2ggLSBN
aXNzZWQgdGhlIGJhY2tlbmQncyBDbG9zaW5nIHN0YXRlICovCiAJY2FzZSBYZW5idXNTdGF0ZUNs
b3Npbmc6CiAJCXNjc2lmcm9udF9kaXNjb25uZWN0KGluZm8pOwogCQlicmVhazsKLS0gCjIuMTcu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
