From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/blkfront: correct purging of persistent
 grants
Date: Fri, 28 Sep 2018 09:28:27 +0200
Message-ID: <20180928072827.14229-1-jgross__46089.6038137891$1538119634$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wnhr=mk=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g5nCQ-0002rc-QT
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 07:28:30 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org
Cc: axboe@kernel.dk, Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IGE0NmI1MzY3MmIyYzJlMzc3MGIzOGE0YWJmOTBkMTYzNjRkMjU4NGIgKCJ4ZW4vYmxr
ZnJvbnQ6IGNsZWFudXAKc3RhbGUgcGVyc2lzdGVudCBncmFudHMiKSBpbnRyb2R1Y2VkIGEgcmVn
cmVzc2lvbiBhcyBwdXJnZWQgcGVyc2lzdGVudApncmFudHMgd2VyZSBub3QgcHUgaW50byB0aGUg
bGlzdCBvZiBmcmVlIGdyYW50cyBhZ2Fpbi4gQ29ycmVjdCB0aGF0LgoKU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvYmxvY2sveGVuLWJs
a2Zyb250LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyBiL2Ry
aXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKaW5kZXggYTcxZDgxN2U5MDBkLi40MjlkMjAxMzFj
N2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKKysrIGIvZHJpdmVy
cy9ibG9jay94ZW4tYmxrZnJvbnQuYwpAQCAtMjY3MCw4ICsyNjcwLDggQEAgc3RhdGljIHZvaWQg
cHVyZ2VfcGVyc2lzdGVudF9ncmFudHMoc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8pCiAJCQls
aXN0X2RlbCgmZ250X2xpc3RfZW50cnktPm5vZGUpOwogCQkJZ250dGFiX2VuZF9mb3JlaWduX2Fj
Y2VzcyhnbnRfbGlzdF9lbnRyeS0+Z3JlZiwgMCwgMFVMKTsKIAkJCXJpbmZvLT5wZXJzaXN0ZW50
X2dudHNfYy0tOwotCQkJX19mcmVlX3BhZ2UoZ250X2xpc3RfZW50cnktPnBhZ2UpOwotCQkJa2Zy
ZWUoZ250X2xpc3RfZW50cnkpOworCQkJZ250X2xpc3RfZW50cnktPmdyZWYgPSBHUkFOVF9JTlZB
TElEX1JFRjsKKwkJCWxpc3RfYWRkX3RhaWwoJmdudF9saXN0X2VudHJ5LT5ub2RlLCAmcmluZm8t
PmdyYW50cyk7CiAJCX0KIAogCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZyaW5mby0+cmluZ19s
b2NrLCBmbGFncyk7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
