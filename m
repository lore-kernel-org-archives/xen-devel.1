Return-Path: <SRS0=rPNm=MB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2553DC07E99
	for <xen-devel@archiver.kernel.org>; Fri,  9 Jul 2021 09:32:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7DAF613D1
	for <xen-devel@archiver.kernel.org>; Fri,  9 Jul 2021 09:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7DAF613D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.153513.283619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mrY-0001QW-8i; Fri, 09 Jul 2021 09:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153513.283619; Fri, 09 Jul 2021 09:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mrY-0001QP-59; Fri, 09 Jul 2021 09:32:00 +0000
Received: by outflank-mailman (input) for mailman id 153513;
 Fri, 09 Jul 2021 09:31:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m1mrW-0001QJ-IU
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 09:31:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1mrT-0005TG-QF; Fri, 09 Jul 2021 09:31:55 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1mrT-0005pj-JM; Fri, 09 Jul 2021 09:31:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Cmo8WwFlhuDtDaHoGVbUwDuA69hII1OEqHXWY1b8kxU=; b=vDwA8bh8g0Pj/YIdBQ5SoJJkud
	XXPPkmmnUg+0nI55STdx1e7kvAIO4hPZhXZ0qcLpMzdOnLr4/nLF8B8fbFcG+4Xx4peKydSPBGqz4
	Axy6dVzfi0FdUJ/9M/7RFfp9F6qXbYBWfPHpF9Q3jGcISH4YBmebBQPRP6zua7mOo6Jk=;
Subject: Re: [PATCH v20210701 07/40] tools: create libxensaverestore
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-8-olaf@aepfle.de>
 <20210709112040.2dd4ec8d.olaf@aepfle.de>
From: Julien Grall <julien@xen.org>
Message-ID: <cb473d34-7022-74d2-e679-087bf84c26b8@xen.org>
Date: Fri, 9 Jul 2021 10:31:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709112040.2dd4ec8d.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Olaf,

On 09/07/2021 10:20, Olaf Hering wrote:
> Am Thu,  1 Jul 2021 11:56:02 +0200
> schrieb Olaf Hering <olaf@aepfle.de>:
> 
>> Move all save/restore related code
> 
> This is now 6 months old.
> 
> What is blocking approval?

There is already an ack from Wei which should be sufficient for the 
tools part.


But looking at the history of the patch, there seem to have been concern 
from Andrew. Were they resolved?

Cheers,

-- 
Julien Grall

