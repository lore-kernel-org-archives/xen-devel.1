Return-Path: <SRS0=TTqk=H7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF02FC433DB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 21:10:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF88600CC
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 21:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF88600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.91971.173599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGpnt-0008OG-B0; Mon, 01 Mar 2021 21:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91971.173599; Mon, 01 Mar 2021 21:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGpnt-0008O9-7h; Mon, 01 Mar 2021 21:10:09 +0000
Received: by outflank-mailman (input) for mailman id 91971;
 Mon, 01 Mar 2021 21:10:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCNA=H7=kernel.org=patchwork-bot+netdevbpf@srs-us1.protection.inumbo.net>)
 id 1lGpns-0008K6-3i
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 21:10:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd75525f-aa01-441b-a188-82c6886b75a9;
 Mon, 01 Mar 2021 21:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B1F67600CD;
 Mon,  1 Mar 2021 21:10:06 +0000 (UTC)
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
X-Inumbo-ID: dd75525f-aa01-441b-a188-82c6886b75a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614633006;
	bh=10f66vRrDYObGPqDTKUGYf/ghz73u8i/BH9WbY3ERq0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TAdxXkv5//SGIll546yMVvLtcxmA29ufr+h+VL103orZWse3heXqtLXzXEVF7Hbi/
	 wQLiUZEqho5ozwEN9ZK/OOAXoOZPJlVq06cMRt2rW0E+3BBMNHiDYlSEcSjH/XisFf
	 dnu/yyAuPfE5I3JZMLA68u8b+h+8TLYI0df0ighed0kKZLPalqi/7JWfDKi5xVd4A1
	 h8C90laa+A7MMwdmLkHTlWCc9NrPKCBSb+KQ0SdaUQsL/Kb60yUN+T/Us9jRdbgLK/
	 uARGl3bIU+Kv3EXPZ+1MjFl3gu2Dmw1O8wA3HtHb/p2cOH45ILIMLpTotoE9RBbx29
	 rWsT06Di3zfqQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] xen-netback: use local var in xenvif_tx_check_gop() instead
 of re-calculating
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <161463300662.4342.7670414356889270416.git-patchwork-notify@kernel.org>
Date: Mon, 01 Mar 2021 21:10:06 +0000
References: <6604dec2-4460-3339-f797-e5f8a7df848f@suse.com>
In-Reply-To: <6604dec2-4460-3339-f797-e5f8a7df848f@suse.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: wl@xen.org, paul@xen.org, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Thu, 25 Feb 2021 16:39:01 +0100 you wrote:
> shinfo already holds the result of skb_shinfo(skb) at this point - no
> need to re-invoke the construct even twice.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Here is the summary with links:
  - xen-netback: use local var in xenvif_tx_check_gop() instead of re-calculating
    https://git.kernel.org/netdev/net/c/826d82170b53

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



