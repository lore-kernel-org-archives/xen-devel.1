Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935B4C433FE
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 12:09:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DFFA23370
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 12:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DFFA23370
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.46424.82385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFK8-0004CF-Sp; Mon, 07 Dec 2020 12:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46424.82385; Mon, 07 Dec 2020 12:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFK8-0004C8-Pr; Mon, 07 Dec 2020 12:09:00 +0000
Received: by outflank-mailman (input) for mailman id 46424;
 Mon, 07 Dec 2020 12:08:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmFK6-0004C2-Ka
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 12:08:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 201cab70-792c-467e-9b72-72c3ea713b65;
 Mon, 07 Dec 2020 12:08:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08B8FAC90;
 Mon,  7 Dec 2020 12:08:56 +0000 (UTC)
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
X-Inumbo-ID: 201cab70-792c-467e-9b72-72c3ea713b65
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607342936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UcVSi8g+hIX+IG4KRIj73MOY57kQKL0iEo/GaRZ/zTA=;
	b=TNWoIFNQU84nu5DmU18lWgfFdDf1okVXZHxTO37AOzq9ccRHm5NNpcKccMduankqYOQyxz
	XspcaCx/PC8z58759MoGziCu8Ee71Mgt3Mj3z+J/pLL1+JXZWs5hl6lLkgZGoh7QppF/ae
	QAwAq+aOZ5TliPn3ktQUlfRIlAP7S2I=
Subject: Re: [PATCH V3 09/23] xen/dm: Make x86's DM feature common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-10-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00c3df9f-760d-bb3d-d1d6-7c7df7f0c17c@suse.com>
Date: Mon, 7 Dec 2020 13:08:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-10-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> As a lot of x86 code can be re-used on Arm later on, this patch
> splits devicemodel support into common and arch specific parts.
> 
> The common DM feature is supposed to be built with IOREQ_SERVER
> option enabled (as well as the IOREQ feature), which is selected
> for x86's config HVM for now.
> 
> Also update XSM code a bit to let DM op be used on Arm.
> 
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes RFC -> V1:
>    - update XSM, related changes were pulled from:
>      [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for IOREQ/DM features
> 
> Changes V1 -> V2:
>    - update the author of a patch
>    - update patch description
>    - introduce xen/dm.h and move definitions here
> 
> Changes V2 -> V3:
>    - no changes

And my concern regarding the common vs arch nesting also hasn't
changed.

Jan

