From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v3 4/5] tools/misc: fix hard tabs in xen-hvmctx.c
Date: Wed, 7 Nov 2018 10:52:22 +0000
Message-ID: <20181107105223.27013-5-paul.durrant@citrix.com>
References: <20181107105223.27013-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9ib7=ns=citrix.com=prvs=842bfaeda=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gKLRl-0002PW-Lm
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 10:52:29 +0000
In-Reply-To: <20181107105223.27013-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul.durrant@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWxzbyBhZGQgZW1hY3MgYm9pbGVycGxhdGUgdG8gYXZvaWQgZnV0dXJlIHByb2JsZW1zLgoKUHVy
ZWx5IGNvc21ldGljLiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgotLS0KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgoKdjI6CiAtIE5ldyBpbiB2MgotLS0KIHRvb2xzL21pc2MveGVuLWh2bWN0eC5jIHwg
MTYgKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbWlzYy94ZW4taHZtY3R4LmMgYi90b29s
cy9taXNjL3hlbi1odm1jdHguYwppbmRleCA0MGU3Nzg1MWJlLi44MjNhYTdkNzM2IDEwMDY0NAot
LS0gYS90b29scy9taXNjL3hlbi1odm1jdHguYworKysgYi90b29scy9taXNjL3hlbi1odm1jdHgu
YwpAQCAtMzcxLDggKzM3MSw4IEBAIHN0YXRpYyB2b2lkIGR1bXBfdmlyaWRpYW5fdmNwdSh2b2lk
KQogICAgIEhWTV9TQVZFX1RZUEUoVklSSURJQU5fVkNQVSkgcDsKICAgICBSRUFEKHApOwogICAg
IHByaW50ZigiICAgIFZJUklESUFOX1ZDUFU6IHZwX2Fzc2lzdF9tc3IgMHglbGx4LCB2cF9hc3Np
c3RfcGVuZGluZyAlc1xuIiwKLQkgICAodW5zaWduZWQgbG9uZyBsb25nKSBwLnZwX2Fzc2lzdF9t
c3IsCi0JICAgcC52cF9hc3Npc3RfcGVuZGluZyA/ICJ0cnVlIiA6ICJmYWxzZSIpOworICAgICAg
ICAgICAodW5zaWduZWQgbG9uZyBsb25nKSBwLnZwX2Fzc2lzdF9tc3IsCisgICAgICAgICAgIHAu
dnBfYXNzaXN0X3BlbmRpbmcgPyAidHJ1ZSIgOiAiZmFsc2UiKTsKIH0KIAogc3RhdGljIHZvaWQg
ZHVtcF92bWNlX3ZjcHUodm9pZCkKQEAgLTQ2OCw0ICs0NjgsMTQgQEAgaW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKiphcmd2KQogICAgIH0gd2hpbGUgKCBkZXNjLnR5cGVjb2RlICE9IEhWTV9TQVZF
X0NPREUoRU5EKSAmJiBvZmYgPCBsZW4gKTsKIAogICAgIHJldHVybiAwOwotfSAKK30KKworLyoK
KyAqIExvY2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEMKKyAqIGMtZmlsZS1zdHlsZTogIkJTRCIK
KyAqIGMtYmFzaWMtb2Zmc2V0OiA0CisgKiB0YWItd2lkdGg6IDQKKyAqIGluZGVudC10YWJzLW1v
ZGU6IG5pbAorICogRW5kOgorICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
