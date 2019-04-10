Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E83C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70DF020850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70DF020850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAE-0006FP-8B; Wed, 10 Apr 2019 14:25:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAB-0006C8-Ow
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:19 +0000
X-Inumbo-ID: 770812c2-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 770812c2-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227656"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:11 +0100
Message-ID: <20190410142408.22848-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 05/62] ts-xen-install: install some
 packages on stretch
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
Message-ID: <20190410142311.krspZYgcZSo7d6eZz1QllsqJu_Bd8aA8RNLAJlwxnss@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZSAicm91dGUiIGNvbW1hbmQg
aXMgbm93IGluIHRoYXQgcGFja2FnZS4KCmxpYm5sIGlzIG5lZWRlZCB3aGVuIHJ1bm5pbmcgeGwu
CgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpBY2tlZC1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQp2MzogaW52ZXJ0IGNv
bmRpdGlvbi4KLS0tCiB0cy14ZW4taW5zdGFsbCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdHMteGVuLWluc3RhbGwgYi90cy14ZW4taW5zdGFs
bAppbmRleCA4ZGU5NGFjMi4uODA5NTI4NTcgMTAwNzU1Ci0tLSBhL3RzLXhlbi1pbnN0YWxsCisr
KyBiL3RzLXhlbi1pbnN0YWxsCkBAIC01Miw2ICs1Miw5IEBAIHN1YiBwYWNrYWdlcyAoKSB7CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlic2RsMS4yZGViaWFuIGxpYmdsaWIyLjAt
MCBsaWJsem1hNQogCQkJICAgICAgIHFlbXUtdXRpbHMKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBuZXRjYXQtb3BlbmJzZCkpOworICAgIGlmICgkaG8tPntTdWl0ZX0gIX4gbS9zcXVl
ZXplfHdoZWV6eXxqZXNzaWUvKSB7CisgICAgICAgIHRhcmdldF9pbnN0YWxsX3BhY2thZ2VzKCRo
bywgJ25ldC10b29scyBsaWJubC1yb3V0ZS0zLTIwMCcpOworICAgIH0KICAgICBpZiAoJGhvLT57
U3VpdGV9ID1+IG0vamVzc2llLykgewogICAgICAgICB0YXJnZXRfaW5zdGFsbF9wYWNrYWdlcygk
aG8sICdsaWJubC1yb3V0ZS0zLTIwMCcpOwogICAgIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
