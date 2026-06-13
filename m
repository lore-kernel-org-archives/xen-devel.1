Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0426FCD98C7
	for <xen-devel@archiver.kernel.org>; Sun, 14 Jun 2026 05:12:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1337500.1598981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYd8Z-00045X-Rd; Sun, 14 Jun 2026 05:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337500.1598981; Sun, 14 Jun 2026 05:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYd8Z-00045O-MH; Sun, 14 Jun 2026 05:11:59 +0000
Received: by outflank-mailman (input) for mailman id 1337500;
 Sat, 13 Jun 2026 18:13:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bblank@thinkmo.de>) id 1wYSr2-0002Q4-UX
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 18:13:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYSr2-001SQe-9k
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 20:13:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bblank@thinkmo.de>)
 id 6a2d9db6-bab6-0a2a0a5309dd-0a2a450bbdcc-2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 20:13:12 +0200
Received: from [162.55.237.202] (helo=mail.thinkmo.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bblank@thinkmo.de>)
 id 6a2d9db7-212f-0a2a450b0019-a237edcabcda-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 20:13:12 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.thinkmo.de (Postfix) with ESMTP id 4gd4Hq61FHzygv;
 Sat, 13 Jun 2026 18:13:11 +0000 (UTC)
Received: from mail.thinkmo.de ([127.0.0.1])
 by localhost (mail.thinkmo.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoE-fvk-5wM7; Sat, 13 Jun 2026 18:13:11 +0000 (UTC)
Received: from shell.thinkmo.de (shell.thinkmo.de
 [IPv6:2a01:4f8:271:3f5c:0:22:0:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (No client certificate requested)
 by mail.thinkmo.de (Postfix) with ESMTPS id 4gd4Hq52mnzyTR;
 Sat, 13 Jun 2026 18:13:11 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mail202312 header.d=thinkmo.de header.i="@thinkmo.de" header.h="In-Reply-To:Content-Transfer-Encoding:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:From:Date:Received:Received"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thinkmo.de; h=
	in-reply-to:content-transfer-encoding:content-disposition
	:content-type:content-type:mime-version:references:message-id
	:subject:subject:from:from:date:date:received:received; s=
	mail202312; t=1781374391; bh=6GPKAOobwmNg968WVow6EBZsOTaaulq+Iwz
	Tk8mWKdE=; b=WFA+uWuhApZWf7VWd8/7P3CJSHS062sBwv3TNsSMwW9kgE+xfPU
	I16+IKhuk0wTRdt2/otJTg1KbwM32kFk4GuBfwPXNz1MAokd9s1PTbcUIn1lBL61
	emjwe4xXWcO7NRrV5SU6pYf9YFvXK7p62K3uCxPwEURLSMMImxRTAguyxd2PbvPo
	PMjUHmB2BS0op2zm6aBLNihf/z8l/vvh7oihpm5fRM9bdAvnl6IuMwyFi76Ottfx
	phQR8oHvWZS24876hZA2mq9lIZxAIEuEAMkr8L2w1vN1jLkYpaBUokKKSGKldF7q
	GZLfTQFbqXOkcP+4+Ps66+zH5otlU7GMNNg==
X-Virus-Scanned: Debian amavis at 
Date: Sat, 13 Jun 2026 20:13:10 +0200
From: Bastian Blank <bblank@thinkmo.de>
To: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/xen/interface: Remove pre-C99 checks
Message-ID: <xuuzvpxooyhkbqluaxszcizjxrqzjczejhdqiso6q2mc4cnhjl@kszikmaagunj>
Mail-Followup-To: Bastian Blank <bblank@thinkmo.de>, 
	xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
References: <20260613175151.1357-1-philmd@oss.qualcomm.com>
 <20260613175151.1357-2-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260613175151.1357-2-philmd@oss.qualcomm.com>
X-purgate-ID: tlsNG-42698a/1781374392-19969F3B-2F56AEB2/0/0
X-purgate-type: clean
X-purgate-size: 598

On Sat, Jun 13, 2026 at 07:51:50PM +0200, Philippe Mathieu-Daudé wrote:
> We mandate a compiler supporting C99 since 2019-01-17 in
> commit 7be41675f7c ("configure: Force the C standard to gnu99"),
> thus supporting flexible array members. Remove what is now dead
> code.

> +    uint32_t optarr[0];

This is no flexible array member. "optarr[]" would be.

https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Flexible-Array-Fields.html

Or are you talking about something different?

Bastian

-- 
The best diplomat I know is a fully activated phaser bank.
		-- Scotty

