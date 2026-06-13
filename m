Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AB7CD98CF
	for <xen-devel@archiver.kernel.org>; Sat, 13 Jun 2026 21:48:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1337554.1598838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD8-0001Sn-8g; Sat, 13 Jun 2026 21:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337554.1598838; Sat, 13 Jun 2026 21:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD7-0001Rl-VU; Sat, 13 Jun 2026 21:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1337554;
 Sat, 13 Jun 2026 21:48:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWD6-0001Bd-1p
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWD5-00DVVl-F2
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:11 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dcf4e-2eae-0a2a0a5409dd-0a2a4506b662-28
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:11 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd01b-7371-0a2a45060019-d1558035e9ae-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:11 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490aebf33e9so9222165e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:11 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387291; x=1781992091; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0X1FdY41+Cjrz6QWLlOKKWLZuKlvYQpTdBJUqPk0yo=;
        b=sgezM7xDgbMt2nAmE2xrL89o/8xjVPvAxSj14nymZf9HEZ1ejks7AjEED95SNKY2EM
         Em/Gql+fMLz0at3Atj5TFDyfAkB9liYt0RzKWYjtC6fwZyGIIMJzi+N0xcI+F6OFr3Yl
         xEoSotwFDr4TzS6IC6yn/jkzsG1pa7am+brMIjgNv77lzESm/Nx9F+9ufXw6HGr8sH6/
         fMDFUwRnCXh0OmQeim92V0nz3VC28P7G/ECj2ayrPnraZ8CAGUvL56rxxmBGUYYmWcnw
         7JxFvuQGyx/qsxS/cWb4y2lFhYu9eSj8onueNAqzQprKeF2mc7wdvWPLdiRg2JoJqM9s
         DxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387291; x=1781992091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0X1FdY41+Cjrz6QWLlOKKWLZuKlvYQpTdBJUqPk0yo=;
        b=rBAlYUPmh1g4fUeXaworPqSmsuK+TxcLKK9iQaufQPl3WGuGX9DHkSHKxb/Zl99hly
         8P+Dmub7yyVtK+1Jji0ji5e0z7dxAFxiiGxR9iipNE9O0ax3kmHyuCSsTBHjbhQAF3PP
         QbnjJtGDyPI4IMQ7JmNtySz97tNW4H9IJv0NRjuJTtWrK8yq8Z7XRPzj5yLK15hec8HO
         XXNCwyrXRCNHTxGHloWxDOYFlwg6H0YM9YSeJ5AcBXOmRratHUIW3ZyVSiJz6tDTl4xQ
         iJ8Gri7xf6LGu0jb4LXGbrFRbj8ZeFM3SJzAe5a9gAFVjJT4RHTGMCF99mbx4Ezz3/+e
         QqSA==
X-Gm-Message-State: AOJu0YxnJonZs5HbZcR8qBPsjubK6+xXNh4EJ2paxA4QdiQ0kzaEXqKC
	DZ47Tq8hJrmrWdPMDdMoWWudfvDt0WRIRRugYUn8H9EOCH0uyJLYRVYqc6zva5IW9Sg=
X-Gm-Gg: Acq92OH8OmOUTIyOhsftNFYTrs4nCfAdADkQj+2Whh8acs+IvIWF+AXAbfjxj2EhisO
	/Iz2sKxYU6QNQIjtz96wbH166mhYGdvjvL2Ps6FVppxs38p1DBbVoyM8g8xeAgNjiMO+gtJxbFn
	NZdpsy8cPHFMdOjGUwP5evMprNz51ZyIu2Ng/19+GWpe4JjznB3MOn3oGiiavKezmq5B9GRigBf
	Wp4we/dwV5KJ3Dtz4P3/eBkO6+AWRqLpCyCen+NzHq4GNgASLHeauaxf5uotOG9as52XWUF3kFl
	1bdVpnzoi85whcfz98I3/aJWNW6f8KB9WWf+moHrj/O4r1/O2ltXZMcIYxKC5Q8Qam2h9VCfwCB
	Ny9NOAK+VMo0XDXWLxT+gFvMvlHgM8TazjRbkeMeImmC9F5HMvDvAy2cORiuwCG9DYFHAwg4hBi
	00gumbmg/sIRPwW8gomNbLThTF99TVJKy1133QL0sN1kQZSpIZdNSYUDB5gZDfIu0kmJgZpMjt9
	9ufslWPStwtuS7qVjMIqroeqQ==
X-Received: by 2002:a05:600c:4595:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-490ec4fb683mr105962455e9.20.1781387290817;
        Sat, 13 Jun 2026 14:48:10 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 03/16] libs/guest: Reduce number of I/O vectors in write_batch
Date: Sat, 13 Jun 2026 22:47:36 +0100
Message-ID: <20260613214749.20620-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1781387291-8EB8BD75-75A58380/0/0
X-purgate-type: clean
X-purgate-size: 1609

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Each page was sent using a different iovec item. This potentially exceed
Linux maximum (1024).
Coalesce adjacent IO vector elements to attempt to reduce the number of
overall IO vectors for each operation.
Also some implementation (MiniOS) emulate writev with multiple write calls.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
--
Changes since v2:
- change prefix in subject.

Changes since v4:
- added Reviewed-by;
- improved commit message;
- minor style fix.
---
 tools/libs/guest/xg_sr_save.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 68ce1aeb98..eba33f861a 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -239,13 +239,21 @@ static int write_batch(struct xc_sr_context *ctx)
     {
         for ( i = 0; i < nr_pfns; ++i )
         {
-            if ( guest_data[i] )
+            if ( !guest_data[i] )
+                continue;
+
+            if ( iov[iovcnt - 1].iov_base + iov[iovcnt - 1].iov_len !=
+                 guest_data[i] )
             {
                 iov[iovcnt].iov_base = guest_data[i];
                 iov[iovcnt].iov_len = PAGE_SIZE;
                 iovcnt++;
-                --nr_pages;
             }
+            else
+            {
+                iov[iovcnt - 1].iov_len += PAGE_SIZE;
+            }
+            --nr_pages;
         }
     }
 
-- 
2.43.0


