Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C6BCD98C5
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2026 09:58:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1338089.1599107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ45U-0002tr-VC; Mon, 15 Jun 2026 09:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338089.1599107; Mon, 15 Jun 2026 09:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ45U-0002tk-ST; Mon, 15 Jun 2026 09:58:36 +0000
Received: by outflank-mailman (input) for mailman id 1338089;
 Mon, 15 Jun 2026 09:58:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZ45S-0002te-ME
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 09:58:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ45R-001OKD-3K
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 11:58:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2fccb8-e002-0a2a0a5209dd-0a2a45078b3c-44
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:58:33 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2fccc8-229c-0a2a45070019-d155d029ddfa-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:58:33 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-68acf0a15b3so4712352a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 02:58:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6940c7456a8sm1785401a12.16.2026.06.15.02.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 02:58:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781517512; x=1782122312; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2FTYXz+ydXVlmvhvOT8QBgUDqwww618CwcENjKoZzQ=;
        b=jDd+HkcEPHxlVngmZ8HUkONAYVRlJ98RZU0qURx+uLf3nxun7MeyV4wo/jlJXOC/DW
         4OR4+bUvhg8NqOf23XlwdILSGW/3xnaZ+IRjgyHSdO39+jwV33LtKHBQw6beBQgIDtgV
         oOf5cR3yVAnDN0UiHExP8U4O/RhlDTp7y9aerGntw04k5pK6FTLvc6UbRt/tK/mGpE6Y
         GTsnpt9kUZ90lb7BeHszhjqBsIzkv7bFJPeXcEKtZQC4VX9XsHB61u/VS6hN4if6mUis
         6uxwOEvouAfZGtsoyP5IO2nWlcHOAuk2sUNr0isSHqQuDEU8lDEC9U/+O53X5s+RwbfM
         efjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517512; x=1782122312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2FTYXz+ydXVlmvhvOT8QBgUDqwww618CwcENjKoZzQ=;
        b=GKt+ufv1x4qyjJ7l7hfRRaiekgTC16TsoBcQtMjBgRzRx90FKRMWk5IiqRPa+Qsbm3
         hLaerkd4/hH0FuYoPDe3ZyxG9wtrK2SwWtFI3JkfNoL7UjvGFcmrDfdulcZE5u6r7jGv
         rCSayoa78bT/q8FtHWb13vGmscv/eZoDJYMiV2LF6CKCKtrf49bzhp0pFBoXvXkyKccd
         8EOMKCj4rnOF6ZqJK1XfkYApUIsZY+pKsUpI08ZCaXyp9WpmUZHwAep6YYOEmfCePXJ7
         luD2Mld1DXalWSwfcQU74K2XTQh0P38R1SsH7ghT3KRMED0COjvK7PxL5KYfutauclfH
         ZCQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lgvwjDK7LL3QfRSX4e60kIf0fXwrwdqimx66Y7wX6aLofwNjYs0aivKdp0f4XSkkZUGJW8xp3ZM0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1Jh56OZt2VVFWuJwtdM8ASsooDKAnMchhgPFdIiq6oXxQfzDl
	MRXHBqH1Cozb5dqD9hPwTxR01kPc44l3Ra1m7uzl9lvmMbVdcUyb1qao
X-Gm-Gg: Acq92OGGtR9b9DFpEcOmXUEuMgXuFmwFbqSdoYvSL5wtc9J/g38lnbBgSVYWEnAzLHF
	y07VksHLFREbTIb1qGxNE/B6REaq2mzn7zfBPvsSwrfYlM1sOOUw5du5JSyQ+zxFEUy/XH2Y+wh
	BZWNBlsHT4Mioxm1P6fR7a3MwzSM0JpSRcSA36VtnuyK3RlI9E2OgezIIrFZSdV6pdNHTl/v0Hc
	tiLQOYd6VG0ej3lVQpl0JG5SblPXJr5MNqkjJZG9dpi/jhHhxy7EqbMVDyEJnZCT8vduvgpwbqe
	/JAcbPb2fJnk4UYrCMVRyR5XU/xsASZibZFR+I7Ij1gILbEd7NEV2oFyRd3RAVSIoXdGCra+P3/
	DPEpqhA1r7CpULZ8GAaVnvb7q5y6kn+T5ITTkeOA8v0JM5AiW5JX3nLDl2P0CXvcLLDvxcHmbap
	urikSx0SyZ3wcLt1LD/XmmXmsdQ25D+HBSE68APtpdl/V0AzXFLfVBSJ7IzErgibF41Mh6MSQeH
	pEGaw==
X-Received: by 2002:a05:6402:321f:b0:68f:cc85:7c1c with SMTP id 4fb4d7f45d1cf-69378a51186mr6301148a12.28.1781517512419;
        Mon, 15 Jun 2026 02:58:32 -0700 (PDT)
Message-ID: <59f5872d-34b0-4fae-82c5-ef1e7e0c5986@gmail.com>
Date: Mon, 15 Jun 2026 11:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 0/7] CI: Refresh Alpine containers
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1781517513-2357BC48-50182636/10/73395122804
X-purgate-type: spam
X-purgate-size: 2587



On 6/13/26 1:09 AM, Andrew Cooper wrote:
> Refresh and update the Alpine containers.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2598243590
> 
> This gets us off an obsolete version of Alpine, and finishes several
> improvement projects (naming, and non-root containers) all at once.
> 
> Andrew Cooper (7):
>    tools/xenalyze: Work around GCC-15 -Werror=nonnull false positive
>    Config.mk: Update QEMU to include pip-25.2 bugfix
>    CI: Introduce new qubes-hw-runner.dockerfile
>    CI: Update the Alpine x86_64 container to 3.24
>    CI: Update the Alpine arm64 container to 3.24
>    CI: Fix inconsistent use of x86-{64,32} vs x86_{64,32}
>    CI: Remove x86 microcode from arm32 jobs
> 
>   Config.mk                                     |   4 +-
>   .../build/alpine/3.18-arm64v8.dockerfile      |  51 ---
>   automation/build/alpine/3.18.dockerfile       |  52 ---
>   .../build/alpine/3.24-arm64v8.dockerfile      |  53 +++
>   .../build/alpine/3.24-x86_64.dockerfile       |  65 +++
>   .../build/alpine/qubes-hw-runner.dockerfile   |  21 +
>   automation/gitlab-ci/build.yaml               | 202 ++++-----
>   automation/gitlab-ci/test.yaml                | 385 +++++++++---------
>   automation/scripts/containerize               |   2 +-
>   .../{xtf-x86-64-config => xtf-x86_64-config}  |   0
>   ...86-64-efi-config => xtf-x86_64-efi-config} |   0
>   .../include/{xtf-x86-64 => xtf-x86_64}        |   0
>   .../{xtf-x86-64-efi => xtf-x86_64-efi}        |   0
>   .../{qubes-x86-64.sh => qubes-x86_64.sh}      |   0
>   tools/xentrace/xenalyze.c                     |  11 +
>   15 files changed, 444 insertions(+), 402 deletions(-)
>   delete mode 100644 automation/build/alpine/3.18-arm64v8.dockerfile
>   delete mode 100644 automation/build/alpine/3.18.dockerfile
>   create mode 100644 automation/build/alpine/3.24-arm64v8.dockerfile
>   create mode 100644 automation/build/alpine/3.24-x86_64.dockerfile
>   create mode 100644 automation/build/alpine/qubes-hw-runner.dockerfile
>   rename automation/scripts/include/configs/{xtf-x86-64-config => xtf-x86_64-config} (100%)
>   rename automation/scripts/include/configs/{xtf-x86-64-efi-config => xtf-x86_64-efi-config} (100%)
>   rename automation/scripts/include/{xtf-x86-64 => xtf-x86_64} (100%)
>   rename automation/scripts/include/{xtf-x86-64-efi => xtf-x86_64-efi} (100%)
>   rename automation/scripts/{qubes-x86-64.sh => qubes-x86_64.sh} (100%)
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

