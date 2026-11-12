Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0B606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n/M4C3MP
Received: from list by lists.xenproject.org with outflank-mailman.1485632.1688783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTGX-0003KJ-RM; Thu, 12 Nov 2026 11:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485632.1688783; Thu, 12 Nov 2026 11:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTGX-0003KC-Oi; Thu, 12 Nov 2026 11:46:53 +0000
Received: by outflank-mailman (input) for mailman id 1485632;
 Thu, 12 Nov 2026 11:46:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRTGV-0003K6-TO
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:46:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRTGV-000DOi-AB
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:46:51 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af5a71e-bab6-0a2a0a5309dd-0a2a45019024-14
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:46:51 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af5a72b-5984-0a2a45010019-d155dd2cd041-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:46:51 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso3768181f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 03:46:51 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49884b99869sm15313091f8f.4.2026.11.12.03.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 03:46:50 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484011; x=1795088811; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2CVmEeZvjj+848uEx9NiE0hsNO9SyGCFM+kP7F0D/k=;
        b=n/M4C3MPUYnk5fhdyH4iO9d6Tkxxkl6lNENz1XpAENim0i/NwRLduafOWHRvbpiQ/6
         ki3ChSD5rpLvneZfOSin30mhoH7u5Td7SE/mfa62Oqqa8dVeTLMNkefgOrfOO+mUlhCH
         +IV4Y9HgnjUumlgV6hs53HHFD+00t9h3qt8qC/HUGjlnUYMaFFHw5qgMo+y8qLAex2vx
         /HoONID0wFKsK4g8z/cqYvowFGxLTqIfE5TFtx5b6TFqVu2oHn0R5vlX3eMHaPd3KMhC
         59O/GNNUZ3WBB4+wy0k6PEWAMI55gVkeZqoK4UY5YoQCBo9ce9f0Ylim8GQWb4esEi2R
         KgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484011; x=1795088811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2CVmEeZvjj+848uEx9NiE0hsNO9SyGCFM+kP7F0D/k=;
        b=h5oVdiYXki7On2M+aXzDzfpxckk3yHC4/a6+9PPGvXEqGXa/cFy7WMkfutnS/8FosX
         MIbhNgoGWUaEPIuAc2Q9khkCJJsBRSw3KATt9OVI81pqYxJAE65e56mWMDkHR3RTSjXk
         4YSdqe1zlaXQ0xcBTDH9ikitJKoPJ5gil/H8rq9PlxSVSrXy4rI1qi2a6onmYY0EL6aX
         XcDyK2pqMSmhXpdr6MPRJmTIUFHv6+tLQIA8qybDJikWY07lmm8Ro0ERX7zjEj5pZ5pc
         K+72jvzr7URq4pmQf37ZlrlrRfnUWAQ7+Ok/5kGFs0AgAwM6X0QOb39uKvduIeE2hFjI
         DDbQ==
X-Gm-Message-State: APuU4Z+hK/dajDAHPxU8FRk32kngHT038J+tWMNaRxeq5aMUcJfnpzR8
	HgC5+bjsEklBFexesBc/BttdF4ViNQbWQRDCP23DIUcKTSrZ4lKIlVmm7NZRsQ==
X-Gm-Gg: AYBFou3LhwppmbLKhs59+jsnoohOybrJ5SlOkEcTi8qKj6wM0n0SEUzxpkinf86N9+T
	SKlmATfFqA/sKMr8bvPR5RFELdvsXCbi8XYZ63GAiyNF7MLn5frqR4UJuajRSkh9Lerir7pqKsZ
	aq4fQCKWimFRGX7scqchuiJH665poWzIrF4ExSCKr9LMhjcxyUTsUNR273Z2EmgPmWFZ/vg2rEw
	/L15XpqhnEYqaGj+cOdSD0gc1ZRd0sm5ejz3pn0CR6dfoH9d7xetveQPP7Q0BI7LyJnbNv82sA5
	90QZodAnRW7W8mFAXIRJgcRgs2EmAqb38OYiJptlFmbySUhbkbhmrJxP21rfrELKJtaDgCo5gVe
	Y/40vDF+XDqOVainlr34k9NL25SIM25xGaxlIhiFh9YxHBDoCc6fzeQpmjrmUAByojle717M4B2
	rJL2WiLrpS+6AKbYUsQDN+XLG+t56jClfmelaSvDn6kqX6CTFJszxa4/bkyQz7Bj+/D2XnX+DyF
	+asOLNnud6FXbmPz5Gq+9njlhf7/u1Lu4Sy9MdIPo6KeCoODw2ZAHcQi4b5VYHC/Sb+CB6jZdbt
	/5NW5v69FTxtuRuPsh+ed1rzNouqJ/9pyhPEePuKGmDM6AvQ6HoEeuQWYvZhS0ZCkOjm
X-Received: by 2002:a5d:5e83:0:b0:493:2eb8:e7d2 with SMTP id ffacd0b85a97d-499c7a2375bmr8878911f8f.41.1794484010602;
        Thu, 12 Nov 2026 03:46:50 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/riscv: add cf_check to vcpu_imsic_{init,deinit}() declarations
Date: Thu, 12 Nov 2026 12:46:47 +0100
Message-ID: <20261112114647.229806-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794484011-1D073757-45474EE7/10/73395122804
X-purgate-type: spam
X-purgate-size: 1278
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vcpu_imsic_init() and vcpu_imsic_deinit() are indirect call targets, as
vAPLIC's vcpu_init and vcpu_deinit callbacks, and are defined cf_check
accordingly. Their declarations in asm/imsic.h lack the attribute,
though, while cf_check is to be present on the declarations as well.

Add cf_check to the declarations, so that they match the definitions.

Fixes: 9164a97efbeb ("xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/imsic.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 639ee327dc67..217fc3d49b25 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -90,8 +90,8 @@ void imsic_irq_disable(unsigned int hwirq);
 
 void imsic_ids_local_delivery(bool enable);
 
-int vcpu_imsic_init(struct vcpu *v);
-void vcpu_imsic_deinit(struct vcpu *v);
+int cf_check vcpu_imsic_init(struct vcpu *v);
+void cf_check vcpu_imsic_deinit(struct vcpu *v);
 unsigned int vcpu_guest_file_id(const struct vcpu *v);
 
 int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
-- 
2.56.0


