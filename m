Return-Path: <SRS0=J13s=EC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C77C4363A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 10:25:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A8622263
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 10:25:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="apvZNe2I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1A8622263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12748.33029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMAK-0007qA-CN; Tue, 27 Oct 2020 10:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12748.33029; Tue, 27 Oct 2020 10:25:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMAK-0007q3-96; Tue, 27 Oct 2020 10:25:20 +0000
Received: by outflank-mailman (input) for mailman id 12748;
 Tue, 27 Oct 2020 10:25:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXMAJ-0007py-Ju
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:25:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 703f0479-bf37-4c36-86df-a4b94ad8a704;
 Tue, 27 Oct 2020 10:25:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16659AD21;
 Tue, 27 Oct 2020 10:25:18 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXMAJ-0007py-Ju
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:25:19 +0000
X-Inumbo-ID: 703f0479-bf37-4c36-86df-a4b94ad8a704
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 703f0479-bf37-4c36-86df-a4b94ad8a704;
	Tue, 27 Oct 2020 10:25:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603794318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZzsh69HGbVNf5I827All+M37rdPv9kdetVvOsKnw+A=;
	b=apvZNe2IRzcM80CJ+NJPnD2TmRofB608NoulqEe/5xoOjQ8Vx8EICe19CUqrrvSNBzWShC
	YndUvhhoUJnGyoTStZYPpwRnVzecPavCDf5R3ub8rKlejZopzmajNjUWSNRfy0YbZ6w1ru
	rmzXEc4zI32+GjkeL3XgIQsdFQVyPOg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 16659AD21;
	Tue, 27 Oct 2020 10:25:18 +0000 (UTC)
Subject: Re: flawed Makefile dependencies in libacpi
From: Jan Beulich <jbeulich@suse.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20201027104548.5823c554.olaf@aepfle.de>
 <d6e3a7b0-129e-9b47-8802-b71eb8642519@suse.com>
Message-ID: <da99d577-ce8d-8fcf-c157-5b91ee895097@suse.com>
Date: Tue, 27 Oct 2020 11:25:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d6e3a7b0-129e-9b47-8802-b71eb8642519@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.10.2020 11:18, Jan Beulich wrote:
> On 27.10.2020 10:45, Olaf Hering wrote:
>> Every once in a while build.c fails to compile because ssdt_s3.h does not exist. The 'sed' command which creates the file appears a few lines down in the build log.
>>
>> I'm not familiar with make. I wonder if "build.o" should depend on "$(H_SRC)" instead of the expanded list of generated headers.
> 
> Oh, yes, it definitely should. Will you make a patch?

Actually it only should be if this line was useful for anything.
But it's dead. Instead the consumers of libacpi/ may need
respective dependencies to be added. In this context it then is
relevant in which context you see the failure - firmware/hvmloader/
or libs/light/ ?

Jan

