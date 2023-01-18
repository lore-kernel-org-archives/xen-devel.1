Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71960C38159
	for <xen-devel@archiver.kernel.org>; Wed, 18 Jan 2023 09:30:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.480270.744569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4ly-0004b3-Ew; Wed, 18 Jan 2023 09:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480270.744569; Wed, 18 Jan 2023 09:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4ly-0004aw-By; Wed, 18 Jan 2023 09:30:22 +0000
Received: by outflank-mailman (input) for mailman id 480270;
 Wed, 18 Jan 2023 09:30:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pI4lx-0004ap-Hd
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:30:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI4lw-00047y-W2; Wed, 18 Jan 2023 09:30:20 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.8.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI4lw-0004HK-P9; Wed, 18 Jan 2023 09:30:20 +0000
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
	bh=2oZO/KAxo0go/UoEoVWKI9dC1ZpQt7I3BZtSX56VdLg=; b=oWuvPHGnsqqffTsyBINMhAhS0K
	DCf6rEoObdJtTTU7zvBypBtCWMyMNPJfvBbxz/CKPndNyPE+WuDVBNni50+SbG4/V32IcV4uEoSWX
	WEPJjq0LvE5yTFxkBCpYnMHHu3NGbLjGqaQNgyfvtTSg7kcYRfMML0Es/h6IUzGSZerg=;
Message-ID: <a0f38463-18b3-ff70-12b8-aa55747d2701@xen.org>
Date: Wed, 18 Jan 2023 09:30:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 13/17] tools/xenstore: switch hashtable to use the
 talloc framework
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-14-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117091124.22170-14-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 17/01/2023 09:11, Juergen Gross wrote:
> Instead of using malloc() and friends, let the hashtable implementation
> use the talloc framework.
> 
> This is more consistent with the rest of xenstored and it allows to
> track memory usage via "xenstore-control memreport".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

