Return-Path: <SRS0=ydFR=D6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1635AC388F9
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 10:02:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F35207BB
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 10:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="URzPz2Sc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85F35207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10820.28871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVtu7-0007da-UZ; Fri, 23 Oct 2020 10:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10820.28871; Fri, 23 Oct 2020 10:02:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVtu7-0007dT-RX; Fri, 23 Oct 2020 10:02:35 +0000
Received: by outflank-mailman (input) for mailman id 10820;
 Fri, 23 Oct 2020 10:02:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVtu6-0007dO-Rm
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:02:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ad01d1d-e56c-4cd4-bc6b-f9c957a67499;
 Fri, 23 Oct 2020 10:02:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B2BCB308;
 Fri, 23 Oct 2020 10:02:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVtu6-0007dO-Rm
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:02:34 +0000
X-Inumbo-ID: 7ad01d1d-e56c-4cd4-bc6b-f9c957a67499
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7ad01d1d-e56c-4cd4-bc6b-f9c957a67499;
	Fri, 23 Oct 2020 10:02:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603447353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UiAwWQwxjwUyDse6kU5DAOIaLAbcxiGZF8selFBQ4vw=;
	b=URzPz2Sc7ROqNLbWsnONq+3DrLpXeWOm74LGrOhBKu/Ml6n86zsmjLwEc4dJndhtadNI6k
	GvqX1gZdcAXxgMrE9v62a+5dtshpMzIO6+Bn+L0EJO9RTigL2kS3OGp8rA7s+oeQGWW3ZA
	MdZjlvNUnPrAKRNmNZdTM6hv2iFJR8E=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4B2BCB308;
	Fri, 23 Oct 2020 10:02:33 +0000 (UTC)
Subject: Re: [PATCH v2 11/14] kernel-doc: public/version.h
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, ian.jackson@eu.citrix.com, julien@xen.org,
 wl@xen.org, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
 <20201021000011.15351-11-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0ef4e16-eba2-1cdf-fc75-4181c12fb746@suse.com>
Date: Fri, 23 Oct 2020 12:02:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201021000011.15351-11-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.10.2020 02:00, Stefano Stabellini wrote:
> --- a/xen/include/public/version.h
> +++ b/xen/include/public/version.h
> @@ -30,19 +30,32 @@
>  
>  #include "xen.h"
>  
> -/* NB. All ops return zero on success, except XENVER_{version,pagesize}
> - * XENVER_{version,pagesize,build_id} */
> +/**
> + * DOC: XENVER_*
> + *
> + * NB. All ops return zero on success, except for:
> + *
> + * - XENVER_{version,pagesize,build_id}
> + */
>  
> -/* arg == NULL; returns major:minor (16:16). */
> +/**
> + * DOC: XENVER_version
> + * @arg == NULL; returns major:minor (16:16).
> + */
>  #define XENVER_version      0
>  
> -/* arg == xen_extraversion_t. */
> +/**
> + * DOC: XENVER_extraversion
> + * @arg == xen_extraversion_t.
> + */
>  #define XENVER_extraversion 1
>  typedef char xen_extraversion_t[16];
>  #define XEN_EXTRAVERSION_LEN (sizeof(xen_extraversion_t))
>  
> -/* arg == xen_compile_info_t. */
>  #define XENVER_compile_info 2
> +/**
> + * struct xen_compile_info - XENVER_compile_info
> + */

At the example of this one - elsewhere I think I've seen you also
use single-line comments starting with /**. I can accept the choice
of multi-line here, but I think I'd like ./CODING_STYLE to then be
amended to allow such in certain cases.

Jan

