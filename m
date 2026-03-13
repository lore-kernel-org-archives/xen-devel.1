Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C7F107BCD3
	for <xen-devel@archiver.kernel.org>; Fri, 13 Mar 2026 17:32:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1254307.1550255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w16NC-0003ld-5p; Fri, 13 Mar 2026 17:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254307.1550255; Fri, 13 Mar 2026 17:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w16NC-0003lW-2M; Fri, 13 Mar 2026 17:32:30 +0000
Received: by outflank-mailman (input) for mailman id 1254307;
 Fri, 13 Mar 2026 17:32:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tRrs=BN=bounce.vates.tech=bounce-md_30504962.69b44a25.v1-2ac2ba2f48654a9b800d54a15b46151f@srs-se1.protection.inumbo.net>)
 id 1w16NB-0003lQ-0r
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 17:32:29 +0000
Received: from mail179-36.suw41.mandrillapp.com
 (mail179-36.suw41.mandrillapp.com [198.2.179.36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97a04208-1f02-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 18:32:22 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-36.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4fXWl91bRZzlfjbY
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 17:32:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2ac2ba2f48654a9b800d54a15b46151f; Fri, 13 Mar 2026 17:32:21 +0000
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
X-Inumbo-ID: 97a04208-1f02-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773423141; x=1773693141;
	bh=R6WJv1Sh2zodKrqqhzmlPYhdr0GPqC5QgGThaZ6xJ74=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=W5vg0tc2V2FTdmpazRnMee+vn3F1BIzy4hpYD89SF+CTLQ74TXVojbt/5gT2UEvi5
	 /crTzZeIhFVfcLwerancj+ZQPK8BUxCKeKzusoyaAPvHYgCXXvhwCK8OM7AlXsR5Pq
	 9nvd3aDFTGCH6OjdLRn7QIFQhgI47rfOpx13jnlUp6t0/94p99GEwfmN1kZ6Ton2zG
	 Su9eak4Mpez8NgVN6RucnVe8HE9vSkwMm2JHjsMXp33YDB1AH12WUf96Gz/iv1b9VW
	 jlfm9ci62lG1G9AgGUqfkCdqLZCvNvYOA7fjcM2KWJPBiA3oEXLFLcitPheglX8lpZ
	 pAKTHoPfJUwoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773423141; x=1773683641; i=anthony.perard@vates.tech;
	bh=R6WJv1Sh2zodKrqqhzmlPYhdr0GPqC5QgGThaZ6xJ74=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fyI4oVKhhcCB9C0KQ/xI3sOSw6BpdNorfP6ph+7vU8uRFWmSkORUS4rkBgVCBWQpb
	 YZOFTG9zEPJs+UWoiivg3TH2ZmqozrrudE/n8H+a0oO1DseSB/o891zaEV//jf/Ru0
	 OlRWYVUKDeiiKef4R4qtyhAAlAyMzQXWoQUr6gKduolUAitGxgC7/L9bb2m57OSPj8
	 BbGwoIbxO0t+xNs5h/ll5km7QFI906dVgLOqp5p4UwzeNGVnmy5k9yL4sihO+nBH+2
	 BN4cWk4c7azg/HhnGB3h1S+OIZfAcNtKcMEWmmVEFUJUpaseIdOdeGu97EJc2JmbKP
	 oBTFqK9F09UWA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2006/11]=20tools/xenstored:=20add=20infrastructure=20for=20per-domain=20quotas?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773423140491
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abRKJPlQOWgyxIdb@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-7-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-7-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2ac2ba2f48654a9b800d54a15b46151f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 17:32:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Mar 05, 2026 at 02:52:03PM +0100, Juergen Gross wrote:
> Add the needed structures and helper functions for supporting quotas
> per domain.

I don't see any new struct or new helpers. What this patch do now is
updating the existing helpers to take per-domain quota into account. I
guess that comment was from an earlier iteration of the patch before it
got split into smaller ones, and easier to review.

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


