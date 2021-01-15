Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A183BC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 01:12:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 474402137B
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 01:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 474402137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67579.120712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0DfJ-0005Lr-V1; Fri, 15 Jan 2021 01:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67579.120712; Fri, 15 Jan 2021 01:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0DfJ-0005Lk-Ri; Fri, 15 Jan 2021 01:12:37 +0000
Received: by outflank-mailman (input) for mailman id 67579;
 Fri, 15 Jan 2021 01:12:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yB8v=GS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l0DfH-0005Lf-Um
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 01:12:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7631739-101b-497e-808a-40d110ee3ed3;
 Fri, 15 Jan 2021 01:12:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48A022137B;
 Fri, 15 Jan 2021 01:12:33 +0000 (UTC)
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
X-Inumbo-ID: a7631739-101b-497e-808a-40d110ee3ed3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610673153;
	bh=/fe2pdnGE2+zvh8NIAEgdZBNYJbLuspsDBxtziH1TTY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N+WIKQgDs28/lEeOwafIIjPlpZNbQ+rQLNgBaSvPxVOTyggWK9KK2lsfAuxaNrPGU
	 As0QMctyVLhI9qTngMUX3D4lwz3FDw1cn3EzS9/zaNgPexpfcnX2Ge5QQjq8qA8JhR
	 0F84aVdQ1PXRFELhwOfBxK2bth2XYw5tgM/+Mtb4+JnvKkHc/kb8eIXqMHFBapUpX5
	 MoMfSmwjY6oyCSjA8TXspBfjtxCiQuMhWUQgsGlUwltmzUvPe6fSlkyNArOZfEaegw
	 pONjCeoHu4C15i5o1WqiUzVC/72Jlh4QypVUF7J0A9zMG+Ih/rC+ea9eSO/dGf5y0x
	 xS7gtDi0Roa4w==
Date: Thu, 14 Jan 2021 17:12:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V4 15/24] xen/arm: Stick around in leave_hypervisor_to_guest
 until I/O has completed
In-Reply-To: <1610488352-18494-16-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2101141711520.31265@sstabellini-ThinkPad-T480s>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-16-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Jan 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch adds proper handling of return value of
> vcpu_ioreq_handle_completion() which involves using a loop in
> leave_hypervisor_to_guest().
> 
> The reason to use an unbounded loop here is the fact that vCPU shouldn't
> continue until the I/O has completed.
> 
> The IOREQ code is using wait_on_xen_event_channel(). Yet, this can
> still "exit" early if an event has been received. But this doesn't mean
> the I/O has completed (in can be just a spurious wake-up). So we need
> to check if the I/O has completed and wait again if it hasn't (we will
> block the vCPU again until an event is received). This loop makes sure
> that all the vCPU works are done before we return to the guest.
> 
> The call chain below:
> check_for_vcpu_work -> vcpu_ioreq_handle_completion -> wait_for_io ->
> wait_on_xen_event_channel
> 
> The worse that can happen here if the vCPU will never run again
> (the I/O will never complete). But, in Xen case, if the I/O never
> completes then it most likely means that something went horribly
> wrong with the Device Emulator. And it is most likely not safe
> to continue. So letting the vCPU to spin forever if the I/O never
> completes is a safer action than letting it continue and leaving
> the guest in unclear state and is the best what we can do for now.
> 
> Please note, using this loop we will not spin forever on a pCPU,
> preventing any other vCPUs from being scheduled. At every loop
> we will call check_for_pcpu_work() that will process pending
> softirqs. In case of failure, the guest will crash and the vCPU
> will be unscheduled. In normal case, if the rescheduling is necessary
> (might be set by a timer or by a caller in check_for_vcpu_work(),
> where wait_for_io() is a preemption point) the vCPU will be rescheduled
> to give place to someone else.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes V1 -> V2:
>    - new patch, changes were derived from (+ new explanation):
>      arm/ioreq: Introduce arch specific bits for IOREQ/DM features
> 
> Changes V2 -> V3:
>    - update patch description
> 
> Changes V3 -> V4:
>    - update patch description and comment in code
> ---
>  xen/arch/arm/traps.c | 38 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 036b13f..4a83e1e 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2257,18 +2257,23 @@ static void check_for_pcpu_work(void)
>   * Process pending work for the vCPU. Any call should be fast or
>   * implement preemption.
>   */
> -static void check_for_vcpu_work(void)
> +static bool check_for_vcpu_work(void)
>  {
>      struct vcpu *v = current;
>  
>  #ifdef CONFIG_IOREQ_SERVER
> +    bool handled;
> +
>      local_irq_enable();
> -    vcpu_ioreq_handle_completion(v);
> +    handled = vcpu_ioreq_handle_completion(v);
>      local_irq_disable();
> +
> +    if ( !handled )
> +        return true;
>  #endif
>  
>      if ( likely(!v->arch.need_flush_to_ram) )
> -        return;
> +        return false;
>  
>      /*
>       * Give a chance for the pCPU to process work before handling the vCPU
> @@ -2279,6 +2284,8 @@ static void check_for_vcpu_work(void)
>      local_irq_enable();
>      p2m_flush_vm(v);
>      local_irq_disable();
> +
> +    return false;
>  }
>  
>  /*
> @@ -2291,8 +2298,29 @@ void leave_hypervisor_to_guest(void)
>  {
>      local_irq_disable();
>  
> -    check_for_vcpu_work();
> -    check_for_pcpu_work();
> +    /*
> +     * The reason to use an unbounded loop here is the fact that vCPU
> +     * shouldn't continue until the I/O has completed.
> +     *
> +     * The worse that can happen here if the vCPU will never run again
> +     * (the I/O will never complete). But, in Xen case, if the I/O never
> +     * completes then it most likely means that something went horribly
> +     * wrong with the Device Emulator. And it is most likely not safe
> +     * to continue. So letting the vCPU to spin forever if the I/O never
> +     * completes is a safer action than letting it continue and leaving
> +     * the guest in unclear state and is the best what we can do for now.
> +     *
> +     * Please note, using this loop we will not spin forever on a pCPU,
> +     * preventing any other vCPUs from being scheduled. At every loop
> +     * we will call check_for_pcpu_work() that will process pending
> +     * softirqs. In case of failure, the guest will crash and the vCPU
> +     * will be unscheduled. In normal case, if the rescheduling is necessary
> +     * (might be set by a timer or by a caller in check_for_vcpu_work(),
> +     * the vCPU will be rescheduled to give place to someone else.
> +     */
> +    do {
> +        check_for_pcpu_work();
> +    } while ( check_for_vcpu_work() );
>  
>      vgic_sync_to_lrs();
>  
> -- 
> 2.7.4
> 

