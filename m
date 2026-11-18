Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B3D606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 17:32:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1494973.1694208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjVt-000822-MG; Wed, 18 Nov 2026 17:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494973.1694208; Wed, 18 Nov 2026 17:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjVt-00081v-Ii; Wed, 18 Nov 2026 17:32:05 +0000
Received: by outflank-mailman (input) for mailman id 1494973;
 Wed, 18 Nov 2026 17:32:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xTjVs-00081p-Ec
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 17:32:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTjVr-006TuN-M9
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:32:03 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6afde109-bab6-0a2a0a5309dd-0a2a4502db48-24
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:32:03 +0100
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6afde113-4900-0a2a45020019-a237832f84fc-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:32:03 +0100
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 1CB0D4EE01D4;
 Wed, 18 Nov 2026 18:32:03 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1795023123;
	b=y8TPrtCnBifnNQx3KEPgJNLVyKxIYyfl5UhGkmxpYsucytI9a6wld+qQhtQpbLNJrfph
	 gPHJ7TDJ8cfKSRYir/OpoYnIj1GmkWLgr4EL6LSGmCdF+AkiNfL6U++4Eie5C6s6knR3A
	 9rvIHjsTc/9UdPOcBfQCtYBqY8YrrrXGhkHC9hYg7Ph7lNGYd6UPrraiqRYI+2Krgu3iL
	 MXtRgUGPuTgBEMcQkI3HkMbHt3riqDbSdeI2hqIclhEA4qRRGEB3qgobqZuDY5h/u7abW
	 Qy+Enf7TjRXPdcr0xK6Z0otw1SI93KFvPp1f+mADe/SqA6KMLKPoHwfK+a2u32m800VJq
	 UmQCl5zmhe4xvv/qifPMOUJLqfmjLYNTWnA/NdfHusQye/xAyzNgySz6OCGcZLnV/0zoH
	 Y98Y8A+wADCCKLtr/hkfm7YnyyTCBzelm579uO+gxy2mmmzEQXrJFAmvPytfOcqqFosbo
	 4J7L0DrqHJPoFM0MW7SCYHZYy43ET9LKKldBu3/vqLlVMhkCoCWBUv/nXF8Q7xBc3+JKH
	 MmHFJA4+QviAxUbotbMYEHqGPR3jMpVlOzFkRSowIhA7Yo2aceQv3e3+tOgG704zSHeU8
	 HkTRgxgp2Z1HOI85tGizY1Qz53Vwua7ZOId9qcUZbkf+wa2vVMQhQ7Isk1YLNBA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795023123;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=qMAPG9xL8pANvU1G0PxQj0gWWybXQPjFO+sJqnqJK6I=;
	b=zrIiC3zj/y4lvq6e/ewa0+MQw5VxMDjWPg2A/JAn3zNv+e15Bq3fGffm14XXxusRdokc
	 nTCfi/oRyFRCRddZwXM1jJQkbQqK5d6uES+7183GidS0QdDFsySV2o0+SqKiz/1mjKtJV
	 EGoY0ljjDinvl6fokg1fp+FX+XB+xZqQKHXATtixTBY/6+a33x5c+oR0ZmQJY9GUBWgrS
	 UNmsbt3PUr+C6tEeMt2efkfukRrehCLZlyAElC76bqNAjmBXC5tItHO4PFL51JyhxkFGS
	 RtW4ByR9pqe5h2usk88LgFEYtPFvoyAJs7jntC/pzkKTz0AO2vZe60JrMKYj/Tc12kURX
	 3HTfsbFU12EiROU1/k360wS4ILdPqFJYUt5GEZSF8ZIWUUXGm4tzWtd3/2fN1Vz8JIKlw
	 aOul+GQ00AOJpXLjSs3y+13wuZGmFE8RtXN2/uv1kVP3S36KgJhreSp96L9aU919S/sEp
	 MrIaL9Jw2Sj5K+Y7wDDCzVuLp5mSenQQqVUFTrgJlNzw3PQZlVkSnhQMRrj9gnYexB78G
	 YBqVu/KEJp3FwE48kKtJlkDFUxXKoLwdEAyPk+KXMl/BXb0AI5RWf+5CnmArs5NZpIM6W
	 nreCbQA7Zj/XQ17jLLSAS8UsrbhyHtwQfv/mCDrpaF13wGBG9pdcGvQqOJac5to=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 18:32:03 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH 5/5] eclair/x86: Scan in-scope files inside cpu/
In-Reply-To: <20261118171758.1125066-6-alejandro.garciavallejo@amd.com>
References: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
 <20261118171758.1125066-6-alejandro.garciavallejo@amd.com>
Message-ID: <0674cbd5a181c736a077096e6dc4cfa7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1795023123-F13836C6-B217113A/0/0
X-purgate-type: clean
X-purgate-size: 3380
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-18 18:17, Alejandro Vallejo wrote:
> Remove the exclusions now that all in-scope files inside are clean on
> the regression subset.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Acked-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks for taking care of this. I think further cleanup can be done, 
looking at the output of

git grep out_of_scope

but probably it's better in a follow-up patch

> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     |  3 --
>  docs/misra/exclude-list.json                  | 36 -------------------
>  2 files changed, 39 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index d49af53055..9fcba4df16 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -186,9 +186,6 @@ context of R7.2."
>  -file_tag+={adopted_r7_2,"^xen/include/efi/efiapi\\.h$"}
>  -file_tag+={adopted_r7_2,"^xen/include/efi/efidef\\.h$"}
>  -file_tag+={adopted_r7_2,"^xen/include/efi/efiprot\\.h$"}
> --file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/intel\\.c$"}
> --file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/amd\\.c$"}
> --file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/common\\.c$"}
>  
> -config=MC3A2.R7.2,reports+={deliberate,"any_area(any_loc(file(adopted_r7_2)))"}
>  -doc_end
> 
> diff --git a/docs/misra/exclude-list.json 
> b/docs/misra/exclude-list.json
> index 2b874dfd3b..a52f0d6429 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -33,42 +33,6 @@
>              "rel_path": "arch/x86/acpi/lib.c",
>              "comment": "Imported from Linux, ignore for now"
>          },
> -        {
> -            "rel_path": "arch/x86/cpu/amd.c",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
> -        {
> -            "rel_path": "arch/x86/cpu/centaur.c",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
> -        {
> -            "rel_path": "arch/x86/cpu/common.c",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
> -        {
> -            "rel_path": "arch/x86/cpu/hygon.c",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
> -        {
> -            "rel_path": "arch/x86/cpu/intel.c",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
> -        {
> -            "rel_path": "arch/x86/cpu/intel_cacheinfo.c",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
> -        {
> -            "rel_path": "arch/x86/cpu/mcheck/non-fatal.c",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
> -        {
> -            "rel_path": "arch/x86/cpu/mtrr/*",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
> -        {
> -            "rel_path": "arch/x86/cpu/mwait-idle.c",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
>          {
>              "rel_path": "arch/x86/delay.c",
>              "comment": "Imported from Linux, ignore for now"

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

