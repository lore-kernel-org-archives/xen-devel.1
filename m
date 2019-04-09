Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA09EC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:03:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DDEC20833
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DDEC20833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpSk-0005ll-EY; Tue, 09 Apr 2019 12:02:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nMgv=SL=citrix.com=prvs=995126bee=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hDpSi-0005lg-U1
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:02:48 +0000
X-Inumbo-ID: 635a2c0c-5abf-11e9-b2af-636ebe69cf00
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 635a2c0c-5abf-11e9-b2af-636ebe69cf00;
 Tue, 09 Apr 2019 12:02:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83098628"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 9 Apr 2019 13:01:58 +0100
Message-ID: <1554811318-1931-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] tools/xl: use libxl_domain_info to get
 domain type for vcpu-pin
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
Cc: ian.jackson@eu.citrix.com, wei.liu2@citrix.com,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409120158.Zq2iItqJO-5UtrsBba7v7zxJK9e_wDlSR93cKkKuwxw@z>

UGFyc2luZyB0aGUgY29uZmlnIHNlZW1zIHRvIGJlIGFuIG92ZXJraWxsIGZvciB0aGlzIHBhcnRp
Y3VsYXIgdGFzawphbmQgdGhlIGNvbmZpZyBtaWdodCBzaW1wbHkgYmUgYWJzZW50LiBUeXBlIHJl
dHVybmVkIGZyb20gbGlieGxfZG9tYWluX2luZm8Kc2hvdWxkIGJlIGVpdGhlciBMSUJYTF9ET01B
SU5fVFlQRV9IVk0gb3IgTElCWExfRE9NQUlOX1RZUEVfUFYgYnV0IGluCnRoYXQgY29udGV4dCBk
aXN0aW5jdGlvbiBiZXR3ZWVuIFBWSCBhbmQgSFZNIHNob3VsZCBiZSBpcnJlbGV2YW50LgoKU2ln
bmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0t
LQogdG9vbHMveGwveGxfdmNwdS5jIHwgMTUgKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy94
bC94bF92Y3B1LmMgYi90b29scy94bC94bF92Y3B1LmMKaW5kZXggNzFkM2E1Yy4uOTNhYmNjNiAx
MDA2NDQKLS0tIGEvdG9vbHMveGwveGxfdmNwdS5jCisrKyBiL3Rvb2xzL3hsL3hsX3ZjcHUuYwpA
QCAtNzksNyArNzksNiBAQCB2b2lkIGFwcGx5X2dsb2JhbF9hZmZpbml0eV9tYXNrcyhsaWJ4bF9k
b21haW5fdHlwZSB0eXBlLAogCiAgICAgc3dpdGNoICh0eXBlKSB7CiAgICAgY2FzZSBMSUJYTF9E
T01BSU5fVFlQRV9IVk06Ci0gICAgY2FzZSBMSUJYTF9ET01BSU5fVFlQRV9QVkg6CiAgICAgICAg
IHR5cGVfbWFzayA9ICZnbG9iYWxfaHZtX2FmZmluaXR5X21hc2s7CiAgICAgICAgIGJyZWFrOwog
ICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfUFY6CkBAIC0yODQsMTkgKzI4MywxNSBAQCBpbnQg
bWFpbl92Y3B1cGluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAogICAgIC8qIE9ubHkgaGFyZCBh
ZmZpbml0eSBtYXR0ZXJzIGhlcmUgKi8KICAgICBpZiAoIWlnbm9yZV9tYXNrcykgewotICAgICAg
ICBsaWJ4bF9kb21haW5fY29uZmlnIGRfY29uZmlnOworICAgICAgICBsaWJ4bF9kb21pbmZvIGRv
bWluZm87CiAKLSAgICAgICAgbGlieGxfZG9tYWluX2NvbmZpZ19pbml0KCZkX2NvbmZpZyk7Ci0g
ICAgICAgIHJjID0gbGlieGxfcmV0cmlldmVfZG9tYWluX2NvbmZpZ3VyYXRpb24oY3R4LCBkb21p
ZCwgJmRfY29uZmlnKTsKLSAgICAgICAgaWYgKHJjKSB7Ci0gICAgICAgICAgICBmcHJpbnRmKHN0
ZGVyciwgIkNvdWxkIG5vdCByZXRyaWV2ZSBkb21haW4gY29uZmlndXJhdGlvblxuIik7Ci0gICAg
ICAgICAgICBsaWJ4bF9kb21haW5fY29uZmlnX2Rpc3Bvc2UoJmRfY29uZmlnKTsKKyAgICAgICAg
aWYgKGxpYnhsX2RvbWFpbl9pbmZvKGN0eCwgJmRvbWluZm8sIGRvbWlkKSkgeworICAgICAgICAg
ICAgZnByaW50ZihzdGRlcnIsICJDb3VsZCBub3QgZ2V0IGRvbWFpbiBpbmZvXG4iKTsKICAgICAg
ICAgICAgIGdvdG8gb3V0OwogICAgICAgICB9CiAKLSAgICAgICAgYXBwbHlfZ2xvYmFsX2FmZmlu
aXR5X21hc2tzKGRfY29uZmlnLmJfaW5mby50eXBlLCBoYXJkLCAxKTsKLQotICAgICAgICBsaWJ4
bF9kb21haW5fY29uZmlnX2Rpc3Bvc2UoJmRfY29uZmlnKTsKKyAgICAgICAgLyogSFZNIGFuZCBQ
VkggZG9tYWlucyB1c2UgdGhlIHNhbWUgZ2xvYmFsIGFmZmluaXR5IG1hc2sgKi8KKyAgICAgICAg
YXBwbHlfZ2xvYmFsX2FmZmluaXR5X21hc2tzKGRvbWluZm8uZG9tYWluX3R5cGUsIGhhcmQsIDEp
OwogICAgIH0KIAogICAgIGlmIChmb3JjZSkgewotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
