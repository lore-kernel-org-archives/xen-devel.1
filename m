Return-Path: <SRS0=SpYr=ML=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CB5C12002
	for <xen-devel@archiver.kernel.org>; Mon, 19 Jul 2021 09:19:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D653B61026
	for <xen-devel@archiver.kernel.org>; Mon, 19 Jul 2021 09:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D653B61026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.158231.291399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5PQK-0002yH-4w; Mon, 19 Jul 2021 09:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158231.291399; Mon, 19 Jul 2021 09:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5PQK-0002yA-21; Mon, 19 Jul 2021 09:18:52 +0000
Received: by outflank-mailman (input) for mailman id 158231;
 Mon, 19 Jul 2021 09:18:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m5PQJ-0002y4-Cz
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 09:18:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m5PQI-0006ua-5A; Mon, 19 Jul 2021 09:18:50 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m5PQH-0002ze-VJ; Mon, 19 Jul 2021 09:18:50 +0000
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
	bh=3rsXbZ71fwPB4fGCjdg7939zo6eyvoIIGbintUM4EQA=; b=vz7kXLyI88zOL2bJH2pxYl5/kC
	o2PBIKKhqfDcel0pF+Y7N81Cf1XuBRlDLpmRIlLzbhZKQUKu5+3CDX9tlSWimjcdWifb7FZ5kHXbT
	4uyLcEpjSmxQdWBTpg6qwsBQbM+2TDwlK/o98c8noOqmhwuTszUFryXFXZDATKtEfUxM=;
Subject: Re: [PATCH] x86/AMD: adjust SYSCFG, TOM, etc exposure to deal with
 running nested
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cd23fd18-66f9-55c7-4a1c-a50d66628d69@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d8913811-2e90-255b-98c6-44e262e113d3@xen.org>
Date: Mon, 19 Jul 2021 10:18:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <cd23fd18-66f9-55c7-4a1c-a50d66628d69@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/07/2021 08:22, Jan Beulich wrote:
> In the original change I neglected to consider the case of us running as
> L1 under another Xen. In this case we're not Dom0, so the underlying Xen
> wouldn't permit us access to these MSRs. As an immediate workaround use
> rdmsr_safe(); I don't view this as the final solution though, as the
> original problem the earlier change tried to address also applies when
> running nested. Yet it is then unclear to me how to properly address the
> issue: We shouldn't generally expose the MSR values, but handing back
> zero (or effectively any other static value) doesn't look appropriate
> either.

IIUC, the unsolved problem is a Linux 3.12 dom0 running on top of the L1 
Xen. The kernel is quite old (and looks to be unsupported), so are we 
expecting anyone to build a new stack with a newer Xen and such dom0?

If the answer is unlikely, then I think it would be fair to keep the 
limitation until someone comes up with such setup.

> 
> Fixes: bfcdaae9c210 ("x86/AMD: expose SYSCFG, TOM, TOM2, and IORRs to Dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

