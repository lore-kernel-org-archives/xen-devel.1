Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B412C433B4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 06:14:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA69261055
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 06:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA69261055
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104112.198732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRqaX-00087B-51; Thu, 01 Apr 2021 06:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104112.198732; Thu, 01 Apr 2021 06:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRqaX-000874-1l; Thu, 01 Apr 2021 06:13:53 +0000
Received: by outflank-mailman (input) for mailman id 104112;
 Thu, 01 Apr 2021 06:13:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRqaV-00086z-KI
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 06:13:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39cabee8-158e-4335-898e-90d3ae046903;
 Thu, 01 Apr 2021 06:13:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B9F1AF2A;
 Thu,  1 Apr 2021 06:13:49 +0000 (UTC)
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
X-Inumbo-ID: 39cabee8-158e-4335-898e-90d3ae046903
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617257629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LrC8NH6cwvyNTaMUZ7lEQO8HaDcFzcZL/32U3WaYC68=;
	b=DdWrNAzbSDiulrJgKuOuWMsjXkucx4Ir2CcCGVIXshS/bz8LsaTlCMA1QLpxff/+DlK5xy
	jS0u7s1hcf22sxQ8TPcZXo1F5k5hCnAS/l6acr0l8DgozPkCaPZFEb+8aUU072rStlaeF4
	bDf/snoaCKb3Qh15fhw5uGaff2UF+u0=
Subject: Re: [PATCH] fix for_each_cpu() again for NR_CPUS=1
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4d993e67-2bdf-9ac3-f78e-daf279642de1@suse.com>
 <800b163affc6334837006a6ef6f8e21415d874e9.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ab32afb-d8d4-de24-e10c-0e9c5e170e45@suse.com>
Date: Thu, 1 Apr 2021 08:13:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <800b163affc6334837006a6ef6f8e21415d874e9.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.03.2021 18:55, Dario Faggioli wrote:
> On Wed, 2021-03-31 at 16:52 +0200, Jan Beulich wrote:
>> Unfortunately aa50f45332f1 ("xen: fix for_each_cpu when NR_CPUS=1")
>> has
>> caused quite a bit of fallout with gcc10, e.g. (there are at least
>> two
>> more similar ones, and I didn't bother trying to find them all):
>>
> Oh, wow... Sorry about that. I was sure I had checked (and with gcc10),
> but clearly I'm wrong.

Perhaps you did try a debug build, while I was seeing the issues in
a non-debug one?

>> Re-instate a special form of for_each_cpu(), experimentally "proven"
>> to
>> avoid the diagnostics.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
> Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks.

Jan

