Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0DFCD37AC
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2026 20:55:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1308463.1579896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGbT-0004oc-Jy; Wed, 13 May 2026 20:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308463.1579896; Wed, 13 May 2026 20:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGbT-0004oV-HB; Wed, 13 May 2026 20:54:51 +0000
Received: by outflank-mailman (input) for mailman id 1308463;
 Wed, 13 May 2026 20:54:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wNGbR-0004oP-RX
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 20:54:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNGbQ-00FIfA-Ou
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 22:54:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a04e4d5-5cb7-0a2a0a5109dd-0a2a450b9232-48
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:54:48 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a04e517-212f-0a2a450b0019-ac6904fea3b8-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:54:48 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 397CF60052;
 Wed, 13 May 2026 20:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CD4C19425;
 Wed, 13 May 2026 20:54:46 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778705686;
	bh=xkJmYuOtGLZWpb7CNtzCmol5bRCeD7uZ7hhfNPO0krY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=L4u9I1inHUCZUHTczpo5x1rZEG1deWeM+d/IJY5N0P24lbAvBO7Y+x8QmZrpy5N74
	 10nSDc6jKOtEW/UEl6gBwXO1vIxHCQ5iuZXyGjMtsb5zKgnvoNQ2CtjF/MTiUYUmbN
	 juSkI+haYzSOP6JZufzQepZBZU1yvKH0Tsn5uE7XENWtv8+Qs7jIFXAJDZLu4CqLAL
	 CuZiK8g+1g3U/nlQxPTSImz8YPB0I0uuNL5uXrHRJTuPjOUm7UX8FuCgCy7pfRc6IW
	 ns9PU89AumzFcPddDZ5PBr5Cph1kudNboFl828xJnzXV+IRATJ+WughQK3EYtoX5a2
	 m1/vwED/H+/7w==
Date: Wed, 13 May 2026 13:54:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
Subject: Re: [PATCH v3 1/2] ns16550: add support for WCH CH382 serial
 adapters
In-Reply-To: <20260511075415.36538-2-Zhao.Jiaqing@amd.com>
Message-ID: <alpine.DEB.2.22.394.2605131354380.3930@ubuntu-linux-20-04-desktop>
References: <20260511075415.36538-1-Zhao.Jiaqing@amd.com> <20260511075415.36538-2-Zhao.Jiaqing@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-42698a/1778705688-12971F3B-B20F1C1B/0/0
X-purgate-type: clean
X-purgate-size: 671

On Mon, 11 May 2026, Jiaqing Zhao wrote:
> Add support for the WCH (Nanjing Qinheng Microelectronics Co., Ltd.)
> CH382 PCIe dual port serial adapter. The CH382 is available in two
> variants:
>  - CH382 2S   [1c00:3253]: 2 serial ports
>  - CH382 2S1P [1c00:3250]: 2 serial ports + 1 parallel port
> 
> This chip uses IO BAR0, base baud rate 115200, ports starting at offset
> 0xc0 and spaced 8 bytes apart, and a 256-byte FIFO. [1]
> 
> [1] https://www.wch-ic.com/downloads/CH382DS1_PDF.html
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

