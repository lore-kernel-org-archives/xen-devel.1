From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH] tools/misc/xen-hvmctx: fix the build
Date: Fri, 19 Jan 2018 09:08:14 -0500
Message-ID: <20180119140814.26611-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=t+gi=ae=citrix.com=prvs=55023bea9=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ecXL8-0002sb-Nr
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 14:08:18 +0000
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

VGhlIHJlY2VudCBjb21taXQgNjZiZjRlZjAgIng4Ni9odm06IHJlLXdvcmsgdmlyaWRpYW4gQVBJ
QyBhc3Npc3QgY29kZSIKbW9kaWZpZWQgb25lIG9mIHRoZSBmaWVsZCBuYW1lcyBpbiBzdHJ1Y3Qg
aHZtX3ZpcmlkaWFuX3ZjcHVfY29udGV4dCBidXQKZGlkIG5vdCBhY2NvcmRpbmdseSBtb2RpZnkg
eGVuLWh2bWN0eCwgbGVhZGluZyB0byBhIGZhaWx1cmUgdG8gYnVpbGQgdG9vbHMuCgpUaGlzIHBh
dGNoIG1ha2VzIHRoZSBuZWNlc3NhcnkgY2hhbmdlIHRvIGZpeCB0aGUgYnVpbGQuCgpTaWduZWQt
b2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9taXNjL3hlbi1odm1jdHguYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS90b29scy9taXNjL3hlbi1odm1jdHguYyBiL3Rvb2xzL21pc2MveGVuLWh2bWN0eC5jCmluZGV4
IGJkZTQxZjM4MTYuLjAyNmJlZDgxMzQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL21pc2MveGVuLWh2bWN0
eC5jCisrKyBiL3Rvb2xzL21pc2MveGVuLWh2bWN0eC5jCkBAIC0zNzksOSArMzc5LDkgQEAgc3Rh
dGljIHZvaWQgZHVtcF92aXJpZGlhbl92Y3B1KHZvaWQpCiB7CiAgICAgSFZNX1NBVkVfVFlQRShW
SVJJRElBTl9WQ1BVKSBwOwogICAgIFJFQUQocCk7Ci0gICAgcHJpbnRmKCIgICAgVklSSURJQU5f
VkNQVTogdnBfYXNzaXN0X21zciAweCVsbHgsIHZwX2Fzc2lzdF92ZWN0b3IgMHgleFxuIiwKKyAg
ICBwcmludGYoIiAgICBWSVJJRElBTl9WQ1BVOiB2cF9hc3Npc3RfbXNyIDB4JWxseCwgdnBfYXNz
aXN0X3BlbmRpbmcgJXNcbiIsCiAJICAgKHVuc2lnbmVkIGxvbmcgbG9uZykgcC52cF9hc3Npc3Rf
bXNyLAotCSAgIHAudnBfYXNzaXN0X3ZlY3Rvcik7CisJICAgcC52cF9hc3Npc3RfcGVuZGluZyA/
ICJ0cnVlIiA6ICJmYWxzZSIpOwogfQogCiBzdGF0aWMgdm9pZCBkdW1wX3ZtY2VfdmNwdSh2b2lk
KQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
