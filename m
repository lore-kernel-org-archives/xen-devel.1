Return-Path: <SRS0=Dhlx=NZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26627C433FE
	for <xen-devel@archiver.kernel.org>; Fri,  3 Sep 2021 10:08:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D52A7601FA
	for <xen-devel@archiver.kernel.org>; Fri,  3 Sep 2021 10:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D52A7601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.177969.323775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM67i-0004D4-Ed; Fri, 03 Sep 2021 10:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177969.323775; Fri, 03 Sep 2021 10:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM67i-0004Cx-BO; Fri, 03 Sep 2021 10:08:38 +0000
Received: by outflank-mailman (input) for mailman id 177969;
 Fri, 03 Sep 2021 10:08:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM67g-0004Cr-Lf
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 10:08:36 +0000
Received: from mail-ej1-x632.google.com (unknown [2a00:1450:4864:20::632])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c434e2e5-586f-42b8-82f7-85921841c2e5;
 Fri, 03 Sep 2021 10:08:35 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id t19so10998324ejr.8
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 03:08:35 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id p5sm2427187eju.30.2021.09.03.03.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 03:08:33 -0700 (PDT)
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
X-Inumbo-ID: c434e2e5-586f-42b8-82f7-85921841c2e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7H6Dr6JQKVJd8ZBAOuYHiT1TMijPI9lm94ml0YNkOmU=;
        b=IBD98SZW9KZZal7dGGuQAEjAduRLEntYcTgOwxwpzaCsJOYStXf09lvZqoqv3d00TR
         kCiLhDiAKTv4BvLyvjQAIiHzEK/9xxhTGDZbLRLt0sn98m8dMbHTU+GQn5lvI5/sLVUO
         crCsf6SVRQVa6+1N1/iKw773pDWJO4WSYgvK/Kcfu2dHXevb5j6eMvVAnZ+JAcdDIC3r
         ZVwlrmkcCshjGiXAg8qINGcNFhxs788QTSSDGBKd9SMDNDL4vGxhHpL6MJMae7Alv6EB
         agjJfky004dG/SytKYYnXdlBRFNi2AO3cE4bkyfEdYx52MuCc4X2olG0TMBXo/dBNjWU
         LnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7H6Dr6JQKVJd8ZBAOuYHiT1TMijPI9lm94ml0YNkOmU=;
        b=JeFqIWH9GmpRccQUxSACtUw6gkbPUqcU9JHX2DQVEx5/jiIEjs3a1yw7vVJQ5aaD0J
         aTPS8kWMtTz24xXfKmsHAT/O3haTliNVTZcWlcu+Zlr4mcjVBGn8ztWQ+zvB+kNFZF3d
         9JABiNWBZj785GgHPXXwdHvn0pEU3pk4updKNGDWLEt1c77nnOx393/e3oEtGlhpDFcP
         aN+6Rg4eZc04Unci4bRyg+oNfz5WGuUUqBA2zijYvN7AxVLZH5jaEXukWSf+QF8mhh7K
         Ly2n3N3NuFXU0nnv1kFXRwyax2suM6In4+P6uFeoGDW3fAisZ9cQj2/bgIcATTo1i91i
         ffTQ==
X-Gm-Message-State: AOAM533M3ZqklRruXCykiLG4TaLH1E8juc8FXw1WlD0LGTWb+YeCOxLP
	OLCSmFNDNlzTGWidf4/0403xeNv8D80=
X-Google-Smtp-Source: ABdhPJw6mI/4aI/4ceFyYh6bdRsh+uhWebon0bgMPdhmq94GIcgA6dYEPZWF11K+3koGJZRrPc0/OQ==
X-Received: by 2002:a17:906:2f15:: with SMTP id v21mr3286141eji.444.1630663714345;
        Fri, 03 Sep 2021 03:08:34 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 0/9] PCI devices passthrough on Arm, part 3
Date: Fri,  3 Sep 2021 13:08:22 +0300
Message-Id: <20210903100831.177748-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hi, all!

This patch series is focusing on vPCI and adds support for non-identity
PCI BAR mappings which is required while passing through a PCI device to
a guest. The highlights are:

- Add relevant vpci register handlers when assigning PCI device to a domain
  and remove those when de-assigning. This allows having different
  handlers for different domains, e.g. hwdom and other guests.

- Emulate guest BAR register values based on physical BAR values.
  This allows creating a guest view of the registers and emulates
  size and properties probe as it is done during PCI device enumeration by
  the guest.

- Instead of handling a single range set, that contains all the memory
  regions of all the BARs and ROM, have them per BAR.

- Take into account guest's BAR view and program its p2m accordingly:
  gfn is guest's view of the BAR and mfn is the physical BAR value as set
  up by the host bridge in the hardware domain.
  This way hardware doamin sees physical BAR values and guest sees
  emulated ones.

The series was also tested on x86 PVH Dom0 and doesn't break it.

Thank you,
Oleksandr

Oleksandr Andrushchenko (8):
  vpci: Make vpci registers removal a dedicated function
  vpci: Add hooks for PCI device assign/de-assign
  vpci/header: Move register assignments from init_bars
  vpci/header: Add and remove register handlers dynamically
  vpci/header: Implement guest BAR register handlers
  vpci/header: Handle p2m range sets per BAR
  vpci/header: program p2m with guest BAR view
  vpci/header: Reset the command register when adding devices

Rahul Singh (1):
  vpci/header: Use pdev's domain instead of vCPU

 xen/drivers/passthrough/pci.c |   9 +
 xen/drivers/vpci/header.c     | 431 +++++++++++++++++++++++++++-------
 xen/drivers/vpci/vpci.c       |  28 ++-
 xen/include/xen/pci_regs.h    |   1 +
 xen/include/xen/vpci.h        |  28 ++-
 5 files changed, 413 insertions(+), 84 deletions(-)

-- 
2.25.1


