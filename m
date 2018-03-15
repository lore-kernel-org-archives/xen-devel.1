From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v2 03/45] xen/arm: gic: Fix indentation in
	gic_update_one_lr
Date: Thu, 15 Mar 2018 20:30:08 +0000
Message-ID: <20180315203050.19791-4-andre.przywara@linaro.org>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jxrf=gf=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ewZWo-00030N-4L
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 20:31:10 +0000
Received: by mail-wm0-x241.google.com with SMTP id h76so12874037wme.4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Mar 2018 13:31:09 -0700 (PDT)
In-Reply-To: <20180315203050.19791-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbmRyZSBQ
cnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6
eXdhcmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+Ci0tLQpDaGFuZ2Vsb2cgdjEgLi4uIHYyOgot
IEFkZCBBbmRyZSdzIHJldmlld2VkLWJ5CgogeGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMu
YwppbmRleCA2MWYwOTNkYjUwLi5lM2NiNDdlODBlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0v
Z2ljLXZnaWMuYworKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwpAQCAtMTk3LDggKzE5Nyw4
IEBAIHN0YXRpYyB2b2lkIGdpY191cGRhdGVfb25lX2xyKHN0cnVjdCB2Y3B1ICp2LCBpbnQgaSkK
ICAgICAgICAgewogICAgICAgICAgICAgaWYgKCBwLT5kZXNjID09IE5VTEwgKQogICAgICAgICAg
ICAgewotICAgICAgICAgICAgICAgICBscl92YWwuc3RhdGUgfD0gR0lDSF9MUl9QRU5ESU5HOwot
ICAgICAgICAgICAgICAgICBnaWNfaHdfb3BzLT53cml0ZV9scihpLCAmbHJfdmFsKTsKKyAgICAg
ICAgICAgICAgICBscl92YWwuc3RhdGUgfD0gR0lDSF9MUl9QRU5ESU5HOworICAgICAgICAgICAg
ICAgIGdpY19od19vcHMtPndyaXRlX2xyKGksICZscl92YWwpOwogICAgICAgICAgICAgfQogICAg
ICAgICAgICAgZWxzZQogICAgICAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAi
dW5hYmxlIHRvIGluamVjdCBodyBpcnE9JWQgaW50byBkJWR2JWQ6IGFscmVhZHkgYWN0aXZlIGlu
IExSJWRcbiIsCi0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
