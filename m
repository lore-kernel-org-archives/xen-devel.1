Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DEAC61DE4
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 01:15:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403703.1637682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0qbj-0000Rx-Vm; Mon, 31 Aug 2026 01:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403703.1637682; Mon, 31 Aug 2026 01:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0qbj-0000Rg-Qi; Mon, 31 Aug 2026 01:14:43 +0000
Received: by outflank-mailman (input) for mailman id 1403703;
 Mon, 31 Aug 2026 01:14:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1x0qbi-0000RW-87
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 01:14:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0qbh-0010Am-35
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 03:14:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a94d566-8faa-0a2a0a5109dd-0a2a4505b096-6
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 03:14:41 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a94d57f-4cb1-0a2a45050019-ac6904fea29a-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 03:14:40 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E4FBE60120;
 Mon, 31 Aug 2026 01:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8D51F000E9;
 Mon, 31 Aug 2026 01:14:36 +0000 (UTC)
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
	s=k20260515; t=1788138878;
	bh=MZSVCQ3Ufblu/TkCyjD4ASm3zUat//7t6XAPFIhWzqo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=FNQn2lOP18icOOBGspsLVDQUJfh9jlpYcKiQFGr5kEGwBb/okpm1nKqXxEjtQjDJA
	 ZPNTPVssFAwJ1x4JD8N4Uj2/UxQpqVJZiyBG26OXjXxCzLu7XaVfOVIE0ko6n1zI4v
	 +laE/UzPkO1UympUy1DJ5zCGH7OLMle/KY6YEEo38YQryn4DbT0RRmUd5GwEgc5hr5
	 pinbQo1KcMOuRBS8ZnP5ZH6uo7S5iDZqnn2F+cTmWBpLMvFIxk4CD7iA8Z93XB45BD
	 TANsKTDmd2DllPizTIswGjCfHRqMQkpRFWnrhDP2qbV6fL3ifsWZ/Ba43u4mpc3FpH
	 EIsE2fP2eKl3w==
Date: Sun, 30 Aug 2026 18:14:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 07/12] altp2m: address Misra 2.1 rule violation
In-Reply-To: <6e98181c-459c-4c45-b8c0-c427e3c0bbc8@suse.com>
Message-ID: <6c8b33f6-4c84-6440-0347-b3a3e1ba639e@kernel.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com> <6e98181c-459c-4c45-b8c0-c427e3c0bbc8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c201ff/1788138881-730B22A1-CB8BF681/0/0
X-purgate-type: clean
X-purgate-size: 1096

On Fri, 28 Aug 2026, Jan Beulich wrote:
> The stub altp2m_vcpu_idx() is recognized as "noreturn" function lacking
> respective annotation (or having a return statement), which hence is deemed
> unreachable code by Misra / Eclair. All call sites are guarded by
> altp2m_active() checks, hence an inline function isn't needed. A
> declaration will suffice, with call sites then getting DCE-d.
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/include/asm-generic/altp2m.h
> +++ b/xen/include/asm-generic/altp2m.h
> @@ -14,13 +14,8 @@ static inline bool altp2m_active(const s
>      return false;
>  }
>  
> -/* Alternate p2m VCPU */
> -static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
> -{
> -    /* Not implemented on GENERIC, should not be reached. */
> -    BUG();
> -    return 0;
> -}
> +/* Alternate p2m VCPU - placeholder on GENERIC */
> +unsigned int altp2m_vcpu_idx(const struct vcpu *v);
>  
>  #endif /* __ASM_GENERIC_ALTP2M_H */
>  
> 

