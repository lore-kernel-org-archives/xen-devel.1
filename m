Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA37BC98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 13:59:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428895.1651810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9127-0001Z3-3K; Tue, 22 Sep 2026 13:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428895.1651810; Tue, 22 Sep 2026 13:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9127-0001Yw-0d; Tue, 22 Sep 2026 13:59:43 +0000
Received: by outflank-mailman (input) for mailman id 1428895;
 Tue, 22 Sep 2026 13:59:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9125-0001Yk-V9
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:59:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9125-00HYlr-80
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:59:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab289ca-bab6-0a2a0a5309dd-0a2a450b8fe6-22
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:59:41 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab289cd-b7e8-0a2a450b0019-4a7de14ce2ae-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:59:41 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6350f89so2507993f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 06:59:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862774882sm5506267f8f.13.2026.09.22.06.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 06:59:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790085581; x=1790690381; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CaOfa4yq+8f+PXaRAVsgS+seiDe9BQ6P4dSHmnDrlbQ=;
        b=lp9YUGuj6OGE4wZXnk1VwE+i1clhqkgd8LPjN5swSwNnStfIp/2Aaz2jENTAcIoOIz
         YdxnFKdoYeU1wvWmNq5QwJE5Xs7QOuzLpJ7tGiN6UGB2ZpE7uRLV1kv18U9U4mLsIZE5
         6S5BGxZdYC1/giDAzNhSWTe0UnQbc8k1mhTschDndJMFIOJJ4cGY8mye08/DfHjEqKpk
         miDXnI34F+SEjleFEYjvtof9UTHxWX8PyKrh94kLefxhe/KQk9M58Hukysmwfa5yASkq
         Zz9r+tgS21L3o5QD5gZkKqokft5wwy+4XX0zN+gNwZBOoqg3of2R8yda1dWFTWeU2t0P
         76JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085581; x=1790690381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CaOfa4yq+8f+PXaRAVsgS+seiDe9BQ6P4dSHmnDrlbQ=;
        b=uOL/XAcWOMJKt+zZY9h4N4elu77QM3UfrkQNWmxof8bD11hFxguR2oOPd3Szt9VnTe
         68Gp7wb97e5/KvO5wlmzhN9d173oybsnHT8ySRIvFPLmdInD0AJnKjsSyV37jp8D0y2H
         +9LVjYE/ByTkFdkL2Hd+F7aqBkJNiMGKl536ox0yPmDeOokQxkMgfTV8QPAleehpPUvq
         5juOOZ+xKl+cY7NfXgufGTHoCpBKDuc4U1dMx3KDJ7FW2kATKEO/qrZf0eZ+7qsUliUX
         QLgFYP4K/DTqOmicc3G3yfw8a+topWlvyW3+DG2HSLGuDI1JRuKV6HTRaocXiRtC6Ybq
         m2lA==
X-Forwarded-Encrypted: i=1; AKwUvBxx95rLgyciUqw+co60g4AxyFfEtM5+b9OWunBNAIFqN+Hiv2MVPfe0ssX0uB86GtiIr0Eg9CEX7Uc=@lists.xenproject.org
X-Gm-Message-State: AFuF++msmfTj8qqVhQPiLg1NTTRbcAIultBJTtC48ZW2CpS7Fe3QpTqT
	4wbO/jRguCjCDtRtMBGn1B7qFGrpxSsfgioD48bIPEWMlxLoY8zCgNnW
X-Gm-Gg: AYBFou1Vq57OxNrVqIcxAUTOzmJOI19mFT6u22SfxkpWMc1qO4kBDP+SeNU9yJRtSWm
	djS1atB7bHtbQIX0s0cvnkD7ST6c/QvxJv8SUhQtm8qij8oD/H0LpLAvYtoCT+RBZiDVUm26H6x
	es9kFagn53vxuctppkUwuiWKtPkklbPcbPygbaWCq/c6ReKIK+mEjvKBhjnrHs9/4cM26i8wBZe
	KhSMeFddrx1/Moji2I3dbZylEOsgwht8dflXxe92shTtsXulll1+DpvhRrDh1O9E5GiqstTe93t
	H3yE6CIWsLTtz+QWtPky/mB0knaHQyZtMpAkvV65T7GITW1I7WdmxmJLmjMSi5Sd6oorpXEdnPp
	ZtN21xVpDT8wu9Y2VqonvmR7gmUslrZhHG7QEn7ATDA/zgWUg3uH6RIxk9Uu3rOTp0cP7GPSLmC
	fLAElPdru96JEVYfXRbTybDrABLxR1A/SUGNmFYnyWquNxLgRkZs8zhJ1bV5SV9xgbL91/Lbq4j
	/7W/23cvHLUqgBV7JKZhk5iPLJATZr1KDXY8W6IpTQeQVPcMJwor2t3gEbv
X-Received: by 2002:a05:6000:2608:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-4871e20b210mr20498734f8f.2.1790085580550;
        Tue, 22 Sep 2026 06:59:40 -0700 (PDT)
Message-ID: <038aa8c1-915d-488e-89ac-004b1b8bec70@gmail.com>
Date: Tue, 22 Sep 2026 15:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] CHANGELOG: add removal of grub-pv
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>
References: <20260922072711.385956-1-jgross@suse.com>
 <20260922072711.385956-5-jgross@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260922072711.385956-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1790085581-AAAD89EA-B9621E1B/10/73395122804
X-purgate-type: spam
X-purgate-size: 940



On 9/22/26 9:27 AM, Juergen Gross wrote:
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   CHANGELOG.md | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index aa1a777dd4..a2dd01037b 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -23,6 +23,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>        The only known user was the classic-xen fork of Linux.  This does not
>        affect Xen kexec support in the kexec-tools package.
>      - The example stubdom "c-stubdom" has been removed.
> +   - The grub-pv stubdom has been removed.  A grub-pv stubdom from an older
> +     Xen version (e.g. 4.22) will still work with Xen 4.23.
>   
>   ## [4.22.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - 2026-07-30
>   

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

