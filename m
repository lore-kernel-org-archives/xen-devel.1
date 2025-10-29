Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D111DCCF9EE
	for <xen-devel@archiver.kernel.org>; Wed, 29 Oct 2025 20:49:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1153122.1483585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vED6h-0003T4-S6; Wed, 29 Oct 2025 20:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153122.1483585; Wed, 29 Oct 2025 20:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vED6h-0003Sx-PZ; Wed, 29 Oct 2025 20:49:23 +0000
Received: by outflank-mailman (input) for mailman id 1153122;
 Wed, 29 Oct 2025 20:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BbVn=5G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vED6g-0003Sr-Vj
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 20:49:22 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd4ef1e6-b508-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 21:49:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 25E944542B;
 Wed, 29 Oct 2025 20:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D684C4CEF8;
 Wed, 29 Oct 2025 20:49:17 +0000 (UTC)
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
X-Inumbo-ID: bd4ef1e6-b508-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761770958;
	bh=l3ey76yLYbCCNB8XjURA6xqdWNGqzaAqUoYZdGcLWNs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oYLF4y8ipYNit6r6YCTn9HVFiQ+aBzCJpiQIYSf2wppkhdNs+naU9EMKTJUe7HbhE
	 1mj1ruS2n8BmmhDuhj3DpwCYYHo2ra60MzQj+UkwEPB3kUnvIB3yjVIjYV+Hq6QQad
	 56tBHkE2jgeo0ST651iskvUdd3iVEc/wsKqUDWiFZx7CTl5RDFL2nazsajTt0Jw0cK
	 pGh/Rzg/OKypVhfVPi1Ig4IeNISFNJqSieUoyJ9teIE7NQRSZihvlcrZrgtPoIDCVJ
	 35RHECMFAeWjJhC0wxGAnVReBs9f5lIeAqzfQbY4ZqPC3YbvzzRaES8/2Yn8D6ezDP
	 z05Pmr+ONjQaw==
Date: Wed, 29 Oct 2025 13:49:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH for-4.20] CI: Fix microcode loading on Xen 4.20 and
 earlier
In-Reply-To: <20251028194539.3668470-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2510291349100.495094@ubuntu-linux-20-04-desktop>
References: <20251028194539.3668470-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1692809242-1761770957=:495094"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1692809242-1761770957=:495094
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 27 Oct 2025, Andrew Cooper wrote:
> CONFIG_UCODE_SCAN_DEFAULT only exists in Xen 4.21.  In older versions of xen,
> use ucode=scan on the command line.
> 
> Fixes: 690655a511cd ("CI: Include microcode for x86 hardware jobs")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Jan Beulich <JBeulich@suse.com>
> 
> The fixes tag is the 4.20 backport, not the original patch.  Found while
> trying to test the microcode loading backports.  (At least the XenServer
> testing has proved more useful).
> 
> 4.20 is the oldest branch that tries to load microcode in Gitlab CI, so this
> does not need backporting further.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2126131501


Acked-by: Stefano Stabellini <sstabellini@kernel.org>

--8323329-1692809242-1761770957=:495094--

