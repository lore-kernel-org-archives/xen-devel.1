Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784ACCA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:08:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442645.1660173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEW3R-0004uV-5B; Wed, 07 Oct 2026 18:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442645.1660173; Wed, 07 Oct 2026 18:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEW3R-0004uO-2T; Wed, 07 Oct 2026 18:07:49 +0000
Received: by outflank-mailman (input) for mailman id 1442645;
 Wed, 07 Oct 2026 18:07:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xEW3Q-0004uC-7B
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:07:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEW3P-008tbe-4q
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:07:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ac68a34-8faa-0a2a0a5109dd-0a2a450aa69e-30
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:07:47 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ac68a72-f2d2-0a2a450a0019-a237832fc924-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:07:47 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id B78464EE0216;
 Wed,  7 Oct 2026 20:07:46 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1791396466;
	b=SCPO44R4CA9S8Vsk+kzF5079r1Yvh8vpWUUlplHi5KNywCMSGkLurEdFLn/8yHCxIObN
	 smgAIVWg1xBYZ4VipDisQOIceYks89BCCibhTFI7GHSx6zSfi89dXbbTiLUKpSYBTIMgx
	 TLDfYw/CGnttthy83K8dO/Ie4usdoRxfzPI5uFb2czcsxlpOtoh+VtMCyYzZPcOTDtYZq
	 afi7oEUhjLSzN8+PERdE4+4AagoHxyUkQOSw5LNW1jZINdwG18eZ/xi3667+ijkV1ou+4
	 Zpq27a8g2wnD4M62Dc4FhWr3v2bIs0QtR7uhXINmlh1+y7JjVJKVolRJl++k5BgwkgKZu
	 6/rpQsqbhsl/Cob2EZR69CGF8Hrq+07TpU/mEswaCpfHN9EaO8Z70gMZMBBmHuZv+PPTV
	 PNUkkawKFE49POsKMU+2G8fKGFZTw2bX7HSlDQQgKMienLwJlZ+DCkSCtkUcYES6exryu
	 /dBaM5MYtH3hIzgJDFikBJqAQ1g5eY7loKLnPyZsxyUTXr+fpR75r6yieKIpL9e094LnD
	 kqdYJZTZVKSTmEGJVrT0ASjP1YUjOp+n2ZbcLEhda0ZmFIH/cKrd8wv8elKpVrLKwAqqj
	 OBJh7NmpV+1LfZDrbL4/sBW2za0cMfWduavuCM6LGxR7GdCU2Ukfenp6Zs2+VMg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791396466;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=kKoqfZ9oNLAGrvGPtldZE8hf6KjD7k5BKmZFYhyYQog=;
	b=CkdN9Bck7HmwNPqNK7PDaLejtzxzzugaSCjP3cTEGzBggwbFYJn+cckx3AA88lqOM/fU
	 vNGMZ0Tzfji3txdDw/jCXGAe360jp06Olpb2oxBf05pV64oMnXALyMPRxMfGEqlh+kwy5
	 7wuZQtBzM3Fg7xNHXThT3brsTK7MWh5YWsyRdxKrUjG2FXG8f0P9nJj9ec9m8FNV8edKE
	 l959P3l7L2RiXwm1S0zsTNTSlb4lL7/MG0LqMgIAuqAGGlb3wtkBbrQiFv5sB097vN8Vm
	 Ob67sm1yahKAdCCR3taCyZQ67sRI6VTvKih6DLi5aoasuco2gnHp3SQPs8DteJo90dQEC
	 zi5ziUcXVwGYhg8FVRc8id0zZoB/qmD6QvgnS2SLMK0RMlutvtJ0MeMybmLd+WDCjtEnU
	 V5noJWgrgjqCO6QG7TojRTBpEF+eTLyBJgNdbX9NJSXesFO2x89YVaxSmZPf0GDzNBIu2
	 W4gDEDzWFhr+G/jYfM1/pM1HtRJDmhp8Tzs6208QHMo5r8nYIQm69uiS4ltLh7cxHV63T
	 eXpWhy2iOGdcp/uMeLVvBZW2A6G1GUyYy20dIEkEyNtmXRBmD5wrQ6hQHPjztNFqD2KXu
	 R6d0Llxz2ox/HfAmgjUhaTzrulemNDuDMNYxgxQvn1XsCKhmar9VsHP4tMdQ9kc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 07 Oct 2026 20:07:46 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] Eclair: scan the last xen-syms linking pass on Arm
In-Reply-To: <e73c282694e68083305d03219f983bf74a8bf494.1791392326.git.dmytro_prokopchuk1@epam.com>
References: <e73c282694e68083305d03219f983bf74a8bf494.1791392326.git.dmytro_prokopchuk1@epam.com>
Message-ID: <bbc500e1808a7bca4385189e35eb6434@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1791396467-518C5CFC-A2FFB00D/0/0
X-purgate-type: clean
X-purgate-size: 4428

On 2026-10-07 19:12, Dmytro Prokopchuk1 wrote:
> The hide pattern .xen-syms.[013] leaves pass 2 visible. On x86
> LAST_LINKING_PASS is 2, so that is the final link. On Arm
> LAST_LINKING_PASS is 3 and the final image is .xen-syms.3. Pass 2 is
> usually only a symlink, so Eclair saw no program link and reported 
> every
> translation unit as unreachable.
> 
> Before the analysis build, read LAST_LINKING_PASS from the architecture
> makefile and the pass numbers from the foreach list in
> xen/scripts/Makefile.link. Hide every pass except that one. An earlier
> pass that is a real link stays hidden.
> 
> Fixes: a401b5c9dc35 ("Eclair: re-enable scanning of the (almost) final 
> linking step")
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Current patch isn't tested, sent just for review (if this accepted, 
> I'll run pipeline).
> 
> Changes in v2:
> - update commit message
> - generate hide pattern before analysis
> - read LAST_LINKING_PASS from the arch Makefile and pass numbers from 
> the Makefile.link
> 
> Link to v1:
> https://patchew.org/Xen/2f67ef7c4593d3ab94b75b5b819e7e046e055796.1791293680.git.dmytro._5Fprokopchuk1@epam.com/
> ---
>  .../eclair_analysis/ECLAIR/analysis.ecl       |  2 +-
>  automation/eclair_analysis/ECLAIR/analyze.sh  |  3 +++
>  .../ECLAIR/generate-xen-syms-passes.sh        | 20 +++++++++++++++++++
>  3 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100755 
> automation/eclair_analysis/ECLAIR/generate-xen-syms-passes.sh
> 
> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl 
> b/automation/eclair_analysis/ECLAIR/analysis.ecl
> index c6e1a7a95d..df1006bcaa 100644
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -37,7 +37,7 @@ their Standard Library equivalents."
>  -doc_begin="Do not analyze intermediate linking artifacts, as they do 
> not differ from their final
>  counterparts for the purposes of MISRA C static analysis."
>  -file_tag+={xen_efi_tmp, "^xen/\\.xen\\.efi\\.([01]|alt\\..*)$"}
> --file_tag+={xen_syms_tmp, "^xen/\\.xen-syms\\.[013]$"}
> +-eval_file=xen_syms_passes.ecl
>  -frames+={hide, "kind(program)&&target(xen_syms_tmp||xen_efi_tmp)"}
>  -doc_end
> 

> diff --git a/automation/eclair_analysis/ECLAIR/analyze.sh 
> b/automation/eclair_analysis/ECLAIR/analyze.sh
> index 2356fc4007..ef59e87212 100755
> --- a/automation/eclair_analysis/ECLAIR/analyze.sh
> +++ b/automation/eclair_analysis/ECLAIR/analyze.sh
> @@ -78,6 +78,9 @@ export ECLAIR_PROJECT_NAME="XEN_${VARIANT}-${SET}"
>  rm -rf "${ECLAIR_OUTPUT_DIR:?}/*"
>  mkdir -p "${ECLAIR_DATA_DIR}"
> 
> +# Generate hide pattern.
> +"${SCRIPT_DIR}/generate-xen-syms-passes.sh"
> +

I would prefer it integrated in [1] instead, running in prepare.sh. At 
least we keep these calls to ECL generation scripts together.

[1] 
https://gitlab.com/xen-project/hardware/xen/-/blob/staging/automation/eclair_analysis/ECLAIR/generate_ecl.sh?ref_type=heads

>  # Perform the build (from scratch) in an ECLAIR environment.
>  "${ECLAIR_BIN_DIR}eclair_env" \
>      "-config_file='${SCRIPT_DIR}/analysis.ecl'" \
> diff --git 
> a/automation/eclair_analysis/ECLAIR/generate-xen-syms-passes.sh 
> b/automation/eclair_analysis/ECLAIR/generate-xen-syms-passes.sh
> new file mode 100755
> index 0000000000..e3795e8234
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/generate-xen-syms-passes.sh
> @@ -0,0 +1,20 @@
> +#!/bin/bash
> +
> +# Hide every xen-syms linking pass except LAST_LINKING_PASS.
> +# The pass list is the foreach in xen/scripts/Makefile.link.
> +
> +set -e
> +
> +cd "$(dirname "$0")"
> +arch=$(echo "${XEN_TARGET_ARCH}" | sed -e 's/x86.*/x86/' -e 
> 's/arm.*/arm/')
> +last=$(sed -n 's/^LAST_LINKING_PASS *:= *\([0-9]\).*/\1/p' \
> +    "../../../xen/arch/${arch}/Makefile" | head -n 1)
> +passes=$(sed -n 's/.*foreach n,\([0-9 ]*\).*/\1/p' \
> +    ../../../xen/scripts/Makefile.link | head -n 1)
> +test -n "${last}"
> +test -n "${passes}"
> +hidden=$(printf '%s' "${passes}" | tr -d " ${last}")
> +
> +printf '%s\n' \
> +    "-file_tag+={xen_syms_tmp, 
> \"^xen/\\\\.xen-syms\\\\.[${hidden}]\$\"}" \
> +    >xen_syms_passes.ecl

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

