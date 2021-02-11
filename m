Return-Path: <SRS0=WbUH=HN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3493FC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 11 Feb 2021 17:20:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD1F64E79
	for <xen-devel@archiver.kernel.org>; Thu, 11 Feb 2021 17:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBD1F64E79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.84027.157406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFd9-0003qF-SN; Thu, 11 Feb 2021 17:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84027.157406; Thu, 11 Feb 2021 17:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFd9-0003q8-PT; Thu, 11 Feb 2021 17:19:51 +0000
Received: by outflank-mailman (input) for mailman id 84027;
 Thu, 11 Feb 2021 17:19:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYUG=HN=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lAFd8-0003q3-2Q
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 17:19:50 +0000
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f973be68-ff6c-43da-b98a-9f14af12bcea;
 Thu, 11 Feb 2021 17:19:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id o10so6279211wmc.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 09:19:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z5sm116078wrn.15.2021.02.11.09.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0EE761FF7E;
 Thu, 11 Feb 2021 17:19:46 +0000 (GMT)
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
X-Inumbo-ID: f973be68-ff6c-43da-b98a-9f14af12bcea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TL6W7d73N3GCIvRIjYMLyXwnB4yeGf0qOX3lyLDdBu4=;
        b=EhrJgNj+rqe4e0/GVhKmxbOe9lxjJ5L9gjz6PiG8j0QQosmYD466hhVvdnX85G7hwU
         Z6S/GHysPn7kLK8NIPDdtl891EDpm9PBagn2RJYeua6mDmOCslp75bzwJnr6pFkIvQos
         UjAEUORUnOfUG6SX/aSEY5DRGnmXchX5AJ2gB/vvXHr0hxjKrVKoti7/Q2wDrKu/727f
         +Hpsy8L9K7OaAaQiLMglrF15jw+craZ4ZnAIzVJ30rZTxvCerYpw/crrxiuuYAt6z6Mq
         ZcJcp1ub2AFd0shcMC+tcqOJWPRAxc+aFSejPyy2kb9SmauIIOY8CzdQK6ZDCG9hk3UO
         JmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TL6W7d73N3GCIvRIjYMLyXwnB4yeGf0qOX3lyLDdBu4=;
        b=LOUrnJSl1bjqsiF6uSHA8f39FzezYdcsjMLxLM/9bezD3EtLfliuB1nCB2UIcu5DvE
         EU7RjnQTC+a4Zh69gq2gl1FCQcPrw4A/F+ngvVTs2JZtvnYD3+3i1E2WY2LjuL+IFqGZ
         2sVu6OVQcGUpo6FHyo2WDHY8Z3Tws50hqt5XnVFnwP+MK6EpibZqhxhnor8OD/YqaY+i
         +J6Aai3EiYoIxP4hguOsFDEeGjASc9ZMIUTvwAG6jojGKSrtKKOAuGiCvZOXiW+BWy73
         14o05Fnd3Lcj0ULHp0dVIYdXgOgmGUZ8dO90M+qy1MiRDF2O7hcVOqa4BLcY/iaE2stW
         AWIQ==
X-Gm-Message-State: AOAM533JQOX5MI2MdlwXPs7WLctqHeFCSQIVG8AtX5rkEOd7iqr5lJAP
	UtPT0NNKy2WqQr7AxvlLP4eOBg==
X-Google-Smtp-Source: ABdhPJwfc92IAQZFHyt9zLftcVjQAQ6qq5klu9mtEeWvx9NXaKZ4BhyBwZ597NnKMkWsjqRkB3sJaw==
X-Received: by 2002:a05:600c:41d6:: with SMTP id t22mr6094059wmh.74.1613063988088;
        Thu, 11 Feb 2021 09:19:48 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 0/7] Xen guest loader (to boot Xen+Kernel under TCG)
Date: Thu, 11 Feb 2021 17:19:38 +0000
Message-Id: <20210211171945.18313-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

These patches have been sitting around as part of a larger series to
improve the support of Xen on AArch64. The second part of the work is
currently awaiting other re-factoring and build work to go in to make
the building of a pure-Xen capable QEMU easier. As that might take
some time and these patches are essentially ready I thought I'd best
push for merging them.

There are no fundamental changes since the last revision. I've
addressed most of the comments although I haven't expanded the use of
the global *fdt to other device models. I figured that work could be
done as and when models have support for type-1 hypervisors.

I have added some documentation to describe the feature and added an
acceptance tests which checks the various versions of Xen can boot.
The only minor wrinkle is using a custom compiled Linux kernel due to
missing support in the distro kernels. If anyone can suggest a distro
which is currently well supported for Xen on AArch64 I can update the
test.

The following patches still need review:

 - tests/avocado: add boot_xen tests
 - docs: add some documentation for the guest-loader
 - docs: move generic-loader documentation into the main manual
 - hw/core: implement a guest-loader to support static hypervisor guests

Alex Bennée (7):
  hw/board: promote fdt from ARM VirtMachineState to MachineState
  hw/riscv: migrate fdt field to generic MachineState
  device_tree: add qemu_fdt_setprop_string_array helper
  hw/core: implement a guest-loader to support static hypervisor guests
  docs: move generic-loader documentation into the main manual
  docs: add some documentation for the guest-loader
  tests/avocado: add boot_xen tests

 docs/generic-loader.txt        |  92 ---------
 docs/system/generic-loader.rst | 117 +++++++++++
 docs/system/guest-loader.rst   |  54 +++++
 docs/system/index.rst          |   2 +
 hw/core/guest-loader.h         |  34 ++++
 include/hw/arm/virt.h          |   1 -
 include/hw/boards.h            |   1 +
 include/hw/riscv/virt.h        |   1 -
 include/sysemu/device_tree.h   |  17 ++
 hw/arm/virt.c                  | 356 +++++++++++++++++----------------
 hw/core/guest-loader.c         | 145 ++++++++++++++
 hw/riscv/virt.c                |  20 +-
 softmmu/device_tree.c          |  26 +++
 MAINTAINERS                    |   9 +-
 hw/core/meson.build            |   2 +
 tests/acceptance/boot_xen.py   | 117 +++++++++++
 16 files changed, 718 insertions(+), 276 deletions(-)
 delete mode 100644 docs/generic-loader.txt
 create mode 100644 docs/system/generic-loader.rst
 create mode 100644 docs/system/guest-loader.rst
 create mode 100644 hw/core/guest-loader.h
 create mode 100644 hw/core/guest-loader.c
 create mode 100644 tests/acceptance/boot_xen.py

-- 
2.20.1


