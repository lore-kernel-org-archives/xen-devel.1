Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF141E9A77B
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 12:29:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1260575.1553868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50sW-0001bD-6S; Tue, 24 Mar 2026 12:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260575.1553868; Tue, 24 Mar 2026 12:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50sW-0001b3-1j; Tue, 24 Mar 2026 12:29:00 +0000
Received: by outflank-mailman (input) for mailman id 1260575;
 Tue, 24 Mar 2026 12:28:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w50sU-00019p-Tk
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:28:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w50sS-008sjJ-OI
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:28:58 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c2838a-2eae-0a2a0a5409dd-0a2a4505c54c-0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:28:58 +0100
Received: from [209.85.208.46] (helo=mail-ed1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c28389-5aeb-0a2a45050019-d155d02ea8eb-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:28:58 +0100
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6674cba2c50so9103754a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 05:28:57 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.190])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f43ae8sm638180966b.6.2026.03.24.05.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 05:28:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774355337; x=1774960137; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5V7qWNxkL9fZedO5saDR1Yh4qFPCnis+jo0Tf2NZuMI=;
        b=kOOq+vFkKaC9HDer4DydvEmQ78WUJLiGRsL9+cj4iW5QU70lYrDakgPjYN8dtazrQj
         zhQn1XU6ELMGtyEyogKvIV7FTKKZbhtsdHqIk2gk+FrhZDofXHojZVcxOBaEhZY8maE5
         8s6+/UThOtDtaSZCUKuAkzI1LUloXpNf938qF+c05gHx0ZoGpJ7Fp3syXoTB63LakAX0
         mD3oKpLSSkSCvgWSYLDki4Jbhona1QdfHAPbr63vyCj4eyHsUoD5pEXFPpj5KOihjEO6
         nG023jt7bR67Txssxw8c1EFXHT0j2AVl8DGsqFn3u6U7J5/1vzqzACGUv4dxTyCFT0HJ
         7yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355337; x=1774960137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5V7qWNxkL9fZedO5saDR1Yh4qFPCnis+jo0Tf2NZuMI=;
        b=RdTqKX64VBbfKGK/cRKYaNGbb6GHfMujEFppv1kN9+GPizS1oR03WEXLliUDhVr2SR
         WgLbIlKcntFr+mh+VlMXeiXnd4YFZOGbp1WxBCAZgwCBQb9/xNleRqWOVn3QdJ/HtPn7
         AgBa+zmBVjiJdNKuH+yNWOu7m0jE8zAdA2w4fGhDwfWwRLdFUjgzw9vjCQKNL/ET3+Uj
         QlChFVB4vrK8CTDEmudfh34vWtnCLzBXyBMiXUuAfOvFAX6JenHDjpFceaO9ONxlsg4Y
         n3FMkSO1jBPbqmUINUWJHyDPyXNNpbrPHBXgCNsha7bzpbM/cK6LWC2tBu2httk6big3
         7RxQ==
X-Gm-Message-State: AOJu0YxI3jLMUWzKhFxy2DcNmowDUyp7zDO4qtSopTGVZTyzrXIeVrxI
	bogsMTzKHN7qIcNa9nZ6bfwDKBldF0VOw+nLRcizmdB4/Uv7xAvq+6K0dzTfbg==
X-Gm-Gg: ATEYQzy+u34JJ0BwaQmmZNd/RTRc9V5PXy3CcP1oCIGlAttpdqxmCZcrLWtmSwhaD/V
	dttB4wTdjSjbuiyvrSXiWSP5O2t1rmsbtDraxUv6Sucfi8bNydduC/MKbBxdOGEYrJL0cRSTTiH
	RsQ3iE4S0OSWtFoOTk+ddfNm/cfdWD5G4WUddJCFGG2Lj3sj2eQUWJQe++1XZ59Y+OdHUGxq2XN
	nxUKjoN2nFnOSucLAIXEC4scmX6fsPONahbJuKSluC8mu6K75s47M7PMQZObfv27ArB9yMGZ0+4
	HX8XxrKv0uicmIy1tDxZklrzhI6Nlylg+sSomqAJODgrRb7qw6XfLzyptttfwdkxJ7xOjJ9DFSh
	kS+skrwonTF8q5JceDEyweWs/Y+6ja90+NZJLUJSy4bGEzD37jIa+BIg3s0BjOSkhlQ5EyxKbfc
	gbv0axM6yd3JiajirB/a6JCPlh78o=
X-Received: by 2002:a17:907:97ce:b0:b97:f2cc:8c3e with SMTP id a640c23a62f3a-b98863728fbmr256741866b.10.1774355337010;
        Tue, 24 Mar 2026 05:28:57 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v17 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Tue, 24 Mar 2026 14:26:37 +0200
Message-ID: <b4ee1eb58b28ddcf2f71aa67bf89bb2d301d2c51.1774353053.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774353053.git.mykola_kvach@epam.com>
References: <cover.1774353053.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1774355338-8295A488-32A53ED7/0/0
X-purgate-type: clean
X-purgate-size: 1014

From: Mykola Kvach <mykola_kvach@epam.com>

Mention the newly added support for guest suspend and resume to/from
RAM via vPSCI on Arm platforms.

This support is limited to non-hardware domain guests.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v16:
- cosmetic changes after review.
---
 CHANGELOG.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c191e504ab..eab73f28d3 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -15,6 +15,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      misusing atomic instructions.
    - Support for CPIO microcode in discrete multiboot modules.
 
+ - On Arm:
+   - Support for guest suspend and resume to/from RAM via vPSCI.
+     Applies only to non-hardware domain guests.
+
 ### Removed
  - On x86:
    - The cpuid_mask_* command line options for legacy CPUs.  These were
-- 
2.43.0


