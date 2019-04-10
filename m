Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A011C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:29:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C58720850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C58720850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEDu-0003kn-82; Wed, 10 Apr 2019 14:29:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEDt-0003kG-Iw
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:29:09 +0000
X-Inumbo-ID: 779ce28a-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 779ce28a-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227676"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:20 +0100
Message-ID: <20190410142408.22848-15-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 14/62] adjust how to skip bootloader
 installation for arm32, in Stretch
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
Cc: Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142320.1BJoCARgbSGlc-Mv24CjT5gEN6SB4izHx1-bKdhq9Eo@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCnY0OiBDaGFuZ2UgY2FzZSBvZiBzdWl0ZSBuYW1lcyBpbiBj
b21tZW50LgotLS0KIE9zc3Rlc3QvRGViaWFuLnBtIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0ZXN0
L0RlYmlhbi5wbQppbmRleCA5MWJmZmRmZi4uODViMTg5MGQgMTAwNjQ0Ci0tLSBhL09zc3Rlc3Qv
RGViaWFuLnBtCisrKyBiL09zc3Rlc3QvRGViaWFuLnBtCkBAIC0xMDQxLDcgKzEwNDEsMTEgQEAg
RU5ECiAJIyBhY3R1YWxseSBkb2VzIHdoYXQgd2UgbmVlZCwgYnV0IHRoZSBpbnN0YWxsZXIgZG9l
c24ndCB0cmVhdAogCSMgdGhhdCBhcyBhICJib290bG9hZGVyIi4KIAkkcHJlc2VlZF9maWxlLj0g
KDw8RU5EKTsKKyAgICAgICAgIyBqZXNzaWUgYW5kIGVhcmxpZXIKIGQtaSAgICAgbm9ib290bG9h
ZGVyL2NvbmZpcm1hdGlvbl9jb21tb24gYm9vbGVhbiB0cnVlCisgICAgICAgICMgc3RyZXRjaCBh
bmQgbGF0ZXIKK2QtaSAgICAgZ3J1Yi1pbnN0YWxsZXIvc2tpcCBib29sZWFuIHRydWUKK2QtaSAg
ICAgbGlsby1pbnN0YWxsZXIvc2tpcCBib29sZWFuIHRydWUKIEVORAogCiAgICAgICAgICMgRGVi
aWFuIEJ1ZyAjNzcxOTQ5IG1lYW5zIHRoYXQgdXBkYXRlLW1lbnUtbGlzdCBhbHdheXMKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
