Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E7AC10F14
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:24:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F46121473
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F46121473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDVC4-0000vR-8a; Mon, 08 Apr 2019 14:24:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RaUp=SK=citrix.com=prvs=994f31c19=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDVC3-0000vB-2M
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:24:15 +0000
X-Inumbo-ID: fa1bfeb0-5a09-11e9-9b93-9f565c793632
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa1bfeb0-5a09-11e9-9b93-9f565c793632;
 Mon, 08 Apr 2019 14:24:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,325,1549929600"; d="scan'208";a="83009843"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <edk2-devel@lists.01.org>
Date: Mon, 8 Apr 2019 15:23:38 +0100
Message-ID: <20190408142408.30419-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408142408.30419-1-anthony.perard@citrix.com>
References: <20190408142408.30419-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 01/31] OvmfPkg/ResetSystemLib: Add missing
 dependency on PciLib
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
Message-ID: <20190408142338.igNke35jAkrPsolSg0CmP1p3EUlgHc4wzKz871ilGNo@z>

YW5kIHJlbW92ZSBleHRyYSBpbmNsdWRlcyBvZiBPdm1mUGxhdGZvcm1zLmguCgpDb250cmlidXRl
ZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQgMS4xClNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KCk5vdGVz
OgogICAgdjI6CiAgICAtIGFsc28gYWRkIFBjaUxpYi5oIGluY2x1ZGUgdG8gdGhlIC5jCiAgICAt
IGFuZCByZW1vdmUgZXh0cmEgaW5jbHVkZSBvZiBPdm1mUGxhdGZvcm1zLmgKCiBPdm1mUGtnL0xp
YnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuaW5mIHwgMSArCiBPdm1mUGtnL0xp
YnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuYyAgIHwgMyArLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL092
bWZQa2cvTGlicmFyeS9SZXNldFN5c3RlbUxpYi9SZXNldFN5c3RlbUxpYi5pbmYgYi9Pdm1mUGtn
L0xpYnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuaW5mCmluZGV4IDM5Y2E4MDU3
MzAuLmViZDcyMmU2NmIgMTAwNjQ0Ci0tLSBhL092bWZQa2cvTGlicmFyeS9SZXNldFN5c3RlbUxp
Yi9SZXNldFN5c3RlbUxpYi5pbmYKKysrIGIvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGli
L1Jlc2V0U3lzdGVtTGliLmluZgpAQCAtMzYsNCArMzYsNSBAQCBbUGFja2FnZXNdCiBbTGlicmFy
eUNsYXNzZXNdCiAgIERlYnVnTGliCiAgIElvTGliCisgIFBjaUxpYgogICBUaW1lckxpYgpkaWZm
IC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmMg
Yi9Pdm1mUGtnL0xpYnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuYwppbmRleCBj
Yzc1ZDA0NmE4Li45MzQ4NTAyODM2IDEwMDY0NAotLS0gYS9Pdm1mUGtnL0xpYnJhcnkvUmVzZXRT
eXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuYworKysgYi9Pdm1mUGtnL0xpYnJhcnkvUmVzZXRTeXN0
ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuYwpAQCAtMTcsMTEgKzE3LDEwIEBACiAjaW5jbHVkZSA8TGli
cmFyeS9CYXNlTGliLmg+CiAjaW5jbHVkZSA8TGlicmFyeS9EZWJ1Z0xpYi5oPgogI2luY2x1ZGUg
PExpYnJhcnkvSW9MaWIuaD4KKyNpbmNsdWRlIDxMaWJyYXJ5L1BjaUxpYi5oPgogI2luY2x1ZGUg
PExpYnJhcnkvVGltZXJMaWIuaD4KICNpbmNsdWRlIDxPdm1mUGxhdGZvcm1zLmg+CiAKLSNpbmNs
dWRlIDxPdm1mUGxhdGZvcm1zLmg+Ci0KIFZPSUQKIEFjcGlQbUNvbnRyb2wgKAogICBVSU5UTiBT
dXNwZW5kVHlwZQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
