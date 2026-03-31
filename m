Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D80110F92F1
	for <xen-devel@archiver.kernel.org>; Tue, 31 Mar 2026 19:04:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1269257.1558337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eO6-0004XW-FZ; Tue, 31 Mar 2026 19:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269257.1558337; Tue, 31 Mar 2026 19:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eO6-0004XP-Cj; Tue, 31 Mar 2026 19:04:30 +0000
Received: by outflank-mailman (input) for mailman id 1269257;
 Tue, 31 Mar 2026 19:04:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7eO5-0004XI-KY
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 19:04:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7eO4-001kxS-Im
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 21:04:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc1ab2-bab6-0a2a0a5309dd-0a2a4507bd8c-10
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:04:28 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc1abc-fd74-0a2a45070019-d1558036dd31-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:04:28 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4887f49ec5aso13454325e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 12:04:28 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a6ebsm66704905e9.6.2026.03.31.12.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 12:04:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774983868; x=1775588668; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=845HDfVTBoc7mrrFu9xgBwD2zq28tgaJ6wnc45Ubl+s=;
        b=o8ieWmoC+nHyQHq9M1oHNs6uq4eMzJhGQLHF0fO8m9bgv39N5SIoSahaU30QqpLe6w
         FCtaXN5dAdeuzZdmYl6oxI9EvCYMcEHtrRp6vYUxZBT1JZQ90yllLZW2MA5m0DjIurgv
         4DrKYpx1U+rVcKLuLYdpoGnDLgV5slxZGZhSZiCY1gH2Zaplxkw02PAv2LLG/Q0kh8fP
         4Lwh/fzdmLd+BRmbFV3kvs5XXv5P93iIxvuYgfQlZZh02B+yVXC6gpqTmzbVRvC+vNOz
         SMXlYE6n5ORVSizXJbCrVzvIq0eTm7h14Dv5JPPwpsuHiGGUVoErhhI1SuDCAMyj6dbJ
         iBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774983868; x=1775588668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=845HDfVTBoc7mrrFu9xgBwD2zq28tgaJ6wnc45Ubl+s=;
        b=cc4IoFJnIjBjg+th1IR1ZRxv2d+9DinK+qdXDAlNBPbSYCh20VSXzBt8sD6X1v8bRv
         3nzge1LCjWcWfCMg2ATr7MtExnWh7cYA1Ep7KIbEDm4ht1l94IwBExOKXwbLcPkP7gl/
         rmZqQWldSuDEV72eDRT+oHlGCOr5Z2d87TtLUQmKcBVdxn1pQYPMkVAqWx+rffsc6NKK
         gvJpQRPGBMU6rLM5lIkJs8htJdj6sKkPUeN/JVuaAj5sDULFWeYWPpYXpLPuFVTEB/SU
         KbgdagI+itc4C2wrRzrwHoYxi1fw8epwwMx7t8QDgAVdZ7lD+VGMuonGmP7WzthAlDva
         zckA==
X-Gm-Message-State: AOJu0Yy8BYVXbcc/7iMWk2QNi3rP3waOC/17te5ipeLdt6Wtmu/2pcx4
	cbZL14dzZmUMny8U6USlO6HlO9D80d6znpGfoF9/FpTFQeS+3uJ4lB1WOd/tZg==
X-Gm-Gg: ATEYQzxy9gguzOy9aF1WOLXy0ehJowlesXmEjt77uM9NEk+KXMdVo+0AmxDqkChpnyV
	7OV7D7JaX/H54x8Cu5qMAnM5oi6L1tjrBftOn4TE6LWJZzC6WWARiYSZ1ewi2f7emxN0fm4pZ3H
	IAAEOgIRuPHrcbe4aUl4U6l/fiIuJmZap7ocUZkb+nrp7dxLE0ZddsGxn1U5RoC5Fx+EWeG49e1
	mOzAxAKWR6jLWbmZ2MJNE2sMTQ5/gnQ3orheI9G88y2/BY1ujFo8bI+V0nxl6RytTLj1jpal2fa
	0TP2lHCypSiJBNReIn/xa57n7ez3kBTFZkffev80wS0AJ42RNbJ4IHsq39IrZPDcwqTJ7tEQdFz
	JNsBbsqUoU1PGtIu6KECbqTfqBf/ziKyfPUagN0tInbnbKJpdgcFJryKYrBMglUfWNHkREUszK1
	nUumZPgNFy9tVxCEn99Mhygfq1ECehXQABb5QZ03MN9T12m0UOIZPdmXGuo/+UyWqd+w==
X-Received: by 2002:a05:600c:1d0f:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-488835a59a3mr8518325e9.31.1774983867440;
        Tue, 31 Mar 2026 12:04:27 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/4]  RISCV: Intrdouce SSTC support in Xen
Date: Tue, 31 Mar 2026 21:04:15 +0200
Message-ID: <cover.1774863161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1774983868-5CD87303-5992864A/10/73395122804
X-purgate-type: spam
X-purgate-size: 2399

This patch series is created based on [1] and the aim is to make Xen properly
works when SSTC extension is available.

It is needed to do in this way as OpenSBI doesn't pass that it supports SSTC
by DTS to Xen and there is no easy way to turn off support of SSTC support.

Also, as a part of this patch series intrdouce suggested [2] by Jan B.
improvements of init_csr_masks().

[1] https://lore.kernel.org/xen-devel/cover.1772814110.git.oleksii.kurochko@gmail.com/T/#mc14576ef43a83b344c5f31626005b995e2ccbeaa
[2] https://lore.kernel.org/xen-devel/cover.1772814110.git.oleksii.kurochko@gmail.com/T/#m9c18d2d7a98958befec16419f5deccc40f6c8c3e

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2417456208

Also, I've manually ran QEMU with SSTC=on/off and built Xen with a newer RISC-V
compileer (in comparison with the version used by CI's docker container) to
verify CONFIG_CC_HAS_ASM_GOTO_OUTPUT branch inside csr_read_safe().

---
Changes in v2:
 - Address the comments from ML.
---

Oleksii Kurochko (4):
  xen/riscv: add exception table support
  xen/riscv: add csr_allowed_read() helper
  xen/riscv: allow Xen to use SSTC while hiding it from guests
  xen/riscv: init_csr_masks()-related improvements

 xen/arch/riscv/Kconfig                      |  1 +
 xen/arch/riscv/Makefile                     |  1 +
 xen/arch/riscv/cpufeature.c                 | 33 ++++++++
 xen/arch/riscv/domain.c                     | 29 +++----
 xen/arch/riscv/extable.c                    | 85 +++++++++++++++++++++
 xen/arch/riscv/include/asm/bug.h            |  2 +
 xen/arch/riscv/include/asm/cpufeature.h     |  1 +
 xen/arch/riscv/include/asm/csr.h            | 36 ++++++++-
 xen/arch/riscv/include/asm/extable.h        | 58 ++++++++++++++
 xen/arch/riscv/include/asm/riscv_encoding.h |  2 +
 xen/arch/riscv/setup.c                      |  3 +
 xen/arch/riscv/time.c                       | 34 +++++----
 xen/arch/riscv/traps.c                      |  5 ++
 xen/arch/riscv/vtimer.c                     |  7 +-
 xen/arch/riscv/xen.lds.S                    |  3 +
 xen/arch/x86/xen.lds.S                      |  6 +-
 xen/include/xen/xen.lds.h                   |  6 ++
 17 files changed, 277 insertions(+), 35 deletions(-)
 create mode 100644 xen/arch/riscv/extable.c
 create mode 100644 xen/arch/riscv/include/asm/extable.h

-- 
2.53.0


