Return-Path: <SRS0=6W/h=IJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38A3C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 14:50:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7982864F3F
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 14:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7982864F3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.96648.183078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMeD-0000Xj-7z; Thu, 11 Mar 2021 14:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96648.183078; Thu, 11 Mar 2021 14:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMeD-0000Xc-44; Thu, 11 Mar 2021 14:50:45 +0000
Received: by outflank-mailman (input) for mailman id 96648;
 Thu, 11 Mar 2021 14:50:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKMeC-0000XX-E5
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:50:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20605d5c-4578-4ac0-afd8-8dfccfa951e7;
 Thu, 11 Mar 2021 14:50:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC4CBAB8C;
 Thu, 11 Mar 2021 14:50:42 +0000 (UTC)
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
X-Inumbo-ID: 20605d5c-4578-4ac0-afd8-8dfccfa951e7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615474242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLrD27xHWuUw+M1XCJMKdmfXk4h795TUzEU6Khx5pNY=;
	b=KrPKXtq5RUp3iGdH37fiq3N6lFR5BYhfcAHPqDphpCvqlwPg/9BEzMr/BC+8awbNXPAFrZ
	s9603s5qmk3AGTJ0WmYAMTwV3/UmsQob+GRZhdLS6Z+P0eH2V/QEfs5mX+i2FU51mVyN1R
	vxXa/KBa6oE2YDPN//ajvzxoqJhk/ZM=
Subject: Re: [PATCH v5] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20210311142207.25556-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <572b503c-6650-a0a7-74d6-f5f3ba076fea@suse.com>
Date: Thu, 11 Mar 2021 15:50:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311142207.25556-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.03.2021 15:22, Michal Orzel wrote:
> Currently in order to link existing DTB into Xen image
> we need to either specify option CONFIG_DTB_FILE on the
> command line or manually add it into .config.
> Add Kconfig entry: CONFIG_DTB_FILE
> to be able to provide the path to DTB we want to embed
> into Xen image. If no path provided - the dtb will not
> be embedded.
> 
> Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
> as it is not needed since Kconfig will define it in a header
> with all the other config options.
> 
> Make a change in the linker script from:
> _sdtb = .;
> to:
> PROVIDE(_sdtb = .);
> to avoid creation of _sdtb if there is no reference to it.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit I think that, as suggested, ...

> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -222,7 +222,7 @@ SECTIONS
>  
>  #ifdef CONFIG_DTB_FILE
>    /* Section for the device tree blob (if any). */
> -  _sdtb = .;
> +  PROVIDE(_sdtb = .);
>    .dtb : { *(.dtb) } :text
>  #endif

.. the now pointless (always true) #ifdef here should also go
away.

Jan

