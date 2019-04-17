Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D9FC282DC
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:58:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F6F20663
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11F6F20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGopF-00049V-9Y; Wed, 17 Apr 2019 17:58:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGopE-00048n-08
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 17:58:24 +0000
X-Inumbo-ID: 645d5ff8-613a-11e9-ad61-234692ca7bf5
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 645d5ff8-613a-11e9-ad61-234692ca7bf5;
 Wed, 17 Apr 2019 17:58:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A9271688;
 Wed, 17 Apr 2019 10:58:22 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A4B43F59C;
 Wed, 17 Apr 2019 10:58:21 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Apr 2019 18:58:09 +0100
Message-Id: <20190417175815.16905-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190417175815.16905-1-julien.grall@arm.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 1/7] xen/arm: mm: Consolidate setting
 SCTLR_EL2.WXN in a single place
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
Message-ID: <20190417175809.6angV9siRdpV8BQ-8V_ev46g-1Iv97FXbV0gF4lOTPs@z>

VGhlIGxvZ2ljIHRvIHNldCBTQ1RMUl9FTDIuV1hOIGlzIHRoZSBzYW1lIGZvciB0aGUgYm9vdCBD
UFUgYW5kCm5vbi1ib290IENQVS4gU28gaW50cm9kdWNlIGEgZnVuY3Rpb24gdG8gc2V0IHRoZSBi
aXQgYW5kIGNsZWFyIFRCTHMuCgpUaGlzIG5ldyBmdW5jdGlvbiB3aWxsIGhlbHAgdXMgdG8gZG9j
dW1lbnQgYW5kIHVwZGF0ZSB0aGUgbG9naWMgaW4gYQpzaW5nbGUgcGxhY2UuCgpTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2Fy
bS9tbS5jIHwgMjIgKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21t
LmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCAwMWFlMmNjY2MwLi45M2FkMTE4MTgzIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtNjAx
LDYgKzYwMSwxOSBAQCB2b2lkIF9faW5pdCByZW1vdmVfZWFybHlfbWFwcGluZ3Modm9pZCkKICAg
ICBmbHVzaF94ZW5fZGF0YV90bGJfcmFuZ2VfdmEoQk9PVF9GRFRfVklSVF9TVEFSVCwgQk9PVF9G
RFRfU0xPVF9TSVpFKTsKIH0KIAorLyoKKyAqIEFmdGVyIGJvb3QsIFhlbiBwYWdlLXRhYmxlcyBz
aG91bGQgbm90IGNvbnRhaW4gbWFwcGluZyB0aGF0IGFyZSBib3RoCisgKiBXcml0YWJsZSBhbmQg
ZVhlY3V0YWJsZXMuCisgKgorICogVGhpcyBzaG91bGQgYmUgY2FsbGVkIG9uIGVhY2ggQ1BVIHRv
IGVuZm9yY2UgdGhlIHBvbGljeS4KKyAqLworc3RhdGljIHZvaWQgeGVuX3B0X2VuZm9yY2Vfd254
KHZvaWQpCit7CisgICAgV1JJVEVfU1lTUkVHMzIoUkVBRF9TWVNSRUczMihTQ1RMUl9FTDIpIHwg
U0NUTFJfV1hOLCBTQ1RMUl9FTDIpOworICAgIC8qIEZsdXNoIGV2ZXJ5dGhpbmcgYWZ0ZXIgc2V0
dGluZyBXWE4gYml0LiAqLworICAgIGZsdXNoX3hlbl90ZXh0X3RsYl9sb2NhbCgpOworfQorCiBl
eHRlcm4gdm9pZCBzd2l0Y2hfdHRicih1aW50NjRfdCB0dGJyKTsKIAogLyogQ2xlYXIgYSB0cmFu
c2xhdGlvbiB0YWJsZSBhbmQgY2xlYW4gJiBpbnZhbGlkYXRlIHRoZSBjYWNoZSAqLwpAQCAtNzAy
LDEwICs3MTUsNyBAQCB2b2lkIF9faW5pdCBzZXR1cF9wYWdldGFibGVzKHVuc2lnbmVkIGxvbmcg
Ym9vdF9waHlzX29mZnNldCkKICAgICBjbGVhcl90YWJsZShib290X3NlY29uZCk7CiAgICAgY2xl
YXJfdGFibGUoYm9vdF90aGlyZCk7CiAKLSAgICAvKiBGcm9tIG5vdyBvbiwgbm8gbWFwcGluZyBt
YXkgYmUgYm90aCB3cml0YWJsZSBhbmQgZXhlY3V0YWJsZS4gKi8KLSAgICBXUklURV9TWVNSRUcz
MihSRUFEX1NZU1JFRzMyKFNDVExSX0VMMikgfCBTQ1RMUl9XWE4sIFNDVExSX0VMMik7Ci0gICAg
LyogRmx1c2ggZXZlcnl0aGluZyBhZnRlciBzZXR0aW5nIFdYTiBiaXQuICovCi0gICAgZmx1c2hf
eGVuX3RleHRfdGxiX2xvY2FsKCk7CisgICAgeGVuX3B0X2VuZm9yY2Vfd254KCk7CiAKICNpZmRl
ZiBDT05GSUdfQVJNXzMyCiAgICAgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgMCkgPSBjcHUwX3BndGFi
bGU7CkBAIC03NzcsOSArNzg3LDcgQEAgaW50IGluaXRfc2Vjb25kYXJ5X3BhZ2V0YWJsZXMoaW50
IGNwdSkKIC8qIE1NVSBzZXR1cCBmb3Igc2Vjb25kYXJ5IENQVVMgKHdoaWNoIGFscmVhZHkgaGF2
ZSBwYWdpbmcgZW5hYmxlZCkgKi8KIHZvaWQgbW11X2luaXRfc2Vjb25kYXJ5X2NwdSh2b2lkKQog
ewotICAgIC8qIEZyb20gbm93IG9uLCBubyBtYXBwaW5nIG1heSBiZSBib3RoIHdyaXRhYmxlIGFu
ZCBleGVjdXRhYmxlLiAqLwotICAgIFdSSVRFX1NZU1JFRzMyKFJFQURfU1lTUkVHMzIoU0NUTFJf
RUwyKSB8IFNDVExSX1dYTiwgU0NUTFJfRUwyKTsKLSAgICBmbHVzaF94ZW5fdGV4dF90bGJfbG9j
YWwoKTsKKyAgICB4ZW5fcHRfZW5mb3JjZV93bngoKTsKIH0KIAogI2lmZGVmIENPTkZJR19BUk1f
MzIKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
