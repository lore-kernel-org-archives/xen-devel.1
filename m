From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/4] xen/arm: initialize access
Date: Mon, 15 Oct 2018 02:56:05 -0700
Message-ID: <1539597367-25807-2-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1810142125100.4859@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k6bj=m3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gBzbk-0001yx-Ix
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 09:56:16 +0000
In-Reply-To: <alpine.DEB.2.10.1810142125100.4859@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SW5pdGlhbGl6ZSB2YXJpYWJsZSAqYWNjZXNzIGJlZm9yZSByZXR1cm5pbmcgaXQgYmFjayB0byB0
aGUgY2FsbGVyLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4
aWxpbnguY29tPgotLS0KIHhlbi9hcmNoL2FybS9tZW1fYWNjZXNzLmMgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tZW1fYWNj
ZXNzLmMgYi94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jCmluZGV4IGJhNGVjNzguLjEwYWIzMDgg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tZW1fYWNjZXNzLmMKKysrIGIveGVuL2FyY2gvYXJt
L21lbV9hY2Nlc3MuYwpAQCAtNDcsNiArNDcsNyBAQCBzdGF0aWMgaW50IF9fcDJtX2dldF9tZW1f
YWNjZXNzKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwKICAgICB9OwogCiAgICAgQVNTRVJU
KHAybV9pc19sb2NrZWQocDJtKSk7CisgICAgKmFjY2VzcyA9IFhFTk1FTV9hY2Nlc3NfbjsKIAog
ICAgIC8qIElmIG5vIHNldHRpbmcgd2FzIGV2ZXIgc2V0LCBqdXN0IHJldHVybiByd3guICovCiAg
ICAgaWYgKCAhcDJtLT5tZW1fYWNjZXNzX2VuYWJsZWQgKQotLSAKMS45LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
