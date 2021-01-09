Return-Path: <SRS0=EDSy=GM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524F8C433DB
	for <xen-devel@archiver.kernel.org>; Sat,  9 Jan 2021 16:25:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEBE723A31
	for <xen-devel@archiver.kernel.org>; Sat,  9 Jan 2021 16:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEBE723A31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.64229.113624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyH3C-0000fV-2s; Sat, 09 Jan 2021 16:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64229.113624; Sat, 09 Jan 2021 16:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyH3B-0000fO-Vf; Sat, 09 Jan 2021 16:25:13 +0000
Received: by outflank-mailman (input) for mailman id 64229;
 Sat, 09 Jan 2021 16:25:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kyH3B-0000fJ-1z
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 16:25:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyH38-0003lX-PV; Sat, 09 Jan 2021 16:25:10 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyH38-0003tQ-GO; Sat, 09 Jan 2021 16:25:10 +0000
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
	bh=89FAQRXbXUo70dld2z7Q2TwlqJJqcfCaDcLuwO5CoCQ=; b=SKLJ3GOMisZq9synvDl2vkxwpA
	uKK+3qIbkSdY7WzH/R7Dh8T4Q8M5gnrUJv9gx29V7cEZdy1JP79J9B+u6izi6XYrzBzwpwldG5mcU
	26h9qSXyt6QZtpXUlpFm5I1b9CEq8QxRhHWyyRlk7PtcihhvSIHofzyvr4o2LfJMP7eg=;
Subject: Re: [PATCH v4 06/10] evtchn: slightly defer lock acquire where
 possible
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
 <50d76d71-7e76-8c4d-0546-bf690085036b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <abe7c2b9-1d8c-713c-af45-5a036cdebb2d@xen.org>
Date: Sat, 9 Jan 2021 16:25:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <50d76d71-7e76-8c4d-0546-bf690085036b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/01/2021 13:11, Jan Beulich wrote:
> port_is_valid() and evtchn_from_port() are fine to use without holding
> any locks.

Per my remark in patch #1, currently, this only holds as long as we are 
checking the port for the current domain.

If it were a different domain, then the risk a risk that port_is_valid() 
may return valid and then invalid.

AFAICT, evtchn_close() may be called with d != current. So there is some 
racyness in the code as well.

Therefore, I will defer my ack until we agree on whether port_is_valid() 
can be used locklessly when current != domain.

Cheers,

