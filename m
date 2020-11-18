Return-Path: <SRS0=TkWG=EY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20AAC5519F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 08:59:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE13221E9
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 08:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Lplaa1xO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EE13221E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.29535.59039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJJZ-0001Qx-4x; Wed, 18 Nov 2020 08:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29535.59039; Wed, 18 Nov 2020 08:59:45 +0000
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
	id 1kfJJZ-0001Qq-1Z; Wed, 18 Nov 2020 08:59:45 +0000
Received: by outflank-mailman (input) for mailman id 29535;
 Wed, 18 Nov 2020 08:59:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfJAt-0006e0-6w
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:50:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bf40fbe-c935-4e0e-a096-066fb9325f3c;
 Wed, 18 Nov 2020 08:50:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80D87AD45;
 Wed, 18 Nov 2020 08:50:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfJAt-0006e0-6w
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:50:47 +0000
X-Inumbo-ID: 8bf40fbe-c935-4e0e-a096-066fb9325f3c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8bf40fbe-c935-4e0e-a096-066fb9325f3c;
	Wed, 18 Nov 2020 08:50:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605689403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyU5ejWfgwEnjWjOuAgNBFVH+se8h5ZxMHqQu86/6+A=;
	b=Lplaa1xOPrE/jDH4KfJhgBZ4ybKF6cgmPiszyNju5YYcFJmyOP/6VzRKhetQ6N8kBkmzYg
	48wK07+NjYad+HnBCd8RvKLT+6LLQPyRSks9/UDfrEoHLdn0I+JWJgTdJM8BgHTvzrc8rU
	rjAeRtBBRqfZO8fn6sn/BcDo/gJtFaQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 80D87AD45;
	Wed, 18 Nov 2020 08:50:03 +0000 (UTC)
Subject: Re: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "iwj@xenproject.org" <iwj@xenproject.org>, "julien@xen.org"
 <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201118005051.26115-1-sstabellini@kernel.org>
 <0A50C952-B9D8-44C3-9326-A0555B435693@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c59a1540-2dd0-2813-9fe5-d5be2335fe9b@suse.com>
Date: Wed, 18 Nov 2020 09:50:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <0A50C952-B9D8-44C3-9326-A0555B435693@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.11.2020 09:45, Bertrand Marquis wrote:
>> On 18 Nov 2020, at 00:50, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -102,8 +102,8 @@ config HVM
>> 	  If unsure, say Y.
>>
>> config XEN_SHSTK
>> -	bool "Supervisor Shadow Stacks"
>> -	depends on HAS_AS_CET_SS && EXPERT
>> +	bool "Supervisor Shadow Stacks (UNSUPPORTED)"
>> +	depends on HAS_AS_CET_SS && UNSUPPORTED
> 
> This one is not following the standard scheme with “if UNSUPPORTED"

There's no standard scheme here: There's one case where the entire
option depends on some other setting (e.g. UNSUPPORTED) and another
where just the prompt (i.e. giving the user a choice) does. The
difference becomes obvious when the option has a default other than
"no": Despite the invisible prompt, it may get turned on. In the
case here (serving as a good example), "default y" would mean the
feature gets turned on when "if UNSUPPORTED" would be added to the
prompt and when UNSUPPORTED is itself off.

Jan

