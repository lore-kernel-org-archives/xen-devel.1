Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB968C982ED
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 00:14:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427934.1650627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8o9R-0000zn-7l; Tue, 22 Sep 2026 00:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427934.1650627; Tue, 22 Sep 2026 00:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8o9R-0000zf-30; Tue, 22 Sep 2026 00:14:25 +0000
Received: by outflank-mailman (input) for mailman id 1427934;
 Tue, 22 Sep 2026 00:14:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1x8o9P-0000zZ-Ui
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 00:14:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8o9O-00Dvsi-IG
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 02:14:22 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6ab1c820-e002-0a2a0a5209dd-0a2a4503c75a-6
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 02:14:22 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6ab1c857-fae8-0a2a45030019-aceafc1fa014-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 02:14:17 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 22E4542A2E;
 Tue, 22 Sep 2026 00:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3581F000FF;
 Tue, 22 Sep 2026 00:14:13 +0000 (UTC)
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
	s=k20260515; t=1790036055;
	bh=iRwgTG+6pfPpNDDDQwwShuFshTcDHmTBQfdIOhFcbFo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=P193QOsBKu0TrKC+zUIj1uuiNMIYQeodQt0ffKeSbEhYAKz/ySoyGKe2khENAQHtV
	 K3zSNNoq8USY+LQE+U0ViH5nZdxrdFk0c2A5YXZPCFgXfqFINXwIpaPFjpQVUxpEGZ
	 GxvuJo39u/e32KnUjSydY+YNwKBxO4wBDv24+kKBs62ooDkUGjc1BPYQGGxAbEhUKY
	 lz3EPSunIMasrmMKlGaf8Tu1yQBV8+6oFFFbW/PWummR7xtp8QYxclVBZ8wbPqFyEj
	 AGHA7CsfcmBm+FmUYJVShhPE02VmbuePMdJt4rO/lNG89fuHCaafdR8ZU95qHNg75f
	 BS89yVTa1KVXA==
Date: Mon, 21 Sep 2026 17:14:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH 6/6] automation/Eclair: tag rules 18.1 and 18.2 as
 clean
In-Reply-To: <486cf199-33fa-4373-965c-d59a782ae6d4@suse.com>
Message-ID: <22bc8842-8540-36a4-28fc-5a6e0d933f4a@kernel.org>
References: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com> <486cf199-33fa-4373-965c-d59a782ae6d4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-33051d/1790036062-770F64E9-36839A19/0/0
X-purgate-type: clean
X-purgate-size: 571

On Wed, 9 Sep 2026, Jan Beulich wrote:
> Remaining (x86) 18.2 violations were addressed. 18.1 was already clean
> everywhere.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Assuming they are still clean:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -80,6 +80,8 @@ MC3A2.R17.3||
>  MC3A2.R17.4||
>  MC3A2.R17.5||
>  MC3A2.R17.6||
> +MC3A2.R18.1||
> +MC3A2.R18.2||
>  MC3A2.R18.6||
>  MC3A2.R18.8||
>  MC3A2.R19.1||
> 

