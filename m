Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7167AC10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 12:12:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 489232077C
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 12:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 489232077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIuHC-0006OF-O3; Tue, 23 Apr 2019 12:11:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VyzP=SZ=citrix.com=prvs=009f8e5a5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hIuHA-0006O5-KX
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 12:11:52 +0000
X-Inumbo-ID: f8a0b00e-65c0-11e9-a14f-8f2a60f58afb
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8a0b00e-65c0-11e9-a14f-8f2a60f58afb;
 Tue, 23 Apr 2019 12:11:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,385,1549929600"; d="scan'208";a="84180793"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Apr 2019 13:11:38 +0100
Message-ID: <20190423121139.25996-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190423121139.25996-1-ian.jackson@eu.citrix.com>
References: <20190423121139.25996-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/3] sg-run-job,
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
Message-ID: <20190423121138.M_o4k6VO55x_Hu7j2biHKdirR4yOP3SGQwI67F9GCmk@z>

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
