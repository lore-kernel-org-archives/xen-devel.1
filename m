Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA14E606A325
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WIM0kw43
Received: from list by lists.xenproject.org with outflank-mailman.1498121.1696083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUNLW-0002q8-Iv; Fri, 20 Nov 2026 12:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498121.1696083; Fri, 20 Nov 2026 12:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUNLW-0002q1-GC; Fri, 20 Nov 2026 12:04:02 +0000
Received: by outflank-mailman (input) for mailman id 1498121;
 Fri, 20 Nov 2026 12:04:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xUNLU-0002pv-Ux
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 12:04:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUNLT-005Mcq-RR
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 13:03:59 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6b003719-bab6-0a2a0a5309dd-0a2a45019200-28
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 13:03:56 +0100
Received: from [209.85.215.177] (helo=mail-pg1-f177.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6b0032b6-5bcc-0a2a45010019-d155d7b1adcc-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 12:44:55 +0100
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-cdb2e0062bbso316273a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 03:44:55 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cde6d02ba46sm1138936a12.21.2026.11.20.03.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 03:44:53 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i="@isslab-korea-ac-kr.20260707.gappssmtp.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175093; x=1795779893; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hYltVfrQnjlF4EF9xtYm6MjuhO3wsKtp0+5xIybN6k0=;
        b=WIM0kw43IvtmRskLLPW66RYvfGWbhWrtGQY7AQbt1t0+GfRD4PqnoOz1doRgTSFphk
         VgtjlIhRyXNaOqAL0AYagK0ep4inzPlaYv7B7KoWoRRgNhXX1oWiRtb/wU1jQSxdaUz/
         /iOnbqLSXHJmCVoxqVAFHt09kQAks68sgIfzLlgj5KbAilv/hiWu6/XOySxQBK3/P+TB
         FQgsyOb51QPuEFXrG1yqflUWNYOS+2H8lkq4HM378Agin4fG3HHsx5RLm4h1a4BXwVEr
         us6PHdyJsnPs8HsTeZKeYz78F7sOtSWl0nOAvAFMFA+rSAx4KCfD3L6Mb8onfZIboIm3
         FYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175093; x=1795779893;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYltVfrQnjlF4EF9xtYm6MjuhO3wsKtp0+5xIybN6k0=;
        b=yFHTEfz/xUKMWNrh2NK9LAw9iSNCsxm/vV51atHBjlzQ44baQTggj/NbcimNyR0/mn
         88Wq5YjrbbT+1H7r2kK3qN6mw6xT0BgA/8g5onQhZAhmUs7uLVJGP9kcoRoO9WNTgcBB
         bPEAa224sYq0himjVDMS8H7IQTXzM7rR8ShTPtpGFpxZ5b5bxtE21XsGDxmGL+GWLX5o
         pX7eSHetstCDZJ1DYZrfVazi5q8DTFN9JcMLZdFpthXhOHUvfvff/OpjSFVB98JCiasf
         DY7TVsZRC1zTZ1twygbzYwacAxJ+2CUjoVohHvXmMYhHRBe/N3vDx6YBzSiyfsj6H7Qb
         Brig==
X-Forwarded-Encrypted: i=1; AL+hErEeDvn/Qwym9yyQNKxkEKp400FhxYNITGHaLzStotJoYpLZDbrOVxiY3rHF6SLKzEKBWXaL91pQn78=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9fws6x9982xrqTDX4UMhJ7LwVmBjuTjxd1Go9wNyaxGRFGk7AU
	WpfBPlkhhj2C2ownoil9GTcj6a0vaEHWhORzgy7MeEkaRDqy6pfeIxsJpo7BbD2WsqQ=
X-Gm-Gg: AYBFou1uZaX7M9CtrHY4TgnhHpZ6ocgI6y6dx1RGmQlYhhULA+090w/picPOKkCh2v4
	rzjZsDzHXY4NCbw3udEHtRgHmu+4INlGXXM0PEDSQoc3n1TCyrfNmcKcRN8Qbarl+0jYV0OTsjT
	7NVDFsn0KrCWy8CXhh+ANMmy14EyBT4i7utJkK2OkvIldjNHXe/eDQNboeXvHhD6ma1aXidDlqZ
	bRn8OsAlzE4iUkQikhK9btWXYJQdrVeHMOpAfRxXTDvVW2hpiB9M2IDF9I+Dk77wvLrL8+PbIXd
	TdM23NEPv40TjG1eFd5kSmQSDKB6nEEKq7+30kuCWIYZGq3mbLFJ9ajH6ICngwz88/1wq++Bl+q
	6hwE3v5/ge2yGA9bOuTT8LNguTelOWPgy6zYTuXIl521B7tOeeVLv0a+JhPeF60eMLfa8og54iM
	0B9+dTTK2mGH6XvFPFP1nwEuGEbdwP8TGOYCsk4apKNW9d58plP1mKB6xdFKeIOMfQ8V9A2OyNQ
	WAL9cmq8CNqHfqV+LbuvRsQ0pXtebWkLO0ukMISV+fHDNYTZcjITMgDlq4bfZxh6j+yr6/xKv9r
	roBYjUqdxzx4KIUGLbm/7Dz2j5IEXR4B65bT3rHSOE0Hu49oCEZQF4ME3s4iepvOY3qffhzNkiW
	TVMh0o2Fjg/Hmc4k9JF4tyFJiatXGLgD9mgfe
X-Received: by 2002:a05:6372:a713:b0:3de:7bd5:fb47 with SMTP id adf61e73a8af0-4014d1590ccmr2473352637.39.1795175093626;
        Fri, 20 Nov 2026 03:44:53 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com
Subject: Re: [PATCH] xen/scsiback: unbind the IRQ before draining in-flight requests
Date: Fri, 20 Nov 2026 20:44:48 +0900
Message-ID: <20261120114448.3072673-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109122654.30859-1-yhlee@isslab.korea.ac.kr>
References: <20261109122654.30859-1-yhlee@isslab.korea.ac.kr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1795175095-4E9475FD-9F9FD471/10/78177266408
X-purgate-type: clean
X-purgate-size: 139
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is superseded by v2:
  https://lore.kernel.org/all/20261113110036.146860-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

