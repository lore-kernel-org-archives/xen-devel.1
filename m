Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1067CD98F0
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2026 17:28:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1339505.1600711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXaY-0004hj-JY; Tue, 16 Jun 2026 17:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339505.1600711; Tue, 16 Jun 2026 17:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXaY-0004hc-Gk; Tue, 16 Jun 2026 17:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1339505;
 Tue, 16 Jun 2026 17:28:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZXaX-0004h9-9u
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:28:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZXaW-004dHr-2G
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 19:28:36 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3187ab-5cb7-0a2a0a5109dd-0a2a4501a71c-20
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:28:36 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3187c3-c1f2-0a2a45010019-d1558032c860-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:28:36 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so35239475e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:28:35 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-461abb44c3dsm5012754f8f.9.2026.06.16.10.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 10:28:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781630915; x=1782235715; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NKJVvAIYFxvZ8mt8ChDl47t49tqxoMamrJnbHmzTz0w=;
        b=qLEIiciAMJ5nhOImtgnGB2e7sn4uBA9FHXFp5gkRGtdGGmlDFdCAFpP6IUgNtXwdnw
         znEBbXtdQvlV+/RkhF6UTe1x2uwCfP//opRh4QsSApv4CLDvrWCrWQLis2zel1PfMwpk
         o6Sz4bctXoEri0u08oC9q3M/BL+p1rc7Lj75dxNsSV5N+WB901PBeK/Pja/r0LqpKdh5
         w3QtM9NwRW6EsLMjFAOEWifjpnFFKwu9BJabM6VeYB469kXmvfv8xsvb3VEa8wNyQGwF
         ZX3jYbFPKeKkddMmFf98Aj4pSry+Twl3zKsp+h36ASBUpBeMaH0nSjbeNwb59Xdd+S/n
         2JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781630915; x=1782235715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKJVvAIYFxvZ8mt8ChDl47t49tqxoMamrJnbHmzTz0w=;
        b=Es8Z2qaLD5WLcfM4kDp5/ikRFsmco1NACp7Gd4ZYhi/A/IrFs6uKrN4uNk17Yv+Jfr
         G/laxU9ZX83uQZoLeFLLWzDkN5fZJhVpojvxmJ2555AGyhU1mfPqp6z9ypBtGdA+jkJc
         LmBprqPPN6JHYS5rvz2ntgA2soq/99H1cFCLnadxlmkoZurS/WMr6Dt1csH5sJYc8yCY
         PCBNkfHR10R+PZjce8AlhWkKM6+H5R8rTvhJ08LjUFa1mWfDGIdAAviIIXz/f3cKgZ9X
         x831io4d2LvpaEfLXahyK9ivolMEbDV95nr0VU0eWs8nWWVBCNKCyA6LGnmRm3awiekA
         3/iA==
X-Gm-Message-State: AOJu0YydZr42J2rv9lQKALkxbzmJnCJP6wig6qDXjyGBjAAMxHT89ysK
	Hr1kIG6KmdAodMek21wXFLQxndaiHFaSbfw+nKj/cACwy50iNtCi+9JMAnaT2jfIZ6s=
X-Gm-Gg: Acq92OFJdcGKPgv3Y1+tRGVgbE/Rc8dIh3GpYu4VDiprDn+/NkrItLQYhK7Ue2QYn4o
	gFzUtHe3HI+YHgYM47x0H/NYWujvbIrwr/T9EcHss2gvx+0aL4KxQVbX3wyrDm4globMkPgVpdw
	lpr9kd/YpgaOoKO1JWvAaYsZ2xehiOak0J/J0uVOsYmyDxMFn36eFLQkJpRW+k3tqxgwzfTKOwW
	gFXH5X2wrvSPK3gHlFGUD9NTsNTqNSG0/KGvSIslld4R+adjqqd5UAkqUqSBAn3GEmHaK4Bht/x
	Kby3YJgEC8UcEtYRrFowjtnK/rkhldz/aNTbIkWhvu1xx00oC2psmq71xo1uK4QYOIcHsmoJOCA
	jViVLQRZZ9pI7EFqbL8h/cgIyAGwSULW78Yet0h4IFWVTAfL6Dt4/bMi/1r5MyFLePNYw/F2V5u
	jaS9J8C4ourcYTOcNiOKAgrKMjvclCidh0xchgCtH67Sq//gJ2B+/qdiCLuXoxo1ofFhjd3S/d0
	6XlNRQQ+nTvHERYuaa0wMGJQiE=
X-Received: by 2002:a05:600c:80c1:b0:490:6e12:542d with SMTP id 5b1f17b1804b1-492333e2f1bmr6454565e9.19.1781630915197;
        Tue, 16 Jun 2026 10:28:35 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 0/4] Various patches to improve Secure Boot support
Date: Tue, 16 Jun 2026 18:28:26 +0100
Message-ID: <20260616172830.111393-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781630916-B6143FF4-4CF786A9/0/0
X-purgate-type: clean
X-purgate-size: 1142

These patches improve support for Secure boot.
UEFI CA memory mitigation requires memory pages to be not executable and
writable at the same time. So changing permissions and splitting some section
is required.
Remove multiboot pieces from EFI executable.

Changes since v1:
- improved some comments;
- merged 2 pacthes removing multiboot support in x86 PE;
- removed a patch dealing with SBAT;
- other minor changes (see single patches).

Changes since v2:
- improved some comments.

Changes since v3:
- Added Acked-by;
- Improve commit message.

Frediano Ziglio (2):
  Align relevant sections to 4KB
  x86: Split .init section to satisfy UEFI CA memory mitigation

Roger Pau Monné (2):
  x86/efi: discard multiboot support for PE binary
  x86/efi: avoid a relocation in efi_arch_post_exit_boot()

 docs/hypervisor-guide/x86/how-xen-boots.rst |  6 ------
 xen/arch/x86/boot/head.S                    |  3 ++-
 xen/arch/x86/efi/efi-boot.h                 |  7 +++++--
 xen/arch/x86/xen.lds.S                      | 22 +++++++++++----------
 4 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0


