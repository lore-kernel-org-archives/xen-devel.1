Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE18CC282CE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A85BF214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A85BF214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc92-0005NO-FM; Mon, 22 Apr 2019 16:50:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc90-0005KN-Pt
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:14 +0000
X-Inumbo-ID: b3115267-651e-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b3115267-651e-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 16:50:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9312EBD;
 Mon, 22 Apr 2019 09:50:13 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B94403F557;
 Mon, 22 Apr 2019 09:50:12 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:34 +0100
Message-Id: <20190422164937.21350-18-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 17/20] xen/arm: mm: Initialize page-tables
 earlier
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422164934.1xBaCsFifYelSxSBIHY3ZnuOD2TppNDVo1gosPztD3g@z>

U2luY2UgY29tbWl0IGY2MDY1OGM2YWUgInhlbi9hcm06IFN0b3AgcmVsb2NhdGluZyBYZW4iLCB0
aGUgZnVuY3Rpb24Kc2V0dXBfcGFnZV90YWJsZXMoKSBkb2VzIG5vdCByZXF1aXJlIGFueSBpbmZv
cm1hdGlvbiBmcm9tIHRoZSBGRFQuCgpTbyB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIHBhZ2Ut
dGFibGVzIGNhbiBiZSBkb25lIG11Y2ggZWFybGllciBpbiB0aGUKYm9vdCBwcm9jZXNzLiBUaGUg
ZWFybGllc3Qgc2V0dXBfcGFnZV90YWJsZXMoKSBjYW4gYmUgY2FsbGVkIGlzIGFmdGVyCnRyYXBz
IGhhdmUgYmVlbiBpbml0aWFsaXplZCwgc28gd2UgY2FuIGdldCBiYWNrdHJhY2UgaWYgYW4gZXJy
b3IKb2NjdXJyZWQuCgpNb3ZpbmcgdGhlIGluaXRpYWxpemF0aW9uIG9mIHRoZSBwYWdlLXRhYmxl
cyBhbHNvIGF2b2lkIHRoZSBkYW5jZSB0byBtYXAKdGhlIEZEVCBhZ2FpbiBpbiB0aGUgbmV3IHNl
dCBvZiBwYWdlLXRhYmxlcy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgICAgfCAxMiArKystLS0tLS0tLS0K
IHhlbi9hcmNoL2FybS9zZXR1cC5jIHwgIDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5j
IGIveGVuL2FyY2gvYXJtL21tLmMKaW5kZXggZWNkZTRlMzRkZi4uZWU1NDFhMzhlMyAxMDA2NDQK
LS0tIGEveGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTU0NSw3
ICs1NDUsNyBAQCBzdGF0aWMgaW5saW5lIGxwYWVfdCBwdGVfb2ZfeGVuYWRkcih2YWRkcl90IHZh
KQogICAgIHJldHVybiBtZm5fdG9feGVuX2VudHJ5KG1hZGRyX3RvX21mbihtYSksIE1UX05PUk1B
TCk7CiB9CiAKLS8qIE1hcCB0aGUgRkRUIGluIHRoZSBlYXJseSBib290IHBhZ2UgdGFibGUgKi8K
Ky8qIE1hcCB0aGUgRkRUIGluIHRoZSBydW50aW1lIHBhZ2UgdGFibGUgKi8KIHZvaWQgKiBfX2lu
aXQgZWFybHlfZmR0X21hcChwYWRkcl90IGZkdF9wYWRkcikKIHsKICAgICAvKiBXZSBhcmUgdXNp
bmcgMk1CIHN1cGVycGFnZSBmb3IgbWFwcGluZyB0aGUgRkRUICovCkBAIC01NjgsNyArNTY4LDcg
QEAgdm9pZCAqIF9faW5pdCBlYXJseV9mZHRfbWFwKHBhZGRyX3QgZmR0X3BhZGRyKQogICAgIC8q
IFRoZSBGRFQgaXMgbWFwcGVkIHVzaW5nIDJNQiBzdXBlcnBhZ2UgKi8KICAgICBCVUlMRF9CVUdf
T04oQk9PVF9GRFRfVklSVF9TVEFSVCAlIFNaXzJNKTsKIAotICAgIGNyZWF0ZV9tYXBwaW5ncyhi
b290X3NlY29uZCwgQk9PVF9GRFRfVklSVF9TVEFSVCwgcGFkZHJfdG9fcGZuKGJhc2VfcGFkZHIp
LAorICAgIGNyZWF0ZV9tYXBwaW5ncyh4ZW5fc2Vjb25kLCBCT09UX0ZEVF9WSVJUX1NUQVJULCBw
YWRkcl90b19wZm4oYmFzZV9wYWRkciksCiAgICAgICAgICAgICAgICAgICAgIFNaXzJNID4+IFBB
R0VfU0hJRlQsIFNaXzJNKTsKIAogICAgIG9mZnNldCA9IGZkdF9wYWRkciAlIFNFQ09ORF9TSVpF
OwpAQCAtNTgzLDcgKzU4Myw3IEBAIHZvaWQgKiBfX2luaXQgZWFybHlfZmR0X21hcChwYWRkcl90
IGZkdF9wYWRkcikKIAogICAgIGlmICggKG9mZnNldCArIHNpemUpID4gU1pfMk0gKQogICAgIHsK
LSAgICAgICAgY3JlYXRlX21hcHBpbmdzKGJvb3Rfc2Vjb25kLCBCT09UX0ZEVF9WSVJUX1NUQVJU
ICsgU1pfMk0sCisgICAgICAgIGNyZWF0ZV9tYXBwaW5ncyh4ZW5fc2Vjb25kLCBCT09UX0ZEVF9W
SVJUX1NUQVJUICsgU1pfMk0sCiAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90b19wZm4o
YmFzZV9wYWRkciArIFNaXzJNKSwKICAgICAgICAgICAgICAgICAgICAgICAgIFNaXzJNID4+IFBB
R0VfU0hJRlQsIFNaXzJNKTsKICAgICB9CkBAIC02OTQsMTIgKzY5NCw2IEBAIHZvaWQgX19pbml0
IHNldHVwX3BhZ2V0YWJsZXModW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0KQogICAgIHB0
ZS5wdC50YWJsZSA9IDE7CiAgICAgeGVuX3NlY29uZFtzZWNvbmRfdGFibGVfb2Zmc2V0KEZJWE1B
UF9BRERSKDApKV0gPSBwdGU7CiAKLSAgICAvKiAuLi4gRFRCICovCi0gICAgcHRlID0gYm9vdF9z
ZWNvbmRbc2Vjb25kX3RhYmxlX29mZnNldChCT09UX0ZEVF9WSVJUX1NUQVJUKV07Ci0gICAgeGVu
X3NlY29uZFtzZWNvbmRfdGFibGVfb2Zmc2V0KEJPT1RfRkRUX1ZJUlRfU1RBUlQpXSA9IHB0ZTsK
LSAgICBwdGUgPSBib290X3NlY29uZFtzZWNvbmRfdGFibGVfb2Zmc2V0KEJPT1RfRkRUX1ZJUlRf
U1RBUlQgKyBTWl8yTSldOwotICAgIHhlbl9zZWNvbmRbc2Vjb25kX3RhYmxlX29mZnNldChCT09U
X0ZEVF9WSVJUX1NUQVJUICsgU1pfMk0pXSA9IHB0ZTsKLQogI2lmZGVmIENPTkZJR19BUk1fNjQK
ICAgICB0dGJyID0gKHVpbnRwdHJfdCkgeGVuX3BndGFibGUgKyBwaHlzX29mZnNldDsKICNlbHNl
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5j
CmluZGV4IDZkZmJiYTI5MjcuLmY3YTM5OWNlODkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9z
ZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCkBAIC03NTQsNiArNzU0LDggQEAgdm9p
ZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwKICAgICAv
KiBJbml0aWFsaXplIHRyYXBzIGVhcmx5IGFsbG93IHVzIHRvIGdldCBiYWNrdHJhY2Ugd2hlbiBh
biBlcnJvciBvY2N1cnJlZCAqLwogICAgIGluaXRfdHJhcHMoKTsKIAorICAgIHNldHVwX3BhZ2V0
YWJsZXMoYm9vdF9waHlzX29mZnNldCk7CisKICAgICBzbXBfY2xlYXJfY3B1X21hcHMoKTsKIAog
ICAgIGRldmljZV90cmVlX2ZsYXR0ZW5lZCA9IGVhcmx5X2ZkdF9tYXAoZmR0X3BhZGRyKTsKQEAg
LTc3NSw4ICs3NzcsNiBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290
X3BoeXNfb2Zmc2V0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocGFkZHJfdCkodWlu
dHB0cl90KShfZW5kIC0gX3N0YXJ0ICsgMSksIGZhbHNlKTsKICAgICBCVUdfT04oIXhlbl9ib290
bW9kdWxlKTsKIAotICAgIHNldHVwX3BhZ2V0YWJsZXMoYm9vdF9waHlzX29mZnNldCk7Ci0KICAg
ICBzZXR1cF9tbShmZHRfcGFkZHIsIGZkdF9zaXplKTsKIAogICAgIC8qIFBhcnNlIHRoZSBBQ1BJ
IHRhYmxlcyBmb3IgcG9zc2libGUgYm9vdC10aW1lIGNvbmZpZ3VyYXRpb24gKi8KLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
