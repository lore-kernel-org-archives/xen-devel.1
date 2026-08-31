Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDE9C61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 05:17:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403747.1637718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0uOL-0005U1-Rj; Mon, 31 Aug 2026 05:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403747.1637718; Mon, 31 Aug 2026 05:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0uOL-0005Tt-OS; Mon, 31 Aug 2026 05:17:09 +0000
Received: by outflank-mailman (input) for mailman id 1403747;
 Mon, 31 Aug 2026 05:17:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x0uOK-0005Tn-5k
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 05:17:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0uOJ-003TCC-F7
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 07:17:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a950e4f-e002-0a2a0a5209dd-0a2a4503adac-12
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 07:17:07 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a950e53-fae8-0a2a45030019-d155dd35b171-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 07:17:07 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-484374f54d0so507419f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 30 Aug 2026 22:17:07 -0700 (PDT)
Received: from notebook.. ([88.230.40.90]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-484322ce2a6sm14228449f8f.19.2026.08.30.22.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 22:17:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788153427; x=1788758227; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufDtI6dGBJzLaCrYz83r0Iy0PyHxGLIGdHKX89PGQi0=;
        b=o2EUgq9J/YqB779nblohXEg7ps+d8VwccvFASAdJNwnY1tVcrI9rsCe+vkmIYPXlVk
         Fio8LQ7w1jt6H3ob6gqE+YjU7iGL3yQ+ocQwDfK+8iRpghDwO54vh8CcwXXkWL6iXAKQ
         ognxvlqUTfSmvJI1wFdylDxEPTnUsLSpWgZIj1j7S8swLcVC/xUxrVthWDfp6uIz8WP0
         y5j3/pV/FKXKx94i8D6+33tlObrkjBa58YCVDMZM4IgzPW/3aqR9UBqYqdZNY3zvC799
         3UKqISsWj9bggYstKt8cOiKZxtXqsAZ7W3L+YoGyiYwSbLd1djhJaJyXImjd7ImQH7yO
         MFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788153427; x=1788758227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufDtI6dGBJzLaCrYz83r0Iy0PyHxGLIGdHKX89PGQi0=;
        b=PgVbZv0HtqWAwzTRfCh22ml4T5Jzt2Wx3bDKBQb34GYDJDtF6/Lf+ulZA0rRmH5zgJ
         SnA85SpAIwCNCOZz5l8uFlzDv03yUOR5ZWRkeJOrFBh4Y4arqysJFLfTSW8dnP2rj0iB
         Ee5jMZn4I5/CIm5d0mHXqofMcR88wgRIqn6CJSn6q9Bz6uIrgJ89nldLVrUhzG1rsm4W
         9khQPFnO29f1Cj7dhRWDxh+gBRq4G5ykF2MIXv1LpXaqsnxq+lM+MF/lN2GSqYMLQlse
         BeIgqcmbQyBDqOIZc3tsGNlI8eHUfaeWpBDaJCmREnzJxF2+pnAHQrKpMioeR5beCmwT
         xDag==
X-Gm-Message-State: AFuF++no89nVtEQB+IhV1NZzpZUiCkpS5tKt7q/C31QRMWE73+oAS4l5
	mwpv3Dma0B8HVcGA0vBX70SlcOZOsdGv1umVAi/m5oDxYKw49eKaQDyejsKEzw==
X-Gm-Gg: AYBFou0gCP7q9nlbE9aFYnOvI3W8RqoVcVYMGTJBVx52Qsrptt/xqDAaOwuoA0s7sde
	vQJI+/hemVf/OxyAXH0tJ4BqWEE6MheDxwFovx5y4y49+UUhnAntib8piwWD9Q2lwFmmlGeNWc5
	tqnRABA8K3GTN/9hHBJ+NdN314QJWjZJPsh7r+s/wf4/TCgnp8GhnIuOMeir9bBEbAWysPzrniL
	OzdvBWyYyVZRi3TecqG0QRraeaEfBOXV5hX/nd1Z6j1I6/Q9+EP9qH5zGHwHjBlbXmVlxXA/I50
	SLerPB5+Y91UHrPE8P/BPWyxe+ThGAifKwpdOnmzXo1BE4Ybg0PECRrQxekbuNIfVHAzZ2u8tKi
	SUmomyJgVZ/Wuzvot3AnImSPY6H239hZS3uu+QqmdPxupMmJuwfOPUrn4AooNHqqwN8i79iIQHn
	7k9OmZkdfecydcNM4RJmveW9rNYuYcFvRXQs6LvtXi1A34lKMdDrD/sjFGyj16qeiIsh62eg==
X-Received: by 2002:a05:6000:4a17:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-4843efdcc6bmr657400f8f.13.1788153426692;
        Sun, 30 Aug 2026 22:17:06 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	roger@xenproject.org,
	anthony.perard@vates.tech,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	teddy.astie@vates.tech,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v3 0/2] xen/sched: fix crashes when vcpu creation fails
Date: Mon, 31 Aug 2026 08:16:35 +0300
Message-Id: <20260831051637.5029-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1788153427-768FA4E9-B7E0CEA7/0/0
X-purgate-type: clean
X-purgate-size: 538

Furkan Caliskan (2):
  xen/common: add vcpus_create() and keep max_vcpus in sync
  xen/sched: core: kill unarmed timers on sched_init_vcpu() failure

 xen/arch/arm/domain_build.c   | 15 +++++++--------
 xen/arch/x86/mm/mem_sharing.c | 11 ++---------
 xen/common/domain.c           | 24 ++++++++++++++++++++++++
 xen/common/domctl.c           | 19 ++++---------------
 xen/common/sched/core.c       | 16 +++++++++-------
 xen/include/xen/domain.h      |  1 +
 6 files changed, 47 insertions(+), 39 deletions(-)

-- 
2.34.1


