Return-Path: <SRS0=Kz/T=JU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DA5C433ED
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 13:25:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6786E61445
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 13:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6786E61445
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.116346.222066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvoS-0005Fk-78; Fri, 23 Apr 2021 13:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116346.222066; Fri, 23 Apr 2021 13:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvoS-0005Fd-3z; Fri, 23 Apr 2021 13:25:40 +0000
Received: by outflank-mailman (input) for mailman id 116346;
 Fri, 23 Apr 2021 13:25:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZvoQ-0005FY-Bg
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 13:25:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3152040-ab0c-47bc-987c-00d82359d6a1;
 Fri, 23 Apr 2021 13:25:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D329AF03;
 Fri, 23 Apr 2021 13:25:36 +0000 (UTC)
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
X-Inumbo-ID: b3152040-ab0c-47bc-987c-00d82359d6a1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619184336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3oSESxNu4pUyQx6KGM+Xm+H+LqU3yUQ/ocTtxYQ5t9Q=;
	b=LbDkEgyWIcOYzOqFsjrL3Cfpdmjteuo2IJg7vNekknMWtae73pNVlMBolnoNafL7/5H+l9
	+TKFbuD92wQy3ahdDcXYmE5w2Wfa5zlrLoOrYTd4/FKc6c+nG4nPjS63rgTCfgwI3u7jgp
	kaJzbP11XYksEH8omBa0Fp6VuEIIheI=
Subject: Re: [PATCH v2] x86/cpuid: do not expand max leaves on restore
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20210423131747.10308-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0c69ce9-15b0-8e7c-d6c2-7f3b6b036f5c@suse.com>
Date: Fri, 23 Apr 2021 15:25:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423131747.10308-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 15:17, Roger Pau Monne wrote:
> When restoring limit the maximum leaves to the ones supported by Xen
> 4.12 in order to not expand the maximum leaves a guests sees. Note
> this is unlikely to cause real issues.
> 
> Guests restored from Xen versions 4.13 or greater will contain CPUID
> data on the stream that will override the values set by
> xc_cpuid_apply_policy.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, looks plausible to me, so
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

