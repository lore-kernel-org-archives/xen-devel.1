Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C958CA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 05:46:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441978.1659513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEKTA-0001Z3-RQ; Wed, 07 Oct 2026 05:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441978.1659513; Wed, 07 Oct 2026 05:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEKTA-0001Ys-MK; Wed, 07 Oct 2026 05:45:36 +0000
Received: by outflank-mailman (input) for mailman id 1441978;
 Wed, 07 Oct 2026 05:45:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xEKT9-0001Ym-2b
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 05:45:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEKT7-00CRx5-Ob
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 07:45:33 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ac5dc6e-bab6-0a2a0a5309dd-0a2a450b98d2-14
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 07:45:33 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ac5dc7d-b7e8-0a2a450b0019-a237832facce-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 07:45:33 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 3BB144EE01FB;
 Wed,  7 Oct 2026 07:45:33 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1791351933;
	b=w/3JMW86rJQTwqW4oeDBjWstPixHRYuIM9LP41wdGCu/5nz0m4nl8RxOMDfApxFtFpFP
	 lgtBdOOB32nECFJv9O6GT8nBW0QbP52hrkmIYk/P9NyHO4M8BCB/9Arz68vWdJhbs+9Mc
	 +w51kxT0claRQwc07LHDla+Yst6WS4xRWB5s18MmZ1/pNjMSIqXwZ0x4CtOlNjSwAqtdR
	 hgUk7iIF1Jjtfepfpj6C81lpTSHKC0WK7N4easmphtlc7q2nOVj6kj7B7N/aE3tGigBY9
	 UKu7a7gFH2w6y6kLilh7uR4kLK7LHO5RM37OrrlQ4fZP5NPH5lKNwqFRa51u9NTQzfIvE
	 0Ee80zFSmtulmSrHBbmOxDuFHIT6xOnh1EaDblVU4QcLE0LEIz0b+z6HD6TubKuae7RyW
	 kpvbigsB5jLXVvpVBy16tDJAnqIr568PlB0tqHc4YausNf+BEI6cTENh91iKkMrpgmRJh
	 I5ZNthbwG2/BboC8NXKCP7yeUPxNU0w/CTFPXPLu3lGaTnajj92CdH0YQISbz7akOBGJe
	 HFZYHiYkssNkMNy1dgtL820Op7iPZN6L7TKEsRvJAMHK1JkjpHJTBQPXDs5tkCu8lDq4d
	 hiy+uXyIDJjH/RWrspqWSn4mMWM7nyMPEujZbjLGlqwKrXBiGx83jDOP0/tpuA0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791351933;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=rex59e9VM4dDveOiR19eBUpIma2cN/MESd8hU5/XKJ4=;
	b=V4bjuhFq99hWEKt91JsYE2pGVH9G27rCG1m5avxGpoc8+8XfnzmQL0FO6qDl9rNNTZrF
	 KZtZglwV6EtMV7lFizV0SrSKeCQU0gmUGZymz5ZBTMo7u4JwfW0FrbfzwdkARecS7yTCE
	 z96J/vZ0TUnzD5UIwIntvmR8qU0icWgDX4TCrf5HNBSa7lhKo3nT1hunFfkjh87PhOjpK
	 eYOjkUldk3VBoijbsQV3+S+IlXhew/xbROfa+l1PmDS8mCdh6RXdIChYHxehtPcpWvagk
	 n162llBFPZ2i3709UJhqoMAIDjN1c0yPBtT6AHb5WTfGZU47Oadu3U/PENWUqHQ3QRCsn
	 Muq93gBzPsf4WqvDvzjKfnW9quuvH0bT4CMBIob8ho+v+3ASZyxTHc1glzS4ks4M5DL5D
	 VURa6JLN7KcTRVcinc0cIxSlGME2NfXGoUPsvlK5Y/Ygbn41IuR/idtkESMejGVkE4hGF
	 MTYXrGAJfJkavlFiWoP0O7vjJaTfnITXaVDtY3rVugWk/cdNyQzTamAbojJHmag1hc9py
	 mkek5g/axnwCMiHrirmT1PXHMFTx0udc+gUVitTgm5xVcnWwWFBqZd0qH3Djmc3wXawgT
	 ovESTxF3B13kzcFLoITh5DVP2hkh/ATZEOKnvEnbY0/maG/xrnFios5adkWnOVw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 07 Oct 2026 07:45:33 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Eclair: scan the last xen-syms linking pass on Arm
In-Reply-To: <8d3b26df-a42a-4d34-bc6c-81ed26839006@epam.com>
References: <2f67ef7c4593d3ab94b75b5b819e7e046e055796.1791293680.git.dmytro_prokopchuk1@epam.com>
 <03338d69-cbde-4918-8ffd-c309230d337f@suse.com>
 <8d3b26df-a42a-4d34-bc6c-81ed26839006@epam.com>
Message-ID: <22ed9e39767c74e820e964acc2e32a32@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791351933-182F49EA-489EDD47/0/0
X-purgate-type: clean
X-purgate-size: 2867

On 2026-10-06 18:09, Dmytro Prokopchuk1 wrote:
> On 10/6/26 18:03, Jan Beulich wrote:
>> On 06.10.2026 16:23, Dmytro Prokopchuk1 wrote:
>>> Hiding .xen-syms.[013] assumed the almost-final image is always pass 
>>> 2.
>>> On x86 LAST_LINKING_PASS is 2, so .xen-syms.2 stays visible. On Arm
>>> LAST_LINKING_PASS is 3 and the final image is .xen-syms.3, which was
>>> hidden. Pass 2 is usually only a symlink, so Eclair saw no program 
>>> link
>>> and reported every translation unit as unreachable.
>> 
>> When I did that work, rule 2.1 ended up clean for both ARM64-* 
>> analysis
>> jobs (iirc). Upon re-checking I now see that ARM64-amd has 177 
>> violations
>> (apparently that's what you talk about above), but ARM64-allcode has 
>> none
>> (https://gitlab.com/xen-project/hardware/xen/-/pipelines/2916569232).
>> 
>>> Stop hiding pass 3. Passes 0 and 1 remain excluded.
>> 
>> This will cause scanning of both passes 2 and 3, i.e. consume more 
>> time
>> and report duplicate violations when both passes are real linking 
>> steps.
>> I think we want to be smarter than that, to really scan exactly once. 
>> I
>> don't have a good idea just yet how to achieve that, though (and I was
>> wondering already when putting together the original patch).
>> 
>> Jan
> 
> Hmm
> 
> At the moment
> (https://gitlab.com/xen-project/hardware/xen/-/pipelines/2917375773) I
> see ARM64 R2.1 violations:
> - 177 in AMD
> - 249 in allcode
> 
> Anyway, we can have if-else like this (copied from
> automation/eclair_analysis/ECLAIR/tagging.ecl):
> 
> -setq=target,getenv("XEN_TARGET_ARCH")
> if(string_equal(target,"x86_64"),
>      file_tag+({"xen_syms_tmp", "^xen/\\.xen-syms\\.[013]$"}),
>      if(string_equal(target,"arm64"),
>          file_tag+({"xen_syms_tmp", "^xen/\\.xen-syms\\.[012]$"})
>      )
> )
> 
> ^^^ test pipeline is here:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2918571749
> 
> BR, Dmytro.

In theory we could even generate a configuration file on the fly just 
before invoking make. See e.g. [1] and [2]. In this way, we can 
determine programmatically which is the linking step to consider, since 
the logic involves some conditionals in the Makefile rules. In any case 
intercepting one more command that is just a symlink does not incur in a 
big cost: only if the intercepted step is another linking command ~5 
more minutes are needed.

[1] 
https://gitlab.com/xen-project/hardware/xen/-/blob/staging/automation/eclair_analysis/ECLAIR/generate_ecl.sh?ref_type=heads
[2] 
https://gitlab.com/xen-project/hardware/xen/-/blob/staging/automation/eclair_analysis/ECLAIR/generate-linker-symbols.sh?ref_type=heads


-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

