Return-Path: <SRS0=61/H=ED=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95F5C4363A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 07:18:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30DFC223C7
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 07:18:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="mTiNhDiu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30DFC223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.13313.33855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXfiw-0000g3-Cy; Wed, 28 Oct 2020 07:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13313.33855; Wed, 28 Oct 2020 07:18:22 +0000
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
	id 1kXfiw-0000fw-9S; Wed, 28 Oct 2020 07:18:22 +0000
Received: by outflank-mailman (input) for mailman id 13313;
 Wed, 28 Oct 2020 07:18:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXfiu-0000fq-IK
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 07:18:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 877d40d1-cfd5-4246-aec3-c16ea735c606;
 Wed, 28 Oct 2020 07:18:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 661EEAAF1;
 Wed, 28 Oct 2020 07:18:18 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXfiu-0000fq-IK
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 07:18:20 +0000
X-Inumbo-ID: 877d40d1-cfd5-4246-aec3-c16ea735c606
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 877d40d1-cfd5-4246-aec3-c16ea735c606;
	Wed, 28 Oct 2020 07:18:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603869498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0AFQQztnsrrudDOoXvM1TAP6LLQFo9xY91hTb49O3k=;
	b=mTiNhDiuvuh/b/qZFLwC9IsKLkNcb0FriwalSddy5sSar89XzkqDgMZGhMmtcQWH/+AJyL
	9Nog2WQ4YnFkFM+Am4SL2pLyd4Ec/VenhM0onq4SJC+EpkPzMF5BGSGGnEybobh+m0JmBT
	CWpt5J0CgYlgOK9T97h4CE31acvGX/E=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 661EEAAF1;
	Wed, 28 Oct 2020 07:18:18 +0000 (UTC)
Subject: Re: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <d1df24d48508c0c01c0b1130ed22f2b4585d04db.1603731279.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2010271621480.12247@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <95b72e09-246b-dcbe-6254-86b3e25081c6@suse.com>
Date: Wed, 28 Oct 2020 08:18:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010271621480.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.10.2020 00:32, Stefano Stabellini wrote:
> On Mon, 26 Oct 2020, Rahul Singh wrote:
>> --- a/xen/drivers/char/Kconfig
>> +++ b/xen/drivers/char/Kconfig
>> @@ -4,6 +4,13 @@ config HAS_NS16550
>>  	help
>>  	  This selects the 16550-series UART support. For most systems, say Y.
>>  
>> +config HAS_NS16550_PCI
>> +	bool "NS16550 UART PCI support" if X86
>> +	default y
>> +	depends on X86 && HAS_NS16550 && HAS_PCI
>> +	help
>> +	  This selects the 16550-series UART PCI support. For most systems, say Y.
> 
> I think that this should be a silent option:
> if HAS_NS16550 && HAS_PCI && X86 -> automatically enable
> otherwise -> automatically disable
> 
> No need to show it to the user.

I agree in principle, but I don't see why an X86 dependency gets
added here. HAS_PCI really should be all that's needed.

Jan

