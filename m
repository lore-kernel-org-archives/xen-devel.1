Return-Path: <SRS0=TJt3=KC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URI_NOVOWEL,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E6AC433ED
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 15:31:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CBAC6101B
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 15:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CBAC6101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.124073.234160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2Rp-0003pk-6g; Fri, 07 May 2021 15:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124073.234160; Fri, 07 May 2021 15:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2Rp-0003pd-3B; Fri, 07 May 2021 15:31:25 +0000
Received: by outflank-mailman (input) for mailman id 124073;
 Fri, 07 May 2021 15:31:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qbhn=KC=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1lf2Rm-0003pV-SO
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 15:31:22 +0000
Received: from mail-qt1-x833.google.com (unknown [2607:f8b0:4864:20::833])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8cc72b0-c544-459d-9c2e-998fb391e780;
 Fri, 07 May 2021 15:31:22 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id c11so6771278qth.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 May 2021 08:31:22 -0700 (PDT)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2])
 by smtp.gmail.com with ESMTPSA id q13sm5140503qkj.43.2021.05.07.08.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 08:31:20 -0700 (PDT)
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
X-Inumbo-ID: c8cc72b0-c544-459d-9c2e-998fb391e780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=71cCRQn+HQWCN9MH5Z6ZnIp2rjcsD2U6fT/zul98+C4=;
        b=qhBjN9gW2haeADbEBgmmibhvdS6XPIbpvsOWGy+XbdvWCkqkBCA58O6F2t2zW5KPxh
         qCN40LL0HdjO8yCitVoc1TIXfwVD2lLrlS3/mKOqv2A2FWB2/rkYdW7gsVvTNeQapVfW
         uK9/mytUMbGhRyGSa/vncCzsvEIw1F+1C15kEehLKbG1iaFcyUI/9f9P170pCXinIOpF
         xjUqVxPbJc0+bCJj2htURf17ozO+/bWB/Fps34ghe0usJvftv91D+n4+fsRTq4SXpSW/
         Ci22yNH9U9iv6J5j5508GjMa4utqMN94h3UY7T88p0RXVy1F+g7dD6pUmC+anR4oVV1R
         wpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=71cCRQn+HQWCN9MH5Z6ZnIp2rjcsD2U6fT/zul98+C4=;
        b=WE/THk9QFIw73P/S/4zAWKt6TJb/NonGGhlq7LO+QS7OSLtE/TvIKH5LnxCe8AJcYk
         IgZ+Oy9EioDLCIboYE+B89O1gwCyB+v03vC7PxdWOQqYvhJwzGlkAUDfh/vTD/GAU9u6
         oGZOXCKYNIUDWISx3KYlwQrbqvP8WOvuQrlQq/vhcMKcMLkqq9E+mOoIZRBBJogwXZ4F
         mAw0LjNBuJ5sk69Rs2W+MgvUHe5r8g/lwvQYgpdbDsw/jObWNhX8izlJe2TqkMbioz3D
         cQ2oWjrIDxLqSjmixINHr9sYGlQUMS9UG+Py8qu+eAnr6y9p3Wh5naUlzvkO4XAemk01
         g7Xg==
X-Gm-Message-State: AOAM532ZATplPk28BTK84F/Xn+Mb6Udc16M6nje+K+QYP7n6HS6hZvBm
	ylXQrFdPY7Wh56xJlMMQ6xc=
X-Google-Smtp-Source: ABdhPJzgKy0K3vlah+CPHtMoJFL4kY+jX19KDcna3mc9Tk983PzGYi5tWMzvo1v4fxnzJhZgdz6wsw==
X-Received: by 2002:a05:622a:13c6:: with SMTP id p6mr10113062qtk.288.1620401481957;
        Fri, 07 May 2021 08:31:21 -0700 (PDT)
Subject: Re: [PATCH 1/9] docs: Warn about incomplete vtpmmgr TPM 2.0 support
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-2-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Message-ID: <cea36fb6-9464-5e20-fbd7-fba367fd9ced@gmail.com>
Date: Fri, 7 May 2021 11:31:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210504124842.220445-2-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/4/21 8:48 AM, Jason Andryuk wrote:
> The vtpmmgr TPM 2.0 support is incomplete.  Add a warning about that to
> the documentation so others don't have to work through discovering it is
> broken.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

>  docs/man/xen-vtpmmgr.7.pod | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod
> index af825a7ffe..875dcce508 100644
> --- a/docs/man/xen-vtpmmgr.7.pod
> +++ b/docs/man/xen-vtpmmgr.7.pod
> @@ -222,6 +222,17 @@ XSM label, not the kernel.
>  
>  =head1 Appendix B: vtpmmgr on TPM 2.0
>  
> +=head2 WARNING: Incomplete - cannot persist data
> +
> +TPM 2.0 support for vTPM manager is incomplete.  There is no support for
> +persisting an encryption key, so vTPM manager regenerates primary and secondary
> +key handles each boot.
> +
> +Also, the vTPM manger group command implementation hardcodes TPM 1.2 commands.
> +This means running manage-vtpmmgr.pl fails when the TPM 2.0 hardware rejects
> +the TPM 1.2 commands.  vTPM manager with TPM 2.0 cannot create groups and
> +therefore cannot persist vTPM contents.
> +
>  =head2 Manager disk image setup:
>  
>  The vTPM Manager requires a disk image to store its encrypted data. The image
> 


