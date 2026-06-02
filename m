Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD9ECD5BD1
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 00:16:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1324285.1589902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCo6-0006Q1-RG; Tue, 02 Jun 2026 00:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324285.1589902; Tue, 02 Jun 2026 00:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCo6-0006Pu-OO; Tue, 02 Jun 2026 00:16:34 +0000
Received: by outflank-mailman (input) for mailman id 1324285;
 Tue, 02 Jun 2026 00:16:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUCo5-0006Pm-9M
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 00:16:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUCo4-001jEH-MH
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 02:16:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e2092-e002-0a2a0a5209dd-0a2a450bb81e-42
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:16:32 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e20df-212f-0a2a450b0019-ac6904fee424-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:16:32 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E6FA86001A;
 Tue,  2 Jun 2026 00:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4574D1F00893;
 Tue,  2 Jun 2026 00:16:30 +0000 (UTC)
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
	s=k20260515; t=1780359390;
	bh=a9AZUDQdTPDxgjcJo+FE1gzEMtGpuhQFsPL+rivrLYk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=nQpiSE/MQrbuVASlY5U4s9P6jH98JXDvMxfJXD3sdDMa4+NMVufKFPT53SzOr9BZf
	 1j2Jl7spqofFU66Cg0CZzAWFgqLs3eo8Z3fa0HzIO1j/zjT8hFVEXMjDTT+OyC8a8b
	 wKd8xdXYimqsuYNiirnHDKBKK6H2EAFycyvkK8xSRm+WuyT1Z69/IDG7kN6XlGSpPr
	 7wldU1dNI/tVH4y8yG+4BMUKM2YmsgaMhIiKTDL1EjPr1Av10RhZjBTNIEvGSyep2Y
	 r9h69Cn7+h7mASlAxnPy9PcfIuYNxdU/YTvp8tiA6LcuGbmC4B3tR5I4yap2C/i1XG
	 KG3edFIh3xYIw==
Date: Mon, 1 Jun 2026 17:16:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    christopher.w.clark@gmail.com, dpsmith@apertussolutions.com, 
    Mykola Kvach <mykola_kvach@epam.com>
Subject: Re: [PATCH v3 3/6] argo: drop argo prefix from argo_dprintk()
 calls
In-Reply-To: <20260526215823.1452619-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2606011716170.550703@ubuntu-linux-20-04-desktop>
References: <20260526215823.1452619-1-dmukhin@ford.com> <20260526215823.1452619-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-42698a/1780359392-1BF7EF3B-CDA23F5D/0/0
X-purgate-type: clean
X-purgate-size: 417

On Tue, 26 May 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> argo_dprintk() prefixes all log lines with "argo: " automatically.
> 
> Remove duplicate prefixes from log messages in the Argo module where
> applicable.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

