Return-Path: <SRS0=Kz/T=JU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CD7C433B4
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 14:46:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92D86141C
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 14:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92D86141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.116450.222266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZx4c-0006Vx-LH; Fri, 23 Apr 2021 14:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116450.222266; Fri, 23 Apr 2021 14:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZx4c-0006Vq-IK; Fri, 23 Apr 2021 14:46:26 +0000
Received: by outflank-mailman (input) for mailman id 116450;
 Fri, 23 Apr 2021 14:46:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZx4b-0006Vl-Mb
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 14:46:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6058053b-ee82-4073-bc91-828611ab6493;
 Fri, 23 Apr 2021 14:46:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 254F6B13D;
 Fri, 23 Apr 2021 14:46:24 +0000 (UTC)
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
X-Inumbo-ID: 6058053b-ee82-4073-bc91-828611ab6493
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619189184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iOlDEf4b6g39hxyyt263KNDJCaC7PL0B89yn1gbbuCU=;
	b=Tb029Xntddf8XmyjqnvyU47FXXHjPJfHjC+yzj9ghwQFpXgOnMu3b8mpeefNuDAuMiMKgB
	YR6oHeQQJtE52c34TAtE+5VvwFqK3uUrRWzEiGf5Ea/sVMmTyIJtAxL/TM4ueulk4ov7lC
	aTBVLrXe15WQ86j0eJKcrYK8W6wuiSg=
Subject: Re: [PATCH v2 1/3] x86/EFI: sections may not live at VA 0 in PE
 binaries
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <89e97459-28fd-704f-d424-88afa3a2a4a5@suse.com>
 <748d35dc-5a2f-302f-d789-9797c6726810@suse.com>
 <YILY6sTSMTqt27S9@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <354d226e-1d18-f05b-22db-3600ae2e0bc2@suse.com>
Date: Fri, 23 Apr 2021 16:46:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YILY6sTSMTqt27S9@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 16:25, Roger Pau Monné wrote:
> On Fri, Apr 23, 2021 at 01:03:34PM +0200, Jan Beulich wrote:
>> PE binaries specify section addresses by (32-bit) RVA. GNU ld up to at
>> least 2.36 would silently truncate the (negative) difference when a
>> section is placed below the image base. Such sections would also be
>> wrongly placed ahead of all "normal" ones. Since, for the time being,
>> we build xen.efi with --strip-debug anyway, .stab* can't appear. And
>> .comment has an entry in /DISCARD/ already anyway in the EFI case.
>>
>> Because of their unclear origin, keep the directives for the ELF case
>> though.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Albeit I would remove those - even if gcc can still generate stabs
> debug info I don't think it's used at all, and in any case a user
> would have to also modify the build system in order to force gcc to
> produce stabs debug info.

I'd be fine dropping them, but I'd prefer doing so in a separate
change then. As to modifying the build system - with all the different
Dwarf versions and with different debug info levels I was wondering
whether we shouldn't allow selecting the precise details via Kconfig.

Jan

