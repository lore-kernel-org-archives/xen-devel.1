Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E5606A323
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 22:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+vRqYlA
Received: from list by lists.xenproject.org with outflank-mailman.1504180.1699688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWhyH-0006Hv-TQ; Thu, 26 Nov 2026 22:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504180.1699688; Thu, 26 Nov 2026 22:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWhyH-0006Ho-Qr; Thu, 26 Nov 2026 22:29:41 +0000
Received: by outflank-mailman (input) for mailman id 1504180;
 Thu, 26 Nov 2026 22:29:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 1xWhyG-0006Hc-Go
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 22:29:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWhyE-009MSr-U6
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 23:29:38 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b08b279-2eae-0a2a0a5409dd-0a2a4508dd68-28
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 23:29:38 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b08b2d2-f659-0a2a45080019-d155dd31d0f2-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 23:29:38 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso6608882f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:29:38 -0800 (PST)
Received: from bala-Latitude-5580.. ([129.0.189.183])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b7515sm871972235e9.13.2026.11.26.14.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 14:29:38 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795732178; x=1796336978; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gqc/twRVWh3m3lmZ/cPlczmzgdWBGeKAftFGLatBQ38=;
        b=x+vRqYlA+Mku9x8vEg7hJ3r2JtYKZKSJO0W+scYCLioh6j77Rj0mP5q+nntRo4LzXF
         8NwByAPPsZpmxsDCwjlHoL80cv0Gc1HF3e6J71V4IpIhzy0Ejquse0GqRpf25Mh5pp6u
         FMIf7q69PKRy/gH+F9lZ6i1pphMhu2Sg7lS3kx+qDE2G1rVrEpqxTJfePHaBr3WjZPr3
         1pau19qRD3QGyPqz8TqWIZs3DJZX27UihnqYAHyC4SmDQJC/DBL8ePktagkwaUgl//Dl
         2rBcgCHfvBrAYIXZniN64MN2UxKN/RTOZgY/1qzpANYx8smJX2LSGyJX71oQ4Ex3bUpA
         JvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732178; x=1796336978;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gqc/twRVWh3m3lmZ/cPlczmzgdWBGeKAftFGLatBQ38=;
        b=Xki+ArJsJI5guhw/Uu3LKDqrSK6bk4KiVa+kudXu3YhLTpYTvx4WBw7nF30mN7/sfr
         wHWBv2tC+BivaoiaEFSK0kO5bwak6loahtywHVbHNkTtMKAb4Im95xVbwUYhjlYmTo0/
         c/fWcqT3iUB55mfAVe0Q3nBcuQE7WvTQ5oCXQQn4Cq2R08EnyXvNzt6m9UQ28DLqoUcN
         zxbv8XDuR7TzPdoNkQHLnvEwLpl9qTf1FvIVOCb1UR9DHWheIxi8tbDBPW6e8DRojAI0
         9tDrXXHhATlYW4DuzlURqKzhSa+w+6ok6y9lb1HXQbJNHyWqwOdZQ4RO8TUN5MOZdhwd
         Y5Gg==
X-Gm-Message-State: APuU4Z8QcJYql8xQ2fNtyAKJzNAmKBv17C1ZQkqpLaIIu4UnQIk1/HdL
	81phbQedaariuga94QsS7/v2r4tat8PPsW5VzggTck+UBHe3xHoNDLajuRYdtQ5U
X-Gm-Gg: AZFdTZf3QjAcd6Sd1xsBhNK0ifRFpKSH6xWtKplh/NgBeo7M9STL2o2RFsI9b4XS2mj
	kg4EU8YfFboy7om2TITCv02tMp5Xd15JaT0eRsfLpSzydBZl+MlrCcPHQjZbYb0LHDlmCNq/NqF
	mr6nNIF19KYfZnuPALasBq+lHjkjR2ynDDmb5dViDL5JuUIHNsuHmUNQ9nOxQe1SIdivlbnBaCl
	aDNFs34IhwMccBWu9ap4b/toHMVgLqp/JaqJcxNiHcCjAEvec1dRHzg9uHHpLejhmkXqSc8GQOI
	1hbwvbMz3cOLygJNuO/70wQsbFofln+gjWa+9YzzloUH3m2hJzwWrkgyQ3/8QpnyhFmA8mZtPR0
	0zE8XRoNEd3+m03fGn7Y17zjMzDNg8mo12Q6TCJat6gr3o41u8LhQTUsu06JAmr3x+Du1jV09vx
	6de6Yaayw1wJXfoQq9+CiODksb/xTzENCkSBFYWpsVLLLPC05WTyV/FvPBNchZJuIXSmShnCPb+
	k+Fx9XvVzF5iPkqhBCASvjL21CinfUWkx7yG8e38zwgIbv69segCBlJPXeZ/I80wXY/9lKPeU5u
	9/g8p7cYMLXnBfjPxgBxH6u39Y3oxOAYWBpw7OqiGsWdOSDKisV7uRZmeVa74g==
X-Received: by 2002:a05:600c:638f:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb8892692dmr407472235e9.22.1795732178220;
        Thu, 26 Nov 2026 14:29:38 -0800 (PST)
From: =?UTF-8?q?Bala=20Andegue=20Fran=C3=A7ois=20Lionnel?= <balaandeguefrancoislionnel@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/3] docs/man: fix typos in man pages
Date: Thu, 26 Nov 2026 23:29:15 +0100
Message-Id: <20261126222918.951621-1-balaandeguefrancoislionnel@gmail.com>
X-Mailer: git-send-email 2.39.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1795732178-D4F4F87B-F48A8C8B/0/0
X-purgate-type: clean
X-purgate-size: 540
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix a few misspellings found with codespell in three man pages.
No functional change.

Bala Andegue François Lionnel (3):
  docs/man: fix typos in xl.cfg.5
  docs/man: fix typo in xl-network-configuration.5
  docs/man: fix typo in xen-vtpmmgr.7

 docs/man/xen-vtpmmgr.7.pod                 | 2 +-
 docs/man/xl-network-configuration.5.pod.in | 2 +-
 docs/man/xl.cfg.5.pod.in                   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)


base-commit: 4565af21821a005e8b2e39871c13a4c81c7fb736
-- 
2.39.2


