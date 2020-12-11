Return-Path: <SRS0=Z24W=FP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA30C4167B
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 01:28:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED53023C18
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 01:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED53023C18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.50013.88465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXEc-0005mW-Pt; Fri, 11 Dec 2020 01:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50013.88465; Fri, 11 Dec 2020 01:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXEc-0005mM-Lg; Fri, 11 Dec 2020 01:28:38 +0000
Received: by outflank-mailman (input) for mailman id 50013;
 Fri, 11 Dec 2020 01:28:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKjA=FP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knXEb-0005ll-G3
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 01:28:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a63fc49-f426-436e-ad12-b2bd723b5184;
 Fri, 11 Dec 2020 01:28:36 +0000 (UTC)
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
X-Inumbo-ID: 7a63fc49-f426-436e-ad12-b2bd723b5184
Date: Thu, 10 Dec 2020 17:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607650116;
	bh=IReJJgjVVbTQUD9zyI+ACY5NU11VnkHtglGwXmLG+S8=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=MzT+emg+30a3ZhCokgGEm70iYEMJU2++5HRli9qO3Nt/JEII3PgrfI26xIO66QPsA
	 6LQpU+yiHjAdAD46qty34cqzlcC7kgD5Z4M6RzITRcVTQkWB45le9+igF9C2itmTK1
	 8WW7NGPtwxvEihbvZNNXRmcUTJiohdxt2gJVOEeS0mJ5m38x8mqUXtHEt+OdMQuPG8
	 LFvapPKZYOh5JqzBB5MGF4UURFraMNTLkM0HgubrgDUuDd2fRZBjKUaK1KJD06xTmt
	 GR4PBt8jpyI2K7xTIKeLfHAZ/HjAFBji2IhGatzsSUQQb2aJR1NCNyPLK0UYydCDKr
	 Tq2uM6ebxg/TA==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/8] xen/arm: Remove support for Stage-1 translation
 on SMMUv3.
In-Reply-To: <a5e3509bbc4ce21e0d9d176d7a2984ef40ad0ae3.1607617848.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2012101532110.6285@sstabellini-ThinkPad-T480s>
References: <cover.1607617848.git.rahul.singh@arm.com> <a5e3509bbc4ce21e0d9d176d7a2984ef40ad0ae3.1607617848.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Dec 2020, Rahul Singh wrote:
> @@ -2087,29 +1693,8 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>  	}
>  
>  	/* Restrict the stage to what we can actually support */
> -	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
> -		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
> -	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
> -		smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
> -
> -	switch (smmu_domain->stage) {
> -	case ARM_SMMU_DOMAIN_S1:
> -		ias = (smmu->features & ARM_SMMU_FEAT_VAX) ? 52 : 48;
> -		ias = min_t(unsigned long, ias, VA_BITS);
> -		oas = smmu->ias;
> -		fmt = ARM_64_LPAE_S1;
> -		finalise_stage_fn = arm_smmu_domain_finalise_s1;
> -		break;
> -	case ARM_SMMU_DOMAIN_NESTED:
> -	case ARM_SMMU_DOMAIN_S2:
> -		ias = smmu->ias;
> -		oas = smmu->oas;
> -		fmt = ARM_64_LPAE_S2;
> -		finalise_stage_fn = arm_smmu_domain_finalise_s2;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> +	smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
> +

Last time we agreed on adding an error message?

