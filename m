Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11988C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCCE420850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCCE420850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAH-0006L0-8I; Wed, 10 Apr 2019 14:25:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAE-0006FL-8J
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:22 +0000
X-Inumbo-ID: 78f2b22b-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 78f2b22b-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227689"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:26 +0100
Message-ID: <20190410142408.22848-21-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 20/62] ts-guests-nbd-mirror: use
 target_{get, put}file_root to transfter cfg
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
Message-ID: <20190410142326.Al7d3ZB9KamFweqWqvlSTFxx5CKKe3OMl6flSZ5Zuvo@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZSBvcmlnaW5hbCBjb2RlIHVz
ZWQgdGFyZ2V0X2NtZF9vdXRwdXRfcm9vdCB3aGljaCBjYXVzZWQgYSB0cmFpbGluZwpuZXcgbGlu
ZSB0byBiZSBkZWxldGVkLCB3aGljaCBjYXVzZWQgbGlidmlydCBjb252ZXJ0ZXIgdG8gZmFpbC4K
Ckl0IHdhc24ndCBkaXNjb3ZlcmVkIHVudGlsIG5vdyBiZWNhdXNlIHdlIGFwcGVuZGVkIHRvbyBt
YW55ICJcbiIuCgpVc2UgdGFyZ2V0X3tnZXQscHV0fWZpbGVfcm9vdCB0byBkbyB0aGUgam9iLgoK
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0cy1ndWVz
dHMtbmJkLW1pcnJvciB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90cy1ndWVzdHMtbmJkLW1pcnJvciBiL3Rz
LWd1ZXN0cy1uYmQtbWlycm9yCmluZGV4IDdlYTMxZjdjLi4wNjkwM2FhYSAxMDA3NTUKLS0tIGEv
dHMtZ3Vlc3RzLW5iZC1taXJyb3IKKysrIGIvdHMtZ3Vlc3RzLW5iZC1taXJyb3IKQEAgLTE1NCw4
ICsxNTQsMTEgQEAgc3ViIHNodWZmbGVjb25maWdzICgpIHsKIAlteSAkZ249ICRnbnNbJGldOwog
CW15ICRnaG89ICRnaG9zWyRpXTsKIAlteSAkY2ZncGF0aD0gJHJ7ICIkZ2hvLT57R3Vlc3R9X2Nm
Z3BhdGgiIH07Ci0JbXkgJGNmZ2RhdGE9IHRhcmdldF9jbWRfb3V0cHV0X3Jvb3QoJHNobywiY2F0
ICRjZmdwYXRoIik7Ci0JdGFyZ2V0X3B1dGZpbGVjb250ZW50c19yb290X3N0YXNoKCRjaG8sMTAs
JGNmZ2RhdGEsJGNmZ3BhdGgpOworCW15ICRmaWxlPSAkY2ZncGF0aDsKKwkkZmlsZT1+IHMsLywt
LGc7CisJJGZpbGU9ICIkc3Rhc2gvIi5ob3N0bmFtZXBhdGgoJGNobykuIi0tJGZpbGUiOworCXRh
cmdldF9nZXRmaWxlX3Jvb3QoJHNobywgNjAsICRjZmdwYXRoLCAkZmlsZSk7CisJdGFyZ2V0X3B1
dGZpbGVfcm9vdCgkY2hvLCA2MCwgJGZpbGUsICRjZmdwYXRoKTsKICAgICB9CiB9CiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
