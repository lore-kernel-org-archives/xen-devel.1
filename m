Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC33C433FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Nov 2022 20:30:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.447294.703362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZu0-0005X5-TY; Tue, 22 Nov 2022 20:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447294.703362; Tue, 22 Nov 2022 20:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZu0-0005Wy-Q6; Tue, 22 Nov 2022 20:29:56 +0000
Received: by outflank-mailman (input) for mailman id 447294;
 Tue, 22 Nov 2022 20:29:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxZu0-0005Wm-5r
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 20:29:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZu0-0007zD-0a; Tue, 22 Nov 2022 20:29:56 +0000
Received: from [54.239.6.190] (helo=[192.168.0.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZtz-00041o-Rb; Tue, 22 Nov 2022 20:29:55 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=c7bMFtwYfCpe3eSVFb1yZIAm4LXmJ+VMWj1cWJuycxI=; b=scNFEU1gvZhp3lQSaCjDqN2DiG
	71hUE0tG0qm8wGz7LNlWr9KvW+CdPc5Vf47JOk78A8S0V5Qgs1T5qNM88Y2ztw/Hzs4eCHPdSu9Po
	YzyWAVR5HXPV00Qqs6WTLEBQGEjQ6pR/pWbbEKPHIk8fSAyrM87X1T7+RhBlV4Oih+ME=;
Message-ID: <c75a7663-80e3-432a-f1b5-7408f15fd399@xen.org>
Date: Tue, 22 Nov 2022 21:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 3/3] xen/arm: Define WLEN_8 macro and use it in
 debug-pl011
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221118114618.20754-1-michal.orzel@amd.com>
 <20221118114618.20754-4-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221118114618.20754-4-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 18/11/2022 11:46, Michal Orzel wrote:
> At the moment, early printk code for pl011 uses a hardcoded value
> for 8n1 LCR configuration. Define and use macro WLEN_8 for that purpose
> (no parity and 1 stop bit are defined as 0).
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall

