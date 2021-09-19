Return-Path: <SRS0=EXO/=OJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48022C433EF
	for <xen-devel@archiver.kernel.org>; Sun, 19 Sep 2021 11:20:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14A94611C8
	for <xen-devel@archiver.kernel.org>; Sun, 19 Sep 2021 11:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14A94611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.190090.339917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRurj-0004lj-OJ; Sun, 19 Sep 2021 11:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190090.339917; Sun, 19 Sep 2021 11:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRurj-0004lc-LK; Sun, 19 Sep 2021 11:20:11 +0000
Received: by outflank-mailman (input) for mailman id 190090;
 Sun, 19 Sep 2021 11:20:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZQJ=OJ=kernel.org=patchwork-bot+netdevbpf@srs-us1.protection.inumbo.net>)
 id 1mRuri-0004lV-FC
 for xen-devel@lists.xenproject.org; Sun, 19 Sep 2021 11:20:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7637f31-53f1-418d-85ff-94fc32433042;
 Sun, 19 Sep 2021 11:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EE7FA61242;
 Sun, 19 Sep 2021 11:20:08 +0000 (UTC)
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
X-Inumbo-ID: c7637f31-53f1-418d-85ff-94fc32433042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632050409;
	bh=JgOlWT0pbtf7IVNWGZ6Y18loUrVLEywZaq+kJszZk28=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=McYbWhBfv9t4VvwDDYNBAFiHD5PCAfs8VVqsgoYw+7amWtY1FVzDJQMZdARAMaRQn
	 hazuosxKMmRlMk0usDx33Hr4ru7oaQ7Eu2ss3lGTe1ZN4DQaSSNmYS8wGQOS2rBI2E
	 xuHGod568wdnTud8oD6FGIZWQcY82cc9McjeggXmX6hTd0MjHZ8oy0dp6gX8RyRMkf
	 xxHDsllhbtBBvdVrmvOBu6qVTu47B1+YjZcG8ZB9bwMYVRW8ovX3Pjen8jLg9Hmu4b
	 bQIKEvC1FsPbDIOUfImizS/Z3q0twtxXmCJlP4VMMP3bMnA/ZTc2IoLSbwEpl8sQr4
	 Vq6Wlj0OSvCow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net][RESEND] xen-netback: correct success/error reporting for
 the SKB-with-fraglist case
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <163205040891.14261.10527748339776839114.git-patchwork-notify@kernel.org>
Date: Sun, 19 Sep 2021 11:20:08 +0000
References: <ef9e1ab6-17b9-c2d7-ef6c-99ef6726a765@suse.com>
In-Reply-To: <ef9e1ab6-17b9-c2d7-ef6c-99ef6726a765@suse.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: netdev@vger.kernel.org, paul@xen.org, wl@xen.org,
 xen-devel@lists.xenproject.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri, 17 Sep 2021 08:27:10 +0200 you wrote:
> When re-entering the main loop of xenvif_tx_check_gop() a 2nd time, the
> special considerations for the head of the SKB no longer apply. Don't
> mistakenly report ERROR to the frontend for the first entry in the list,
> even if - from all I can tell - this shouldn't matter much as the overall
> transmit will need to be considered failed anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

Here is the summary with links:
  - [net,RESEND] xen-netback: correct success/error reporting for the SKB-with-fraglist case
    https://git.kernel.org/netdev/net/c/3ede7f84c7c2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



