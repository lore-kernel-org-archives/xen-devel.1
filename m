Return-Path: <SRS0=9xPH=TC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8FAC43219
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 17:53:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE72B2081C
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 17:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE72B2081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMFtR-0006hD-JO; Thu, 02 May 2019 17:53:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yl7K=TC=citrix.com=prvs=018ff06f8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMFtP-0006gN-Rt
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 17:53:11 +0000
X-Inumbo-ID: 267c4aac-6d03-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 267c4aac-6d03-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 17:53:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,422,1549929600"; d="scan'208";a="84983433"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 2 May 2019 18:42:29 +0100
Message-ID: <20190502174238.23848-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 0/9] mg-repro-flight: Provide --rebuild
 to make variant build jobs too
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190502174229.ix1b6U8RMUd_EUE17IJi6rdlqShtBKHgkHq0r6BlQPU@z>

SXQgaXMgYW5ub3lpbmcgdGhhdCBtZy1yZXByby1mbGlnaHQgY2Fubm90IHJ1biBhIGJ1aWxkIGZv
ciB5b3UgdG9vLgpGaXggdGhpcy4KClRoaXMgaXMgb24geGVuYml0cyBpbgogIGh0dHBzOi8veGVu
Yml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9pd2ovb3NzdGVzdC5naXQKICB4ZW5iaXRzLnhl
bi5vcmc6L2hvbWUvaXdqL2V4dC9vc3N0ZXN0LmdpdApldGMuIGFzIHRoZSBicmFuY2gKICB3aXAu
cmVwcm8tZmxpZ2h0LWJ1aWxkcy52MQoKSWFuIEphY2tzb24gKDkpOgogIG1nLWV4ZWN1dGUtZmxp
Z2h0OiBTYXZlIGFuIG1ybyBpbiB0bXAvCiAgY3MtYWRqdXN0LWZsaWdodDogQnJlYWsgb3V0IGNv
cHlfam9ic18qCiAgY3MtYWRqdXN0LWZsaWdodDogVXNlIGRiX3ByZXBhcmUgYW5kIGhvbm91ciAt
RCAtRCBmb3Igc3FsIGR1bXBzCiAgbWctcmVwcm8tc2V0dXA6IEltcHJvdmUgYSBkb2MgbWVzc2Fn
ZSBzbGlnaHRseQogIG1nLXJlcHJvLXNldHVwOiBCcmVhayBvdXQgY29tcHV0ZV9hZGp1c3RzCiAg
bWctcmVwcm8tc2V0dXA6IE1vdmUgbG9nZ2luZyBzZXR1cCB0byBsYXRlcgogIG1nLXJlcHJvLXNl
dHVwOiBBbGxvdyBhcmd1bWVudHMgdG8gYmFkdXNhZ2UKICBtZy1yZXByby1zZXR1cDogTW92ZSBm
bGlnaHQgY3JlYXRpb24gdXAgYmVmb3JlIHRhc2sgY3JlYXRpb24KICBtZy1yZXByby1mbGlnaHQ6
IFByb3ZpZGUgLS1yZWJ1aWxkIHRvIG1ha2UgdmFyaWFudCBidWlsZCBqb2JzIHRvbwoKIGNzLWFk
anVzdC1mbGlnaHQgIHwgMTQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLQogbWctZXhlY3V0ZS1mbGlnaHQgfCAgIDEgKwogbWctcmVwcm8tc2V0
dXAgICAgfCAxMjIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0K
IDMgZmlsZXMgY2hhbmdlZCwgMjM4IGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQoKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
