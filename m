Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FBBF9D0C9
	for <xen-devel@archiver.kernel.org>; Tue, 14 Apr 2026 12:05:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1281701.1564564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCcVh-0005Pl-EP; Tue, 14 Apr 2026 12:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281701.1564564; Tue, 14 Apr 2026 12:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCcVh-0005Pe-Ag; Tue, 14 Apr 2026 12:04:53 +0000
Received: by outflank-mailman (input) for mailman id 1281701;
 Tue, 14 Apr 2026 12:04:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wCcVf-0005PY-Pp
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 12:04:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCcVf-009KLV-6t
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 14:04:51 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69de2d5c-2eae-0a2a0a5409dd-0a2a4504c700-36
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 14:04:51 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69de2d62-bb33-0a2a45040019-a237832fa4e2-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 14:04:51 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D11C34EE8D50;
 Tue, 14 Apr 2026 14:04:50 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1776168290;
	b=znbrPan31mdDDHdVtmu6dWk8WqZ1Q4SrB14En764rUvEbfjGN9nQR4hjZPCJtW7aS4Lp
	 eOdge/ytg2jeta356aJOgtQyUhiV9v/Wmgn8V+941EitL73XAQdXUKIanKMmAjlJXTNdd
	 qJPh7raabU55f3pqSF8h7H7oJHem4lR1hBGA217r9cFxYZM4JNgMEdcuHPp/TKj/rtV6A
	 VlVWmHrwt9KAPjwwjXMAa7vhZ+dOP5JXPfdNitjuptDHl0hAYFA0j+SMhUMEYDF7EE4Px
	 xz+TR9q3VTbyFF1uVrGzfoJaJrOlX0mA+lb0/qqSFP771BiYPNutTw5elPwpbZLBoHpvs
	 DL5qQhNa9GUy8WUIqM2iLK5lbS7XyEngFyQJIZjRISZc4N1S19TpJbGWYRMBUAT2ZRqUx
	 B1CzEN9Qq+iKVloRPKxL2vSZ/Ih4DJuplf9OIVorTuTuw+GW2ihwp+dz8cTSSEBeB5KSs
	 kWgRYXWMUZz4UVkAVunowzJZ/1JoroNJ9asFeeZztLoJ4ACpsCt2HfzbUFQJVzO7MvpLR
	 +mBFpWAyNsY7vEiZxyhox86dYBkdl/sCEgjpbqDsoF/kUS9b5I6HDHi32kD9t665e532B
	 SRBSRlc9bZ6woWKDonN2ZpNjCaSpoFVlr8Tq/6zNG1VmsPbYf4KBzzVg1nbFpWc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1776168290;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=JU4pvPTIQQJuO3ucPW6MqZkZAJcCu5Tx5uiE1Cgg+EM=;
	b=RmusjHEqebKyWtX0QgrExWGoW2TgaKeU8jWwU9cnyblA4eIF62/ZrAuon0KJfz643s5A
	 JbGNLirFnbMU55jXuYRta1H9108noFriKNuR5pe8uMpOWlEXXBpd48jnpPwf6Zksij8N8
	 hlV57s6RGqOwKxRDitbYmVt0h4f+njzCUP+S8N8oCH6FaSFrC5/QqOaQnT3jgkHizikiK
	 X8kTpEljpsxQSWdx5fG7tsnuGfCCd0Skmtx/mnjoi+RrVd68wZwAvt8ROth95lvTTQqwX
	 RiP/mXXYJg4hk9FA8rirQgwy47eLM5hsZLWRwbn/nGYQ/Gyj9vctZ0T9hPS2u1/VkJKYk
	 by9u/EjBJvPMXNgl5JJYcNeo1ELRpBavXB7X7bLGWBdgCripRRQ6teO/WpdUczCz+WmN9
	 sGk0VpnN5ROzJnbh6hhJi+Pa/xbxpyz+5KQqlI+fEJMhUg1dfYhRn54J86a+wx0ZrQWuX
	 2/XsgaKowePkaXmkohc+0DYNQ7oszUVsFVeBpyiAUDihpYzipfdwTo+1HT4DI4YIiEsy5
	 0SEH/fqQ4A7oX1XBRztkdc0k0SRj1r0ZRYF8XPWEBRf2NG/t2yIoxFiBkVHxenUabMkXp
	 Qx2X2vWyF5Um3ja7YNgZlHe+vLP/7Rpz8Bcmq8SNZC1gwLvsV185nMJ351xD850=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 14:04:50 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] automation: Extend eclair-ARM64-allcode and mark as
 gating
In-Reply-To: <20260414111656.72939-1-michal.orzel@amd.com>
References: <20260414111656.72939-1-michal.orzel@amd.com>
Message-ID: <68b7bb7e95e6ae92b976c98af1a7cab9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776168291-31F2651B-B3ED53E4/0/0
X-purgate-type: clean
X-purgate-size: 1352

On 2026-04-14 13:16, Michal Orzel wrote:
> Extend the job by enabling static memory, static shared memory and 
> early
> printk features. Given no more regressions for clean rules, mark as
> gating.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2451527401

NIT: pipeline does not seem to be public. Other than that:

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> ---
>  automation/gitlab-ci/analyze.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml 
> b/automation/gitlab-ci/analyze.yaml
> index 4e9af9d60224..b3f99f472d9e 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -149,7 +149,11 @@ eclair-ARM64-allcode:
>        CONFIG_STACK_PROTECTOR=y
>        CONFIG_UNSUPPORTED=y
>        CONFIG_VM_EVENT=y
> -  allow_failure: true
> +      CONFIG_STATIC_MEMORY=y
> +      CONFIG_STATIC_SHM=y
> +      CONFIG_EARLY_UART_CHOICE_PL011=y
> +      CONFIG_EARLY_UART_BASE_ADDRESS=0x0
> +  allow_failure: false
> 
>  eclair-ARM64-testing:
>    extends: eclair-ARM64-allcode

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

