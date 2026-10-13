Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D042ACC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:07:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447071.1663238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbHI-0000Lz-EM; Tue, 13 Oct 2026 12:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447071.1663238; Tue, 13 Oct 2026 12:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbHI-0000Ls-Bp; Tue, 13 Oct 2026 12:06:44 +0000
Received: by outflank-mailman (input) for mailman id 1447071;
 Tue, 13 Oct 2026 12:06:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xGbHH-0000Lm-Sn
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:06:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbHE-001u1N-4B
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 14:06:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ace1ec7-2eae-0a2a0a5409dd-0a2a450c893c-48
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:06:40 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ace1ecf-f479-0a2a450c0019-a237832fb17e-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:06:39 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id AD9634EE0237;
 Tue, 13 Oct 2026 14:06:39 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1791893199;
	b=V1TF2EXv5vT7Q0myfCBCID59r2MrQOSh/TWYkXfegRISN3rC7HdUcE+yTdXSOYBPR6Fo
	 KEFSvVYORZsjhdeu66W/N9l/zHl5lHSBaDWMI8YXrvU8sONuZz0EGvxbue0IRBlbMWMXg
	 oHVtqveU5FfqEs21v/ZvVkPsfLpa/vIkzv2aLimLlw7fr2ct2uwBGAo6hqCn03/XQjHxa
	 zAsoLysC3rp5VWLzkFnT5+ahegcub7Tja3RKbwP47TptXrTgoM4RiJqSFL1dIZvs8dZjS
	 Z+18BBGmspFX6+LLp2GcpcJwl2kvhzNIstOwviG7GLIADEITwQJH5buxc8Wr2IzPmi2gw
	 UOthybB55kPkp/FeDbHNQF+KmCUs3u1xmWvJazbpytsvqpZRt2jPosF9MlDh8ng6lqKBd
	 jk+AITOSxJ0CA3RWeEdrQ/uO5G38IJ0FR/L8F/vrH8FZkEUnPb1cUjqyJq58WjgsQBQSb
	 nkb19YinBNIP2cxLkFsJiXjZOgl2kU4r403ESC2XOgPDv4t/WQx2Xh/vZbm64T6FAmGcq
	 uTXMoUL8s4qcldWEqmB0hoqE51FH/vlzhI+yFHlArhwnazkYe9CQZDlDVgEJl7UOKtbwX
	 85cHh3KwH2bpXIctC6qt8jZePawlPo1K0ySkrlD5DIECeBo3/hC8I/lFBgM0ixY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791893199;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Jqzi0kVZQgqe1ar74UQa/SvZKO0ouJTQ816MdMn1KmQ=;
	b=B3deMNOS4Hnl07HClA4BB9CzbkASKajgGCiNhsbzoIC+DxoArB46KgFgmfTxTwvfHGtN
	 yFMT7Za2vKlqJysOZ3jRBOS+Arkwv3t8aBBKxPKSAMXN80fA5kLDqTgFLpTGpbEtZNgnS
	 MTJqy/Y3x+yZ2vYej1MKCKcklHuJqdehsk7wRJIt0+qrUHx1O/bm6nUqkrpXxcY255APU
	 NWxVC/OvGUZLpFHDMenIBAGOwe/8SUXlzo7tvKievVJ69IUrXtd4q6zlxym4d/lj7qDm3
	 yIuu92OUF76s1nvcX0lILB0T7b7If5p0pjeU8bYjJ6uq4wYlQEcMxTXOO4GqmYXMk5X2q
	 SsB6Jo2TfXsqqTgaKveXMVxVf9laruQT0sMFw875fTWNMYPLSrLYha7CvUvdMl4XHWfuu
	 I44dSoxIyE2b0Ow+EXOke3+VCHeG33OG9hw+o+e2GNe/otjTGGhHF7EaqrVsQxA7btW+g
	 Kh6Mj0AqoWMJK92ICAe3/03Fl9QbUEc2QRMCtTwl9khqYJGR7pjLL7IhtX8TLmRWoWtay
	 Mp4Mc54jfCuZmTOuS/JMasyhl0k5AEXqRJsi5NLR7iZYzF0bevW+oJbU4Vv/j9u6RqCbI
	 9LTuuXfQ7Xq6raDZ+K8sDpisvwVffX6Pzs4NKkK5bchw9hHzqKOXkvbXM/bf9qM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 13 Oct 2026 14:06:39 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] Eclair: scan the last xen-syms linking pass on Arm
In-Reply-To: <da077c781fe07f776946475521bd06409a9af100.1791836668.git.dmytro_prokopchuk1@epam.com>
References: <da077c781fe07f776946475521bd06409a9af100.1791836668.git.dmytro_prokopchuk1@epam.com>
Message-ID: <bbf53927199f7644ef019171b86ad754@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1791893200-01CC3A5B-D54C4CBA/0/0
X-purgate-type: clean
X-purgate-size: 4445

On 2026-10-12 22:49, Dmytro Prokopchuk1 wrote:
> The hide pattern .xen-syms.[013] leaves pass 2 visible. On x86
> LAST_LINKING_PASS is 2, so that is the final link. On Arm
> LAST_LINKING_PASS is 3 and the final image is .xen-syms.3. Pass 2 is
> usually only a symlink, so Eclair saw no program link and reported 
> every
> translation unit as unreachable.
> 
> During analysis preparation, read LAST_LINKING_PASS from the 
> architecture
> makefile and the pass numbers from the foreach list in
> xen/scripts/Makefile.link. Hide every pass except that one. An earlier
> pass that is a real link stays hidden. The generator runs from
> generate_ecl.sh, together with the other ECLAIR configuration scripts.
> 
> Fixes: a401b5c9dc35 ("Eclair: re-enable scanning of the (almost) final 
> linking step")
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks for spotting and fixing this!

> ---
> Test CI pipeline: 
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2940065908
> 
> Changes in v3:
> - generate the hide pattern from generate_ecl.sh, which prepare.sh 
> already runs
> 
> Link to v2:
> https://patchew.org/Xen/e73c282694e68083305d03219f983bf74a8bf494.1791392326.git.dmytro._5Fprokopchuk1@epam.com/
> 
> Changes in v2:
> - update commit message
> - generate hide pattern before analysis
> - read LAST_LINKING_PASS from the arch Makefile and pass numbers from 
> the Makefile.link
> ---
>  .../eclair_analysis/ECLAIR/analysis.ecl       |  2 +-
>  .../ECLAIR/generate-xen-syms-passes.sh        | 20 +++++++++++++++++++
>  .../eclair_analysis/ECLAIR/generate_ecl.sh    |  3 +++
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
> diff --git a/automation/eclair_analysis/ECLAIR/generate_ecl.sh 
> b/automation/eclair_analysis/ECLAIR/generate_ecl.sh
> index b955783904..b97fc55fd2 100755
> --- a/automation/eclair_analysis/ECLAIR/generate_ecl.sh
> +++ b/automation/eclair_analysis/ECLAIR/generate_ecl.sh
> @@ -20,3 +20,6 @@ 
> accepted_rst="${ECLAIR_PROJECT_ROOT}/docs/misra/rules.rst"
> 
>  # Generate the list of linker-defined symbols (must be run after a Xen 
> build)
>  "${script_dir}/generate-linker-symbols.sh"
> +
> +# Hide every xen-syms linking pass except LAST_LINKING_PASS.
> +"${script_dir}/generate-xen-syms-passes.sh"

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

