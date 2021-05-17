Return-Path: <SRS0=GMNG=KM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B06DC433ED
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 09:36:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCF3E61059
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 09:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCF3E61059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128133.240604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liZfo-0007A4-PH; Mon, 17 May 2021 09:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128133.240604; Mon, 17 May 2021 09:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liZfo-00079x-MN; Mon, 17 May 2021 09:36:28 +0000
Received: by outflank-mailman (input) for mailman id 128133;
 Mon, 17 May 2021 09:36:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1liZfo-00079r-6p
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 09:36:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liZfl-00006B-DE; Mon, 17 May 2021 09:36:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liZfl-0005Oh-6j; Mon, 17 May 2021 09:36:25 +0000
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
	bh=J1WSNSzJeyuM+ouj28g9EeljK31fGQKeT+wbfTEyemw=; b=wpF/0NPYNuowfHSAn5O3Vl9Mkh
	YlLAwL3UomNc1O9kqxzpjrQwc8LjsuciKtpdsdGjJ5l6z74xXL2WU2P6YlPw65K14g5N4xLtM678g
	Ino7uSz3FP/OLaJ8TtsY4x8YYfhKNVWOGmgwAXk98V6EYFtKo7W1kvcfHk8oh7URJSuk=;
Subject: Re: [PATCH] drivers/char: Add USB3 debug capability driver
To: Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9a6a15ebc538105c83be88883ab3a7125ed52d37.1620776791.git.connojdavis@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <46931334-d4a8-eb89-0b81-727ff30c0ec0@xen.org>
Date: Mon, 17 May 2021 10:36:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9a6a15ebc538105c83be88883ab3a7125ed52d37.1620776791.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Connor,

On 12/05/2021 01:12, Connor Davis wrote:
> +config XHCI_FIXMAP_PAGES
> +        int "Number of fixmap entries to allocate for the xHC"
> +	depends on HAS_XHCI_DBC
> +        default 16
> +        help
> +          This should equal the size (in 4K pages) of the first 64-bit
> +          BAR of the host controller in which the DbC is being used.

Why can't you use the ioremap() for the new serial controller? Is this 
going to be used by Xen very early?

Cheers,

-- 
Julien Grall

