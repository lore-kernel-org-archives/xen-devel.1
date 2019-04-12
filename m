Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3099EC10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 10:03:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046142084D
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 10:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 046142084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEt1u-0007AB-1e; Fri, 12 Apr 2019 10:03:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VTWF=SO=citrix.com=prvs=99843409f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hEt1s-0007A6-Um
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 10:03:28 +0000
X-Inumbo-ID: 37ab8a2f-5d0a-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 37ab8a2f-5d0a-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 10:03:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,340,1549929600"; d="scan'208";a="83422192"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 12 Apr 2019 11:03:25 +0100
Message-ID: <20190412100325.11699-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xl: handle PVH type in
 apply_global_affinity_masks again
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
 Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412100325.z1R9yY1RD8gnmx8-8-4TbglNO1hxzcskZ2_yWDjuaEY@z>

QSBjYWxsIHNpdGUgaW4gY3JlYXRlX2RvbWFpbiBjYW4gY2FsbCBpdCB3aXRoIFBWSCB0eXBlLiBU
aGF0IHNpdGUgd2FzCm1pc3NlZCBkdXJpbmcgdGhlIHJldmlldyBvZiA0OGRhYjk3NjcuCgpSZWlu
c3RhdGUgUFZIIHR5cGUgaW4gdGhlIHN3aXRjaC4KClJlcG9ydGVkLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgotLS0KIHRvb2xzL3hsL3hsX3ZjcHUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfdmNwdS5jIGIvdG9vbHMv
eGwveGxfdmNwdS5jCmluZGV4IDkzYWJjYzY1YzAuLjMyOTUxMmVhYWYgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL3hsL3hsX3ZjcHUuYworKysgYi90b29scy94bC94bF92Y3B1LmMKQEAgLTc5LDYgKzc5LDcg
QEAgdm9pZCBhcHBseV9nbG9iYWxfYWZmaW5pdHlfbWFza3MobGlieGxfZG9tYWluX3R5cGUgdHlw
ZSwKIAogICAgIHN3aXRjaCAodHlwZSkgewogICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfSFZN
OgorICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfUFZIOgogICAgICAgICB0eXBlX21hc2sgPSAm
Z2xvYmFsX2h2bV9hZmZpbml0eV9tYXNrOwogICAgICAgICBicmVhazsKICAgICBjYXNlIExJQlhM
X0RPTUFJTl9UWVBFX1BWOgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
