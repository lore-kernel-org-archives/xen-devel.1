Return-Path: <SRS0=hLJu=KT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8BEC47080
	for <xen-devel@archiver.kernel.org>; Mon, 24 May 2021 09:00:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8F9E611CE
	for <xen-devel@archiver.kernel.org>; Mon, 24 May 2021 09:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8F9E611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=epam.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.131699.246008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ll6Rm-0005hu-3V; Mon, 24 May 2021 09:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131699.246008; Mon, 24 May 2021 09:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ll6Rm-0005hn-0L; Mon, 24 May 2021 09:00:26 +0000
Received: by outflank-mailman (input) for mailman id 131699;
 Mon, 24 May 2021 08:01:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yMb4=KT=darkstar.site=sakib@srs-us1.protection.inumbo.net>)
 id 1ll5WV-0000hD-Ba
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 08:01:15 +0000
Received: from pb-smtp2.pobox.com (unknown [64.147.108.71])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b74c592a-deb1-419a-afce-cfda55b4e452;
 Mon, 24 May 2021 08:01:13 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 4C462B33FA;
 Mon, 24 May 2021 04:01:13 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 44D6EB33F9;
 Mon, 24 May 2021 04:01:13 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [95.67.114.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 23594B33F8;
 Mon, 24 May 2021 04:01:11 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b74c592a-deb1-419a-afce-cfda55b4e452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=mCsJmtMIZvPu58czx8ZlXkLAmQ9FB2eDwle91D0METI=; b=QUDB
	7yljJ6uAuxl1APj85QsfTuCLWY8hWwQrQ3nCIF0xuECvL+qtOACg1Sian5u0gmz8
	Nj5jskZFrwuJ9RpDe5PdYZib13XXe5g8j8I1F+NAEXxU0YhCVysFnBqit99GDccH
	J8ykkIMs1e/Cd72Gaf4Ectq0DyzxVE7rXANL+CM=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Wei Liu <wl@xen.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1] libxl/arm: provide guests with random seed
Date: Mon, 24 May 2021 08:00:57 +0000
Message-Id: <20210524080057.1773-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 3417F180-BC66-11EB-99A9-74DE23BA3BAF-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Pass random seed via FDT, so that guests' CRNGs are better seeded early a=
t boot.
Depending on its configuration Linux can use the seed as device randomnes=
s
or to just quickly initialize CRNG.
In either case this will provide extra randomness to further harden CRNG.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 tools/libxl/libxl_arm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index 34f8a29056..05c58a428c 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -342,6 +342,12 @@ static int make_chosen_node(libxl__gc *gc, void *fdt=
, bool ramdisk,
         if (res) return res;
     }
=20
+    uint8_t seed[128];
+    res =3D libxl__random_bytes(gc, seed, sizeof(seed));
+    if (res) return res;
+    res =3D fdt_property(fdt, "rng-seed", seed, sizeof(seed));
+    if (res) return res;
+
     res =3D fdt_end_node(fdt);
     if (res) return res;
=20
--=20
2.25.1


