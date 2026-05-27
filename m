Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48735CD5BDE
	for <xen-devel@archiver.kernel.org>; Wed, 27 May 2026 01:21:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1320278.1587640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS2xR-0001pQ-0i; Wed, 27 May 2026 01:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320278.1587640; Wed, 27 May 2026 01:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS2xQ-0001og-Qw; Wed, 27 May 2026 01:21:16 +0000
Received: by outflank-mailman (input) for mailman id 1320278;
 Wed, 27 May 2026 01:21:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wS2xP-0001gS-Us
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 01:21:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wS2xP-005m8e-BG
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 03:21:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1646e5-2eae-0a2a0a5409dd-0a2a450cd0b0-16
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 03:21:15 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a16470b-62f1-0a2a450c0019-d155da29c42d-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 03:21:15 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-bdb3eb93e20so1004846366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 18:21:15 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.69]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5ece286sm550541266b.40.2026.05.26.18.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 18:21:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779844875; x=1780449675; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5q42x2SOumwV2ISXd6im3oJPw1oUaSthvJnr3rBh1Q=;
        b=XP95W2WPsjBB5oyYiVafiQq1xN4A5yA76kGHaY8jn/vraV/Wf/rrWOqVPv5YURkoyg
         gxN9ZkmpZaJt3LokqldafztIVMt1n6nfZ1C27tXUy1z66qu+FvCJBGe+JWq1IRl9ZCu+
         mycxrTl2OKYMJwaEs77KbV2KXtKI2Z/UI7ghWmP+uCG55eFd+CrZwOE8obATii7Hh0wY
         JekCpPd4rL7OzfDX3a7rb/DdKpIJVXzgPCcIU78JwA/+nDqlfYeI7lobBzWgXMnzhD27
         gOmS5hK9rXJV/bSW5oSjgIr6LyxQbOX7HBBpGHtHUozwXnKXaXX4XUaixEU3sKd3aetc
         kr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779844875; x=1780449675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z5q42x2SOumwV2ISXd6im3oJPw1oUaSthvJnr3rBh1Q=;
        b=RyMtKhNrQiyqL/iH6+c4Ff4ZT3thH5+eUVys48QznoEN+LS6r0dTUBjJGIXK/fdSTH
         FCsVacUcPnMCrEr1nkgKGo+jsu2eUtaxuAq0OzkOYSJZwJhrLBgJw6xr9jtlCcgx2Cmh
         Z4Lzw1/fXA87NEJPfQVIFTddy+qGpBpGU12W2wDbStIZL81wIJFb5b5Z53vmflYruMzt
         qyaN2Lg/T5VqI9/X5jYgwK21smWOJvBqJ5xXDnKPyhuh/7h3cCW5oPXyQuLOZbiSBJvs
         8svjTuJgYAfamwl8p2lQx9lZIkoZNmQ9o/BzWIY4OL7DsNaDR1k4HEhAjZfywbG3mJS8
         AnJw==
X-Gm-Message-State: AOJu0Yxyp8wQVLND3THxtE3rOQ1e/em3GEyyC1jgVx/77joMKDxU9ow/
	KKDsWmPKf1/54g4XffMQGpfRxvuNoIlrL292De9jOZpTp9DoT3zdXUhlFtmZww==
X-Gm-Gg: Acq92OER2kEb1hj22r21preg9duwv4QJo3pDfdKvsuzEh+sNOdKkYd8FvgOlriwgqzs
	rYjGxkw3d2qXABslvhvNoWpppihOStNDnJoc1wJ8VZWqSeKVQZOfkH/XGJP3nFS7ugyWm2um0Oc
	w+hUjbjaNCKsnWH7wdSTNDusCgjVxbyjO3ehc486W8CCfiw7a2+jSUsatIg8kvPgeOczoKqawtz
	W0a/EjwQssfATbGABx29MBCQ7uCEOacmyBqWhvBliy9w/lzIDdPt0nBZw/AEWT3vca7SkKo2Fim
	aGTOOhJdr64cPdjxjfDaiuQ3db8zbB5NDTYwoULyHrgZt1qucVmCVPYVWHAsBp5gHmRFGo9oPcz
	vMmq37E5MejC879spCgVxaYng4WBjyVQKeYld2ongA7JP+GE6zY8gw0H2cx4B0G6bPra+Hw2LIY
	4uCssae+9HxVPVueQQHusJf3+f4B7mdZHD7by4
X-Received: by 2002:a17:907:3e99:b0:be2:cd33:213f with SMTP id a640c23a62f3a-be2cd332452mr350832266b.17.1779844874751;
        Tue, 26 May 2026 18:21:14 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 v2 2/2] docs/arm: Document GICv3 vCPU limit for host-layout domains
Date: Wed, 27 May 2026 04:18:51 +0300
Message-ID: <0799399a712539130dbfced315d5abb8e20137ad.1779840898.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779840898.git.mykola_kvach@epam.com>
References: <cover.1779840898.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779844875-E0159CF5-CFD08657/0/0
X-purgate-type: clean
X-purgate-size: 2620

From: Mykola Kvach <mykola_kvach@epam.com>

The number of vCPUs requested for a boot-time Arm domain is not bounded
solely by Xen's generic domain limits. For GICv3 domains using the host
memory layout, Xen can only create vCPUs whose virtual redistributor
frame is covered by redistributor MMIO regions exposed for that layout.

This can affect the hardware domain and direct-mapped domains. Document
the GICv3-specific limit in the `cpus` property description in the Arm
device-tree booting guide. Also add a generic domain-limit caveat to the
`dom0_max_vcpus` command-line documentation.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- move the detailed GICv3 host-layout redistributor note from
  dom0_max_vcpus to the Arm device-tree booting documentation.
- keep only a generic domain-limit note under dom0_max_vcpus.
---
 docs/misc/arm/device-tree/booting.txt | 9 +++++++++
 docs/misc/xen-command-line.pandoc     | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index f73839df09..bcb06bc796 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -162,6 +162,15 @@ with the following properties:
 
     An integer specifying the number of vcpus to allocate to the guest.
 
+    The resulting number of vcpus is still subject to Xen's generic and
+    architecture-specific domain limits. On Arm GICv3 systems, each vcpu
+    needs a virtual redistributor frame. Domains using the host GIC layout,
+    such as the hardware domain or direct-mapped domains, can only use vcpus
+    whose virtual redistributor frame is covered by the redistributor MMIO
+    regions exposed for that layout. If the requested number of vcpus exceeds
+    that limit, Xen will create fewer vcpus than requested, stopping at the
+    first vcpu whose virtual redistributor frame is not covered.
+
 - llc-colors
     A string specifying the LLC color configuration for the guest.
     Refer to docs/misc/cache_coloring.rst for syntax. This option is applicable
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index d46d5b2152..8c89b7852c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1000,6 +1000,9 @@ For example, with `dom0_max_vcpus=4-8`:
 >      8    |  8
 >     10    |  8
 
+The resulting number of Dom0 VCPUs is still subject to Xen's generic
+and architecture-specific domain limits.
+
 ### dom0_mem (ARM)
 > `= <size>`
 
-- 
2.43.0


