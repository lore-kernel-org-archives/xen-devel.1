Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD6CECD983
	for <xen-devel@archiver.kernel.org>; Thu,  5 Feb 2026 16:08:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1222185.1530203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1tg-00016d-4G; Thu, 05 Feb 2026 16:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222185.1530203; Thu, 05 Feb 2026 16:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1tg-00016W-1G; Thu, 05 Feb 2026 16:08:00 +0000
Received: by outflank-mailman (input) for mailman id 1222185;
 Thu, 05 Feb 2026 16:07:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vo1te-00016Q-OP
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 16:07:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vo1te-004F9j-1c;
 Thu, 05 Feb 2026 16:07:58 +0000
Received: from [2a01:cb15:80df:da00:10d0:b82f:72a2:ac5] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vo1td-000giS-2O;
 Thu, 05 Feb 2026 16:07:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=L7AlrDhtoiZcfuy+jhhS8IOW+H9z6FpyimOCakWieZk=; b=RaZP1+cn+70lYc2JMr9kqqVAC4
	S4kHvMWOjr00afQJ5Y8TRpNmi8/KBPputVO5xX9pbWyi5Qs2TdA235iFunxvM8BhJ3/f98Y68UH0P
	74ajQ2RSaR5QKFy9g7v2D7cQikfMmbif8sNctH+/BdTQ0qBKCsuLe1zaCsIZxYi6q6gM=;
Date: Thu, 5 Feb 2026 17:07:55 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v9 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
Message-ID: <aYTAW5My41py18b4@l14>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com>
 <3a5ff98b9c46c393e856c2e9a645b2cb1509d5c4.1769696107.git.oleksii_moisieiev@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a5ff98b9c46c393e856c2e9a645b2cb1509d5c4.1769696107.git.oleksii_moisieiev@epam.com>

On Thu, Jan 29, 2026 at 02:16:55PM +0000, Oleksii Moisieiev wrote:
>  docs/man/xl.cfg.5.pod.in                    |  13 +
>  tools/libs/light/libxl_arm.c                |   4 +
>  tools/libs/light/libxl_types.idl            |   4 +-
>  tools/xl/xl_parse.c                         |  12 +

Hi Oleksii,

Could you put the toolstack part of the patch in a separated patch?

Thank you.

-- 
Anthony PERARD

