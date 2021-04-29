Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9119C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 09:35:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67800600EF
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 09:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67800600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119849.226587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc35I-0005b0-K4; Thu, 29 Apr 2021 09:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119849.226587; Thu, 29 Apr 2021 09:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc35I-0005at-H0; Thu, 29 Apr 2021 09:35:48 +0000
Received: by outflank-mailman (input) for mailman id 119849;
 Thu, 29 Apr 2021 09:35:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc35H-0005ao-Jv
 for xen-devel@lists.xen.org; Thu, 29 Apr 2021 09:35:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c34e34e-bbe1-43c4-a7b5-a7629065df28;
 Thu, 29 Apr 2021 09:35:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE49DAFE1;
 Thu, 29 Apr 2021 09:35:45 +0000 (UTC)
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
X-Inumbo-ID: 4c34e34e-bbe1-43c4-a7b5-a7629065df28
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619688945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2OV4pAIm+D4Mq+z1muNo/etlA5NNla0VOkM/UVJRjg=;
	b=FLGgcREr+5LcXo0eECpJVPz/NwgjEjIXAYGaXjxmOV130A9P3z7aGwa5KWYpK2mOemoMYK
	hsMz5I5zro39JDrFO25ZFTC7H0N+BvebXB+DciZ5oZ+pfv0tvpKwXk+Mw0ZB09tv75CjHU
	B2T1xSFPOvj/eo8pMxiCaHBIbB327vY=
Subject: Re: Serial Console : SOL vs Physical Port
To: =?UTF-8?Q?Charles_Gon=c3=a7alves?= <charles.fg@gmail.com>
References: <CAAQRGoBi4tC+K_FHJceXxEqC6wy79qX0aE60OOeBWSo8tTEbjg@mail.gmail.com>
Cc: xen-devel@lists.xen.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37488d5d-eec9-53f2-4ba7-157a7f9f5a9d@suse.com>
Date: Thu, 29 Apr 2021 11:35:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAAQRGoBi4tC+K_FHJceXxEqC6wy79qX0aE60OOeBWSo8tTEbjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.04.2021 20:49, Charles Gonçalves wrote:
> Is there any difference between both?
> I'm trying to debug an issue using a SOL but the host crashes before any
> meaningful message.
> 
> The SOL is working properly when I can debug some crashes perfectly. But
> for a specific case I'm wondering if I could be losing some messages.

Well, without having an explanation, experience tells me that SOL in
some cases is more fragile. Do you have "sync_console" in place? Does
the crash perhaps happen too early for the serial output to have got
configured in Xen yet?

Jan

