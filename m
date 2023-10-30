Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D5CC4332F
	for <xen-devel@archiver.kernel.org>; Mon, 30 Oct 2023 14:52:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.625171.974169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTcQ-0005Ao-7w; Mon, 30 Oct 2023 14:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625171.974169; Mon, 30 Oct 2023 14:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTcQ-0005Af-5O; Mon, 30 Oct 2023 14:51:54 +0000
Received: by outflank-mailman (input) for mailman id 625171;
 Mon, 30 Oct 2023 14:51:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxTcO-0005AW-GE
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 14:51:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxTcN-0003ai-Pj; Mon, 30 Oct 2023 14:51:51 +0000
Received: from [54.239.6.189] (helo=[192.168.13.78])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxTcN-0001G3-GL; Mon, 30 Oct 2023 14:51:51 +0000
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
	bh=sUBxZHal8X3gZ030XRWzozLKdebv6lcq6WYIS1X76PE=; b=081JzxPIIUhOGNO75zqQGOtDAF
	0/NXkVg3Uiy+LRXLoKx3cB0iWM5Jj+a1j666JcKn8EHixKioUAMBQUtnEC2hbhibSet1pbW2o+jtP
	WK8tQkazCjo2yOEbHATU48ptDsw7lKfJ0K64G2A+bMmPLfuk0UXCAaWzhjQCULWJnv1I=;
Message-ID: <98da41d4-f818-44c7-bd3c-b3e3b224ff0d@xen.org>
Date: Mon, 30 Oct 2023 14:51:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <0c86b50a796ba2aaab01e30935ed559ab719d33a.1698418578.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0c86b50a796ba2aaab01e30935ed559ab719d33a.1698418578.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 27/10/2023 16:11, Nicola Vetrini wrote:
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 8511a189253b..8aaaa1473fb4 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -90,6 +90,13 @@ Deviations related to MISRA C:2012 Rules:
>            - __emulate_2op and __emulate_2op_nobyte
>            - read_debugreg and write_debugreg
>   
> +   * - R7.1
> +     - It is safe to use certain octal constants the way they are defined
> +       in specifications, manuals, and algorithm descriptions. Such places
> +       are marked safe with a /\* octal-ok \*/ in-code comment, or with a SAF
> +       comment (see safe.json).

Reading this, it is unclear to me why we have two ways to deviate the 
rule r7.1. And more importantely, how would the developper decide which 
one to use?

Cheers,

-- 
Julien Grall

