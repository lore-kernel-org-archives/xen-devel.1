Return-Path: <SRS0=FTcr=IH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538C0C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 14:55:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0AB46524C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 14:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0AB46524C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95538.180416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdlv-0004qr-S1; Tue, 09 Mar 2021 14:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95538.180416; Tue, 09 Mar 2021 14:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdlv-0004qk-OB; Tue, 09 Mar 2021 14:55:43 +0000
Received: by outflank-mailman (input) for mailman id 95538;
 Tue, 09 Mar 2021 14:55:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJdlu-0004qd-Bt
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:55:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a3a3497-dc6f-41b7-aa92-e46182e5ba5a;
 Tue, 09 Mar 2021 14:55:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5296AEBE;
 Tue,  9 Mar 2021 14:55:40 +0000 (UTC)
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
X-Inumbo-ID: 3a3a3497-dc6f-41b7-aa92-e46182e5ba5a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615301740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLHb+YAcHTY1pyFDQG5H8fcOhtAOu3Rg7vCcXWyNTQg=;
	b=kXM534RWQnV7lDsg/BqCtdx4BoXj9Mk7bmnfCWk5Lqr8HQospz+COqV4sfhXo3xcHaqWq1
	IGWqGe1iSvGhulrGA79OI8JXgUoluYUZghRlG+p+SL1XM8KVlu55INvuK85M+bbWZh7JYZ
	BLT1V45NuM6Rtz2G421QdidMrmYX/+w=
Subject: Re: [PATCH 4.15 1/3] MAINTAINERS: Make myself the owner of the
 changelog
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210309145002.30359-1-iwj@xenproject.org>
 <20210309145002.30359-2-iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <208181b5-d2e7-15c8-df86-00dea6e3040d@suse.com>
Date: Tue, 9 Mar 2021 15:55:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309145002.30359-2-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.03.2021 15:50, Ian Jackson wrote:
> Signed-off-by: Ian Jackson <iwj@xenproject.org>

I don't suppose this kind of a change needs it, but just in case:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -256,7 +256,7 @@ S:	Supported
>  F:	xen/drivers/passthrough/arm/smmu-v3.c
>  
>  Change Log
> -M:	Paul Durrant <paul@xen.org>
> +M:	Ian Jackson <iwj@xenproject.org>
>  R:	Community Manager <community.manager@xenproject.org>
>  S:	Maintained
>  F:	CHANGELOG.md
> 


