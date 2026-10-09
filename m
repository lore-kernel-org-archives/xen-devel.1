Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64F0CA601D
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 15:37:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444509.1661337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFCew-0008CR-Gh; Fri, 09 Oct 2026 15:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444509.1661337; Fri, 09 Oct 2026 15:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFCew-0008CK-CS; Fri, 09 Oct 2026 15:37:22 +0000
Received: by outflank-mailman (input) for mailman id 1444509;
 Fri, 09 Oct 2026 15:37:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xFCev-0008CE-50
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 15:37:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFCeu-002GpV-IP
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 17:37:20 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ac90a04-bab6-0a2a0a5309dd-0a2a4506a652-20
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 17:37:20 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ac90a30-195a-0a2a45060019-a237832f9a9c-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 17:37:20 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 64A4F4EE0211;
 Fri,  9 Oct 2026 17:37:19 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1791560240;
	b=cW2mQL+CBni6hwK0hTJFX4cJCOl9UydalDxkk5t1l81qPzPKt8OCHDoETgbW+22hmZHX
	 R57wtoS+L/Z2L/O04cT3uWLpO0fMFZK2dgBkwIeJwCwej5pBSQAuPAzKxingbStekACjB
	 wpVkpAGNH4waGF5phGPTpQHE/azt00SKlEA0J2f2UK84bf91VYIuIgRhiLnbMwykN7u9G
	 efNAtLFNjZioTaJtnXcJNnpLdjyxDa3FpMbd36Wnog5KV8qAKUAYtQD/zxDziQpm6pUR1
	 PesnRQKDAFPVTUILAGpKEFkp2TjcZa6ceFxy93y5I+XEfoSPGEHZW9/zyd7BIDlzDNIY1
	 62qX1Y2m/NhSJO0X/S0e/1if05S2BuNinPlu0X8jr7KLuzNRLmu5kCFf+JuLCT6K/2HPf
	 xJSyHbf8sTfQSSoOx+tt1g9GbUagcCbetFWo6zDiikCkYn7TksiAN3HgGKOiXPq7w9r58
	 DKWTyL9/GY2sRDc52kibIZ0Icptez8DKMBtMbwn8WgaWxXiezp4GUeZlsbGyVVa8TeHek
	 lTEBHJYZk3e1mhjVrEUfW2NxEZxV+A9DHplyx8C1a9VI1ki9Fv9fxrfmTyrohhOXJPOHt
	 d9oNAGD40UxaqMq98UnIrA8GWhv0LSz2Gs+P0c1nxsmELdj0Ze8H34kh3JPcjHs=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791560240;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=wnQK4qWyR832CxicqxWHinwbzaeqLnPL4WpG+H3T6YQ=;
	b=5EeF8JHZ/Oze/amMmnMH6q8yLDYPFYeQD/nvvRX4SAZk6D/jYbY7wGXRVMPCjAQGFjIF
	 6W0gz860hJ7ilXo4Ssztub4nFNwQA2Nb6FKfvP7aZ/rgtPNZukPY4NEYNwqmx00QT8mEQ
	 4VSnfGhBT2ji/0EXZM4VakoYsdkyYArkG+0eAkXcj+dBlKBBkzjrQXrOe2ZQKdIeJdlxv
	 3XknLJX1e2xbtXCjWA/84c8RuOnSSogKXMdV2ub2SRQ6ou5kJ8x09kKibeSlRPDXf3mL6
	 JF0f8YntWFeWFE9b1arPymKo9dudYomcDULJ3X3u231kz59xaJzOCa8XMbCuGk1w/8H/n
	 WKax7K06k+brAqmOXNrhOE15oiIn/EKvBj1tXnmBZ0OTl64QRwwLD4bu0u3nZNWPMGuXv
	 34JefHDgajirvz9T6pVQua8AIajt5e/itTZRqxFRA/3i8G4UkpZMmrcAtQdgUq+WtJAld
	 5H40WMCe9FHJC7r7+sEzlWZBB++YcfjaWaLirtFGNYWBjBQ1jdECOF/1ltx+UDN4/Kwdm
	 L7w9o3UIzr+8tV0MmFtSqR9EkyyanJnnn+85x/cvGFnPyMSh4zA40AKyWw2pS+8LuNZWz
	 Ol3WFHaWhNIR9ZqZm4Loe3WupQeIo+SOtznKyTq7zup3ZNmgqrMRNbydt+VpnQE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 09 Oct 2026 17:37:19 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] automation/eclair: generalize the noreturn
 function-pointer deviation
In-Reply-To: <d68c56607781bfa829766aed36eeb31f06080fbc.1791224638.git.dmytro_prokopchuk1@epam.com>
References: <d68c56607781bfa829766aed36eeb31f06080fbc.1791224638.git.dmytro_prokopchuk1@epam.com>
Message-ID: <5b5cccc8bbbc4c87fc99427eb4c1c413@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1791560240-F687577B-5FD8B61F/0/0
X-purgate-type: clean
X-purgate-size: 6049

On 2026-10-05 20:56, Dmytro Prokopchuk1 wrote:
> The R11.1 safe cast only matched void noreturn (*)(void *). Accept any
> noreturn function pointer converted to a compatible function pointer.
> canonical() covers typeof destinations, and compatible_deep_unqualified
> keeps the parameter and return types aligned.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> 
> This patch tries to cover both of these:
> 
> 1. eclair: widen R11.1 noreturn cast deviation
> https://patchew.org/Xen/c6632dd805a119aca54b9d1ae2eea68ef9c1334c.1790674358.git.dmytro._5Fprokopchuk1@epam.com/
> 
> 2. Eclair: relax "noreturn" function-pointer conversion deviation
> https://patchew.org/Xen/6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com/4cca58b6-b555-4064-aa26-5204dc4b99cc@suse.com/
> 
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2914802667
> 
> The only one Rule11.1 violation remains, which is covered by this Jan's 
> patch:
> x86/kexec: address Misra rule 11.1 violation in machine_kexec_load()
> 

The change itself is fine, but the aspect I'm concerned with is the 
following: if you have a function marked noreturn, the compiler is 
entitled to
essentially remove any code following it, so in principle this could be 
the case also when invoking a function pointer (i.e. the compiler has no 
obligation to retain code after a call to a function pointer that is 
actually a noreturn function). While this in practice may not happen 
often (e.g., the analysis done by a compiler is probably too shallow to 
actually infer paths where the function pointer is only ever assigned to 
noreturn functions when it is called), it is still not completely true 
to say that the behavior is not altered by casting away noreturn. I have 
given in [1] my R-by to the previous form of this deviation, but I 
realize that this aspect should be mentioned. This is of course 
supported by testing and code coverage evidence that the behavior is 
indeed the same, or a suitable guarantee from the compiler vendor that 
the behavior never diverges.

[1] 
https://gitlab.com/xen-project/hardware/xen/-/commit/b5497ad4a4a2b9a97100ca002cc82b573b198071

> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++----
>  docs/misra/deviations.rst                        | 8 ++++----
>  docs/misra/rules.rst                             | 7 ++++---
>  3 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 6cdb10a129..d89976a894 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -394,11 +394,12 @@ constant expressions are required.\""
>  }
>  -doc_end
> 
> --doc_begin="The conversion from 'void noreturn (*)(void *)' to 'void 
> (*)(void *)' is safe
> -because the semantics of the 'noreturn' attribute do not alter the 
> calling convention or behavior of the resulting code."
> +-doc_begin="The conversion from a noreturn function pointer to a 
> function pointer
> +with a compatible signature is safe because the semantics of the 
> 'noreturn'
> +attribute do not alter the calling convention or behavior of the 
> resulting code."
>  -config=MC3A2.R11.1,casts+={safe,
> -  
> "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1, 
> pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
> -   ref(property(noreturn)))))"}
> +  
> "kind(bitcast)&&to(type(canonical(__function_pointer_types)))&&from(expr(skip(!syntactic(),
> +   ref(property(noreturn)))))&&relation(compatible_deep_unqualified)"}
>  -doc_end
> 
>  -doc_begin="The conversion from a pointer to an incomplete type to 
> unsigned long does not lose any information, provided that the target 
> type has enough bits to store it."
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 6bcc2adf95..ed7129b8dc 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -392,10 +392,10 @@ Deviations related to MISRA C:2012 Rules:
>       - Tagged as `safe` for ECLAIR.
> 
>     * - R11.1
> -     - The conversion from 'void noreturn (*)(...)' to 'void (*)(...)' 
> is safe
> -       because the semantics of the 'noreturn' attribute do not alter 
> the calling
> -       convention or behavior of the resulting code, parameters 
> handling remain
> -       consistent.
> +     - The conversion from a noreturn function pointer to a function 
> pointer
> +       with a compatible signature is safe because the semantics of 
> the
> +       'noreturn' attribute do not alter the calling convention or 
> behavior
> +       of the resulting code.
>       - Tagged as `safe` for ECLAIR.
> 
>     * - R11.2
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index a59cf1782e..bd288bba29 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -435,9 +435,10 @@ maintainers if you want to suggest a change.
>         and any other type
>       - All conversions to integer types are permitted if the 
> destination
>         type has enough bits to hold the entire value. Conversions to 
> bool
> -       and void* are permitted. Conversions from 'void noreturn 
> (*)(...)'
> -       to 'void (*)(...)' are permitted. Conversions from [unsigned] 
> long
> -       or '(void *)' to a function pointer are permitted.
> +       and void* are permitted. Conversions from a noreturn function 
> pointer
> +       to a function pointer with a compatible signature are 
> permitted.
> +       Conversions from [unsigned] long or '(void *)' to a function 
> pointer
> +       are permitted.
>         Example::
> 
>             unsigned long func_addr = (unsigned long)&some_function;

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

