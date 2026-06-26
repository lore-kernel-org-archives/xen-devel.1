Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B18CC43327
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2026 22:38:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1346559.1604952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdFBq-000181-EQ; Fri, 26 Jun 2026 22:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346559.1604952; Fri, 26 Jun 2026 22:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdFBq-00017u-BC; Fri, 26 Jun 2026 22:38:26 +0000
Received: by outflank-mailman (input) for mailman id 1346559;
 Fri, 26 Jun 2026 22:38:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alhouseenyousef@gmail.com>) id 1wdFBp-00017g-Id
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 22:38:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wdFBo-00HJ3B-GB
 for xen-devel@lists.xenproject.org; Sat, 27 Jun 2026 00:38:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3efefa-bab6-0a2a0a5309dd-0a2a4502ba02-22
 for <xen-devel@lists.xenproject.org>; Sat, 27 Jun 2026 00:38:24 +0200
Received: from [209.85.128.177] (helo=mail-yw1-f177.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3eff5f-5a27-0a2a45020019-d15580b1ecbd-3
 for <xen-devel@lists.xenproject.org>; Sat, 27 Jun 2026 00:38:24 +0200
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-80236b44a1dso15908967b3.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 15:38:24 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-80abc3d1734sm23177557b3.15.2026.06.26.15.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 15:38:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782513503; x=1783118303; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHjctOwAHvr5B+KSgeGZUSJFSThxaO6hOxTWkkNP1po=;
        b=BNxlbZzYz17qsNK6FeS5njKgW29s6wwFiOxRoXdDIFyArtTHNy841D0W75YxkZL7Kq
         1JJEsCAbmHjpjtMGd4cQWTJiuz29ewOhJ9cUL9u0jjBUZDhMz2IDDP2N/K9PhxeyHq3m
         2LD4q8MzMIRz6NeB8IRT5Bp+fFRcUxWAzw2P6OZf/pVSfsfbuF7E8dB3+6p68BNEvBLd
         Bo/rL7+Urs60fO8ItNkevj4i7ATWxO3do8jWVABxRFlzTBmK0Sk9fOeDM+OHIyyZsHux
         jJZo5AAunkGPNW0mdmO1OjKfCHIJ3vnQnjYmS2eQQr4S6F6xfho46KGniqzkVCSsuAiE
         B29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782513503; x=1783118303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UHjctOwAHvr5B+KSgeGZUSJFSThxaO6hOxTWkkNP1po=;
        b=dVG0kxj5aW/YqAmNhJKe9l/jfxLSlXmWroLNWc24e2H/yqMeI56RNmdPFBkgP2X+Hj
         QdRmWm2uPTQyanPnaaNWztPo8UHB0hccGK94GyFXsJ/lMV7x7gn+bZgwihG12fpmJgKy
         nCAl5TvgrobqQOtTJPiQkrEKGoUNyp/l8j4DM+X234OB0XQXDF9fBp05bfLj0TZy+mnP
         VT2K2JDQtn6e0hn4vph6UFFBkTzhwwhFbQarWc7MJVH79xozHA5lb0HQxErUaJY1XzXF
         9niAqjHyNt1MXmvgdRox1B63TigDaF5i6yn7TXWejwu2/znluWz+bWGYgD0zWJoYdVOY
         +URA==
X-Gm-Message-State: AOJu0Yw0tHvz2CzUwuApXnxjCNjF6r1tL3ronKUUoHSuy6hdu4i5ZKC/
	xtHiKSfNqzYfvLJPObz641enbnhf8WTwq3e0U4+oYBsZYDu7a+U/svW4
X-Gm-Gg: AfdE7cmXth3to4Z1U86PiA5GEWESLdybNpoVHDZVYkCZsuoQu+mXHa40drT8NSXIpax
	Z8c51tbzfeY3KvaE0LrGgrZr6wfnUOAPaxII6fIoK+6gLdWob8pscjS9r/aupgm36a+3R9r9qDQ
	Jbd5Eu6hKhvR9eMs7m77z0wSt7epg4vixtgJUCU33kDhIuS1HPEDVEu0HQfaNVeTXAYAa7DDPjT
	ukQL8rwwM9s0DFAbMb4o+rai1KJ9lzeQy1dNFX7P+4Ru5dpHjrhQ13JDoRtl6Wrjc4anU43t3MK
	pAe8nA7zsf+fle8SdkRecLeflKsA4VN4ni7S/fMvPurAwJwbhlbSswnmSdTUj6NVkSzm2YrjHPM
	RuekLdGPvPWVU2GTGzQNS0mLF/gvSkCxzdFiZ4TWlZHOM8WFLVDOdGiL01DET0CPWXBfcX48MDA
	IU2TiIT+xi4jPeuzHB23Jyuo9kgQ==
X-Received: by 2002:a05:690c:7208:b0:80c:85e5:8743 with SMTP id 00721157ae682-80c85e58a99mr26080157b3.65.1782513502844;
        Fri, 26 Jun 2026 15:38:22 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH v2 0/2] xen/gntalloc: validate grant count before allocation
Date: Sat, 27 Jun 2026 00:38:03 +0200
Message-ID: <20260626223805.43781-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624124745.10073-1-alhouseenyousef@gmail.com>
References: <20260624124745.10073-1-alhouseenyousef@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1782513504-55AE07C5-4D9024E2/0/0
X-purgate-type: clean
X-purgate-size: 789

The allocation ioctl currently allocates a user-sized grant-id array
before checking the global grant limit.  It also adds the requested count
when enforcing that limit, which makes the check harder to reason about
in the presence of mixed signed and unsigned types.

Make the grant counters unsigned first, then reject impossible requests
before allocation and use subtraction for the locked limit check.

Changes in v2:
- Split the unsigned type changes into a prerequisite patch.
- Remove the signed checks and unnecessary casts.

Yousef Alhouseen (2):
  xen/gntalloc: make grant counters unsigned
  xen/gntalloc: validate grant count before allocation

 drivers/xen/gntalloc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

-- 
2.54.0

