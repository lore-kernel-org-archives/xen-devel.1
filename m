Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A41D606A324
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 22:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ms4w7KiH
Received: from list by lists.xenproject.org with outflank-mailman.1504183.1699708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWhyK-0006hH-Hn; Thu, 26 Nov 2026 22:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504183.1699708; Thu, 26 Nov 2026 22:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWhyK-0006h7-Cd; Thu, 26 Nov 2026 22:29:44 +0000
Received: by outflank-mailman (input) for mailman id 1504183;
 Thu, 26 Nov 2026 22:29:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 1xWhyI-0006Vr-OF
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 22:29:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWhyI-00BqUv-4y
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 23:29:42 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b08b276-8faa-0a2a0a5109dd-0a2a450ab120-48
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 23:29:42 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b08b2d5-f2d2-0a2a450a0019-d155802ee482-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 23:29:42 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso58574675e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:29:42 -0800 (PST)
Received: from bala-Latitude-5580.. ([129.0.189.183])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b7515sm871972235e9.13.2026.11.26.14.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 14:29:41 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795732181; x=1796336981; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BqMlIcvFk5wgQR99qoxqav+XhsvfsmVe/Dt+KeE3mtA=;
        b=ms4w7KiHtaYXVf1r/Uy8Ksqzxp6Oh2FoTM1/PohlZt70qbnZl+HxEHnn5/6QNmULde
         msoDgzUAO14GiiRtF4l6Oju5Gd7ToFLGcRI5ikWdU2fU0FvXwTiTT1vhr5o5YfMT7+h0
         rZwLU6W2kenZr6wFK+xshrAAio+IpddaR231f9NhEQS8Isx+MqFnpcdm6zfrrkThoGtX
         +z97Rhjxb/gQDmC/7yMjiUqhxaZwvIu/8yzY1I72uDgOylsjc5b01lifJmy9Uye7sghm
         k93Vtg1zu/cUH6W8jrUBspJfwcH5OOROCWbkbB96FzVqrYAArcZ9jYVB/fRerapyDA7o
         hJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732181; x=1796336981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqMlIcvFk5wgQR99qoxqav+XhsvfsmVe/Dt+KeE3mtA=;
        b=T18M2cPE++zjBI90orXeQQztP9zes1oYVgxGp5fuPIxcsT9MZjJtLHPzhaaxFTIdIK
         O5R/HfJO4YG82WDii8vLY/vd42o8IdTV7ybVXxB2ALFkLXqTGxmzoTda0RCOCB35+9yo
         hk+9wbYVi7PqMIpPc2wWIMjSZiqOtwHC7J8/oh8mHTeF5hdNAK5ERBlaZt4exL0Uybst
         PgBCP01zOwOj9por4RDpAGi6u80Fr+sJU22KOVUewV937iLNHEewiAuFWE1Hn+maf3RT
         NI514+oX6qewlP59HxDU2sOqrEoqagmT2FK8zFdt2xGFpIvLw7OyYpePMnaAEQ5hLOVs
         AECg==
X-Gm-Message-State: APuU4Z9wgyz729rg0I9sFgnAOzinPIyOSeWJpE4gHfZ/ik8TLkNPFRYi
	RA5PzoL0RBdvAjBzHo31hJ/YDs/Gc10pwCJqEqeV3Lxfa2ygEsfiuqZo9o/mAJBz
X-Gm-Gg: AZFdTZciWOmNlqX/zMiHfiqxs5QIrg+gvskaMBF+FxA/cNPn4CgPsDlwbQ/zmUBN3Eb
	Rjm5PaxgtTRvR8NzoTVI7BOLnWie+ctSCVDy8KimMTQtq73AV/QTxAAEqdYGAXp4/Wx6ylhQ0+R
	upRukOgSB8gSeo59YCj6CQk7v2VFbh76hEaS+6ePsvgPoEwvV9y6fqlUyKFeaXKGgMWaP982Bm3
	4kI/BBxOStaOaOHWOz9LOYrXYfOKILAbE0JVNNlaABiNR2+pUvKRrOccRTkjbZEpNI8A2b8d+WK
	bt0C2TOwcZIIRWcaVb8aerHuncNb9nMcdRxiOH0DW84BGuA5Uie0VnBG8JGxwa2/0fXKrVmrWXc
	RAXlc1/0NIz1iWrC/OCWO7KzQTUChiYqNOVFl5XmXp9aaOZQD3BHyrjKaDwBapHdnHAgGz+szyk
	3J8QvFDPUv9SYUy974QBHrAcp52wvHzP9cFrwyPfFW9f+luwe0t4TCosNNapAbunYivOE/BvhKc
	4GvLWu2S6e06TeMn16nPk8h4ahTX61fAUc+1wySrFHSy0PsYr2Rc50HJZIVmMpQxFMGz74A9PCv
	gJyLtIrlF46L49ZnYxuqcOFb2GJnrAiEU7yiH5yyWaTBah7F9ypBMXkwEmZo8g==
X-Received: by 2002:a05:600c:4f4c:b0:4bb:8503:69f4 with SMTP id 5b1f17b1804b1-4bb888097a2mr556240315e9.5.1795732181508;
        Thu, 26 Nov 2026 14:29:41 -0800 (PST)
From: =?UTF-8?q?Bala=20Andegue=20Fran=C3=A7ois=20Lionnel?= <balaandeguefrancoislionnel@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/3] docs/man: fix typo in xl-network-configuration.5
Date: Thu, 26 Nov 2026 23:29:17 +0100
Message-Id: <20261126222918.951621-3-balaandeguefrancoislionnel@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20261126222918.951621-1-balaandeguefrancoislionnel@gmail.com>
References: <20261126222918.951621-1-balaandeguefrancoislionnel@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1795732182-530D9CFC-CAA1B473/0/0
X-purgate-type: clean
X-purgate-size: 1023
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix the misspelling "exclusing" -> "excluding" in the description of
the mtu option.

Found with codespell. No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Bala Andegue François Lionnel <balaandeguefrancoislionnel@gmail.com>
---
 docs/man/xl-network-configuration.5.pod.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/man/xl-network-configuration.5.pod.in b/docs/man/xl-network-configuration.5.pod.in
index 324ee9bbf85e..0c940462f36c 100644
--- a/docs/man/xl-network-configuration.5.pod.in
+++ b/docs/man/xl-network-configuration.5.pod.in
@@ -255,7 +255,7 @@ NOTE: This should not be set unless you have a reason to.
 
 =head2 mtu
 
-Specifies the MTU (i.e. the maximum size of an IP payload, exclusing headers). The
+Specifies the MTU (i.e. the maximum size of an IP payload, excluding headers). The
 default value is 1500 but, if the VIF is attached to a bridge, it will be set to match
 unless overridden by this parameter.
 
-- 
2.39.2


