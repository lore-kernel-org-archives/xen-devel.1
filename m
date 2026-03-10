Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C3DFD4F05
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2026 16:45:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1250304.1547773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00CY-0002qG-SP; Tue, 10 Mar 2026 16:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250304.1547773; Tue, 10 Mar 2026 16:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00CY-0002q9-Pb; Tue, 10 Mar 2026 16:44:58 +0000
Received: by outflank-mailman (input) for mailman id 1250304;
 Tue, 10 Mar 2026 16:44:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vo/M=BK=bounce.vates.tech=bounce-md_30504962.69b04a86.v1-ab72382673ed4219823e03700adaec69@srs-se1.protection.inumbo.net>)
 id 1w00CX-0002px-ED
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:44:57 +0000
Received: from mail132-19.atl131.mandrillapp.com
 (mail132-19.atl131.mandrillapp.com [198.2.132.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 778b7e3d-1ca0-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 17:44:56 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-19.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4fVfqp0shXz38V
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 16:44:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ab72382673ed4219823e03700adaec69; Tue, 10 Mar 2026 16:44:54 +0000
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
X-Inumbo-ID: 778b7e3d-1ca0-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773161094; x=1773431094;
	bh=PDKUA/ghCpgwOyp0wj5kBTfKQs5YlszkqJ+BY+fssTw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=OJhyg9SKKlUdl7O3lpFHkmEUOf9MjtgLaKrKxX89QZLR0iyI4Fi/KtiGfjKYDRIpD
	 b15pxQOws7eY3U8Rl2R6T2EWg3QBifWTd1QhnQOG69tB8EiL8UY2uMxuNzStwmScsc
	 U9vetnDDhJmURtXVAZB9LGsjOOOUnZgviWdQjQx2oAgexC0BJoTGzQAw+yeuKK6GMU
	 oIDzGQiSPm8FDq6GQbGjH1XH8+WSY03wUdPhptE1KqRsB/xTtoWW/MHuLJr+4x/L3x
	 BtuXAXbLnp50XDM9uqoizB3zzS+Zi03/qoOOjog6nYuQMi/mCbWOGDKC+THEfL1CFl
	 pKL/BS1k1X+Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773161094; x=1773421594; i=teddy.astie@vates.tech;
	bh=PDKUA/ghCpgwOyp0wj5kBTfKQs5YlszkqJ+BY+fssTw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=RHUniUrECtGwPXN1Uwl7AlAb3UfH+29S0aTDsbL4f7p5fHZpuLA8Igz1SnHWc2jj6
	 hAA2GKL8EXDkOHOGaYttkdmVOB6R3wKLEzfZA0g6Q2NxYGgnXr0ttj09bKFI8IS/T0
	 Vvwuz0QMK6nNV/m9upbHQUdgUQZO0MOD8MdwCjusupZGnF5dJ6zF+/jozf4Pyh5k06
	 TAntwPxvNBnTc3w28UQogHhIq/r52aQHqLLbDnZXl7nt/oLxTLIYqGdJSY2xfLQgwC
	 3xeWRmCU6oGktkqbUfxjPqlyE4OF6j6YQD0ZkOwifOQO9oM7WJste1/EZ6aHSfsAyK
	 J/gur438yD7UA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=200/6]=20Intel=20vPMU=20improvements?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773161093132
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <cover.1773160025.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ab72382673ed4219823e03700adaec69?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260310:md
Date: Tue, 10 Mar 2026 16:44:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

First patch fix a problem that prevents vPMU from properly working with
a PV domain on a processor that doesn't have hyperthreading.

The second patch adds a missing PEBS/DS_AREA MSR handler for PV.

The next patches tries to introduce a proper CPUID handling and restrict
some hardware limits to Xen ones.

Last patch allow vPMU to work with PMU version 6 (Intel Core Ultra and alike).

Teddy Astie (6):
  x86/vpmu: Expose up to 8 Intel event selectors in PV Dom0
  x86/vpmu: Expose PEBS and DS area in PV mode
  x86: Define some Intel vPMU leafs
  x86/vpmu: Sanitise Intel PMU version
  x86/vpmu: Limit to using supported general/fixed counters
  x86/vpmu: Allow PMU version 6

 xen/arch/x86/cpu-policy.c            | 39 +++++++++++++++++++++++++++-
 xen/arch/x86/cpu/vpmu_intel.c        | 24 ++++++++++++++---
 xen/arch/x86/domain.c                |  2 +-
 xen/arch/x86/pv/emul-priv-op.c       |  8 ++++--
 xen/include/xen/lib/x86/cpu-policy.h | 10 ++++++-
 5 files changed, 74 insertions(+), 9 deletions(-)

-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


