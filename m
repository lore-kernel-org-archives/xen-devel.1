Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1D6C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:51:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1120F2077C
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1120F2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJgeS-0002qa-7j; Thu, 25 Apr 2019 15:51:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JXZu=S3=citrix.com=prvs=011b70836=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hJgeR-0002pZ-64
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:51:07 +0000
X-Inumbo-ID: edee0dc0-6771-11e9-9fff-4b8dfb8fe4e9
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edee0dc0-6771-11e9-9fff-4b8dfb8fe4e9;
 Thu, 25 Apr 2019 15:51:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84415674"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Apr 2019 16:50:52 +0100
Message-ID: <20190425155056.23145-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
References: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/6] sg-run-job,
 ts-host-install: New --build option
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425155052.t-5mWiFOdD-viQbvBtKVBIxlnYWl0V37NrXbKRdyoFc@z>

VXNlZCB0byBzcGVjaWZ5IHRoYXQgdGhlIGhvc3Qgd2lsbCBiZSB1c2VkIGZvciBidWlsZGluZy4g
IEN1cnJlbnRseQpoYXMgbm8gZWZmZWN0LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogc2ctcnVuLWpvYiAgICAgIHwgMiArLQogdHMt
aG9zdC1pbnN0YWxsIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NnLXJ1bi1qb2IgYi9zZy1ydW4tam9iCmluZGV4IDU2
YjYzODRhLi43YzU4ZDRiYSAxMDA3NTUKLS0tIGEvc2ctcnVuLWpvYgorKysgYi9zZy1ydW4tam9i
CkBAIC03MzQsNyArNzM0LDcgQEAgcHJvYyBhbGxvY2F0ZS1idWlsZC1ob3N0IHtvc3R5cGV9IHsK
IH0KIHByb2MgcHJlcGFyZS1idWlsZC1ob3N0LWxpbnV4IHt9IHsKICAgICBnbG9iYWwgam9iaW5m
bwotICAgIHJ1bi10cyBicm9rZW4gaG9zdC1pbnN0YWxsKCopIHRzLWhvc3QtaW5zdGFsbC10d2lj
ZQorICAgIHJ1bi10cyBicm9rZW4gaG9zdC1pbnN0YWxsKCopIHRzLWhvc3QtaW5zdGFsbC10d2lj
ZSArIC0tYnVpbGQKICAgICBydW4tdHMgLiBob3N0LWJ1aWxkLXByZXAgdHMteGVuLWJ1aWxkLXBy
ZXAKIH0KIApkaWZmIC0tZ2l0IGEvdHMtaG9zdC1pbnN0YWxsIGIvdHMtaG9zdC1pbnN0YWxsCmlu
ZGV4IDQyMTNjM2EyLi43MDk0NTU5ZiAxMDA3NTUKLS0tIGEvdHMtaG9zdC1pbnN0YWxsCisrKyBi
L3RzLWhvc3QtaW5zdGFsbApAQCAtNDEsNiArNDEsNyBAQCB3aGlsZSAoQEFSR1YgYW5kICRBUkdW
WzBdID1+IG0vXi0vKSB7CiAJJHBvd2Vyb25fdGVzdF9vbmx5PSAxOwogICAgIH0gZWxzaWYgICht
L14tLXJlc2N1ZSQvKSB7CiAJJHhvcHRze1Jlc2N1ZU1vZGV9PSAxOworICAgIH0gZWxzaWYgICht
L14tLWJ1aWxkJC8pIHsKICAgICB9IGVsc2UgewogCWRpZSAiJF8gJCEiOwogICAgIH0KLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
