Return-Path: <SRS0=m+yb=K2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA89C4708F
	for <xen-devel@archiver.kernel.org>; Mon, 31 May 2021 06:48:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D109761186
	for <xen-devel@archiver.kernel.org>; Mon, 31 May 2021 06:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D109761186
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.134455.250138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnbj6-0001kk-2F; Mon, 31 May 2021 06:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134455.250138; Mon, 31 May 2021 06:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnbj5-0001kd-VA; Mon, 31 May 2021 06:48:39 +0000
Received: by outflank-mailman (input) for mailman id 134455;
 Mon, 31 May 2021 06:48:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lnbj5-0001kU-B8
 for xen-devel@lists.xenproject.org; Mon, 31 May 2021 06:48:39 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc9d7e05-6c68-445f-a1b2-0e2c00d8dbe2;
 Mon, 31 May 2021 06:48:38 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA6841FD2E;
 Mon, 31 May 2021 06:48:37 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2B8B0118DD;
 Mon, 31 May 2021 06:48:37 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id FlftCMWGtGAtBQAALh3uQQ
 (envelope-from <jbeulich@suse.com>); Mon, 31 May 2021 06:48:37 +0000
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
X-Inumbo-ID: bc9d7e05-6c68-445f-a1b2-0e2c00d8dbe2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622443717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FzItFjU0DW/KZKPmp5D37yuIYUfQma0ENnM1MHwo2z4=;
	b=UXoHatDlwOoB5iZUYn+khS2+GyBkMcuU29TmNhHj29MuUl6qLHZV5zZUWTMpNqGsvKfIdF
	jwLxQjTrSYkGOdFMQk1Jkg+BsXE2QzkHIqb1BBpR1lbQEbHIGu04bCMMUeSfEvFCbA36Wv
	0gcCYg6+YScVNltbgS3q1Wpj6D5duO0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622443717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FzItFjU0DW/KZKPmp5D37yuIYUfQma0ENnM1MHwo2z4=;
	b=UXoHatDlwOoB5iZUYn+khS2+GyBkMcuU29TmNhHj29MuUl6qLHZV5zZUWTMpNqGsvKfIdF
	jwLxQjTrSYkGOdFMQk1Jkg+BsXE2QzkHIqb1BBpR1lbQEbHIGu04bCMMUeSfEvFCbA36Wv
	0gcCYg6+YScVNltbgS3q1Wpj6D5duO0=
Subject: Re: [PATCH 1/3] x86/mtrr: remove stale function prototype
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210528173935.29919-1-roger.pau@citrix.com>
 <20210528173935.29919-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <095c2f58-712d-5f99-d716-7d70290326fa@suse.com>
Date: Mon, 31 May 2021 08:48:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210528173935.29919-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Authentication-Results: imap.suse.de;
	none
X-Spamd-Result: default: False [0.00 / 100.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 MID_RHS_MATCH_FROM(0.00)[]

On 28.05.2021 19:39, Roger Pau Monne wrote:
> Fixes: 1c84d04673 ('VMX: remove the problematic set_uc_mode logic')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

