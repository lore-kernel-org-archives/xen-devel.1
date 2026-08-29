Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A4DC61DBE
	for <xen-devel@archiver.kernel.org>; Sat, 29 Aug 2026 14:05:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402852.1637645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0Jfp-0006Yx-RP; Sat, 29 Aug 2026 14:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402852.1637645; Sat, 29 Aug 2026 14:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0Jfp-0006Yq-OM; Sat, 29 Aug 2026 14:04:45 +0000
Received: by outflank-mailman (input) for mailman id 1402852;
 Sat, 29 Aug 2026 14:04:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x0Jfo-0006Yk-6c
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 14:04:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0Jfn-00HHO4-Ey
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 16:04:43 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a92e6f1-2eae-0a2a0a5409dd-0a2a4508909c-2
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 16:04:43 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a92e6fb-f659-0a2a45080019-a237832fc068-3
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 16:04:43 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id C71EE4EE0060;
 Sat, 29 Aug 2026 16:04:42 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1788012283;
	b=McTwEUebFObeKEVigMbKpOIXwZRDo29CsdbGhfQrGTyGxdalmyUXpADoQPg5Dj6bTab9
	 9v19MeivsBsq343sLyLIjk/kPxtzpEVxdotFmeQmtzdrz9p/6ev9iLTEgMt5fQpEf1M59
	 iQihR777jb2A534M6T8sWmHBYDpShNOC08LhrPsnoXK6m9aSsrh/xMPdzaXGJ2ztxDO5Y
	 6KtgzEMsvav8ZMtkh6fAdsIGaFuvT+9XlpIsGBFkqCB4tKZv0qdEkIJKeVHC1jxQECfzg
	 WghW9yDUxnTa7dVy/H4BkdQgMT+Yk7Y0RNSNnsMjSg67EKABRuyKioxJxJIZHSogo/QsE
	 6uo1doGUJu8d+5cEKuODUahA80UIR5wpwt/tIej5L8V52K4fYfK+lB4KDUA+TDxWAdvRv
	 7WSNiUeDCGzdVTAYlQlifwsjXWMNy864y4q0RC7vlyNfIWxbXoqM2Zvlrz1wjfANUHsOx
	 U8NvJLa/iEQGiC2zOwJMBqrNKyD0k8h5GJPz55uX9BNi51hIxGrAn866UZCuA6/FrTo2Q
	 +iDc1F5tBD8a3Bo7tKzm+nMkigjOlfyx1lBdipsdfnZwTuPyR0X2+etPI4/Nt1TnM6kx/
	 vM5s6z+p7dIp75IW16IZUHIxpsH3ZS8qn4/WsX3DUOacuq6aC3IO+q8rO0L76xg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788012283;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=YPq55LcariTfRIgkToCnifE9romNqBh34Zbm15cX+N8=;
	b=Bgtu9QbAuanLWeUc+YiMedoRGpq0TLTfiisknIbjDXOIwcnU/XAqc2EP6E2mhXEzdjZu
	 WbFrzlFgxjJiXA+g3H8l3H/VsOZBZyeWZV1fPqLtnupWJD0I4D2urz7qNbD9XP65NcdA0
	 4uPA6TzMwSJi26woKcJ4wqqKBg7n6LilmsoyPeS6dH2DSenjqwbkurmEg3yirVEbW04n9
	 RuLdQt8JooEvBvTvmm0xsYHr2h8nh+GNRdmzjGGMLb1v95FqEhndPFWz//XRZfODi5YdT
	 rrTF9FZIa6MJr6SE1xpjucmfzmoZ9XrbgIV2AZAsBM/BJ9xPhawF7166HfTa3BAYOXOJS
	 xiBWwmhO5xHkuSMIf+2LCI2CNsAsEwMTwYyxg4jleJXvWJR5gDXWRRmDQNBYeQY8U8KAb
	 RbqVhsFCnrfBFNIaiFXW0Ywo0OhYNGf380QK3BLnnYEwUAG3k155n3XFH/X2PGMPJCn+u
	 XUUVEjfLeL3CXUXmJabuq+KlF5QEBscNXGDCHVwNV95jFxOkH5jEaTzKUKuiWLGbFCWO2
	 cBitMp22B/SCHMQAdnOUm3Jc/7fWoZ/09V0t3iyUxNH8IKNJf0RO5V0jV3fxfP9Qlan4Q
	 LKqX1CAOK7dX4M9Dt/vlp52MPPiGgdtv7QuwVgQeEZTFbwkAJr9ux9CTK0izIo0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Sat, 29 Aug 2026 16:04:42 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 09/12] Eclair: deviate BUILD_ERROR() wrt rule 2.1 and
 introduce variants
In-Reply-To: <06c5efc0-e130-417f-8333-b8eacd1c6d77@suse.com>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <06c5efc0-e130-417f-8333-b8eacd1c6d77@suse.com>
Message-ID: <99c8a63920c37dafdfeb2a2a4333df72@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788012283-D4B7187B-86E94913/0/0
X-purgate-type: clean
X-purgate-size: 3112

On 2026-08-28 09:04, Jan Beulich wrote:
> BUILD_ERROR() is even stronger a guard than assertions in general, and
> ASSERT_UNREACHABLE() (or BUG()) in particular. Deviate it just like 
> those
> to allow use for marking unreachable portions of code.
> 
> In some cases code being unreachable is dependent upon configuration.
> Introduce two variants, as constructs like
> 
>     if ( IS_ENABLED(CONFIG_...) )
>         BUILD_ERROR("...");
> 
> results in the if() still being reported as unreachable. Sadly these 
> two
> new macros introduce a new 20.12 violation each, which hence also needs
> deviating.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Presumably you did not fold at least one of the following patches where 
the construct is actually used into this one to separate concerns?

> 
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -19,6 +19,7 @@ Constant expressions and unreachable bra
> 
>  -doc_begin="Unreachability inside an ASSERT_UNREACHABLE() and 
> analogous macro calls is deliberate and safe."
>  -config=MC3A2.R2.1,reports+={deliberate, 
> "any_area(any_loc(any_exp(macro(name(ASSERT_UNREACHABLE||PARSE_ERR_RET||PARSE_ERR||FAIL_MSR||FAIL_CPUID)))))"}
> +-config=MC3A2.R2.1,reports+={deliberate, 
> "any_area(any_loc(any_exp(macro(^BUILD_ERROR(|_IF(|_NOT))$))))"}
>  -doc_end
> 
>  -doc_begin="The asm-offset files are not linked deliberately, since 
> they are used to generate definitions for asm modules."
> @@ -667,6 +668,7 @@ deliberate."
>  to the # or ## operators within the following macros are deliberate, 
> to provide
>  useful diagnostic messages to the user."
>  -config=MC3A2.R20.12,macros+={deliberate, 
> "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO||RUNTIME_CHECK)"}
> +-config=MC3A2.R20.12,macros+={deliberate, 
> "^BUILD_ERROR(|_IF(|_NOT))$"}
>  -doc_end
> 
>  -doc_begin="The helper macro GENERATE_CASE may use a macro parameter 
> for ordinary
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -64,6 +64,21 @@
>   */
>  #define BUILD_ERROR(msg) asm ( ".error \"" msg "\"" )
> 
> +/*
> + * Like above, but conditional upon @cfg (not) being enabled.  @cfg 
> must be
> + * suitable to pass to IS_ENABLED().
> + */
> +#define BUILD_ERROR_IF(cfg)                               \
> +    (IS_ENABLED(cfg)                                      \
> +     ? ({ BUILD_ERROR( #cfg " unexpectedly enabled"); })  \
> +     : (void)0)
> +
> +#define BUILD_ERROR_IF_NOT(cfg)                           \
> +    (!IS_ENABLED(cfg)                                     \
> +     ? ({ BUILD_ERROR( #cfg " unexpectedly disabled"); }) \
> +     : (void)0)
> +
> +
>  /* Hide a value from the optimiser. */
>  #define HIDE(x)                                 \
>      ({                                          \

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

