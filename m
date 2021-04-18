Return-Path: <SRS0=OTPY=JP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534D2C433B4
	for <xen-devel@archiver.kernel.org>; Sun, 18 Apr 2021 18:08:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3A67610FC
	for <xen-devel@archiver.kernel.org>; Sun, 18 Apr 2021 18:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3A67610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.112528.214687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYBpp-00068S-Un; Sun, 18 Apr 2021 18:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112528.214687; Sun, 18 Apr 2021 18:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYBpp-00068L-Qs; Sun, 18 Apr 2021 18:07:53 +0000
Received: by outflank-mailman (input) for mailman id 112528;
 Sun, 18 Apr 2021 18:07:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYBpp-00068G-3O
 for xen-devel@lists.xenproject.org; Sun, 18 Apr 2021 18:07:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYBpm-0007cR-Ip; Sun, 18 Apr 2021 18:07:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYBpm-0002nr-Bf; Sun, 18 Apr 2021 18:07:50 +0000
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
	bh=8sRyFLG3IlmitXTRR+QCtfzBsz66JAL4/9EdrbCNtp4=; b=SponDqYZQ+QNNUAvLupHooJqVg
	JHLoFkT2NQZwlM4Rbop5VnkGL6+xbBbIheUUqHcd8uXSNxUuc7EcEFnMoDR85CKj6M08KLnAAAcGn
	mX1PTa/ZadmJ6G7HymV2Q8eRtFbXlHQyVFvIquT9YO6vUGBgfb4aFeDsiaEwn16gi0vE=;
Subject: Re: [PATCH] tools: Drop XGETTEXT from Tools.mk.in
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20210416155941.15454-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b9526156-a3d3-1434-0419-de5cebcf1d6c@xen.org>
Date: Sun, 18 Apr 2021 19:07:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210416155941.15454-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 16/04/2021 16:59, Andrew Cooper wrote:
> This hunk was missing from the work to drop gettext as a build dependency.
> 
> Fixes: e21a6a4f96 ("tools: Drop gettext as a build dependency")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Julien Grall <julien@xen.org>
> CC: Juergen Gross <jgross@suse.com>
> ---
>   config/Tools.mk.in | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/config/Tools.mk.in b/config/Tools.mk.in
> index d47936686b..934d899967 100644
> --- a/config/Tools.mk.in
> +++ b/config/Tools.mk.in
> @@ -12,7 +12,6 @@ PYTHON              := @PYTHON@
>   PYTHON_PATH         := @PYTHONPATH@
>   PY_NOOPT_CFLAGS     := @PY_NOOPT_CFLAGS@
>   PERL                := @PERL@
> -XGETTTEXT           := @XGETTEXT@
>   AS86                := @AS86@
>   LD86                := @LD86@
>   BCC                 := @BCC@
> 

-- 
Julien Grall

