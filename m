Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20600C4167B
	for <xen-devel@archiver.kernel.org>; Fri,  1 Dec 2023 02:45:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.645237.1007273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tWI-0005kA-MN; Fri, 01 Dec 2023 02:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645237.1007273; Fri, 01 Dec 2023 02:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tWI-0005k3-Jo; Fri, 01 Dec 2023 02:44:46 +0000
Received: by outflank-mailman (input) for mailman id 645237;
 Fri, 01 Dec 2023 02:44:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tWI-0005jx-4l
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:44:46 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94547ca9-8ff3-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 03:44:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6E5A7CE259E;
 Fri,  1 Dec 2023 02:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B7BC433C7;
 Fri,  1 Dec 2023 02:44:38 +0000 (UTC)
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
X-Inumbo-ID: 94547ca9-8ff3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701398680;
	bh=ngxf8el7WqYYNBf+o/FjN/IvNJ6ozlpE/VKrhCgLwM0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Cv52c7H62CLtFfBtzUp9QgNYf7K4pmFEx0q5IVkCzujDkSpYmxuDxm4bMrSxFCqO7
	 V/Bd/bmXLVjERLvx90VM/v+A1wFF9NT8guf9NM1D3K6DYZ/V86mKLnjlcyd6ybrzWv
	 C8mruptUalTA2c/1J6vTCO0PvfVNdhKb/0djzGoH+Dqx1w836XPBYHCEA7rPlE5bfC
	 tWREEEqTWtKjX6IG2Emx9S4qYHv2EeftrHGFwPS25I4TBdyM1pkBYdn8+lqNIN/tD1
	 C2XVDCeitBkVq5mEoQfyolkbn2bLweHAC+yvMgigg0IDr/znq8yaVReGGTZ/WslztH
	 Xse+wooSmDCeA==
Date: Thu, 30 Nov 2023 18:44:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 4/7] x86/viridian: make build_assertions static
In-Reply-To: <1fc043cb040a24515e2355a5a908c42f20a39418.1701270983.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311301843290.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com> <1fc043cb040a24515e2355a5a908c42f20a39418.1701270983.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Nov 2023, Nicola Vetrini wrote:
> This is consistent with other instances of the same function
> and also resolves a violation of MISRA C:2012 Rule 8.4.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

