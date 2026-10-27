Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0541D606A323
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 07:27:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1461861.1672868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbaH-0001aE-11; Tue, 27 Oct 2026 07:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461861.1672868; Tue, 27 Oct 2026 07:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbaG-0001a7-Ua; Tue, 27 Oct 2026 07:27:00 +0000
Received: by outflank-mailman (input) for mailman id 1461861;
 Tue, 27 Oct 2026 07:27:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xLbaG-0001a1-4D
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 07:27:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLbaD-005Uww-MX
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 08:26:57 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ae05228-e002-0a2a0a5209dd-0a2a45038950-36
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:26:57 +0100
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ae05241-fae8-0a2a45030019-a237832feae4-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:26:57 +0100
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6C1BB4EE022E;
 Tue, 27 Oct 2026 08:26:56 +0100 (CET)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1793086017;
	b=g5f7x+TBNmTgFgY4bdNTIW4kYjto59SPZXdvH9j+ZeWTAym4n1GU2vNmmnwZI4G8uFd+
	 rSAMAKLslnmk5IY49s4XTKYghOY09c49zD/S4qP+XfiV1WLmxrqa4TDC/Sq10hF49sO9G
	 MNO6eaKS2TPAworOHwOymUigr7mdxQTy9GhI2wZISOK+3x3XpHlNI7IRRrZaARpWGaJnm
	 WRqn4pEkknuRzgomFkA8Jmk9iFqYcY63h5SwOCav0T03xHufRU4/U5pXQpCU2jHudyKCc
	 vvh0RxJwdaxNFEv/x/7zW3BSfvQLZR8Tq33ZW0Ja3gFwMG7mae2zy3PSrir0x+oGGJdt3
	 wFko8by6N74vvBuEMsTAuoAHTyrTZK8798nCIvtOCdkxS15E9W2LNKLfeJfq0XLZDz0HH
	 Ux5Mu80WT5Z7l8HO4xcbb8klbmDyXM8tfJpavPtQgVaZFjkfmo59JaYl0eoEBbzchecsi
	 l//M/afnpCn5A384ZTpWXhDY+Rn1QJVlYrBXWXbKSjFhneTymINx864k0oC1f/8gWSo2f
	 4CKx0N6DpWhcqPZuQkfL4lQxWeu9YL5mhRemJv7PynZYzGXt66vFMx3hHU0TkA5MOldfs
	 XJePDQs2fnBekeQR3sYoVY2GtxTlM+X6Tys2/iqKumORrxEI+FbLvgbVwEtfSH8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793086017;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=nE5ezc6sMX5qgETh/sc+Htd7hJpEx+RLXPTxbs7ktBI=;
	b=4LjDyEkhSvoZtSyd3E+VKdu5dMPLcXRfEnfUa9re3cnQ2mJcmyMN1vl0xsWkmuyxV625
	 l36I+FyjsljuKSTYwoq71T6LHsJseH9nrGUB2rpTltAhJceDouuL2rOzCG1NwHq83z1PB
	 f8hJvR2MHyCjV+wgxbJ2soF7YYpHsF87OHlPWC1mUlQXwEmIViINVZiF0A1KEIXub9y9u
	 HYdGi9OaMui/njdn7NR87XrFH8wuvPSncZhxHL3eWuDOdUIrKfnNa+lE3gNXW+OqRaBd6
	 FLP8v2d21juTKky1/swptzqCbthV+zyhtoeOdxVdTDvV3Dah44ZMJC5z9RhmqgEAtg6vJ
	 5fujOUj2KJsAdjjbvxY7xUY2ekUWgrWcSNsBBFJdmalTpjUUjyaeeKiwLT9nbshUd6PfZ
	 CZFeaya5y+bYy6xBtDwI7DsD6eCdjuqslYxPL6JsGYdIrMk2IvX9SKdffDpBF+1AYXkcj
	 u+SXKahxDmNYIodvNEOLb/XkW+J75z6WGOf7HNAcSsU/VU2vxmmrRBTrXKPTtZcoRa+Ay
	 LozEAq1VAZ1QZt+fy1xxVI22Q6AUwL/Z8vtPQ+ebVtmGJdN7eA7ORdP8AtF0rjM2VVGS3
	 lZWM9dbJBiU56xJKOv8lZFcEPUtxcG6ytu1WYQ5APZ9pin9Roi7UJ1Ovz32/3oU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 08:26:56 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v3] automation/eclair: generalize the noreturn
 function-pointer deviation
In-Reply-To: <d0af5523cf21dc3d8da6cf0e765fb34a664f7f1c.1792399445.git.dmytro_prokopchuk1@epam.com>
References: <d0af5523cf21dc3d8da6cf0e765fb34a664f7f1c.1792399445.git.dmytro_prokopchuk1@epam.com>
Message-ID: <e23ab1b67b60df32ad262a321da71e93@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1793086017-6CEDA4E9-4B343F01/0/0
X-purgate-type: clean
X-purgate-size: 5428
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-19 10:51, Dmytro Prokopchuk1 wrote:
> The R11.1 safe cast only matched void noreturn (*)(void *). Accept a
> conversion where noreturn is omitted and the signature is otherwise
> compatible. canonical() covers typeof destinations, and
> compatible_deep_unqualified keeps the parameter and return types 
> aligned.
> 
> Discarding noreturn does not change the calling convention. Code after
> the call is unreachable when every possible callee is noreturn. Leaving
> that code in place is a tolerated Rule 2.1 violation. The full 
> rationale
> is in docs/misra/deviations.rst.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Nicola Vetrini <nicola.vetrini@bugseng.com> # 
automation/eclair_analysis/.*

> ---
> Changes in v3:
> - Reworded the deviation text per Jan's review: "noreturn omitted but 
> an
>   otherwise compatible signature", "all of the possible callees", and a
>   tolerated Rule 2.1 violation
> - rules.rst: use '(void *)' spelling
> 
> Changes in v2:
> - do not claim that discarding noreturn leaves compiler behavior 
> unchanged
> - write that code after the call is unreachable, and that Xen's 
> behavior
>   is the same (whether the compiler deletes that code or leaves it)
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl |  9 +++++----
>  docs/misra/deviations.rst                        | 12 ++++++++----
>  docs/misra/rules.rst                             |  8 +++++---
>  3 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 6cdb10a129..c7a800c62f 100644
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
> function
> +pointer with noreturn omitted but an otherwise compatible signature 
> does
> +not alter the calling convention."
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
> index 6bcc2adf95..76be6b3251 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -392,10 +392,14 @@ Deviations related to MISRA C:2012 Rules:
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
> +       with noreturn omitted but an otherwise compatible signature 
> does not
> +       alter the calling convention. The callee does not return, so 
> code
> +       following a call through the resulting pointer is unreachable. 
> The
> +       compiler may delete that unreachable code when it can see that 
> all
> +       of the possible callees are noreturn, or it may leave the code 
> in
> +       place. Xen's behavior is the same in either case. Code left in 
> place
> +       is a tolerated violation of Rule 2.1.
>       - Tagged as `safe` for ECLAIR.
> 
>     * - R11.2
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index a59cf1782e..5f9fe4c860 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -435,9 +435,11 @@ maintainers if you want to suggest a change.
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
> +       and '(void *)' are permitted. Conversions from a noreturn 
> function
> +       pointer to a function pointer with noreturn omitted but an 
> otherwise
> +       compatible signature are permitted.
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

