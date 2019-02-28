From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 2/4] xen-block: remove redundant assignment
Date: Thu, 28 Feb 2019 17:34:37 +0000
Message-ID: <20190228173439.8013-3-anthony.perard@citrix.com>
References: <20190228173439.8013-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vqcE=RD=citrix.com=prvs=955018df6=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gzPaF-00062F-EP
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 17:34:59 +0000
In-Reply-To: <20190228173439.8013-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClRoZSBhc3NpZ25t
ZW50IHRvICdwJyBpcyB1bm5lY2Vzc2FyeSBhcyB0aGUgY29kZSB3aWxsIGVpdGhlciBnb3RvICdp
bnZhbGlkJwpvciBwIHdpbGwgZ2V0IG92ZXJ3cml0dGVuLgoKU3BvdHRlZCBieSBDb3Zlcml0eTog
Q0lEIDEzOTg2MzgKClJlcG9ydGVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxp
bmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+CkFja2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KTWVzc2FnZS1JZDogPDIwMTkwMjE1MTYyNTMzLjE5NDc1LTMtcGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgotLS0KIGh3L2Jsb2NrL3hlbi1ibG9jay5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9ibG9jay94
ZW4tYmxvY2suYyBiL2h3L2Jsb2NrL3hlbi1ibG9jay5jCmluZGV4IDUwMTJhZjljYjYuLjI5YWZl
MjcwM2EgMTAwNjQ0Ci0tLSBhL2h3L2Jsb2NrL3hlbi1ibG9jay5jCisrKyBiL2h3L2Jsb2NrL3hl
bi1ibG9jay5jCkBAIC00MTMsOCArNDEzLDcgQEAgc3RhdGljIHZvaWQgeGVuX2Jsb2NrX3NldF92
ZGV2KE9iamVjdCAqb2JqLCBWaXNpdG9yICp2LCBjb25zdCBjaGFyICpuYW1lLAogICAgICAgICB9
CiAKICAgICAgICAgaWYgKCplbmQgPT0gJ3AnKSB7Ci0gICAgICAgICAgICBwID0gKGNoYXIgKikg
KytlbmQ7Ci0gICAgICAgICAgICBpZiAoKmVuZCA9PSAnXDAnKSB7CisgICAgICAgICAgICBpZiAo
KigrK2VuZCkgPT0gJ1wwJykgewogICAgICAgICAgICAgICAgIGdvdG8gaW52YWxpZDsKICAgICAg
ICAgICAgIH0KICAgICAgICAgfQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
