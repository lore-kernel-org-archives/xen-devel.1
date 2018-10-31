From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v2 8/9] tools/misc: fix hard tabs in xen-hvmctx.c
Date: Wed, 31 Oct 2018 12:43:34 +0000
Message-ID: <20181031124335.23867-9-paul.durrant@citrix.com>
References: <20181031124335.23867-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z2zh=nl=citrix.com=prvs=83522333a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gHpqX-0005ur-RO
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 12:43:41 +0000
In-Reply-To: <20181031124335.23867-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWxzbyBhZGQgZW1hY3MgYm9pbGVycGxhdGUgdG8gYXZvaWQgZnV0dXJlIHByb2JsZW1zLgoKUHVy
ZWx5IGNvc21ldGljLiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgoKdjI6CiAtIE5ldyBpbiB2MgotLS0KIHRvb2xzL21pc2MveGVuLWh2bWN0eC5jIHwgMTYgKysr
KysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbWlzYy94ZW4taHZtY3R4LmMgYi90b29scy9taXNj
L3hlbi1odm1jdHguYwppbmRleCA0MGU3Nzg1MWJlLi44MjNhYTdkNzM2IDEwMDY0NAotLS0gYS90
b29scy9taXNjL3hlbi1odm1jdHguYworKysgYi90b29scy9taXNjL3hlbi1odm1jdHguYwpAQCAt
MzcxLDggKzM3MSw4IEBAIHN0YXRpYyB2b2lkIGR1bXBfdmlyaWRpYW5fdmNwdSh2b2lkKQogICAg
IEhWTV9TQVZFX1RZUEUoVklSSURJQU5fVkNQVSkgcDsKICAgICBSRUFEKHApOwogICAgIHByaW50
ZigiICAgIFZJUklESUFOX1ZDUFU6IHZwX2Fzc2lzdF9tc3IgMHglbGx4LCB2cF9hc3Npc3RfcGVu
ZGluZyAlc1xuIiwKLQkgICAodW5zaWduZWQgbG9uZyBsb25nKSBwLnZwX2Fzc2lzdF9tc3IsCi0J
ICAgcC52cF9hc3Npc3RfcGVuZGluZyA/ICJ0cnVlIiA6ICJmYWxzZSIpOworICAgICAgICAgICAo
dW5zaWduZWQgbG9uZyBsb25nKSBwLnZwX2Fzc2lzdF9tc3IsCisgICAgICAgICAgIHAudnBfYXNz
aXN0X3BlbmRpbmcgPyAidHJ1ZSIgOiAiZmFsc2UiKTsKIH0KIAogc3RhdGljIHZvaWQgZHVtcF92
bWNlX3ZjcHUodm9pZCkKQEAgLTQ2OCw0ICs0NjgsMTQgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2KQogICAgIH0gd2hpbGUgKCBkZXNjLnR5cGVjb2RlICE9IEhWTV9TQVZFX0NPREUo
RU5EKSAmJiBvZmYgPCBsZW4gKTsKIAogICAgIHJldHVybiAwOwotfSAKK30KKworLyoKKyAqIExv
Y2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEMKKyAqIGMtZmlsZS1zdHlsZTogIkJTRCIKKyAqIGMt
YmFzaWMtb2Zmc2V0OiA0CisgKiB0YWItd2lkdGg6IDQKKyAqIGluZGVudC10YWJzLW1vZGU6IG5p
bAorICogRW5kOgorICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
