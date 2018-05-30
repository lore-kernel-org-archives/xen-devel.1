From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] ALSA: xen-front: freeing an error pointer
Date: Wed, 30 May 2018 13:36:55 +0300
Message-ID: <20180530103655.bnjzq2jpfrjjwvvj__3439.21992830492$1527676582$gmane$org@kili.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jxob=ir=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1fNyTr-0006Ya-EP
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 10:37:23 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
List-Id: xen-devel@lists.xenproject.org

a2ZyZWUoKSBkb2Vzbid0IGFjY2VwdCBlcnJvciBwb2ludGVycyBzbyBJJ3ZlIHNldCAic3RyIiB0
byBOVUxMIG9uIHRoZXNlCnBhdGhzLgoKRml4ZXM6IGZkM2IzNjA0NWMyYyAoIkFMU0E6IHhlbi1m
cm9udDogUmVhZCBzb3VuZCBkcml2ZXIgY29uZmlndXJhdGlvbiBmcm9tIFhlbiBzdG9yZSIpClNp
Z25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KCmRp
ZmYgLS1naXQgYS9zb3VuZC94ZW4veGVuX3NuZF9mcm9udF9jZmcuYyBiL3NvdW5kL3hlbi94ZW5f
c25kX2Zyb250X2NmZy5jCmluZGV4IDM4YzdlMWVlZmJiOS4uNjhkY2Q3ZDFmMDllIDEwMDY0NAot
LS0gYS9zb3VuZC94ZW4veGVuX3NuZF9mcm9udF9jZmcuYworKysgYi9zb3VuZC94ZW4veGVuX3Nu
ZF9mcm9udF9jZmcuYwpAQCAtMzA2LDYgKzMwNiw3IEBAIHN0YXRpYyBpbnQgY2ZnX2dldF9zdHJl
YW1fdHlwZShjb25zdCBjaGFyICpwYXRoLCBpbnQgaW5kZXgsCiAJc3RyID0geGVuYnVzX3JlYWQo
WEJUX05JTCwgc3RyZWFtX3BhdGgsIFhFTlNORF9GSUVMRF9UWVBFLCBOVUxMKTsKIAlpZiAoSVNf
RVJSKHN0cikpIHsKIAkJcmV0ID0gUFRSX0VSUihzdHIpOworCQlzdHIgPSBOVUxMOwogCQlnb3Rv
IGZhaWw7CiAJfQogCkBAIC0zNDcsNiArMzQ4LDcgQEAgc3RhdGljIGludCBjZmdfc3RyZWFtKHN0
cnVjdCB4ZW5fc25kX2Zyb250X2luZm8gKmZyb250X2luZm8sCiAJc3RyID0geGVuYnVzX3JlYWQo
WEJUX05JTCwgc3RyZWFtX3BhdGgsIFhFTlNORF9GSUVMRF9UWVBFLCBOVUxMKTsKIAlpZiAoSVNf
RVJSKHN0cikpIHsKIAkJcmV0ID0gUFRSX0VSUihzdHIpOworCQlzdHIgPSBOVUxMOwogCQlnb3Rv
IGZhaWw7CiAJfQogCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
