Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1081CC79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 13:13:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413073.1643330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4I72-00034K-Hx; Wed, 09 Sep 2026 13:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413073.1643330; Wed, 09 Sep 2026 13:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4I72-00034D-F3; Wed, 09 Sep 2026 13:13:16 +0000
Received: by outflank-mailman (input) for mailman id 1413073;
 Wed, 09 Sep 2026 13:13:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x4I71-000347-Oc
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:13:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4I70-00GyZs-T9
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:13:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa15b5f-bab6-0a2a0a5309dd-0a2a4506e2e4-16
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:13:14 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa15b6a-195a-0a2a45060019-a237832fbe66-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:13:14 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6FD744EE0060;
 Wed,  9 Sep 2026 15:13:14 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1788959594;
	b=hixid/nfu0DeRYxpIsUpAiRXT5SrL/MUPtnaebYcpk2lR8OpTMcw36XASYvZ9hu60ff4
	 w6MM3Aoq6CO46VugUnNss5dLiX2uj9CcLMD3MFDfY4C+t7yf7QPLsAjUUjucMSAHUgTeh
	 YgETkrIvyYPf8I5hKQspJcuMO/nvc99MeFuyiWqg/57EsoP4/k761CmzYhH9Bia3vXWeE
	 G+EDwXrPT1xY0t6MjgPi+ym3D7pUqug36ksqAplLqoAjdvEm4W/qpUliJi53pAUpgO8Nv
	 SU23N1KH6fEak9pp6tQ2e7hEJBYNUqJjPTuRj0f14yRtZUDRsa5eZLg47r+50J4X8aLfG
	 rbtIm5XqfzIUCWLWRN1ecyIulS5hNHxU6TcasBlfu/yFGdGwt2A1EKmEAlPrCM3KBniXw
	 Qi9BPxthyDl/NpgTv4CQ4E6uJcUqKZ26+FYLRDg5vBTuJsBU3QWkCbmepc1pK/LiznKXO
	 CBElrFJnaNnfKsubSLMmZYmmR3u9ETop39cc175ZM7AGSU9yzj6UXeNq7q9CTqJyB1pjc
	 UBRevfXD316L9fOEt79XgyrloPBg0dsgD9YN7K+O6IeHSti0fc4dgNrL3LaHXCKRSezUn
	 em4lrbHLbHZG9l/ZLUu7CjX9xm1K9gtFRqikv2uKMyM7qiBwobTcfILdg/kUDrY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788959594;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=N45BUT9bQLoOghpSgU8eM6kYG4cRMsUb3+R1YEfzTmw=;
	b=o9Cx/eci/4ZwjzPT9HCbJl4VQeuwBPTASDgcz2hxDZtc4H5kZnAQj1GV2hY1xacX29H6
	 ZnLihVPRfhUWxFEvgROIvUye1GzAnJhuTdPXKVXGpBHuuverKCP3QER4J3NcEWopmFcR9
	 r3gyLhiUPdpF10SNygRe8GcQ6lK3otWW3GNfNLMujZqee1yYJgVf1R4+rGpvCvrRyqdsf
	 lECZIh+LHR3vfQLB7eekeRs6pf0YHFtS1odb3GqN7X4xT5sE1j/jc0yprCC2hougjheSv
	 PngNmwWJkG/xXYvWAj3zDG90UM7WnOfrQk55rtrjgStm5Mx0jmomHOYINTZzPJz/AxhwN
	 B7j+rpC+Z+vtw1OGTAZlG1jpI9nK01Mwl+jP/5ityZvl2U9akBF9PdMYlKjU6Di4aEBWs
	 XGgpK/teOMfrF/cMGDtDD8LhiXvGUGWrGf1e9G5HIioIw/GJrpl0wFmB9kY53p94li6gD
	 ti6IhmYf0pm6amJxCQcfFgbIM9g0WN6LSOq4mQwoJunZ3Wdq1YWU8Er0m34XqCPfJEKF4
	 MbvFjM5AvJXkO+rT+xY18un0sMDKSBKLyEBvH01mCcE5OeWJf2YvRx9S/BAb7rhl0yZdG
	 F7+PwwPF25aqF1O3x2NfW4hAYjFZ/pa8XjbUX5HNSMDJGXu4kgp/GeHJC/3BClE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 15:13:14 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 5/6] x86/Viridian: annotate Eclair false-positives for
 rule 18.2
In-Reply-To: <08038aa9-6902-4070-b49c-0a9ff113c786@suse.com>
References: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
 <08038aa9-6902-4070-b49c-0a9ff113c786@suse.com>
Message-ID: <c9c787931b19aeff84a5aaabe557c7fb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788959594-F667277B-BCC0AE2A/0/0
X-purgate-type: clean
X-purgate-size: 2399

On 2026-09-09 15:01, Jan Beulich wrote:
> "Subtraction between pointers shall only be applied to pointers that
> address elements of the same array" is not violated here: 
> start_stimer()
> is only ever passed a sane argument, and stimer_expire() is either 
> called
> from start_stimer() (using its parameter as argument) or as a callback,
> where a sane callback argument is also guaranteed to be set up.
> 
> Suggested-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> As per Nicola Eclair 16.0.0 has this fixed.

Perhaps I didn't express clearly that the remark was about the violation 
annotated in patch 4/6. Here instead, a suitable reproducer is not yet 
available. Nevertheless, if the claim is true the approach to address 
the violation is still ok.

> 
> --- a/docs/misra/false-positive-eclair.json
> +++ b/docs/misra/false-positive-eclair.json
> @@ -10,6 +10,13 @@
>          },
>          {
>              "id": "SAF-1-false-positive-eclair",
> +            "violation-id": "MC3A2.R18.2",
> +            "tool-version": "3.14.0",
> +            "name": "Rule 18.2: pointer subtraction",
> +            "text": "Viridian stimer index calculations use sane 
> pointers"
> +        },
> +        {
> +            "id": "SAF-2-false-positive-eclair",
>              "violation-id": "",
>              "tool-version": "",
>              "name": "Sentinel",
> --- a/xen/arch/x86/hvm/viridian/time.c
> +++ b/xen/arch/x86/hvm/viridian/time.c
> @@ -136,6 +136,7 @@ static void cf_check stimer_expire(void
>      struct viridian_stimer *vs = data;
>      struct vcpu *v = vs->v;
>      struct viridian_vcpu *vv = v->arch.hvm.viridian;
> +    /* SAF-1-false-positive-eclair vs is always sane */
>      unsigned int stimerx = vs - &vv->stimer[0];
> 
>      set_bit(stimerx, &vv->stimer_pending);
> @@ -146,6 +147,7 @@ static void start_stimer(struct viridian
>  {
>      const struct vcpu *v = vs->v;
>      struct viridian_vcpu *vv = v->arch.hvm.viridian;
> +    /* SAF-1-false-positive-eclair vs is always sane */
>      unsigned int stimerx = vs - &vv->stimer[0];
>      int64_t now = time_ref_count(v->domain);
>      int64_t expiration;

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

