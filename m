Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920A6CD6E79
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 20:19:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1332078.1594720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgRB-0004QB-Co; Mon, 08 Jun 2026 20:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332078.1594720; Mon, 08 Jun 2026 20:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgRB-0004Q4-9z; Mon, 08 Jun 2026 20:19:09 +0000
Received: by outflank-mailman (input) for mailman id 1332078;
 Mon, 08 Jun 2026 20:19:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wWgRA-0004Pf-1o
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 20:19:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWgR9-00B2md-0g
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 22:19:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2723a8-bab6-0a2a0a5309dd-0a2a4506a996-14
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:19:05 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2723b7-7371-0a2a45060019-888fbc33527b-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:19:05 +0200
Received: by mx.zohomail.com with SMTPS id 1780949931284788.3710999714295;
 Mon, 8 Jun 2026 13:18:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1780949934; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nFMMNusW8iNFhpCXAYBsdOC9e0r/c3y8Gq613U2PYCHLfx43TfKVAd5eOFf/4JHj5xTJdAxj1jxQ77iFT7KmNdoh6ThMw/hI9EwTCjhf+zmkf/KJSdFtDFRWKPqrsEKxKivqD7QwWaASBnR9pBFprDCY/cBEaFArfW6g9sH/Y/4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780949934; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=45UdOykV39QgLWCIyvgO03AZPBdshS1eGbFhct3aEzY=; 
	b=SO5asRHGXftnudaSX+KJrDx5tDPUyapcO6aPQeUyWkQ2rRZa5zZWMUoZT7m7DckJwE/YGg4dQu+YcGrIcNalBuJdO+bWL7KM3egJvAK9XpIxC2AV1IvMXBCRc5YOQpPmtAt0FekMMog2ITMo/A2e684H6DkwaV/XVnGZAURh/Is=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780949934;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=45UdOykV39QgLWCIyvgO03AZPBdshS1eGbFhct3aEzY=;
	b=ZVmtPel1a38ALznDRSx0w9zyh98vYC6/At9P7AK1aEdzFvwnWkEb4jcibaYb9kKA
	mW4vCMOdt4FILU/1G8xgYNQ3z2KPZhUJ6KHfmqNOO0zTDNuB/dLQNnTsw+S10pb+MVy
	ZJzS9n2MenE+byW67+qZYdOGU9evnUAxWU09H70s=
Message-ID: <e087af10-4fee-4fea-92fa-5a647524af80@apertussolutions.com>
Date: Mon, 8 Jun 2026 16:18:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] automation: enable Argo debugging in CI
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, christopher.w.clark@gmail.com
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-7-dmukhin@ford.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20260526215823.1452619-7-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-16d1c6/1780949945-84767D75-285A654A/0/0
X-purgate-type: clean
X-purgate-size: 1101



On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Enable extra Argo traces in CI to help analyze any potential Argo issues.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - new patch
> - example verbose log: https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/14552079442
> ---
>   automation/gitlab-ci/build.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 7f5b5938e851..5f9192e53d63 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -319,6 +319,7 @@ alpine-3.18-gcc-debug:
>         CONFIG_EXPERT=y
>         CONFIG_UNSUPPORTED=y
>         CONFIG_ARGO=y
> +      CONFIG_ARGO_DEBUG=y
>         CONFIG_UBSAN=y
>         CONFIG_UBSAN_FATAL=y
>         CONFIG_MICROCODE_SCAN_DEFAULT=y

Why not just set up a job with the variable ARGO_DEBUG=1 and not have to 
introduce the first and only Kconfig option turning on a debug logging flag?

V/r,
Daniel P. Smith

