Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5D5D6CFAC
	for <xen-devel@archiver.kernel.org>; Fri, 23 Jan 2026 01:06:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1211947.1523314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj5ca-0006ej-51; Fri, 23 Jan 2026 01:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211947.1523314; Fri, 23 Jan 2026 01:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj5ca-0006ec-1A; Fri, 23 Jan 2026 01:05:56 +0000
Received: by outflank-mailman (input) for mailman id 1211947;
 Fri, 23 Jan 2026 01:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CMz=74=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vj5cY-0006eW-OT
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 01:05:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a95fa04b-f7f7-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 02:05:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2366160018;
 Fri, 23 Jan 2026 01:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2601FC116C6;
 Fri, 23 Jan 2026 01:05:49 +0000 (UTC)
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
X-Inumbo-ID: a95fa04b-f7f7-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769130350;
	bh=zPcvXu5VCYMukLaN255k/MTEnsytblLlj+oHAvHnX7g=;
	h=Date:From:To:cc:Subject:From;
	b=M/Uy3H5xmlCo2A2AatxcLgW32+urSgesqnZrfHkfUoNlgkifb0J9U+irBV2bdGFNc
	 1M4m6JL2wlr4kHsqpUbCrOFmk0N0GgnUmF4EdigJtcP16NhhTKtbDzBX9AkzaLdexn
	 FtOp5EJkBG58CwhKj5xdGptsfE70yfT+K2/1CHtqTi43zh2quBrtw3JE3z1vTpe61F
	 v5KttgBuIblqxzGTOAeoih2QP+GxriCI7a5Dgy/CnlgaOkCfAsIUa50qrYxZqa+ftY
	 +QsRzTYdeP1LN3AWEufHQJboVja8hUC7AlpPNUh8a2I2ly7LUVSp9reGilLdEihqdV
	 u04izACpRPkoA==
Date: Thu, 22 Jan 2026 17:05:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com, jbeulich@suse.com, sstabellini@kernel.org
Subject: [PATCH v7 0/2] xen: console_io for dom0less guests
Message-ID: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This short patch series enable the usage of console_io hypercalls for
dom0less guests.

Cheers,

Stefano

