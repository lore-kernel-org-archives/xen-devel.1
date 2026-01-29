Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C919D73E87
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jan 2026 23:20:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1217105.1526917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlbJ0-00032w-Bw; Thu, 29 Jan 2026 23:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217105.1526917; Thu, 29 Jan 2026 23:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlbJ0-00032p-97; Thu, 29 Jan 2026 23:20:06 +0000
Received: by outflank-mailman (input) for mailman id 1217105;
 Thu, 29 Jan 2026 23:20:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fBE=AC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlbIz-0002qh-9Y
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 23:20:05 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09ff99fb-fd69-11f0-b160-2bf370ae4941;
 Fri, 30 Jan 2026 00:20:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 60D106001A;
 Thu, 29 Jan 2026 23:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85587C4CEF7;
 Thu, 29 Jan 2026 23:20:00 +0000 (UTC)
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
X-Inumbo-ID: 09ff99fb-fd69-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769728802;
	bh=VzOS7K6H7Wqg5KcjJXPpN5yAoinwvbEy5F7XI3gKziA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YZSY4P+U7lWFlnunk/tyaRqVx8/aXMd6Hs/XGF1ypr1N9vSObWPLHHbW2t0igh3VG
	 dEm06qQE17ObTJy0rTDTkB7TZWwEpONIq7H8cehyF/OpQCrWEmbP1AyOFxF4T/A1oa
	 M/VMLPrvyvekzAA4LRwxN0XHh0IyyWnPubnYpENwYuRShmamiB6tDA3anAosHSbxgM
	 bUqRxJGC0+WpS92B6YUQXAJhQT6Y0PFoixpGyICPkb/2KhLlwwzz+jNF2csoWlMXch
	 AwJX7h7pe8lK53vMTfnXk4gq0+kJW4r74YAwZ7TAI6jgunDDdq5GSvEeOYuvhP9S4G
	 dG5eEbwfxOsWw==
Date: Thu, 29 Jan 2026 15:19:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v9 2/5] xen: arm: smccc: add INVALID_PARAMETER error
 code
In-Reply-To: <366a3a85e89e868a12e261ea0ae07aca661d0ab6.1769696107.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601291519520.2238666@ubuntu-linux-20-04-desktop>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com> <366a3a85e89e868a12e261ea0ae07aca661d0ab6.1769696107.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Jan 2026, Oleksii Moisieiev wrote:
> According to the "7.1 Return Codes" section of DEN0028 [1]
> INVALID_PARAMETER code (-3) is returned when one of the call
> parameters has a non-supported value.
> Adding this error code to the common smccc header file.
> 
> [1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> 
> 
>  xen/arch/arm/include/asm/smccc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
> index 441b3ab65d..478444fb09 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -381,6 +381,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
>                         0x3FFF)
>  
>  /* SMCCC error codes */
> +#define ARM_SMCCC_INVALID_PARAMETER     (-3)
>  #define ARM_SMCCC_NOT_REQUIRED          (-2)
>  #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
>  #define ARM_SMCCC_NOT_SUPPORTED         (-1)
> -- 
> 2.34.1
> 

