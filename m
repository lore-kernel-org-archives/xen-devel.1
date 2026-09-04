Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CE0C61DD6
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:12:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408220.1640857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RqW-0004qf-Q0; Fri, 04 Sep 2026 11:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408220.1640857; Fri, 04 Sep 2026 11:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RqW-0004qY-Mp; Fri, 04 Sep 2026 11:12:36 +0000
Received: by outflank-mailman (input) for mailman id 1408220;
 Fri, 04 Sep 2026 11:12:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x2RqU-0004qD-NW
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:12:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2RqU-006qSV-3g
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:12:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa79b-8faa-0a2a0a5109dd-0a2a4501e67a-28
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:34 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa7a1-5984-0a2a45010019-d155dd29e8df-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:34 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-482e4998d28so623414f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 04:12:33 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885be1c1sm5501729f8f.32.2026.09.04.04.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 04:12:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1788520353; x=1789125153; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hmkZM9Mm73S645jnJBU1at3N10v0ENSyY/CU3V99DxM=;
        b=oMQ05KIEyLbV2jea+jiwj246+Y0CjROtCG43lZDMwS6RG75wFN1YJqs5eR30uRMsT/
         Sti9uxIW7zlp+u9P/OS0DmR4dVq6grbLkHUY9AbjEPWgQ2JMx0822wsSsVmLxTKIzEOP
         LbgJIinSmcSmx3nz2MWXSH7yzfItDxnWEB1TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520353; x=1789125153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmkZM9Mm73S645jnJBU1at3N10v0ENSyY/CU3V99DxM=;
        b=m5rKo0Bi8JvM2GeOvIWFmXla6lX58VUlSsxnpYtyCy2JcyzAzDPae/RRIKx8zJ+GEh
         9Y/3xWaxcK+nAVf+xv6UDoHavPTzeiMtDk61OvPXu6SUBYVOqZxoaj8BhPbyjK/4wTlp
         GLPcaqe+atfsjmloqIFTY5u6GFEygocCj0EpIedR7obRFwaBeSoj5tdUWU0HHjF/ndGi
         TEMSI8rbtBTaeJgS+xYvJxw7nXQvycTtbpe8hn+XQohbtrUEued/PHu+OCiiv0CBH/l7
         hqQiEzRXFAe17hyilUY5w9Pi9V04v4YQUB5ZISoILfhHL/nvtdjmjoC8SCC8pEUYTCj3
         pUug==
X-Gm-Message-State: AFuF++kI1boN2I0V2EopwQzZ9UiQENQT+32/tyLTJp22I3TLwYIsKkCy
	P7PPK2lcV3abBEuNyp8b4/I8nhbZIbKzig4fqEf3WJIyPm68i6HN54m/L0PC5OrEsB48WntAe5Y
	VkESo
X-Gm-Gg: AYBFou0DV3IKn3kKpYhy/vjyb9GqkLgN3DtNZcc2Mmjb/9MldaVHWSpFBC2lHrigpMx
	/n3Uj4Xx+hZdU9Ppxu2g+ty6tRA0iI3r4aoehIBORP/r0aURMGY/2V3pHLiC0TW7GgfB3XhPWXp
	aP0nQlQQkYI4aslhg0w6teI7AZcdzhSePEabEINoOIXLqspJ/hrMl4kHnB/uT1tajtm3BMFljTm
	zOv9gPOjmj53al4o4kShR0BasbGF5t0bgazvUA+JrlLwcEHYOZTWvn84iUp4RQRFhF+8xH1YI2Q
	WpLlw0oep7C0Elo+H6Y5+gECyhLGKMJOSHTAUZvl3auyVHEu7ck73umk23XazBCQ84na1AneRw7
	OrTWbNlanayGUqa93OsfpKzrNJDnrns21YKP1KKBCRVg+jkbS/aCjJjC+Yeq6hjjOR8AZlTVkVv
	cIydSrfEK7PKWdscRc2ToZoCM6b0HPhKiI4gTYEInvs/RA3qaC9M2gJyvH9vvHNBlCSQ7UO+d+5
	PKs2S4zMgQX8CQ78EizhGtlqhn/twh1mJpzOcs=
X-Received: by 2002:a05:6000:25fe:b0:485:8cb8:b838 with SMTP id ffacd0b85a97d-4858cb8b900mr1701754f8f.7.1788520352907;
        Fri, 04 Sep 2026 04:12:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: [PATCH v2 0/5] xen/arm: Fixes and improvements to SMCCC
Date: Fri,  4 Sep 2026 12:12:23 +0100
Message-Id: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1788520354-C4B45757-EE6EE7FA/0/0
X-purgate-type: clean
X-purgate-size: 1331

Patch 1 is a bugfix for the issue reported by Jan Setje-Eilers.  It needs
backporting to Xen 4.22.

Everything else is because I couldn't bear to leave the code generation in
such a bad state.

Only minor changes since v1, in patches 4 and 5.

Andrew Cooper (5):
  xen/arm: Fix evaluation of parameters for SMCCC calls
  xen/arm: Introduce arm_smccc_guest_smc()
  xen/arm: Clean up 32bit arm_smccc_1_1_smc()
  xen/arm: Rewrite arm_smccc_smc() for arm64
  xen/arm: Rewrite arm_smccc_*() to return by value

 xen/arch/arm/arm64/smc.S                    |  16 --
 xen/arch/arm/cpuerrata.c                    |  18 +-
 xen/arch/arm/firmware/scmi-smc.c            |  16 +-
 xen/arch/arm/include/asm/smccc.h            | 238 +++++++++++---------
 xen/arch/arm/platforms/exynos5.c            |   2 +-
 xen/arch/arm/platforms/imx8m.c              |  16 +-
 xen/arch/arm/platforms/imx8qm.c             |  16 +-
 xen/arch/arm/platforms/seattle.c            |   4 +-
 xen/arch/arm/platforms/xilinx-zynqmp-eemi.c |  17 +-
 xen/arch/arm/psci.c                         |  17 +-
 xen/arch/arm/tee/optee.c                    |  50 ++--
 xen/arch/arm/traps.c                        |   4 +-
 12 files changed, 187 insertions(+), 227 deletions(-)


base-commit: 48728c33e43329c8037575320ce681a65cc13eb7
-- 
2.39.5


