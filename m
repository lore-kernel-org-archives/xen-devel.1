Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ACEC433F5
	for <xen-devel@archiver.kernel.org>; Thu,  5 May 2022 10:59:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.321987.543154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZCp-0007P3-Da; Thu, 05 May 2022 10:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321987.543154; Thu, 05 May 2022 10:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZCp-0007Ow-Ah; Thu, 05 May 2022 10:59:35 +0000
Received: by outflank-mailman (input) for mailman id 321987;
 Thu, 05 May 2022 10:59:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmZCo-0007Oq-0W
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 10:59:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmZCn-00042S-6b; Thu, 05 May 2022 10:59:33 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.236.17])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmZCm-0001bR-W3; Thu, 05 May 2022 10:59:33 +0000
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
	bh=3N4YsIiibXlZqaFYkKkk8amaqy18kkvoO+KOegbi83M=; b=f/Gyyn8eZj4onyPNx5ump8fn9l
	0cu2ZYQBXyfbNRqyOG5NOamoIDR/YT6LWqzbuHgSkfv9NklIutvYRzWQtFfSjwIjXBwu2V4pXU++W
	6yPX8mWOxviGoDhimsTZ9OezfYumOyjoOEe4oT4eVDa01ObCu8yMJtKUKXq+3YdleogI=;
Message-ID: <18cd9a4a-f7ce-7078-b638-fdce3531481f@xen.org>
Date: Thu, 5 May 2022 11:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v2] tools/xenstore: don't let special watches be children
 of /
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Raphael Ning <raphning@amazon.com>
References: <20220502100722.17250-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220502100722.17250-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 02/05/2022 11:07, Juergen Gross wrote:
> When firing special watches (e.g. "@releaseDomain"), they will be
> regarded to be valid children of the "/" node. So a domain having
> registered a watch for "/" and having the privilege to receive
> the special watches will receive those special watch events for the
> registered "/" watch.
> 
> Fix that by calling the related fire_watches() with the "exact"
> parameter set to true, causing a mismatch for the "/" node.
> 
> Reported-by: Raphael Ning <raphning@amazon.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Raphael Ning <raphning@amazon.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

And commited it.

Cheers,

-- 
Julien Grall

