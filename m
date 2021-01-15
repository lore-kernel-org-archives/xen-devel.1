Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38657C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 01:49:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFC6123A58
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 01:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFC6123A58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67609.120784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0EEU-0000fr-4n; Fri, 15 Jan 2021 01:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67609.120784; Fri, 15 Jan 2021 01:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0EEU-0000fk-1k; Fri, 15 Jan 2021 01:48:58 +0000
Received: by outflank-mailman (input) for mailman id 67609;
 Fri, 15 Jan 2021 01:48:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yB8v=GS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l0EES-0000ff-GS
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 01:48:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bc57145-ae7f-4fe8-a9de-4cf0bf8d0c55;
 Fri, 15 Jan 2021 01:48:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C45CB23A58;
 Fri, 15 Jan 2021 01:48:54 +0000 (UTC)
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
X-Inumbo-ID: 9bc57145-ae7f-4fe8-a9de-4cf0bf8d0c55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610675335;
	bh=Bmhf4XKGdFvBIGm0mhZqOTH27HcE6rDVlCQAx6RKq8Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PFcRyyaigni3YyVqjXI+t0coiMqTvRRxDrMv79lfDXuta4mGgTz85ysjYXg7BAfLu
	 RfVFi6gGCFipkmR9Cg27C8px2H1lnGMZ/iczUnlkHdc5cqR4QlSHsCs4tJZbJ4/epu
	 hz3iqeWJA+/yi+KlWcK2IwEPx5OApje9PSiAYcq6O4b46BK1KoVt2P/In4d67PaNaq
	 2uNHcolz9j8p4W4dQgv5JMszIRZvByUeMVjAIWNxl5LjKtr+NuxRC5EGNyn/6khz4g
	 jOKmOwJAZHqnV6Ysd5sbfe8NPWcu4zJdYdAptBw9K5Wfu5/zbi9IRQvLAOuyP+X4iv
	 doxgfVn7R6M3Q==
Date: Thu, 14 Jan 2021 17:48:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V4 20/24] xen/arm: io: Harden sign extension check
In-Reply-To: <1610488352-18494-21-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2101141748160.31265@sstabellini-ThinkPad-T480s>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-21-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Jan 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> In the ideal world we would never get an undefined behavior when
> propagating the sign bit since that bit can only be set for access
> size smaller than the register size (i.e byte/half-word for aarch32,
> byte/half-word/word for aarch64).
> 
> In the real world we need to care for *possible* hardware bug such as
> advertising a sign extension for either 64-bit (or 32-bit) on Arm64
> (resp. Arm32).
> 
> So harden a bit more the code to prevent undefined behavior when
> propagating the sign bit in case of buggy hardware.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes V3 -> V4:
>    - new patch
> ---
>  xen/include/asm-arm/traps.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
> index e301c44..992d537 100644
> --- a/xen/include/asm-arm/traps.h
> +++ b/xen/include/asm-arm/traps.h
> @@ -93,7 +93,8 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>       * Note that we expect the read handler to have zeroed the bits
>       * outside the requested access size.
>       */
> -    if ( dabt.sign && (r & (1UL << (size - 1))) )
> +    if ( dabt.sign && (size < sizeof(register_t) * 8) &&
> +         (r & (1UL << (size - 1))) )
>      {
>          /*
>           * We are relying on register_t using the same as
> -- 
> 2.7.4
> 

