Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34C4606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 10:49:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1461090.1672040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIGc-0001UJ-1A; Mon, 26 Oct 2026 10:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461090.1672040; Mon, 26 Oct 2026 10:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIGb-0001UC-Ud; Mon, 26 Oct 2026 10:49:25 +0000
Received: by outflank-mailman (input) for mailman id 1461090;
 Mon, 26 Oct 2026 10:49:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xLIGa-0001T0-Qw
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:49:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLIGZ-00Cpdf-36
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:49:23 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6adf3026-bab6-0a2a0a5309dd-0a2a4501a5b8-34
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 11:49:22 +0100
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6adf3032-5984-0a2a45010019-a237832feddc-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 11:49:22 +0100
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 961EF4EE009A;
 Mon, 26 Oct 2026 11:49:22 +0100 (CET)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1793011762;
	b=FC9yYpFOo78Hl/+J7mOA3jW+Zj+B7TXPM7Lup9BVz8Xq3ltJpQoFC/LOhPGGbiTfH0X7
	 blENp7g4WMyfgEwb45ZpWEacjBwhv3vptBnSn2OJDJdK+tGMV9He4lNS/g6mlgJuG74Cn
	 o0ueBWTv1AANHigYp2MW0MQ30t5ZTDTl+rmFH9QV7Intfo0OGyehax/6FVerXhaIxSbgi
	 89fzmRQ5sOJZ9PBiAmWFqvojbO/g34LmQeGUDDvocetKPWF/jAr6OSTcyZuuizSSSN5Mp
	 OolmHnHOqbajvBZEjSU+BOKTMC/BJOC/cfdZWf6nO9E3GKNmRefBHOuaMqD8ch5xDLf4X
	 aEIUHAhMtcGK25FTabIDvjjusmqASK5r3IuW+RC8cODeLOHJ7kbEYPg6fzbFk2qpTD2EJ
	 Q9qSzobqQOwaf8GrTEd+gxCuiuk/Zq+Fum712Q8P7PLVke2cCHh7iitEAwbIhtxeQdkKk
	 hpycTADNPzh5pjjpOuU1Q2DAIlMMlq5kFwy2SSDYPGtpCCj8WFsy5Ppdzl+m7ahE0Krfj
	 7uRXuV9PWJeC3aKs7Dz6q2tt74LiIONpghHglHQ4J6V0iWvJqGtMyfy9AkJtGJ1ojQaU5
	 g67goTrNkhliBiTnmyilmKZjKUAMyoIr0rxLhxBYklu4nZp+O3mfvMXSaqs7TFM=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793011762;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=pGeqiRbBcJZmwJHs0M8oZ31tUUfyu6RxU8e5//3ky9k=;
	b=x1VidAV2Z1l+thqyHYEI219K/UX/odTdZrjJiGu+EmVdsg5H35xtLDniI+6DbkJsAk7M
	 wZCYjXLBAcy5WDHapkKnsiM1xAl/eAG2lQyUcfn8jeM+33aasX7KmMnqSeE7p18M/Rfcg
	 p0lbmQH0jv/Zd9rZJhfteuAyihfQZeWGMP7W2aiApSMBsfzdOR8YFGYgVoPaxzfIhwrOC
	 lBoV0B9ibC0jSWaaALOc5Ux4PHkY/J+8ItWmxozlnssWxIpLppPsJXfr0wvcvB57vv/Yd
	 rAgiQnIYfTQ74/vtuHtwgNoqPaLhzJVhlBDGRArbnOPvlWGZ8vVY5fxE+P2/vLFydqlFD
	 +FMFm2H7fGUmlxTbrptpRp2wbCKzvfxJVUYv1mwXyqauff6OTWre1BKHVtpN6hTXuXTzv
	 e0LyKyzHnaDhEeBUTbSGQqkd0Trk94PBzmg9Z9ywoVu1r8Fz/Tt4cTHGAmNzblsVB+oiO
	 vGW8ajZDmt2AxhmdnM+3+D79s16OlVp8l5xgExjDc1mEm/PSxoNAeegreVIffx2+COstY
	 znEaRmgCA0BfA5F5Fd9TRh8UvHRKj5Uq1Rtzlpq1KKzcI3wd7cgAox/XZeecwDpv/sTen
	 V+lmuB1Emhu+hOMbXnL7+jiqhUweVLkS/CDJmQ/dVJUgDH02zUoDturtTKZ4KzE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 11:49:22 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Shuaidong Chen <shuaidong.chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Doug Goldstein
 <cardoe@cardoe.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>, Penny Zheng
 <penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>
Subject: Re: [XEN PATCH] misra: merge the two R14.3 invariant-condition
 deviations
In-Reply-To: <20261026030309.2507461-1-shuaidong.chen@amd.com>
References: <20261026030309.2507461-1-shuaidong.chen@amd.com>
Message-ID: <806ad55d683fcef1ec04c7b90965b363@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793011762-BCB45757-20D8D37C/0/0
X-purgate-type: clean
X-purgate-size: 3740
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-26 04:03, Shuaidong Chen wrote:
> MC3A2.R14.3 ("Controlling expressions shall not be invariant") is
> deviated by two separate entries.  One covers 'if' statements and
> conditional operators and places no restriction on where the invariant
> condition comes from.  The other covers 'switch' statements, but only
> when the controlling expression is a 'sizeof' operator.
> 
> The rationale recorded for the two is the same: the condition is
> deliberate.  Nothing about a 'switch' makes an invariant condition less
> deliberate than the same condition in an 'if', so the 'sizeof'
> restriction reads as an artefact of that entry having been added for
> read_atomic() and friends in arch/x86/include/asm/atomic.h rather than
> as a considered limit.
> 
> Fold switch_stmt into the general entry and drop the 
> 'sizeof'-restricted
> one, which the general predicate now subsumes.  Invariant 'switch'
> conditions that are not a 'sizeof' become deliberate as a result; that
> is the intent.
> 
> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>

Assuming maintainers are ok with this relaxation:

Acked-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++------
>  docs/misra/deviations.rst                        | 8 ++------
>  2 files changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 7f3fd35a33d..08a88ddfa62 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -472,12 +472,8 @@ activity."
>  -config=MC3A2.R14.2,reports+={disapplied,"any()"}
>  -doc_end
> 
> --doc_begin="The XEN team relies on the fact that invariant conditions 
> of 'if' statements and conditional operators are deliberate"
> --config=MC3A2.R14.3,statements+={deliberate, 
> "wrapped(any(),node(if_stmt||conditional_operator||binary_conditional_operator))" 
> }
> --doc_end
> -
> --doc_begin="Switches having a 'sizeof' operator as the condition are 
> deliberate and have limited scope."
> --config=MC3A2.R14.3,statements+={deliberate, 
> "wrapped(any(),node(switch_stmt)&&child(cond, operator(sizeof)))" }
> +-doc_begin="The XEN team relies on the fact that invariant conditions 
> of 'if' statements, conditional operators and 'switch' statements are 
> deliberate"
> +-config=MC3A2.R14.3,statements+={deliberate, 
> "wrapped(any(),node(if_stmt||conditional_operator||binary_conditional_operator||switch_stmt))" 
> }
>  -doc_end
> 
>  -doc_begin="The use of an invariant size argument in 
> {put,get}_unsafe_size and array_access_ok, as defined in 
> arch/x86(_64)?/include/asm/uaccess.h is deliberate and is deemed safe."
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 32713172067..99a1b2332c2 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -458,12 +458,8 @@ Deviations related to MISRA C:2012 Rules:
> 
>     * - R14.3
>       - The Xen team relies on the fact that invariant conditions of 
> 'if'
> -       statements and conditional operators are deliberate.
> -     - Tagged as `deliberate` for ECLAIR.
> -
> -   * - R14.3
> -     - Switches having a 'sizeof' operator as the condition are 
> deliberate and
> -       have limited scope.
> +       statements, conditional operators and 'switch' statements are
> +       deliberate.
>       - Tagged as `deliberate` for ECLAIR.
> 
>     * - R14.3

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

