Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5E8C433E1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 19:18:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F9F205CB
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 19:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="l2ku/qf4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89F9F205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6fDP-000169-EZ; Fri, 14 Aug 2020 19:18:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=osIB=BY=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6fDO-000164-Mf
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 19:18:10 +0000
X-Inumbo-ID: 8bf9e54b-d35b-4e51-bfa7-9afbea5205fe
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bf9e54b-d35b-4e51-bfa7-9afbea5205fe;
 Fri, 14 Aug 2020 19:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=a6Qvc4SLPnudBJvvLlAl72byzu3NQpKo/dXkwz69o88=; b=l2ku/qf4uGDKnP2SECEEyPmGL8
 6Abujy3dMJrizVUWJTx1rdTNRh4XXXVWOk0k/kfqHenWumATJG5AESRGbDr1l1n3jtHd77Y2ouINt
 UJ4Fgj59iLaUiNSlwkBg/SLVytn9Mak4SBQLJQ0+LJzWwuvWLUhZ447/dC1mFIkvVmfc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6fDM-0004yi-Bp; Fri, 14 Aug 2020 19:18:08 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6fDM-0002KQ-2h; Fri, 14 Aug 2020 19:18:08 +0000
Subject: Re: [RESEND][PATCH v2 7/7] xen/guest_access: Fix coding style in
 xen/guest_access.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-8-julien@xen.org>
 <3bafb97f-45a3-7203-3e73-37e73c453de6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <28c7d999-52da-cc96-533b-264c749c7f88@xen.org>
Date: Fri, 14 Aug 2020 20:18:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3bafb97f-45a3-7203-3e73-37e73c453de6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 31/07/2020 12:41, Jan Beulich wrote:
> On 30.07.2020 20:18, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>>      * Add space before and after operator
>>      * Align \
>>      * Format comments
> 
> How about also
> 
>      * remove/replace leading underscores
> 
> ?

I don't have any plan for this. You are welcome to send a patch for this.

Cheers,

-- 
Julien Grall

