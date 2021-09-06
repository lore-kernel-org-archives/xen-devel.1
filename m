Return-Path: <SRS0=XIDt=N4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B70C433F5
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 11:05:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DB360E76
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 11:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6DB360E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.179633.326003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCQs-0000Gu-LR; Mon, 06 Sep 2021 11:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179633.326003; Mon, 06 Sep 2021 11:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCQs-0000Gn-Ic; Mon, 06 Sep 2021 11:04:58 +0000
Received: by outflank-mailman (input) for mailman id 179633;
 Mon, 06 Sep 2021 11:04:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNCQr-0000Gh-2n
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 11:04:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNCQp-00028G-An; Mon, 06 Sep 2021 11:04:55 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNCQp-0008Lo-46; Mon, 06 Sep 2021 11:04:55 +0000
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
	bh=cUUe6zzqW0wvOLi12xZic2f3L00lviKdlvhQ+zAy3fs=; b=0G+ZCTjQWV78luFw20ktNazUe7
	pXeAXYqqVsiVHa4xMP7cltFmcw3uKqLxi+Ndlen7GxAH/sznP1zOnzCptX1/bjm/ahZtLZLvgGT+m
	6a8k+vHCcYOIbeX2LJikd3ce45UYi2DCnT4gwD5L2HvJ3OecNw/P9bKf//9RV8N8/boM=;
Subject: Re: [PATCH] gnttab: maptrack handle shortage is not IOMMU related
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e28eea8c-fd54-c3a7-a10a-5eeac2c7a8a1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <29fd1d29-1077-4513-a8b6-5d220b06f4d3@xen.org>
Date: Mon, 6 Sep 2021 12:04:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e28eea8c-fd54-c3a7-a10a-5eeac2c7a8a1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/08/2021 15:27, Jan Beulich wrote:
> Both comment and message string associated with GNTST_no_device_space
> suggest a connection to the IOMMU. A lack of maptrack handles has
> nothing to do with that; it's unclear to me why commit 6213b696ba65
> ("Grant-table interface redone") introduced it this way. Introduce a
> new error indicator.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Or should this be a more specific one, e.g. GNTST_no_mt_handle? If not,
> I would intend to also use GNTST_no_space for -ENOMEM like situations.

I guess the guest could use GNTSTS_no_mt_handle to reduce the number of 
persistent mappings (if there are any).

Although, I am not sure how involved it would be in OS like Linux.

Anyway, the new error status is better than the previous one. So I am 
happy with either solutions:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

