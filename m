Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DF7C10F13
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:13:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5EA920880
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5EA920880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDhBz-0006ls-CO; Tue, 09 Apr 2019 03:12:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nMgv=SL=citrix.com=prvs=995126bee=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hDhBy-0006lF-2u
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:12:58 +0000
X-Inumbo-ID: 5f70f893-5a75-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5f70f893-5a75-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 03:12:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,327,1549929600"; d="scan'208";a="83070520"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <edk2-devel@lists.01.org>
Date: Tue, 9 Apr 2019 04:12:39 +0100
Message-ID: <1554779560-26204-3-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/3] OvmfPkg/XenSupport: use a correct PCI
 host bridge aperture for BAR64
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org,
 jordan.l.justen@intel.com, julien.grall@arm.com, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, lersek@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409031239.Xbgrcqq9aqGour366zedNj-sgHoGOGJtR2cfMDnpM7g@z>

SW4gY2FzZSBCQVI2NCBpcyBwbGFjZWQgYmVsb3cgNEcgY2hvb3NlIHRoZSBjb3JyZWN0IGFwZXJ0
dXJlLgpUaGlzIGZpeGVzIGEgZmFpbGVkIGFzc2VydGlvbiBkb3duIHRoZSBjb2RlIHBhdGguCgpD
b250cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQgMS4xCkFj
a2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KU2lnbmVk
LW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQog
T3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jIHwgNiArKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMgYi9Pdm1m
UGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKaW5kZXggNWVhNjNmNy4u
Zjc2MzEzNCAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVu
U3VwcG9ydC5jCisrKyBiL092bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hlblN1cHBv
cnQuYwpAQCAtMTQzLDcgKzE0MywxMSBAQCBQY2F0UGNpUm9vdEJyaWRnZVBhcnNlQmFycyAoCiAg
ICAgICAgICAgTGVuZ3RoID0gTGVuZ3RoIHwgTFNoaWZ0VTY0ICgoVUlOVDY0KSBVcHBlclZhbHVl
LCAzMik7CiAgICAgICAgICAgTGVuZ3RoID0gKH5MZW5ndGgpICsgMTsKIAotICAgICAgICAgIE1l
bUFwZXJ0dXJlID0gTWVtQWJvdmU0RzsKKyAgICAgICAgICBpZiAoQmFzZSA8IEJBU0VfNEdCKSB7
CisgICAgICAgICAgICBNZW1BcGVydHVyZSA9IE1lbTsKKyAgICAgICAgICB9IGVsc2UgeworICAg
ICAgICAgICAgTWVtQXBlcnR1cmUgPSBNZW1BYm92ZTRHOworICAgICAgICAgIH0KICAgICAgICAg
fQogCiAgICAgICAgIExpbWl0ID0gQmFzZSArIExlbmd0aCAtIDE7Ci0tIAoyLjcuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
