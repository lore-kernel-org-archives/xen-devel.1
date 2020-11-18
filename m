Return-Path: <SRS0=TkWG=EY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086C3C3E8C5
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 17:43:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CEB6248EB
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 17:43:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="vwl5fUu6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CEB6248EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.30175.59968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRTl-00022m-Sv; Wed, 18 Nov 2020 17:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30175.59968; Wed, 18 Nov 2020 17:42:49 +0000
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
	id 1kfRTl-00022f-Q0; Wed, 18 Nov 2020 17:42:49 +0000
Received: by outflank-mailman (input) for mailman id 30175;
 Wed, 18 Nov 2020 17:42:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfRTl-00022V-Eq
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:42:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRTj-00079C-DX; Wed, 18 Nov 2020 17:42:47 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRTj-0006eK-7o; Wed, 18 Nov 2020 17:42:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRTl-00022V-Eq
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=NFq7AppJuxIWgtdJ0C+aY5M9nma0lDoU03FwtyeQwD8=; b=vwl5fUu6AA4E6A9UYh4s+ftfq1
	M4PQy/km+tHA0AyfWDO1gtFA+jRVen26UwKvziHqpmYRvVmCNRb0bchJ64N2hTmcp1aGcEV0+YtGh
	+4t0DJouiXxfS+S5ESa0FwAnR+lgyONF/IKVEfnsKLFjJXdhabtHBCc9KPqFSumAati0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRTj-00079C-DX; Wed, 18 Nov 2020 17:42:47 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRTj-0006eK-7o; Wed, 18 Nov 2020 17:42:47 +0000
Subject: Re: [PATCH v2 5/8] lib: move init_constructors()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <c7b091f4-b2a4-965e-3a1a-de26f45f0d5d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cc2d63ea-3e6f-2e27-7433-2ec006d855a9@xen.org>
Date: Wed, 18 Nov 2020 17:42:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <c7b091f4-b2a4-965e-3a1a-de26f45f0d5d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/10/2020 11:18, Jan Beulich wrote:
> ... into its own CU, for being unrelated to other things in
> common/lib.c. For now it gets compiled into built_in.o rather than
> lib.a, as it gets used unconditionally by Arm's as well as x86'es
> {,__}start_xen(). 

AFAICT, parse_size_and_unit() is also used unconditionally on both 
architectures.

I think we want to follow the same approach everywhere. If there are no 
major downside to build an archive, then we built in everything in lib/ 
in the archives.

Cheers,

-- 
Julien Grall

