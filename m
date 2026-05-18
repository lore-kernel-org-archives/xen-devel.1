Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453A0CD4F4A
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2026 14:36:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1311957.1582081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOz4d-0000NP-7Q; Mon, 18 May 2026 14:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311957.1582081; Mon, 18 May 2026 14:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOz4d-0000NI-4s; Mon, 18 May 2026 14:36:03 +0000
Received: by outflank-mailman (input) for mailman id 1311957;
 Mon, 18 May 2026 14:36:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wOz4b-0000Mt-78
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 14:36:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOz4a-0014ju-90
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:36:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0b23d0-bab6-0a2a0a5309dd-0a2a450b95f6-0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:36:00 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0b23d0-212f-0a2a450b0019-a237832faa16-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:36:00 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id F25944EE3C71;
 Mon, 18 May 2026 16:35:59 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1779114960;
	b=mBVM5EVKupG5nuvs6O2D3qHJGff4FZm2LKTSBzFho6I0/eqV3dEiVmqkL4Ne9w9EWfxJ
	 RGKgZKtzH1baJTtfMikZMjYns+dxe7g8XAyZSpEWLjlQeuTtkaIBlkE2E1gIW4gJBGeN+
	 XR8mURFsR/+bJIExSJXkSBlJ2oAMMaZU41oTC8rgXYRBBzcdZtcd+L4tpVMmbr1WezKbF
	 5KigB2RAicQaBTVv3s+E8mwxNzeeEjFP+cAT9+fYVboD6lijbqbiHVvmGX83NYCeNtzjO
	 eD5PmsgY/ZcknMUYOJdBAPAO4WUeAALPZD6A/7VBHA/5+yNjq11VTsdvX3XJ++u/ldlhW
	 yd1EHuyeAovCuo+6aghhXAhVom5+9EGPEfulf2Pm5HtiCAVZPv8l9jbzIOiDtDZKgaZxk
	 eSBI0vPxA9Z4FB3mZYA4V9lgUeVH2vKvBabByvHOqDnEmF6sdyvx63YNnPA+/IWcT6Vt2
	 F7+m5PlFAFyNkVMHy0LXlVQjYpLBfrBOm1GRnqKaMrwU6Mo0ZX5E4AVmCAgVyjMaDFtli
	 SxvigNrnJRbZSwJ4+2eoYFiJXrNPH9AMfFq4Tnsr2QCLGngAWClM9iFx+KGtHGM9GZ2I+
	 qdYDby6/iGn1e/2wf2eT7zoVS+fFp7qZrcxaWhjavl3JOXDY80iXEcyTNY2P+Iw=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1779114960;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=5kvEkR+x1Zrs5LIJVh7DFk9j7lKLX5Qk/Ynk9sx/Yr8=;
	b=qJF95nK1lyw3CCtxA5XxlNHQHiAMsG5wTfy62HI10HtqyYpjA1t/bAegUF86yhfw3vD2
	 Ky6x3Lw2Zenb+okYHaaNTTSXkIWHRoifeOnt5beVPlRR93UIZEEMk1k+XrNmdyFgQ4spE
	 2da/DAsTUIvkSPYpQaKpCsTstZjoGBLOB1jNoxzzTSKNoyuCQ5lXoG5oXEdnnCE7knCEt
	 Gef9egb6pbnT1YZPoi9dfI2QL9hR/Tfg3nSoF7meNz7vMNZt5OLiq1IPFGW6iDu768sYm
	 2IoEV+nTgDAqoSkr1Ec3ufk+rWQtpAZ8KJsYPSo6S1xwwYHEnBt019rIsQvBuMMkmidNj
	 K4ItOEnTvufsDPG1zDD1Z6h8gTIaw/qD1WfcgL8IkayFlas7O1v1Gk6cpv614SLdkbjOe
	 HXuWELdBqGLIThbENmVeO7sBzwqtxbyoNNpswyBJeGMxCCFQz3RLSJp5i46pip/gisJLj
	 5kdTpPDHAis8FyvB2sIgo69csaN6nqpif5bOLlfeM6TGPP9+hq0v8eeHygWPkTUYLL3aH
	 mexYchmXLk6lXl3R284RhLKydCUMMnBALV0Dp7W9yHZXr8i9Sz87S/VjnYpgv3xCVcmHk
	 +bfNdmviC+73z07rOkMNpYjhEMdWF8ghv5IiZ1/MUjt+eX27hqSZ90B5s0YROTE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Mon, 18 May 2026 16:35:59 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2] x86/MCE: adjust ID2COOKIE() for Misra C:2012 rule 11.2
In-Reply-To: <ad17d551-139b-4edb-b820-6ab12a4d70fe@suse.com>
References: <ad17d551-139b-4edb-b820-6ab12a4d70fe@suse.com>
Message-ID: <0f3b4071c849c17b1150eeb3fa084639@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1779114960-12B70F3B-966F51F7/0/0
X-purgate-type: clean
X-purgate-size: 946

On 2026-05-18 11:51, Jan Beulich wrote:
> ... ("Conversions shall not be performed between a pointer to an
> incomplete type and any other type"): Add an intermediate cast to
> unsigned long.
> 

Stale comment I presume.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> v2: Add comment.
> 
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -1264,7 +1264,8 @@ static void cf_check __maybe_unused x86_
> 
>  #if BITS_PER_LONG == 64
> 
> -#define ID2COOKIE(id) ((mctelem_cookie_t)(id))
> +/* Two layers of casting to cover Misra C:2012 rule 11.2. */
> +#define ID2COOKIE(id) ((mctelem_cookie_t)(void *)(id))
>  #define COOKIE2ID(c) ((uint64_t)(c))
> 
>  #elif defined(BITS_PER_LONG)

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

