From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 2/3] xen-block: remove redundant assignment
Date: Fri, 15 Feb 2019 16:25:32 +0000
Message-ID: <20190215162533.19475-3-paul.durrant__32686.9935191766$1550248018$gmane$org@citrix.com>
References: <20190215162533.19475-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=skQ2=QW=citrix.com=prvs=9420f6528=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gugJL-0006Ru-Vw
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 16:26:00 +0000
In-Reply-To: <20190215162533.19475-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, xen-devel@lists.xenproject.org
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGFzc2lnbm1lbnQgdG8gJ3AnIGlzIHVubmVjZXNzYXJ5IGFzIHRoZSBjb2RlIHdpbGwgZWl0
aGVyIGdvdG8gJ2ludmFsaWQnCm9yIHAgd2lsbCBnZXQgb3ZlcndyaXR0ZW4uCgpTcG90dGVkIGJ5
IENvdmVyaXR5OiBDSUQgMTM5ODYzOAoKUmVwb3J0ZWQtYnk6IFBldGVyIE1heWRlbGwgPHBldGVy
Lm1heWRlbGxAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CkNjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KQ2M6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+CkNjOiBNYXggUmVpdHogPG1yZWl0
ekByZWRoYXQuY29tPgotLS0KIGh3L2Jsb2NrL3hlbi1ibG9jay5jIHwgMyArLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9i
bG9jay94ZW4tYmxvY2suYyBiL2h3L2Jsb2NrL3hlbi1ibG9jay5jCmluZGV4IDUwMTJhZjljYjYu
LjI5YWZlMjcwM2EgMTAwNjQ0Ci0tLSBhL2h3L2Jsb2NrL3hlbi1ibG9jay5jCisrKyBiL2h3L2Js
b2NrL3hlbi1ibG9jay5jCkBAIC00MTMsOCArNDEzLDcgQEAgc3RhdGljIHZvaWQgeGVuX2Jsb2Nr
X3NldF92ZGV2KE9iamVjdCAqb2JqLCBWaXNpdG9yICp2LCBjb25zdCBjaGFyICpuYW1lLAogICAg
ICAgICB9CiAKICAgICAgICAgaWYgKCplbmQgPT0gJ3AnKSB7Ci0gICAgICAgICAgICBwID0gKGNo
YXIgKikgKytlbmQ7Ci0gICAgICAgICAgICBpZiAoKmVuZCA9PSAnXDAnKSB7CisgICAgICAgICAg
ICBpZiAoKigrK2VuZCkgPT0gJ1wwJykgewogICAgICAgICAgICAgICAgIGdvdG8gaW52YWxpZDsK
ICAgICAgICAgICAgIH0KICAgICAgICAgfQotLSAKMi4yMC4xLjIuZ2IyMWViYjYKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
