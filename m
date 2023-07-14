Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662FFEB64DA
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jul 2023 13:25:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.563649.880992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKImp-0005Ld-MY; Fri, 14 Jul 2023 13:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563649.880992; Fri, 14 Jul 2023 13:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKImp-0005LW-Jb; Fri, 14 Jul 2023 13:24:43 +0000
Received: by outflank-mailman (input) for mailman id 563649;
 Fri, 14 Jul 2023 13:24:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qKImp-0005LO-58
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 13:24:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKImo-0002Ei-7s; Fri, 14 Jul 2023 13:24:42 +0000
Received: from [54.239.6.186] (helo=[192.168.4.173])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKImo-0003I1-1K; Fri, 14 Jul 2023 13:24:42 +0000
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
	bh=8dSjrJX81ELMcw/ReX9TZOJZz8Ymx6aMnuM7JVpffe4=; b=ro7pLELRAOPpzsDMkw18ox2/Wt
	qScAh9dfnCc/9tdUH7KGuifi1gFV3ipZgfwhlt9sxbE/UL2JdQuD/1k/D7xqHemDE2NdxKfRmNMNl
	0EErLyq5mjDUjb6vA8gOnlLahjLpUb80iypgChhvlbKqHPQG7TeqJgitbzI5ruGIGVBA=;
Message-ID: <625fd6db-18cf-8d04-c94e-9f988baa1878@xen.org>
Date: Fri, 14 Jul 2023 14:24:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/ACPI: Use const char * for string literals
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20230714131026.3082591-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230714131026.3082591-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 14/07/2023 14:10, Andrew Cooper wrote:
> For pre-ANSI-C compatibility reasons, string literals have a mutable type, but
> it is undefined behaviour to mutate them.
> 
> Swap char *'s to const char *'s for variables which hold string literals.
> 
> This fixes several violations of MISRA Rule 7.4:
> 
>    A string literal shall not be assigned to an object unless the object's type
>    is "pointer to const-qualified char".
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>


I had a similar patch in my queue. But never sent as I didn't know 
whether it would be accepted. This was one of the major blocker for 
switching the hypervisor to use const string.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

