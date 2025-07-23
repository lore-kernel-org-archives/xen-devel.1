Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35536C83F1A
	for <xen-devel@archiver.kernel.org>; Wed, 23 Jul 2025 20:25:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1054705.1423385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueg28-0000dP-Aj; Wed, 23 Jul 2025 20:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054705.1423385; Wed, 23 Jul 2025 20:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueg28-0000dI-7R; Wed, 23 Jul 2025 20:25:48 +0000
Received: by outflank-mailman (input) for mailman id 1054705;
 Wed, 23 Jul 2025 20:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KKGU=2E=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueg27-0000dC-Qq
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 20:25:47 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 364b3558-6803-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 22:25:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2723EA54FC1;
 Wed, 23 Jul 2025 20:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22425C4CEE7;
 Wed, 23 Jul 2025 20:25:44 +0000 (UTC)
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
X-Inumbo-ID: 364b3558-6803-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753302344;
	bh=Mi7B7FjljJFRJ1UsWbFkcTHaj+qzDVbunUVmrAOOlbE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SQfuDEMYnBllfS/XvRLnhIlaTVzHRVA7rTVtPgJzA4mROUthAH1Mmh49lyVoNNh3g
	 3HeND2gC1KxoeKucVVhogmuuopJqtmO7cbygNxkRD5A6/fDjk4E4jczpYn8+ldofu3
	 OGhPi6LlsRMJSmDtFw7UOA5wKFIWmRV0mD53YlVnoKZJiWy/z4XkIHJp//N49TX43O
	 RApQymARqG12KsBQfIpQHQa9Tr24VFQjtJ6vkUdZrHFPIQSFOkwQz0K1B1ilWSdfHz
	 ZH7x3bflVw1h9BPWNJomt5RtxiirEJxGyuY9Itu00FHuYSTzm1RiYcIoHRSx2FqctJ
	 vZgyjmzy57P8A==
Date: Wed, 23 Jul 2025 13:25:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] automation/eclair: monitor rules 11.6, 17.2, 18.3,
 21.11, 21.14-16
In-Reply-To: <35b3116fd3d4681ef3cf80a87b12c66055ce4342.1753283164.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507231325120.7043@ubuntu-linux-20-04-desktop>
References: <35b3116fd3d4681ef3cf80a87b12c66055ce4342.1753283164.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Jul 2025, Dmytro Prokopchuk1 wrote:
> Add MISRA C rules to the monitored set.
> All these rules are 'accepted' for XEN, have zero or few violations,
> and should be enabled for the ECLAIR scan.
> 
> Rule 17.2 is enabled to prevent accidental direct recursion.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Please provide a link to a passed pipeline. With that:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - updated commit message
> ---
>  automation/eclair_analysis/ECLAIR/monitored.ecl | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 00bff9edbe..72698b2eb1 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -45,6 +45,7 @@
>  -enable=MC3A2.R10.2
>  -enable=MC3A2.R11.1
>  -enable=MC3A2.R11.2
> +-enable=MC3A2.R11.6
>  -enable=MC3A2.R11.7
>  -enable=MC3A2.R11.8
>  -enable=MC3A2.R11.9
> @@ -62,12 +63,14 @@
>  -enable=MC3A2.R16.6
>  -enable=MC3A2.R16.7
>  -enable=MC3A2.R17.1
> +-enable=MC3A2.R17.2
>  -enable=MC3A2.R17.3
>  -enable=MC3A2.R17.4
>  -enable=MC3A2.R17.5
>  -enable=MC3A2.R17.6
>  -enable=MC3A2.R18.1
>  -enable=MC3A2.R18.2
> +-enable=MC3A2.R18.3
>  -enable=MC3A2.R18.6
>  -enable=MC3A2.R18.8
>  -enable=MC3A2.R19.1
> @@ -83,14 +86,18 @@
>  -enable=MC3A2.R20.14
>  -enable=MC3A2.R21.3
>  -enable=MC3A2.R21.4
> --enable=MC3A2.R21.6
>  -enable=MC3A2.R21.5
> +-enable=MC3A2.R21.6
>  -enable=MC3A2.R21.7
>  -enable=MC3A2.R21.8
>  -enable=MC3A2.R21.9
>  -enable=MC3A2.R21.10
> +-enable=MC3A2.R21.11
>  -enable=MC3A2.R21.12
>  -enable=MC3A2.R21.13
> +-enable=MC3A2.R21.14
> +-enable=MC3A2.R21.15
> +-enable=MC3A2.R21.16
>  -enable=MC3A2.R21.17
>  -enable=MC3A2.R21.18
>  -enable=MC3A2.R21.19
> -- 
> 2.43.0
> 

