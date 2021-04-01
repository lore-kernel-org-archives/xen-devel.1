Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB4CC433ED
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 09:28:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14CA1610C7
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 09:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14CA1610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104217.199059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtcs-0002Z8-Iv; Thu, 01 Apr 2021 09:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104217.199059; Thu, 01 Apr 2021 09:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtcs-0002Z1-Ff; Thu, 01 Apr 2021 09:28:30 +0000
Received: by outflank-mailman (input) for mailman id 104217;
 Thu, 01 Apr 2021 09:28:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRtcr-0002Yw-NN
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:28:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e08efd25-6b68-486d-8a30-af0fe2fcb1fd;
 Thu, 01 Apr 2021 09:28:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00FA9AE6D;
 Thu,  1 Apr 2021 09:28:28 +0000 (UTC)
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
X-Inumbo-ID: e08efd25-6b68-486d-8a30-af0fe2fcb1fd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617269308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkdbBrVK/p16/Dm78k97AvAwNFvaoVHKkhdL9CZCm9Q=;
	b=eK/Hclm3fC6Au6C5zJJvnkeIc7uy4wGD2fJWEloBmb5hrwcV2Ms+KAhbgu67osbZM1QSLQ
	5gAi8UcdUwrlcQMQ3z47Dp0pYXIbgrnq4zC/uwnj2y+tAZrgW20UYhi2LWC+rc4+gIpnQb
	tiSW/xKhtVldVZoQic7sGluKgw8QoHE=
Subject: Re: [PATCH v3 02/11] x86/hvm: drop domain parameter from vioapic/vpic
 EOI callbacks
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-3-roger.pau@citrix.com>
 <b9a244b9-834d-4e41-3e39-504277b0c916@suse.com>
 <YGWPSF+zDWc4+slD@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74913386-ba01-182b-464a-6a5c5c5816ff@suse.com>
Date: Thu, 1 Apr 2021 11:28:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGWPSF+zDWc4+slD@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.04.2021 11:15, Roger Pau Monné wrote:
> On Wed, Mar 31, 2021 at 06:04:43PM +0200, Jan Beulich wrote:
>> On 31.03.2021 12:32, Roger Pau Monne wrote:
>>> EOIs are always executed in guest vCPU context, so there's no reason to
>>> pass a domain parameter around as can be fetched from current->domain.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Reviewed-by: Paul Durrant <paul@xen.org>
>>> ---
>>> Changes since v1:
>>>  - New in this version.
>>
>> Just to make it explicit - possibly same thing as with patch 1,
>> depending on how exactly the issue there gets taken care of.
> 
> I don't think we have any scenario ATM where we allow EOI'ing of
> interrupts from a different vCPU context, neither I can see us
> allowing such in the future, but I don't want this discussion to block
> the series, hence I'm going to drop this patch together with patch 1.

Well, having seen also your reply to Andrew wrt patch 1, I just wanted
to clarify that dropping the two patches isn't the only option. Making
Viridian code resilient in this regard might be another one.

Jan

