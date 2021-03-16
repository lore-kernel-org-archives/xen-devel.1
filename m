Return-Path: <SRS0=4R9G=IO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66E8C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 14:30:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 912666504A
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 14:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 912666504A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98306.186370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAiK-0008CU-QV; Tue, 16 Mar 2021 14:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98306.186370; Tue, 16 Mar 2021 14:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAiK-0008CN-Mp; Tue, 16 Mar 2021 14:30:28 +0000
Received: by outflank-mailman (input) for mailman id 98306;
 Tue, 16 Mar 2021 14:30:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMAiJ-0008CI-Ki
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 14:30:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74006899-4a21-4cbd-8182-282d17db0948;
 Tue, 16 Mar 2021 14:30:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A508AC24;
 Tue, 16 Mar 2021 14:30:25 +0000 (UTC)
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
X-Inumbo-ID: 74006899-4a21-4cbd-8182-282d17db0948
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615905025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4A2LYziD1JqclB2MuncuRlyny5vbQA1utP7FCnQOn6A=;
	b=m8LgtBEhtaIq3OwOZ8W61Lr3595U0cmAFLAE8/ngZdjteGnuXTcidNulWPyWlhJrB9boPH
	f2DXHVNBUhOPCQ9Uxylxv5ka2DsTc3IcqYZqswIiP3qappwNmKv4aIoQ/1UpTmVLYWaGUc
	UhxBU3BVoTVPblZU72mxKwu4UFymu4k=
Subject: Re: AMD Ryzen 4000 (Mobile) cpufreq issues
To: Dylanger Daly <dylangerdaly@protonmail.com>
References: <s6DNE-pStgBNMxxe8WkUZJbkqMyjdifBDHA_3gMGdC6oE1rweg8Au8ZPHaDFkvT0ETGykePtDj02LphVIWtdfyFQ9ZBFMjKJq6UNzY4BiAc=@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bf29b7f0-d687-9f32-0a59-57562bf5261b@suse.com>
Date: Tue, 16 Mar 2021 15:30:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <s6DNE-pStgBNMxxe8WkUZJbkqMyjdifBDHA_3gMGdC6oE1rweg8Au8ZPHaDFkvT0ETGykePtDj02LphVIWtdfyFQ9ZBFMjKJq6UNzY4BiAc=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.03.2021 04:02, Dylanger Daly wrote:
> It appears AMD Ryzen 4000 based CPUs are not supported by `xenpm`, running `xenpm get-cpufreq-states` returns nothing and `get-cpufreq-para` returns `failed to get cpufreq parameter`
> 
> This was somewhat expected as Ryzen 4000 series CPUs are quite new, so as a workaround I tried putting `cpufreq=dom0-kernel dom0_max_vcpus=8 dom0_vcpus_pin` onto CMDLINE, from what I've read this should essentially pass control for CPU frequency scaling down to dom0's kernel (5.11.4).

Just fyi, seeing that you found a solution for your problem: I
firmly believe "cpufreq=dom0-kernel" should never have been
introduced. I'm not surprised at all if, as it looks, it stopped
working at some point.

Jan

