Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5859FC433DB
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 09:15:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A71F2242A
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 09:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A71F2242A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66891.118999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzyil-00036j-9Q; Thu, 14 Jan 2021 09:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66891.118999; Thu, 14 Jan 2021 09:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzyil-00036c-6I; Thu, 14 Jan 2021 09:15:11 +0000
Received: by outflank-mailman (input) for mailman id 66891;
 Thu, 14 Jan 2021 09:15:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kzyik-00036X-5h
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 09:15:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbcd7245-13a9-4f34-87b3-e8431cba310e;
 Thu, 14 Jan 2021 09:15:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B810EAFA0;
 Thu, 14 Jan 2021 09:15:07 +0000 (UTC)
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
X-Inumbo-ID: dbcd7245-13a9-4f34-87b3-e8431cba310e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610615707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dqx0OGAsjeQ62ZRtchGNs8vhDSAFf1FQYtYf42T79rM=;
	b=FQvQLBA7HJBRbUoETdAvRwlLAZ1ikf5hEtuLGHCV8gl+5+NOfKrNTIcer5cDq67cUcDooT
	GR8FzyfHVORpbPpVqW2G4PWzu/oxh8NF6Q9r9/4ZuW8GwlVr5L74unpWPakcwvBZk1yBvD
	LPKj7bd8VBNkwIQWPBJYUwEp51ZZv30=
Subject: Re: [PING] Re: [PATCH v2] xen/irq: Propagate the error from
 init_one_desc_irq() in init_*_irq_data()
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20201128113642.8265-1-julien@xen.org>
 <b4d95397-3d01-7fd6-968c-2b82e3b2e95c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9c1733d-4cae-a57a-27b0-8ff5d923ceaa@suse.com>
Date: Thu, 14 Jan 2021 10:15:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b4d95397-3d01-7fd6-968c-2b82e3b2e95c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.01.2021 20:05, Julien Grall wrote:
> On 28/11/2020 11:36, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> init_one_desc_irq() can return an error if it is unable to allocate
>> memory. While this is unlikely to happen during boot (called from
>> init_{,local_}irq_data()), it is better to harden the code by
>> propagting the return value.
>>
>> Spotted by coverity.
>>
>> CID: 106529
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Roger Paul Monné <roger.pau@citrix.com>
> 
>  From my understanding of MAINTAINERS rule, I still need an ack from x86 
> maintainers.

Roger _is_ an x86 maintainer, so why would you need another ack?

Jan

