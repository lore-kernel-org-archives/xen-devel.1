Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC83606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 16:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naZPLT5D
Received: from list by lists.xenproject.org with outflank-mailman.1475259.1682100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP0dx-0005JX-Fk; Thu, 05 Nov 2026 16:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475259.1682100; Thu, 05 Nov 2026 16:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP0dx-0005JQ-Cr; Thu, 05 Nov 2026 16:48:53 +0000
Received: by outflank-mailman (input) for mailman id 1475259;
 Thu, 05 Nov 2026 16:48:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <visitorckw@gmail.com>) id 1xP0dv-0005I9-Dp
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:48:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP0du-004WML-Qk
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 17:48:50 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6aecb360-bab6-0a2a0a5309dd-0a2a450b8752-28
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 17:48:50 +0100
Received: from [209.85.210.173] (helo=mail-pf1-f173.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6aecb371-b7e8-0a2a450b0019-d155d2ade041-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 17:48:50 +0100
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-8b32bc605d9so79265b3a.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 08:48:50 -0800 (PST)
Received: from google.com ([118.150.148.19]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8b09af918f2sm2233005b3a.23.2026.11.05.08.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 08:48:48 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897329; x=1794502129; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nGgbr1sgl5oeyIRIzBGv/BG59BAeAsA8nAEB42w9jp8=;
        b=naZPLT5DDFyrVVTb2gj2+92Bnr3x0c0Aj6FyjazS2MUz9XfLMVu0EKqH3kNKsV76cc
         aQegxYjtKItB8+++zTV4mV2i7AkSpk4AR5DU1YCdZBd5Whg9X6sY9bs2GjJGnWvJtBiX
         lLYChdhowuUXyZFAKnHIyoYcYLRrl8VMbm0Y21NmZ7cqrybvXe4nCNFCT28sivcAOOXZ
         VGeV+yp0jQ6MpE8J+GPU9+p4tzWoj8a+5sagi43PdMEW2NQNGGCXvPa2EnjjsOVXJjhz
         55DSUCW657aDONoixA0yON269WictujR4za445nTtFWuDnP980UBc+wE/U49PY3RNxLP
         CCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897329; x=1794502129;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGgbr1sgl5oeyIRIzBGv/BG59BAeAsA8nAEB42w9jp8=;
        b=T37nQVHicqKZRaN8unNJDjsHAE1IermffVtwqXomr8e4xNQcsHoXS4Oj1l0+PDQP1S
         0D3bYIL2QJyKWy0Tnj2r3ok3Z6eP9laxNCbV13Q+AI5D4ISR8MxLSEzT6o8SunkG2SR7
         IlgdiJMXG3QttHCaUohsorkpUxHz9LLIHLUmUduZToHCnAzpf/djbeFlaux+HcTv0LS+
         E7AKRmvRxlOGRaBqsQkvC9l0uT5pDBnlnKOuB76/AOhUxSrVD4gFBsBS3WMYtpW++x1b
         if8gwXymLWjLl+pUPPSkDPY9qORCzxA4tpt9QCE7fzmNPUpDNz4H9ZDP+00mti4FkOXk
         SISA==
X-Gm-Message-State: APuU4Z/xw05TOWJvZemmWz/TARjTC6IXsyoIjyMAzXDnlKAcUOglb8Q6
	DiHLpY+7egLqA0X69urB5M4CwjtEXOcvjoocrYEAcEcUdagjA24Kx9Cm
X-Gm-Gg: AYBFou3H5SxZylusqCoxuPhLHjw32SyMbdE6DOhyK2l6e/MkysblbL1zFDJnj6L7VaS
	rEt8uUmf4AKIuWwjql+pazIfgjgtprsiwCbJIJpAXc48kZU/KhuBvfBt832wVvo14DvccIEAUbj
	M34ShfjrkBkloHzHVUeFm8FU+usm2EoWNneGlGcMl7sMCCKmToQtqPBPlb88pHzyiN3z1rxrlg7
	in0NtX87OkPEJNLmnGwldyOGtxowpBfonUAe6XwtR3uJgCNTebCQOsa2Op6AZ61ZRhRLG3HmhRf
	lLpzXoWgvKiS2CEjQMoZhDm8my5YaZBaivyzHrBZQrweV9onvEm3nZSME+im4ueAlAph/FNiybm
	vO0WJVDopG+sJ28VwJUrWCp4ECF5J2oPxVA3pH1juSNRGjfMtQrI/k36KtIap3oUCWcjLCf5/8H
	zsOC/Ov6IEc/bP0/a0NbtucWYP+dKpg3yzQ8ePtj2KBUJtA7LbNNxYvRompxztBq16Vt/oLJfhl
	NZ2ZFyakHnGgK1yJAq4DrhVzJspmNUOKfMxJJw4g/6QbRN9ccXe3jhWizQVkJtN5DcJIzW/80FN
	swQCDcT8xVfC2FbeFrZGq65fmDOd
X-Received: by 2002:a05:6a00:4148:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8a9ba7039admr17093163b3a.2.1793897328565;
        Thu, 05 Nov 2026 08:48:48 -0800 (PST)
Date: Fri, 6 Nov 2026 00:48:44 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
	bertrand.marquis@arm.com, marscheng@google.com,
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com
Subject: Re: [PATCH] xen/dt: Skip non-RAM reserved-memory regions in
 make_memory_node()
Message-ID: <auyzbMaKb2_Oul4V@google.com>
References: <20261028211737.17629-1-visitorckw@gmail.com>
 <10bc93f8-5ac4-4804-864e-d83a5fbf7108@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10bc93f8-5ac4-4804-864e-d83a5fbf7108@amd.com>
X-purgate-ID: tlsNG-42698a/1793897330-188C99EA-C66FF9E6/0/0
X-purgate-type: clean
X-purgate-size: 4721
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michal,

On Mon, Nov 02, 2026 at 02:02:20PM +0100, Orzel, Michal wrote:
> 
> 
> On 28-Oct-26 22:17, Kuan-Wei Chiu wrote:
> > Xen creates a second /memory node for Dom0 from
> > bootinfo_get_reserved_mem() without checking whether those regions
> > belong to host RAM. However, /reserved-memory can also describe
> > on-chip SRAM or firmware regions outside system RAM. Listing them in a
> > /memory node causes Dom0 to register non-RAM addresses as system RAM,
> > conflicting with device MMIO mappings.
> It's worth adding a reference to Linux binding for nvmem-rmem as an example (the
> only one so far?) of /reserved-memory describing non RAM. Please also mention
> Linux comment at early_init_dt_reserve_memory().

Ack.

> 
> > 
> > Skip reserved-memory banks outside the host RAM banks reported by
> > bootinfo_get_mem() in make_memory_node().
> Have you considered EFI boot? There we don't use /memory and bootinfo_get_mem()
> contains usable memory. IOW I think it does not contain reserved memory. In such
> scenario, we would skip the reserved regions because they are not described in
> memory membank. So it would be a regression in behavior.
> 

I'm not quite familiar with EFI, so I indeed didn't consider the EFI
boot scenario in the first place. I think I should skip the
is_in_host_ram() check when efi_enabled(EFI_BOOT)?

> > 
> > Fixes: 248faa637d2f ("xen/arm: add reserved-memory regions to the dom0 memory node")
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > Found while trying to bring up Xen on new hardware.
> > Tested on real silicon.
> > 
> >  xen/common/device-tree/domain-build.c | 42 +++++++++++++++++++++++++--
> >  1 file changed, 39 insertions(+), 3 deletions(-)
> > 
> > diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> > index 30a59abfa7..33baf150a6 100644
> > --- a/xen/common/device-tree/domain-build.c
> > +++ b/xen/common/device-tree/domain-build.c
> > @@ -504,6 +504,34 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
> >      return res;
> >  }
> >  
> > +static bool __init is_in_host_ram(const struct membank *bank)
> > +{
> > +    const struct membanks *ram = bootinfo_get_mem();
> > +    paddr_t start = bank->start;
> > +    paddr_t end = start + bank->size;
> > +    unsigned int i;
> > +
> > +    if ( !bank->size || end < start )
> You can omit the empty check. Empty banks are not added to membanks.

Ack.

> 
> > +        return false;
> > +
> > +    for ( i = 0; i < ram->nr_banks; i++ )
> > +    {
> > +        paddr_t ram_start = ram->bank[i].start;
> > +        paddr_t ram_end = ram_start + ram->bank[i].size;
> > +
> > +        if ( start < ram_start )
> > +            return false;
> > +
> > +        if ( end <= ram_end )
> > +            return true;
> > +
> > +        if ( start < ram_end )
> > +            start = ram_end;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> >  int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
> >                              int sizecells, const struct membanks *mem)
> >  {
> > @@ -513,14 +541,20 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
> >      int nr_cells = 0;
> >      __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
> >      __be32 *cells;
> > +    bool is_resv = (mem == bootinfo_get_reserved_mem());
> >  
> >      if ( mem->nr_banks == 0 )
> >          return -ENOENT;
> >  
> >      /* find the first memory range that is reserved for device (or firmware) */
> > -    for ( i = 0; i < mem->nr_banks &&
> > -                 (mem->bank[i].type != MEMBANK_DEFAULT); i++ )
> > -        ;
> > +    for ( i = 0; i < mem->nr_banks; i++ )
> > +    {
> > +        if ( mem->bank[i].type != MEMBANK_DEFAULT )
> > +            continue;
> > +        if ( is_resv && !is_in_host_ram(&mem->bank[i]) )
> > +            continue;
> This filter (MEMBANK_DEFAULT and your check) is now duplicated in two places.
> Please add a helper for it. Also adjust the now stale comment.
> 

Ack.

Regards,
Kuan-Wei

> > +        break;
> > +    }
> >  
> >      if ( i == mem->nr_banks )
> >          return 0;
> > @@ -544,6 +578,8 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
> >          if ( (mem->bank[i].type == MEMBANK_STATIC_DOMAIN) ||
> >               (mem->bank[i].type == MEMBANK_FDT_RESVMEM) )
> >              continue;
> > +        if ( is_resv && !is_in_host_ram(&mem->bank[i]) )
> > +            continue;
> >  
> >          nr_cells += reg_size;
> >          BUG_ON(nr_cells > ARRAY_SIZE(reg));
> 
> ~Michal
> 

