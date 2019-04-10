Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29CFC10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9877A20850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9877A20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAF-0006Hb-CQ; Wed, 10 Apr 2019 14:25:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAC-0006D0-Rx
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:20 +0000
X-Inumbo-ID: 77e5b1d7-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 77e5b1d7-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227675"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:19 +0100
Message-ID: <20190410142408.22848-14-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 13/62] Extend workaround
 `clk_ignore_unused' to stretch
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Julien Grall <julien.grall@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142319.117mCB0h6De-e4VsZX585YBEEMsQZUveWP1WOfQOjbA@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoaXMgaXMgaHR0cHM6Ly9idWdz
LnhlbnByb2plY3Qub3JnL3hlbi9idWcvNDUKCldpdGhvdXQgdGhhdCBwYXJhbWV0ZXIgd2UgbG9z
ZSB1YXJ0IG91dHB1dC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgotLS0KIE9zc3Rlc3QvRGViaWFu
LnBtIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0ZXN0L0RlYmlhbi5wbQppbmRl
eCA4MmI1ZmI0MC4uOTFiZmZkZmYgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvRGViaWFuLnBtCisrKyBi
L09zc3Rlc3QvRGViaWFuLnBtCkBAIC0yNDEsNyArMjQxLDcgQEAgRU5ECiAJcHVzaCBAeGVua29w
dCwgJHhlbmtvcHQ7CiAJIyBodHRwOi8vYnVncy54ZW5wcm9qZWN0Lm9yZy94ZW4vYnVnLzQ1CiAJ
cHVzaCBAeGVua29wdCwgImNsa19pZ25vcmVfdW51c2VkIgotCSAgICBpZiAkaG8tPntTdWl0ZX0g
PX4gbS93aGVlenl8amVzc2llLzsKKwkgICAgaWYgJGhvLT57U3VpdGV9ID1+IG0vd2hlZXp5fGpl
c3NpZXxzdHJldGNoLzsKIAogCSR4ZW5rb3B0ID0gam9pbiAnICcsIEB4ZW5rb3B0OwogCWxvZ20o
IkRvbTAgTGludXggb3B0aW9uczogJHhlbmtvcHQiKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
