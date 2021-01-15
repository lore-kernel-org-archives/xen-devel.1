Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECE6C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 11:09:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 959EB223C8
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 11:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 959EB223C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67949.121491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0My6-0002vP-3Z; Fri, 15 Jan 2021 11:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67949.121491; Fri, 15 Jan 2021 11:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0My5-0002vI-Vz; Fri, 15 Jan 2021 11:08:37 +0000
Received: by outflank-mailman (input) for mailman id 67949;
 Fri, 15 Jan 2021 11:08:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0My4-0002vD-Kv
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 11:08:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 786ec3ef-e125-4212-b20c-261ed0a243fe;
 Fri, 15 Jan 2021 11:08:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6090FAB7F;
 Fri, 15 Jan 2021 11:08:35 +0000 (UTC)
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
X-Inumbo-ID: 786ec3ef-e125-4212-b20c-261ed0a243fe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610708915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P4tL2x5Ukc6sZGPXp7pxEWGNsgS2d2BBecfpMno6mv8=;
	b=Vohav+/a11Nwx9sap78gLNBRGb7tYO2Nn5gPtvgjKqaqYXTi3oZyi26UJ6rZSqQ9i0bdbO
	427tYgxhKstnze+eN5UYlZ6MjwHiaA2740NuflyooDY2RHRLIM3IRhbcNYuK6klDmcuAf+
	/zIR73D5kC5G22tRhCQW5WZKT6dizm8=
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
 Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
 <24576.27654.137226.608671@mariner.uk.xensource.com>
 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
 <867ee616-d808-0107-cbf4-82b7d296d0e6@suse.com>
 <79f5fd23-debb-701a-1aec-30144af1a896@citrix.com>
 <d38bd6ae-9085-ac4e-e182-3216fc492bed@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8eb8533b-3356-494d-21c8-6ea908dabd0d@suse.com>
Date: Fri, 15 Jan 2021 12:08:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d38bd6ae-9085-ac4e-e182-3216fc492bed@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 11:59, Andrew Cooper wrote:
> On 15/01/2021 10:52, Andrew Cooper wrote:
>> 4) zstd support to unbreak Fedora.  (I'm deliberately putting this in
>> the bugs rather than feature cateogry).
> 
> Ha!  I should have read further through my emails before replying.

What I've sent doesn't cover DomU-s, though, so ...

> But we do at least want this item tracking.

... I definitely agree here from whichever perspective I take.

Jan

