Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B3DF506E0
	for <xen-devel@archiver.kernel.org>; Mon, 16 Mar 2026 14:34:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1255589.1550495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w291L-0000ZH-3W; Mon, 16 Mar 2026 14:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255589.1550495; Mon, 16 Mar 2026 14:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w291K-0000Yd-Vr; Mon, 16 Mar 2026 14:34:14 +0000
Received: by outflank-mailman (input) for mailman id 1255589;
 Mon, 16 Mar 2026 14:34:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1JYG=BQ=bounce.vates.tech=bounce-md_30504962.69b814dd.v1-32c867f81d6248ee9399a3f3f549431a@srs-se1.protection.inumbo.net>)
 id 1w291J-0000Vg-Ck
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 14:34:13 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f8525ab-2145-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 15:34:06 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fZHf516jZz5QkT3f
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 14:34:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 32c867f81d6248ee9399a3f3f549431a; Mon, 16 Mar 2026 14:34:05 +0000
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
X-Inumbo-ID: 2f8525ab-2145-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773671645; x=1773941645;
	bh=w+BKKtFI0vu/fLApqTU/xbShaAQvgsXeuvs+d59KFx0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=kba9RbepLDqbep8omQBtFWXrDOn2uI+rJtvbvZEKrf5mgkorUo9g5kMcS7JVeZCM4
	 hYsTMHBsZwo8jJsdC/geF+7MvYXAXXTQL895o5raZB3pimwDDK1xh9kAs3aFpESZel
	 FcP8ebjv3hj/7YOV2m0m+k6P81wUkWjJOBZsjOtep8ky8bbT2G/fD6n2YFdhL0l7N7
	 KB6lck2vPByaqOqx5dO5ayZY6jAa1+iFnEAiYqDis3ZTMadDPOvq+V6Oxw/BXp3jsR
	 XJFNn8RPwCFysMfWVrFIkpirj0nDzCGKKbkUw5MD2YoDOFtM6PdqVVbXYy7VcA9mKY
	 KMwTcAnMl8yHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773671645; x=1773932145; i=teddy.astie@vates.tech;
	bh=w+BKKtFI0vu/fLApqTU/xbShaAQvgsXeuvs+d59KFx0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=1HQoXE5quGo3LtlouCrjWbaKRfyJ9VAxtD/TgKf54/rZkKfUkF4RCVcvkWX5l8ePS
	 uJatYR8SWbe0OurGOyeYJD6N9e2/YK4x+mrexXUm54Eb2dsEzHxRAV7WbDbe6OUYeJ
	 5/4L02/s1HYlyORCM1B5Ks8jeRM5udO/BmG8uH+MJLlPREEJtASNimzttBwOkp/2dO
	 kX4Er+5TG/sNGvQI2K0sIFmkgZwc9E7+jK+9iD/VJIpGDry6A860I1bOJS1yqGRuLu
	 FaokhzpKfkwKhWppHtcTBT1D52fPzmBXSK13MygE8wGBulDIy1auRIp/GiogbEfYpk
	 FQPjMFjtJvXoA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v9=201/3]=20libxc:=20Report=20EINVAL=20in=20invalid=20xc=5Fresource=5Fop=20use?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773671644458
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>
Message-Id: <d7d0fa8ca02d59d34bd3be7ecfacd5c0376fafc0.1773671343.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.32c867f81d6248ee9399a3f3f549431a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260316:md
Date: Mon, 16 Mar 2026 14:34:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

xc_report_op doesn't update errno when called with 0 operations
(even though it returns -1).

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 tools/libs/ctrl/xc_resource.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/ctrl/xc_resource.c b/tools/libs/ctrl/xc_resource.c
index cb6a97202b..f65127f91c 100644
--- a/tools/libs/ctrl/xc_resource.c
+++ b/tools/libs/ctrl/xc_resource.c
@@ -137,6 +137,7 @@ int xc_resource_op(xc_interface *xch, uint32_t nr_ops, xc_resource_op_t *ops)
     if ( nr_ops > 1 )
         return xc_resource_op_multi(xch, nr_ops, ops);
 
+    errno = EINVAL;
     return -1;
 }
 
-- 
2.53.0



--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


