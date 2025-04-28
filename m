Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7FDC3ABA3
	for <xen-devel@archiver.kernel.org>; Mon, 28 Apr 2025 23:34:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.971306.1359757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9XzR-0005lv-2O; Mon, 28 Apr 2025 23:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971306.1359757; Mon, 28 Apr 2025 23:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9XzQ-0005lo-W2; Mon, 28 Apr 2025 23:34:20 +0000
Received: by outflank-mailman (input) for mailman id 971306;
 Mon, 28 Apr 2025 23:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4d+=XO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9XzP-0005lh-5G
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 23:34:19 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ce49060-2489-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 01:34:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EEACE614AE;
 Mon, 28 Apr 2025 23:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912EFC4CEE4;
 Mon, 28 Apr 2025 23:34:14 +0000 (UTC)
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
X-Inumbo-ID: 4ce49060-2489-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745883255;
	bh=fdWBd7jSJHZHFUkZHAbfiAt4NmveuRO6oOnK5BFyFtc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AU7B79t7w1PB2PpjPQKREJx6vWe2n1wR9WrW+kDiu0631C1W60GfvahkMgZkUHPj7
	 0i6Ux50Kh1HUf+NstE/B4tFxuIv0AXvcZfI4I37UHBTmK3xnMfYU8DXWw61+BpAUtX
	 n+8Eg0k8eQlsrRM12yT9WVRN4++/6b/F5T3L8TD1U5rK1st8entCjMuNh4YmJhsoMu
	 Htwcz5Ekqne8l8mb3TlN1DQcLgibblq099tumNMRBSri1asBeptQirLbS5yQ72ifaX
	 fw+wGDHPedwB53iKnUAPTaD+k3LCrQ/A1HpHgLGW6k6Hj+IyFZoJf2ecFwybAmcvfH
	 i9S0eymRbYgiw==
Date: Mon, 28 Apr 2025 16:34:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v2 3/3] xen/console: introduce conring_flush()
In-Reply-To: <20250426185021.100646-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504281634050.785180@ubuntu-linux-20-04-desktop>
References: <20250426185021.100646-1-dmukhin@ford.com> <20250426185021.100646-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 26 Apr 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce conring_flush() to ensure all messages kept in the internal
> console ring are sent to all physical consoles (serial, VGA (x86))
> after their initialization is completed.
> 
> Resolves: https://gitlab.com/xen-project/xen/-/issues/184
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


