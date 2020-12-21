Return-Path: <SRS0=3GnW=FZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BF2C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 21 Dec 2020 08:51:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ED8C22C7E
	for <xen-devel@archiver.kernel.org>; Mon, 21 Dec 2020 08:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ED8C22C7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.57332.100312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGuF-0000f5-0G; Mon, 21 Dec 2020 08:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57332.100312; Mon, 21 Dec 2020 08:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGuE-0000ey-Se; Mon, 21 Dec 2020 08:51:02 +0000
Received: by outflank-mailman (input) for mailman id 57332;
 Mon, 21 Dec 2020 08:51:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krGuD-0000es-Or
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 08:51:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2435b063-f81a-4132-a024-c41c00d253be;
 Mon, 21 Dec 2020 08:50:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E58ABACC4;
 Mon, 21 Dec 2020 08:50:56 +0000 (UTC)
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
X-Inumbo-ID: 2435b063-f81a-4132-a024-c41c00d253be
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608540657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGghG70X6CDqUmgyIEtDHZH6iY/LD9W9rHtNUkpPDTE=;
	b=aSdUOez1DiXKpXj1E/hUSws9wBo1BUygdZCV4grp7BJ8P1jlw4HWVmufH5PWKJsij8G07b
	4ZUpUGTTErkWQGpUDNLggAr4wxjYJcMF1Dw4TxSK+TVhxBmgRreTAMsgWyQYABqC4udBtV
	9J+PXAOkPfojcYc9RrDiNgcWwIWBiQo=
Subject: Re: [XEN PATCH 1/3] xen/arch/x86: don't insert timestamp when
 SOURCE_DATE_EPOCH is defined
To: Maximilian Engelhardt <maxi@daemonizer.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1608319634.git.maxi@daemonizer.de>
 <5f715df2808dcd24b9fab95cd02522d16daba86c.1608319634.git.maxi@daemonizer.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c89da8a4-7d84-2bcc-ff13-2a4b3002a98f@suse.com>
Date: Mon, 21 Dec 2020 09:50:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5f715df2808dcd24b9fab95cd02522d16daba86c.1608319634.git.maxi@daemonizer.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.12.2020 21:42, Maximilian Engelhardt wrote:
> By default a timestamp gets added to the xen efi binary. Unfortunately
> ld doesn't seem to provide a way to set a custom date, like from
> SOURCE_DATE_EPOCH, so set a zero value for the timestamp (option
> --no-insert-timestamp) if SOURCE_DATE_EPOCH is defined. This makes
> reproducible builds possible.
> 
> This is an alternative to the patch suggested in [1]. This patch only
> omits the timestamp when SOURCE_DATE_EPOCH is defined.
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg02161.html
> 
> Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>

Acked-by: Jan Beulich <jbeulich@suse.com>

