Return-Path: <SRS0=dbYD=AX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C0FC433E7
	for <xen-devel@archiver.kernel.org>; Sun, 12 Jul 2020 03:31:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA30B20748
	for <xen-devel@archiver.kernel.org>; Sun, 12 Jul 2020 03:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4JjtjKf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA30B20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juSiO-0001pG-Fg; Sun, 12 Jul 2020 03:31:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQ2C=AX=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1juSiN-0001ot-5r
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2020 03:31:43 +0000
X-Inumbo-ID: 342b6aea-c3f0-11ea-b7bb-bc764e2007e4
Received: from mail-pf1-x443.google.com (unknown [2607:f8b0:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 342b6aea-c3f0-11ea-b7bb-bc764e2007e4;
 Sun, 12 Jul 2020 03:31:42 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 207so4482629pfu.3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2020 20:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Z3iLvmsALgpeKkdpuNL17/HM7clfrVNQ9KU9ARLG1y0=;
 b=V4JjtjKfiTieITrJU1+IsNVyCXTofXiYb1IBwVWUF0NhkJZwo2pn4KSii2ojXEDJUI
 66oIhsD0yr8miUbgs/hnkZguouIlQFh57D8QELabHjbdW1UxLxGLLNBkzNIsKUoO8gQJ
 hI8vluoROpyGtD3WEqXuxsbWXfeiLkK/6UD16CPnJbJHi0BlLgXvWM25njV3H3Hm/6s+
 NwUxqQK575Tft3dW74YgxV38tHrMXyq+M4eIrmalxNhNHumwd5n531ub6o9lXtqZWAhu
 qqUOfZZHNjqwmn+xR0U4aefx1Joq7fTfTsBq4TT7aT6Qe32Y3aocPzm27rqmGh1kc35U
 jGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Z3iLvmsALgpeKkdpuNL17/HM7clfrVNQ9KU9ARLG1y0=;
 b=mr6DK1W7A/9UuVVUnVuFmM6h9gwR6GD1t8oeV1ZMOs1x0lajc4+tBc7uFsYNXJIyeo
 B7S1QRriuiCZgkoa+vzW7rA/VscBQe7AcJa9kFZefUpXsdmSVqZWPlwJR3EZmZbmmWEG
 fa7e6UXeUpSFr9EVrYXapFZn9NDL2bbcvdDRedBNjW0RRv7BnvpA2rIcmC5LI8aExwn8
 MFRBM2TD7MG/zm++2EqOvUyLB/q6t2ympaItx4AeTuUKC32pNJPgbasMXd3TF3G6A/bN
 4mVT83xoDHV0xGLNbQT5rCqbbl14uQKO0WYxKjLeK31bA+V0sncjLeI+1n+ocuVOdG12
 JX+A==
X-Gm-Message-State: AOAM5307iRvgL7zxHhGRAeZDc+IetzkECHCnD62CKKwm9+H7rFVImSZn
 ACOMxu6PEltAbTHGNVBU1yI=
X-Google-Smtp-Source: ABdhPJxXbi9KSZF/o0irOMdLPlhjV3pV92Mf5shXsy1/+Fp0VJiHmbskE4DYeA/T1f3pXWChiRQDSA==
X-Received: by 2002:a62:3583:: with SMTP id
 c125mr21856884pfa.158.1594524701949; 
 Sat, 11 Jul 2020 20:31:41 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.167.224.89])
 by smtp.gmail.com with ESMTPSA id s89sm9750271pjj.28.2020.07.11.20.31.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Jul 2020 20:31:41 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [PATCH v3 2/3] xen/privcmd: Mark pages as dirty
Date: Sun, 12 Jul 2020 09:09:54 +0530
Message-Id: <1594525195-28345-3-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
References: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <xadimgnik@gmail.com>,
 linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

pages need to be marked as dirty before unpinned it in
unlock_pages() which was oversight. This is fixed now.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Suggested-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Paul Durrant <xadimgnik@gmail.com>
---
 drivers/xen/privcmd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index b001673..079d35b 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -611,8 +611,11 @@ static void unlock_pages(struct page *pages[], unsigned int nr_pages)
 {
 	unsigned int i;
 
-	for (i = 0; i < nr_pages; i++)
+	for (i = 0; i < nr_pages; i++) {
+		if (!PageDirty(pages[i]))
+			set_page_dirty_lock(pages[i]);
 		put_page(pages[i]);
+	}
 }
 
 static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
-- 
1.9.1


