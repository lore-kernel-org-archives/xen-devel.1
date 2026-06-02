Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5F5CD6E57
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 19:43:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1325412.1590896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUV0s-0007jW-1A; Tue, 02 Jun 2026 19:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325412.1590896; Tue, 02 Jun 2026 19:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUV0r-0007jP-UD; Tue, 02 Jun 2026 19:42:57 +0000
Received: by outflank-mailman (input) for mailman id 1325412;
 Tue, 02 Jun 2026 19:42:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUV0q-0007jJ-AD
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 19:42:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUV0p-000yzA-C6
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 21:42:55 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1f321e-bab6-0a2a0a5309dd-0a2a4504c01c-20
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:42:55 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1f323e-1dec-0a2a45040019-ac6904fed762-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:42:55 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7A8B860098;
 Tue,  2 Jun 2026 19:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89F41F00893;
 Tue,  2 Jun 2026 19:42:52 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780429373;
	bh=A20g0DYnwPA9DU+zwyH2wh96dcB5DraK8CrJUGAdDm8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ToP8wfXyComJ5oTw09xJO+LaGDkG9LL3Rc1dQd155ngtdaHWaHV+vjg4dPZnRwpaC
	 LFjuW1oN4kS6DXaurs7dclT329xCam/wQRbgO0rWKdAH6sLzCjJIICWDeu2H6P2btt
	 T5d2PnXs/nfwdF/i6Ez2XWtW+CFOOxBbsuDyaIKHvZEh1QI7+59jrDE7DmBjwlxrLA
	 DzRLHJOitax1l18UMDheEUgTjhplBNXxmYiVg39N5KDGFervri/0wkjYTsmoXtHAIm
	 9r4XnDjzzmyKckC1XimUdcR/XcekusrKkp9BR4vo4MleYltYPEFmxHxyTXvtA3VIpv
	 dLndIV3R4naVQ==
Date: Tue, 2 Jun 2026 12:42:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH 2/2] CI: Mark eclair-x86_64-allcode as blocking now that
 it's clean
In-Reply-To: <20260602174629.2649448-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2606021242330.550703@ubuntu-linux-20-04-desktop>
References: <20260602174629.2649448-1-andrew.cooper3@citrix.com> <20260602174629.2649448-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-195285751-1780429373=:550703"
X-purgate-ID: tlsNG-ebf023/1780429375-411763FF-8590947C/0/0
X-purgate-type: clean
X-purgate-size: 1376

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-195285751-1780429373=:550703
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 2 Jun 2026, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

Assuming the pipeline is clean:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/analyze.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 9bf032931fc4..673110d40ed3 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -62,7 +62,6 @@ eclair-x86_64-allcode:
>        CONFIG_XEN_GUEST=y
>        CONFIG_XHCI=y
>        CONFIG_XSM=y
> -  allow_failure: true
>  
>  eclair-x86_64-testing:
>    extends: eclair-x86_64-allcode
> -- 
> 2.39.5
> 
--8323329-195285751-1780429373=:550703--

