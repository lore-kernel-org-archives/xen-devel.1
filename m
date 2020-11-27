Return-Path: <SRS0=GZ64=FB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F07C5519F
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 17:39:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AAFB21D91
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 17:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0j8EzUjA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AAFB21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39698.72684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kihiG-000363-8G; Fri, 27 Nov 2020 17:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39698.72684; Fri, 27 Nov 2020 17:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kihiG-00035v-5P; Fri, 27 Nov 2020 17:39:16 +0000
Received: by outflank-mailman (input) for mailman id 39698;
 Fri, 27 Nov 2020 17:39:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C3sB=FB=kernel.org=kuba@srs-us1.protection.inumbo.net>)
 id 1kihiE-00035q-RJ
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 17:39:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59ba2d25-8ba3-4c99-89a9-d1b31f2d7d23;
 Fri, 27 Nov 2020 17:39:14 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04B9621534;
 Fri, 27 Nov 2020 17:39:11 +0000 (UTC)
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
X-Inumbo-ID: 59ba2d25-8ba3-4c99-89a9-d1b31f2d7d23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606498753;
	bh=j1DgY7r0rMQwVPcBNG2W4pflvrkcsR7Nn0kZYvEb2Ss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0j8EzUjAKu+0z+mAQUkB3CXGNcEbFYIqENj9gKgasYED6nKNkPWzRrF0o9Zh8bFYY
	 ufUD4pf3x2fVB0Sf272JPD3mGvgRrWph+5enO8G3pD1njUJDyq7PPaKQC7JJXYshQ8
	 NXklXCJw7Tl57KnQy271JTtuX5+F9SUf5tUoe6PU=
Date: Fri, 27 Nov 2020 09:39:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, bpf@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, Dany Madden <drt@linux.ibm.com>,
 Daris A Nevil <dnevil@snmc.com>, "David S. Miller" <davem@davemloft.net>,
 Erik Stahlman <erik@vt.edu>, Geoff Levand <geoff@infradead.org>, Grygorii
 Strashko <grygorii.strashko@ti.com>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Ishizaki Kou <kou.ishizaki@toshiba.co.jp>, Ivan
 Khoronzhuk <ivan.khoronzhuk@linaro.org>, Jens Osterkamp
 <Jens.Osterkamp@de.ibm.com>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Allen <jallen@linux.vnet.ibm.com>, John Fastabend
 <john.fastabend@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>, Lijun Pan
 <ljp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman
 <mpe@ellerman.id.au>, netdev@vger.kernel.org, Nicolas Pitre
 <nico@fluxnic.net>, Paul Durrant <paul@xen.org>, Paul Mackerras
 <paulus@samba.org>, Peter Cammaert <pc@denkart.be>, Russell King
 <rmk@arm.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>, Santiago
 Leon <santi_leon@yahoo.com>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Thomas Falcon <tlfalcon@linux.vnet.ibm.com>, Utz Bacher
 <utz.bacher@de.ibm.com>, Wei Liu <wei.liu@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/8] Rid W=1 warnings in Net
Message-ID: <20201127093911.05d9122a@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <20201126133853.3213268-1-lee.jones@linaro.org>
References: <20201126133853.3213268-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Nov 2020 13:38:45 +0000 Lee Jones wrote:
> Resending the stragglers.
> 
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.

This set doesn't apply to net-next, please rebase.

