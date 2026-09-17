Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9A4C982CD
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 06:02:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423669.1648638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x75Ce-0002Oo-2y; Thu, 17 Sep 2026 06:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423669.1648638; Thu, 17 Sep 2026 06:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x75Cd-0002Oh-W7; Thu, 17 Sep 2026 06:02:35 +0000
Received: by outflank-mailman (input) for mailman id 1423669;
 Thu, 17 Sep 2026 06:02:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x75Cd-0002OP-6B
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 06:02:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x75Cc-004exF-JK
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 08:02:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aab8274-bab6-0a2a0a5309dd-0a2a450bc814-40
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 08:02:34 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aab8279-b7e8-0a2a450b0019-a237832fc870-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 08:02:33 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 2EE194EE0091;
 Thu, 17 Sep 2026 08:02:33 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1789624953;
	b=Ddrxy353OE5YXZyHrxiwSL9UYy7zY8Elkit9mV9n+a8S63EgACtXXq0Tw/GExhu3W6yY
	 bCouFCTD29XnC6wW2/OiA/X5vg/q235zMNPNUvlsvfnH0BOW6lWXzBUp9L3iOf79GgSOm
	 LFj6S/nh9gRAZEwi2vYbj+9ToscXfaWUKd1D50L/5x7bJCpFLlCF1+Vov7yNCCKDRniQx
	 Kns0DKyoudOvKtqZovMqIKkYnpV+Gj5nngmBsiKsexgoYKHz4oPM3cJWGjKIDYjUNqTAm
	 5Pc6/Kr/0hgOI33ffKK2UMDJcPC4cnN6f+mZSAMapaXjtRFS2isV81dfSWDgAxeyW2i/z
	 injXUVoexoP9YhI3XTmKZOjBfPqIcA4fYWfK6TIIVpeIcH1Ar5mR/7CGQJtSBpZIL2BUK
	 0DMZze5dk3R9wHvdIiKHzC21h2cRqPWnVqbFF8g6Dv5nnfUI1BG4qY4CfZuXt0r/7GWGF
	 2M0QdhNhS4+tN7lfLaSpEoyuW/lGYxDqPuQkAcimGBh45xaO7pOlnd2KODmX6zJGbWLO0
	 58Fu7KLwV4f/6ypszaXMHZzAgcEAulD8oEb56dmrZ5K/rGMw/xGIv3vBD8aPcAKg086Sr
	 YN9TsinkPrWTi4ghP+x2wXdHYf+5RMqHXVQ/lIXr8c2CMIDBAL0krAgPq8JQC4s=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789624953;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=AKVD4zQmp0fABHipds2ZuwEtMrYuY5h109P153OAoyA=;
	b=H0HBg0OVqYzpbxJjnfbFfimcFO4bIOn6Hh57BIMrrLlIAc2iRXQxBJzEm3/z6TuNKihh
	 w6H5CeEEcs/jPbSPMLD1LKLXrnRVB55XRUIIq7lW4EkezPQRglzwL0uhW9FPYTIC2iZOq
	 xxL8ClBkWcg8BOroMSh24EJn2VPvmMIckayD1eGPei2Zn4NeLLjQpkr5D6WUOmjJV/O/e
	 tjTGJPeiKPezDMMvqVD0Ewaq2tdVW1t1QQnoQ2+IbZ3j97hhsAOZKXtKRm15CTA1QYIqw
	 ywn0j2MK5HexqqaNEFuSOJvx8GNmOztcg8Wj8Jav6uQg2hOhw5VxTghVdjUQVSHziU8m+
	 2hvdXdgi02vNYwPtK14aS3gaa0XVa9/LxeWzvB5RFQMvwagY3hxPJdYAGo+TrCl4UJ34w
	 w6qtrZ96S/mkPQ2X06+lr9iDWhsKf4VUNxSc7omJBHE3WrrKH8T/BSmF6oNost/dVtQLM
	 O91Z9xOKnchwwRSsUA4hXWwrbiHXx75mcTsqQUJchOJcnCwQUGLCu5GLv2+65c5LeCkh/
	 Gp+U8lU8h8bbjbBqB7qUHF1OVSjRdIOIhEyTyi+z+55i7frUgahjldUcMfkQMO0GW3CXx
	 sMREGm7JpuqecJjFyGYRLHDA5E8Bj9n6pJpbGFcRyCpfZ1KFkKufi4WizfS+53k=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 08:02:33 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH] Eclair: re-enable scanning of the (almost) final linking
 step
In-Reply-To: <19fff81a-5920-4c9b-be8f-74354f88bb69@suse.com>
References: <19fff81a-5920-4c9b-be8f-74354f88bb69@suse.com>
Message-ID: <c47cb3aee2638c403eaed186884fff71@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1789624953-A88C99EA-F82DFEE5/0/0
X-purgate-type: clean
X-purgate-size: 1418

On 2026-09-10 11:55, Jan Beulich wrote:
> The real final binaries are now no longer created by a linker 
> invocation,
> but by renaming an intermediate file (each). Arrange for linking pass 2
> outputs to be scanned instead, yet continue to exclude the auxiliary
> .xen.efi.alt.* binaries.
> 
> Fixes: da944a72fdf4 ("x86: split xen-syms/xen.efi linking rules"))
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> ---
> Sadly for Arm64, until "Arm: split xen-syms linking rule" has gone in,
> this will slow down analysis jobs.
> 
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -36,8 +36,8 @@ their Standard Library equivalents."
> 
>  -doc_begin="Do not analyze intermediate linking artifacts, as they do 
> not differ from their final
>  counterparts for the purposes of MISRA C static analysis."
> --file_tag+={xen_efi_tmp, "^xen/\\.xen\\.efi\\..*$"}
> --file_tag+={xen_syms_tmp, "^xen/\\.xen-syms\\..*$"}
> +-file_tag+={xen_efi_tmp, "^xen/\\.xen\\.efi\\.([01]|alt\\..*)$"}
> +-file_tag+={xen_syms_tmp, "^xen/\\.xen-syms\\.[013]$"}
>  -frames+={hide, "kind(program)&&target(xen_syms_tmp||xen_efi_tmp)"}
>  -doc_end

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

