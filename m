Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92502C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 08:55:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B76C6124E
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 08:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B76C6124E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161092.295785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8IrP-00010q-PK; Tue, 27 Jul 2021 08:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161092.295785; Tue, 27 Jul 2021 08:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8IrP-00010j-Lf; Tue, 27 Jul 2021 08:54:47 +0000
Received: by outflank-mailman (input) for mailman id 161092;
 Tue, 27 Jul 2021 08:54:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m8IrP-00010d-0w
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 08:54:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m8IrK-00021Q-1Y; Tue, 27 Jul 2021 08:54:42 +0000
Received: from [54.239.6.180] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m8IrJ-0005ey-Q9; Tue, 27 Jul 2021 08:54:41 +0000
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
	bh=eywEcllzg8j9Hfe3EcYDV2wNQxA1ZsKolNcV6bImFpg=; b=iYF3sQ1jRYZo8BOsHPNtA5C28T
	GEPh69ukTGTWwhGyg4Xz5/jSolmc2XSXK7CFIvGQ30P3JT/9eGP68EoIhVLBrGJaS95mYBHOJsHGp
	mqqm1qcHsLUbqYeXR70fhwEEp6L2oif3RR07NCRdMGYQ85s2iMhv+85pwX3eAiO3kefw=;
Subject: Re: [XEN PATCH v2] tools/xl: Add stubdomain_cmdline option to xl.cfg
To: Scott Davis <scottwd@gmail.com>, xen-devel@lists.xenproject.org
Cc: Scott Davis <scott.davis@starlab.io>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <93dd20b91ca75b35c5886e4051659e58bceb080d.1626970707.git.scott.davis@starlab.io>
From: Julien Grall <julien@xen.org>
Message-ID: <198774b3-f688-376a-7fed-256662f6adba@xen.org>
Date: Tue, 27 Jul 2021 09:54:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <93dd20b91ca75b35c5886e4051659e58bceb080d.1626970707.git.scott.davis@starlab.io>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Scott,

On 22/07/2021 17:54, Scott Davis wrote:
> This adds an option to the xl domain configuration file syntax for specifying
> a kernel command line for device-model stubdomains. It is intended for use with
> Linux-based stubdomains.
> 
> Signed-off-by: Scott Davis <scott.davis@starlab.io>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

