From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH 4/6] xen-netfront: add range check for Tx
 response id
Date: Mon, 30 Apr 2018 23:01:48 +0200
Message-ID: <960c6d6300fd3450ae9fb1de1c412bef7dbae992.1525122026.git-series.marmarek__14164.3024435782$1525122106$gmane$org@invisiblethingslab.com>
References: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ssrj=ht=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fDFwt-0007R7-ML
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 21:03:03 +0000
In-Reply-To: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek@invisiblethingslab.com>
References: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, stable@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

VHggcmVzcG9uc2UgSUQgaXMgZmV0Y2hlZCBmcm9tIHNoYXJlZCBwYWdlLCBzbyBtYWtlIHN1cmUg
aXQgaXMgc2FuZQpiZWZvcmUgdXNpbmcgaXQgYXMgYW4gYXJyYXkgaW5kZXguCgpDQzogc3RhYmxl
QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Ci0tLQogZHJpdmVycy9uZXQveGVu
LW5ldGZyb250LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIGIvZHJpdmVycy9uZXQveGVuLW5ldGZy
b250LmMKaW5kZXggOTM0YjhhNC4uNTVjOWIyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQveGVu
LW5ldGZyb250LmMKKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMKQEAgLTM5NCw2ICsz
OTQsNyBAQCBzdGF0aWMgdm9pZCB4ZW5uZXRfdHhfYnVmX2djKHN0cnVjdCBuZXRmcm9udF9xdWV1
ZSAqcXVldWUpCiAJCQkJY29udGludWU7CiAKIAkJCWlkICA9IHR4cnNwLmlkOworCQkJQlVHX09O
KGlkID49IE5FVF9UWF9SSU5HX1NJWkUpOwogCQkJc2tiID0gcXVldWUtPnR4X3NrYnNbaWRdLnNr
YjsKIAkJCWlmICh1bmxpa2VseShnbnR0YWJfcXVlcnlfZm9yZWlnbl9hY2Nlc3MoCiAJCQkJcXVl
dWUtPmdyYW50X3R4X3JlZltpZF0pICE9IDApKSB7Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
