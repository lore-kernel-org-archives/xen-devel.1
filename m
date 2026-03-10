Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBEFFD4F07
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2026 16:45:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1250306.1547792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Ca-0003GR-9s; Tue, 10 Mar 2026 16:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250306.1547792; Tue, 10 Mar 2026 16:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Ca-0003GK-71; Tue, 10 Mar 2026 16:45:00 +0000
Received: by outflank-mailman (input) for mailman id 1250306;
 Tue, 10 Mar 2026 16:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RolC=BK=bounce.vates.tech=bounce-md_30504962.69b04a87.v1-98e738de90924bc686cc968f1472c66f@srs-se1.protection.inumbo.net>)
 id 1w00CZ-0002px-1I
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:44:59 +0000
Received: from mail132-19.atl131.mandrillapp.com
 (mail132-19.atl131.mandrillapp.com [198.2.132.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 789a7155-1ca0-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 17:44:57 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-19.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4fVfqq3K7VzkL
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 16:44:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 98e738de90924bc686cc968f1472c66f; Tue, 10 Mar 2026 16:44:55 +0000
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
X-Inumbo-ID: 789a7155-1ca0-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773161095; x=1773431095;
	bh=1m7dPcMlJIb03kreZNPze6+WVgaHDmdl8ulwk259SZM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ale4B8aZNnm+IhxftIYstS2ITGOARPsmP2404cd+PXkOdEHx/ISNUtyLVXqpqa5js
	 D6fegAL8rFFrvB9AjNyWdFAqj8nWm23zC0wJbidc93EOGBiZk2yEObFkQg7mric73F
	 LZD2gCdWuOh3Df4C1Co9LGWFj1zQAHh6v2IB1AlrhB1hz9wTjI77UBYlkMgjH6ru/X
	 tQjTLJSVeMgnFtG38ncAJo72ipNaenbwnbWT6Jj9Hivxlmiy5Hb5pvFcJ746QSVVwL
	 B7ZVQAPsmYxDlnQtEqS/5yVC+9HcqSXK3eaFCF87KtHSUeD3e5+4xvNlHXkh7eDO/6
	 aoJ5PYpNO4P+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773161095; x=1773421595; i=teddy.astie@vates.tech;
	bh=1m7dPcMlJIb03kreZNPze6+WVgaHDmdl8ulwk259SZM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fkhdNI1O+TmcQ+LMOmsMhLo9axcKs2ka3+WR1ZwDDfEeKcuV2yStGlmBKRrsc5o62
	 jLaKyt52PWmITR4fjnhrC5lOsMl6rcxfXP0umPFhzeuo5819lNZkssT3vO4GJZvPg8
	 ChaCYwMH9fPOBMuJAe4fkn2AulRuIMf0BJYIpAPDEWrvlGRJ/Kp+VkyvumYAhBmnig
	 cePVJDovm3oE8EQ0XuQDRKPr8yf8CjZllJ7rhH+5rd8Jfv+JnjHnWsrZMWgVM9THEI
	 bS5FREaL7yOAd93DDkic/U31afk4YcU7Y71c1j9u88pIk4JX4nuDbV5nVcB/Qcc3Ff
	 suwqk2sA1+snA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=206/6]=20x86/vpmu:=20Allow=20PMU=20version=206?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773161094603
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <151db665c8e9014f0b09d3fbaed3f60448298f0f.1773160025.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1773160025.git.teddy.astie@vates.tech>
References: <cover.1773160025.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.98e738de90924bc686cc968f1472c66f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260310:md
Date: Tue, 10 Mar 2026 16:44:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

PMU version 6 (notably implemented in Intel Core Ultra) is backward compatible
with older versions, as we're exposing version 2 to the guest, it is not
expected not try using PMU version 6 features.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
I don't have the hardware to test vPMU on Intel Core Ultra, but I guess it's
supposed to work, as it only introduces new features and doesn't disable
existing ones.

That could want a changelog entry regarding vPMU support on Intel Core Ultra 
and alike ?

 xen/arch/x86/cpu/vpmu_intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 0871795218..9c8802b285 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -819,7 +819,7 @@ static int cf_check core2_vpmu_initialise(struct vcpu *v)
     static bool ds_warned;
 
     if ( v->domain->arch.cpuid->basic.pmu.version <= 1 ||
-         v->domain->arch.cpuid->basic.pmu.version >= 6 )
+         v->domain->arch.cpuid->basic.pmu.version >= 7 )
         return -EINVAL;
 
     if ( (arch_pmc_cnt + fixed_pmc_cnt) == 0 )
@@ -904,6 +904,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
     case 3:
     case 4:
     case 5:
+    case 6:
         printk(XENLOG_INFO "VPMU: PMU version %u is not fully supported. "
                "Emulating version 2\n", version);
         /* FALLTHROUGH */
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


