Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1F3C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 825B120883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 825B120883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDovN-0000xA-5A; Tue, 09 Apr 2019 11:28:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDovL-0000tN-41
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:28:19 +0000
X-Inumbo-ID: 92caec98-5aba-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 92caec98-5aba-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 11:28:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83096477"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 9 Apr 2019 12:08:29 +0100
Message-ID: <20190409110844.14746-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 16/31] OvmfPkg/XenPlatformPei: Introduce
 XenHvmloaderDetected
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409110829.CS6j_eNFwirdD34MAiJ6KjRdmVLs6seeG2WKLL2faD0@z>

Q29udHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQpT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
LS0tCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmggfCA1ICsrKysrCiBPdm1mUGtn
L1hlblBsYXRmb3JtUGVpL1hlbi5jICAgICAgfCA3ICsrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxh
dGZvcm0uaCBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaAppbmRleCA2Y2NkNWVi
NjZjLi41NTY1ZDQ3ZTM0IDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRm
b3JtLmgKKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCkBAIC05NSw2ICs5
NSwxMSBAQCBYZW5EZXRlY3QgKAogICBWT0lECiAgICk7CiAKK0JPT0xFQU4KK1hlbkh2bWxvYWRl
ckRldGVjdGVkICgKKyAgVk9JRAorICApOworCiBWT0lECiBBbWRTZXZJbml0aWFsaXplICgKICAg
Vk9JRApkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092bWZQa2cv
WGVuUGxhdGZvcm1QZWkvWGVuLmMKaW5kZXggOWQ5ZTlmODAyMC4uODk5MzNlYzNlOSAxMDA2NDQK
LS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYworKysgYi9Pdm1mUGtnL1hlblBsYXRm
b3JtUGVpL1hlbi5jCkBAIC0yMDIsNiArMjAyLDEzIEBAIFhlbkRldGVjdCAoCiAgIHJldHVybiBG
QUxTRTsKIH0KIAorQk9PTEVBTgorWGVuSHZtbG9hZGVyRGV0ZWN0ZWQgKAorICBWT0lECisgICkK
K3sKKyAgcmV0dXJuIChtWGVuSHZtbG9hZGVySW5mbyAhPSBOVUxMKTsKK30KIAogVk9JRAogWGVu
UHVibGlzaFJhbVJlZ2lvbnMgKAotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
