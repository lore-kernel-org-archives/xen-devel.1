Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F6A109192C
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2026 22:45:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1257640.1551962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3M7A-00079H-Do; Thu, 19 Mar 2026 22:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257640.1551962; Thu, 19 Mar 2026 22:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3M7A-000799-AB; Thu, 19 Mar 2026 22:45:16 +0000
Received: by outflank-mailman (input) for mailman id 1257640;
 Thu, 19 Mar 2026 22:45:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sa2u=BT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1w3M79-000791-6Z
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 22:45:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47a713a3-23e5-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 23:45:09 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 9297B4EE77FD;
 Thu, 19 Mar 2026 23:45:07 +0100 (CET)
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
X-Inumbo-ID: 47a713a3-23e5-11f1-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1773960307;
	b=RulXNESW1wZ7wJPKoTBu6I3JSdXbeBq1Uw/du5Oy5wfWLf2F10Eq/b3pEPNFDd+pwzgd
	 xU25VijrOKRvhyvKsCwtgf1eX6ksUU/EHA5t2BruA5Cqy4ucCLb89tMIR6XD7oxW7nX43
	 k/DhbXTJ1GV8LGVvF9fYkWs+mzpAnQgnJWQ9yjKX516zjMF42BaekymLHWFhQNepzGFhR
	 Oosc5UY/NHQc4soZzO/Qj+PVOEzOYeE9Ul72ZDIwQJV3GmWGyM8f5HzAu7CvVkvsYsqUP
	 F1cINRiEYF+nD82M0s9Ia25sipPCS3aoTfSzQ3N9ztU5glpXi21Iq7yd9UmDp6nRQh7VY
	 vV8e/IhowEzuM7ExBJMu73/FaF01BBFqn1BYB2HK0Bc16AEsX6lu+lCNyCtLCLISAhWXE
	 zG1NC2BD8YeYDo3wa6WpzLC2gQXfBtCpNXWToj+5yR0F7JZXBykZ3f+BrkrCqD9QdB6bx
	 I2k1sO5gaZcrbB253Eh3h8iKuEi39fqRLzq4/ZmY/Ca38LlQgojxscyeyxlpfFn5UFQiq
	 JiP30c0kf1uLLuzFcIS4O4d7Q4dgr9G5W/ovGHfMykG2m2f7DXZgq6UfuAaF8US6s5F5b
	 FWqsmL31dXBuvyIpLbBJG0go3Y4IThjzR79U5hnq1+TIxrnb5/n5flf9tT/boI0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1773960307;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=hHOjDr+0CnsgdbkpKX8Vpudx1cC5wcHD2f6BIWZWn14=;
	b=NvJSQ4FnKLYVtALvqUh3DPr8Nm0DiEKK2FgTba6zCfQb42UyrDPJsr1+gk75AGkTdcoK
	 StYQyTLsyWIBw7XjSvgEv5GgC36KKXq+pItVFOtR358r5thqKg4qJF4bfOTOSkriMbtCb
	 Ou9z1PW8NP0zFj0xkoReWpw4L/5CaZjaZkCo1+r1omfIt0T5Uj35A+0XwBbHCEysEq0Pz
	 eh1FcH+o2VBWsDn++Jd+kCJsvHqIFUIo9mS+qAtJNp+6Bu0kfxBDUMFZr2j98mDFAUAPk
	 7xa3TZLAcJgSIUnjL86qFOxtrtZX0+/UrnbJEgFlgcRHKFBLX64Gb/CGMWck1MvdTaFUK
	 fXyO152SRDQ0JuIONtikrU82wtAxlmho8lyLybu/urDnO9avdPNHzu+Bhp+s63fAM2Y6D
	 oGXjzmU1KT0aoXVyOz2ov/6oPbJZpCVv5A8pNuJeYf63KAf3vpOYhyn1scTzCaRnt3ojI
	 2T1K59q2w+k6AeBrh5hc3leq69sdIeH/oC05KshrTPnWTOX38saVYgx3kLCDFaXcdsy5W
	 d90kKM74ki209YGREGYIx0W3+m68T6toVDYbtPxe55pMJT50ClqJprZCP45XXly2HPtMV
	 umNBsWy+y9OMQL5nAULCIvAx2X8gjvB3xtcDGQ0sKN4/9Nh+93AzVAHnIONpClY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 19 Mar 2026 23:45:07 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
 <michal.orzel@amd.com>
Subject: Re: [PATCH] arm/tee: rename variable to address MISRA C Rule 5.3
In-Reply-To: <e7fd1f75146e7faa520414c4ffc1bd9572914039.1773951370.git.dmytro_prokopchuk1@epam.com>
References: <e7fd1f75146e7faa520414c4ffc1bd9572914039.1773951370.git.dmytro_prokopchuk1@epam.com>
Message-ID: <0da4df5923796172a0e38fc2e890a556@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-03-19 21:16, Dmytro Prokopchuk1 wrote:
> The local variable 'ffa_vm_count' shadows the global variable, declared
> in 'xen/arch/arm/tee/ffa_private.h', therefore it is renamed
> 'ffa_vm2vm_count'.
> 
> No functional change.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

minor nit: it could be useful to add a link to a successful CI pipeline 
for more complex cases

> ---
>  xen/arch/arm/tee/ffa_partinfo.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c 
> b/xen/arch/arm/tee/ffa_partinfo.c
> index fdb03dae9a..473507ca3a 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -265,7 +265,7 @@ void ffa_handle_partition_info_get(struct 
> cpu_user_regs *regs)
>      uint32_t dst_size = 0;
>      size_t buf_size;
>      void *dst_buf, *end_buf;
> -    uint32_t ffa_vm_count = 0, ffa_sp_count = 0;
> +    uint32_t ffa_vm2vm_count = 0, ffa_sp_count = 0;
> 
>      ffa_uuid_set(&uuid,
>               get_user_reg(regs, 1),
> @@ -310,7 +310,7 @@ void ffa_handle_partition_info_get(struct 
> cpu_user_regs *regs)
>           */
>          if ( ffa_uuid_is_nil(uuid) )
>          {
> -            ffa_vm_count = get_ffa_vm_count();
> +            ffa_vm2vm_count = get_ffa_vm_count();
> 
>              /*
>               * Workaround for Linux FF-A Driver not accepting to have 
> its own
> @@ -320,7 +320,7 @@ void ffa_handle_partition_info_get(struct 
> cpu_user_regs *regs)
>               * the requester endpoint information should be included 
> or not
>               */
>              if ( ACCESS_ONCE(ctx->guest_vers) < FFA_VERSION_1_2 )
> -                ffa_vm_count -= 1;
> +                ffa_vm2vm_count -= 1;
>          }
> 
>          goto out;
> @@ -355,7 +355,7 @@ void ffa_handle_partition_info_get(struct 
> cpu_user_regs *regs)
>              goto out_rx_release;
>      }
> 
> -    ret = ffa_get_vm_partinfo(uuid, &ffa_vm_count, &dst_buf, end_buf,
> +    ret = ffa_get_vm_partinfo(uuid, &ffa_vm2vm_count, &dst_buf, 
> end_buf,
>                                dst_size);
> 
>  out_rx_release:
> @@ -370,7 +370,7 @@ out:
>          if ( flags || ACCESS_ONCE(ctx->guest_vers) == FFA_VERSION_1_0 
> )
>              dst_size = 0;
> 
> -        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, 
> dst_size);
> +        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm2vm_count, 
> dst_size);
>      }
>  }

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

