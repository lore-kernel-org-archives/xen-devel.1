Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFB9606A8A7
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 14:23:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1485930.1688954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVhz-0000qq-7U; Thu, 12 Nov 2026 14:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485930.1688954; Thu, 12 Nov 2026 14:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVhz-0000qh-4T; Thu, 12 Nov 2026 14:23:23 +0000
Received: by outflank-mailman (input) for mailman id 1485930;
 Thu, 12 Nov 2026 14:23:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xRVhy-0000qL-2h
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:23:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRVhx-00253p-Fs
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:23:21 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6af5cbd7-8faa-0a2a0a5109dd-0a2a450cdf18-16
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:23:21 +0100
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6af5cbd8-f479-0a2a450c0019-a237832fda60-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:23:21 +0100
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id CEB464EE01F0;
 Thu, 12 Nov 2026 15:23:20 +0100 (CET)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1794493400;
	b=lSUp2cRbUFrpERmkPvJSq+iLDavohsHRKXsFC9wn//AqZoCAq87ptQkqHVjYmQTrFzvc
	 ZvoAdH2MQoNOwPbcBU5yOW+9dNPEFKYyANj98ZLMlh/FgWK0Qhn+ZqJ2nlF4RkOX8pvUc
	 xNOEd3kt99fy6G2c6onqezWBWbhesaH29Uvqu2h0sJHac6rkdgeFkBqdBN/eWdGOAAueG
	 CaPhqrQdXOMjmnpRqU6Qh4XkqfEMwsUE65RVAK0LInRY4Appah/LTB9sN8bORTdpFlJzZ
	 zxxsINAInmduVkOdLoFOEwxZk7i566ktRra0wm6FCaFRqY1G7HO6OYBdfrROBTOmB8DJL
	 d3jlQJH8ZVFVKlemndIEVHVh2fcdw4CmWIHV5l/6Bapq5yUcA7YIwUqHSVGeG2Axxvqli
	 CgVlPTWZKJy1rplyiHkD+u4wBOYdMrKNj1GlbKzK42DGRf810UCbmOGUT2tL/UR0ogJxL
	 6JFaGgzW8DvHoCNq0aT1QkCh852fdfZZcTMIwVNc+6Ah/+X4EWuGdyTKjdAC5bV3Dlkx5
	 hARUEcmFlfWMdeJAzrRSBC5Bmy5St8JskEyv3hJyKNzO6YTE6qa55+soaraqXGm2U6XYL
	 pjE9m/l2J0M1jL6rwvJo8H8i73dB+nKJowALuujZV4TRm4mwKQnFuAfHBI6Nv24=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794493400;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=tsKBSh0JYLFtOwQP2b1ABzDmFoeZAnEpa/s8eJGt9YQ=;
	b=QSNI8ITU836Fmst1ksGVx13P4npy1MwD4ytvyawH9YxRuZV6ACRU1k+Pw0PBBclCNPV9
	 twrGjuol63p41zkxclNmQpr3iX5HgIKaZtU4f1rz6elkRLim6zJwrcPuMJ1dn/tPHGb7D
	 11MEKv0r3LUa1mOpUUtNugWDsnbygnYtToJeAOK17uHh1bMA4a+rbVCuf3e0XYhq3bRJY
	 f523yAsKkKjQ6YJSFb5Gr2dbS/GK9Lkzze/5hvbmXE8KctUxRclCbz4NQU6m/xx/u07TH
	 3d0GpGm54TNk/SGldVMOsrPrjMPtt+xgBqsMjyOCBjDOn4DOFWWeZ/5G0BA1l+FFPoJv+
	 2zeulhGiMDrosDoCJOJ7dJQ3ePsOZPwrDnrKDbUccAIj2rcwxPLsp35HoUViqlYv8Z5wn
	 Z6S7c16btHighSalY7VeFIJL8kGYzkhXst9HOdTGzya0pfJZkZDh8LNSZ6ciRFP1dL99e
	 E7H+kOhXE9CP/kBTTituRh5VNwYGGHb3ysDn21tGRWyJUsEhnHfr4HaIXqxFaFYEmYwt2
	 ZK/soOYShhyfBLVvoru6eOv7K23tR9c0GTSFs+cg5bkzSSfez5q5SJ3AVU8CSkuNNYFfm
	 bS5DHHCrub6lViOhji70f/9Gyq3lDpoTZ3YvlT7Y2g3ytZeuAA5fOeUcHrOajHw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 15:23:20 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Shuaidong Chen <shuaidong.chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH v3] automation/eclair: deviate R2.6 for the x86 emulator
In-Reply-To: <20261110134902.2891528-1-shuaidong.chen@amd.com>
References: <20261110134902.2891528-1-shuaidong.chen@amd.com>
Message-ID: <69fb2281b50d0d8a959c9347897ab508@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1794493401-00ACCA5B-47C7E908/0/0
X-purgate-type: clean
X-purgate-size: 4129
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-10 14:49, Shuaidong Chen wrote:
> MISRA C:2012 Rule 2.6 (advisory) states that "a function should not
> contain unused label declarations".
> 
> Depending on which parts of the x86 emulator are compiled in, some of
> its labels end up with no goto targeting them.  For example, with
> CONFIG_HVM=n private.h defines X86EMUL_NO_FPU, X86EMUL_NO_MMX and
> X86EMUL_NO_SIMD: the CASE_SIMD_* macros then expand to plain labels
> instead of case labels, and the gotos to several hand-written simd_*
> labels are preprocessed out, leaving 91 unused labels in
> x86_emulate.c.  The build already acknowledges this by passing
> -Wno-unused-label for that object.
> 
> Annotating these labels would only add churn to the emulator.  As done
> for Rule 16.2, deviate the rule for the emulator as a whole.
> 
> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>

Acked-by: Nicola Vetrini <nicola.vetrini@bugseng.com> # eclair

See below for a small nit

> ---
> v3:
> - Drop the CONFIG_HVM=n specifics from the deviation text, as the
>   deviation itself isn't limited to that configuration.
> 
> v2:
> - Drop the __maybe_unused annotations (v1 patch 1) and the CASE_SIMD_*
>   specific deviation (v1 patch 2) in favour of an emulator-wide
>   deviation, following the existing one for Rule 16.2.
> - Trim the Cc list.
> 
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
>  docs/misra/deviations.rst                        | 8 ++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 296340bb4c..12afc758dd 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -55,6 +55,11 @@ removed by the compiler, the resulting slowdown is 
> negligible."
>  -config=MC3A2.R2.6,reports+={deliberate, 
> "any_area(text(^.*__maybe_unused.*$))"}
>  -doc_end
> 
> +-doc_begin="Depending on which parts of the x86 emulator are compiled 
> in, some of its labels, many of them generated by the CASE_SIMD_* 
> macros, may end up with no goto targeting them.
> +Annotating them would only add churn to the emulator, therefore it is 
> deemed better to leave such files as is."
> +-config=MC3A2.R2.6,reports+={deliberate, 
> "any_area(any_loc(file(^xen/arch/x86/x86_emulate/.*$)))"}
> +-doc_end
> +

There is already a definition of that directory pattern for Rule 16.2 
[1]:

-file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}

so you could just reuse that by moving this file_tag definition earlier. 
For instance:

-file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
[..]
-config=MC3A2.R2.6,reports+={deliberate, 
"any_area(any_loc(file(x86_emulate)))"}
[..]
-config=MC3A2.R16.2,reports+={deliberate, 
"any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}

[1] 
https://gitlab.com/xen-project/hardware/xen/-/blob/staging/automation/eclair_analysis/ECLAIR/deviations.ecl#L534

>  #
>  # Series 3.
>  #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index bee4686675..7b983db264 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -116,6 +116,14 @@ Deviations related to MISRA C:2012 Rules:
>         such labels poses no risks.
>       - Tagged as `deliberate` for ECLAIR.
> 
> +   * - R2.6
> +     - Depending on which parts of the x86 emulator are compiled in, 
> some of
> +       its labels, many of them generated by the CASE_SIMD_* macros, 
> may end
> +       up with no goto targeting them. Annotating them would only add 
> churn
> +       to the emulator, therefore it is deemed better to leave such 
> files as
> +       is.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R3.1
>       - Comments starting with '/\*' and containing URLs are safe as 
> they are
>         not instances of commented-out code.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

