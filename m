Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EF8C88E53
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 15:09:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1418790.1646509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5PLm-0007gq-9J; Sat, 12 Sep 2026 15:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1418790.1646509; Sat, 12 Sep 2026 15:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5PLm-0007gj-6H; Sat, 12 Sep 2026 15:09:06 +0000
Received: by outflank-mailman (input) for mailman id 1418790;
 Sat, 12 Sep 2026 15:09:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x5PLl-0007gd-4y
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 15:09:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5PLk-0042ST-ID
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 17:09:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa56ae9-8faa-0a2a0a5109dd-0a2a4508e81e-14
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 17:09:04 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa56b10-f659-0a2a45080019-a237832f8d60-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 17:09:04 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 170184EE0097;
 Sat, 12 Sep 2026 17:09:04 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1789225744;
	b=LJYESk4J4p+XnQTbNXqgJGilJi312ySvRVaXS2sIk7mVZMqluWb/UlH8HVj70u4k408B
	 +gHytz7aqKfvSCg4g6ORBAkpL3PBi1gBIyexuxu+CTgVd0aY4qVr1KmgyLKXfHrMq5HBz
	 KPjUX6fyyGgxorZTc8QsNxEkodjkayxBReEPK3zmllu2M5yGWZ4Uv09ZitnhC4t5r9giq
	 xPG61BoAa18lvgKMhy66UNHfoOhS5COY8NFQN825GjKLA6AIhBL1n/wyiUPXULbLSX1TB
	 uvL5knFivPXA1c+fakh1Xh3jFTR8b+D1L20eQW4G2jIt3SODK72/wEtH3z1GT3bJz+sIR
	 gC/lXMCJenlzTBdTQdbKGhHHcpGZ+upBE0FoaNKenXLWJ4lZGrPxHrUzWlwE4vjRVoeOE
	 +uVXYgrPmkn+dB070HE5xvjAxnPXpEtJ+nYxrLFCc918eWhv++oy+x4tMD/mdFZyNie9r
	 uF7X9b1/CsRn+ZpUgOnsRKF8cyIGl2zunS3pGi74tRMKm/goHRGnNqrz6rsxf814lekki
	 ocsWMMxS8Nw6kLEa6IzNB8jM62FdMSMr6P1JfmZJS/rJn0ip6BJDb5buhU32WeG6hRdcf
	 f0N+EocVjCyNKFf53JkY6UoFso5HcNSiAcLku2FWH1+y08UqBBnmcas0E/nGC0w=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789225744;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ejPTY9h43ECeayBtlQG6CqAEIQZT5Y2gmubrHLJQH+M=;
	b=417MyG5HjfeqkAlSV9uyMZmU5bUrY4HF2/kRZxo535W3w9fkwXJeZ12dZB+Jf944ZCJX
	 ehFdlpEUasQWdAvAKbyrU/sXKYfFJwevUK8kaptjOHBJkZ8lswtsT6MBPUVJ2kGGQEsyQ
	 wTKOadBapvaCHA3efHCK1/0tli/dy/q2dbJEdLaYWSr6GtUxnf/TDJZ913G0ohZOeAiwX
	 Zdo9qr0snHsoXFXnKdnCYK+O9UjMopdFr84ZbBzUs/cjOTgHFgDPWoMbmB+88WwXtctal
	 hBnUfnePbmmSZIt5mlADuN9scCTK7qPYZl587m3XJEL9BvpxNkn4HKvKTnAq8YtIhhNjX
	 bGc9ElqWspObrNx6aN7YubJwiiLMnYGNywZjcGNyPzj/epULqwvVLatfccOP8OqnycdOH
	 pzCDDkz15Y0VnESiaurHcz66DucBk2etHgDpOFPEVByu4C3pnECPSCXGnpttUOaTJMCeo
	 JxwAwiTph15Ybqa/+lG6DpDaOzWIJVish1EqTws8hDo2sHpv/dIBmeO0G6ddV6KC6U+8c
	 c20DsohYGtA/gtTjS85t52vgYtERypB6ta1PL5Q1CZj0T0bS5SG5HweJW08SfvtHldMSZ
	 PKATo8sASDQ9PQDvrACY5QGCxOHbkE/NYNnzfVpTHfZqqJbR5k2JGPq/ZPWqPs8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 17:09:04 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 1/4] x86/domain: address Misra rule 11.1 violation in
 reset_stack_and_call_ind()
In-Reply-To: <be5f65cc-332e-4292-9b63-33196cc8ce81@suse.com>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
 <be5f65cc-332e-4292-9b63-33196cc8ce81@suse.com>
Message-ID: <bddc66b1fc0936a9a85365969f17254c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789225744-D694287B-7BAF051A/0/0
X-purgate-type: clean
X-purgate-size: 2071

On 2026-09-03 13:43, Jan Beulich wrote:
> Eclair dislikes both sides of the comparison to differ in noreturn
> attributes, thus deeming this a violation of "Conversions shall not be
> performed between a pointer to a function and any other type". Since 
> gcc
> doesn't permit use of "noreturn" types used in a typecast, resort to
> typeof().
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> ---
> Really Eclair's diagnosis is misleading here, and not only because of 
> the
> missing "noreturn" there, making both sides be identical: There are no
> implicit conversions performed on this kind of pointer operands of an
> equality expression. A diagnosis of "comparison of pointers to 
> different
> types", along the lines of what compilers use, would be more to the 
> point.
> 

The point here is that the types are not identical, if you consider 
noreturn as part of the function type (as clang does) or not (as GCC 
does). This is the reason why we err on the side of caution and diagnose 
this, and it's not likely to change in the near future. Perhaps we could 
make the violation message more explicit about the motivation of the 
mismatch.

> --- a/xen/arch/x86/include/asm/current.h
> +++ b/xen/arch/x86/include/asm/current.h
> @@ -208,7 +208,7 @@ unsigned long get_stack_dump_bottom (uns
>  /* The constraint may only specify non-call-clobbered registers. */
>  #define reset_stack_and_call_ind(fn)                                   
>  \
>      ({                                                                 
>  \
> -        (void)((fn) == (void (*)(void))NULL);                          
>  \
> +        (void)((fn) == (typeof(dom_xen->arch.ctxt_switch->tail))NULL); 
>  \
>          switch_stack_and_jump(fn, "INDIRECT_CALL %", "b");             
>  \
>      })

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

