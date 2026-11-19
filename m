Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFD2606A334
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 22:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gyREX3PF
Received: from list by lists.xenproject.org with outflank-mailman.1497511.1695804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUAWp-0007gO-JT; Thu, 19 Nov 2026 22:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497511.1695804; Thu, 19 Nov 2026 22:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUAWp-0007gH-G7; Thu, 19 Nov 2026 22:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1497511;
 Thu, 19 Nov 2026 22:22:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xUAWo-0007gB-BY
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 22:22:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUAWn-003LaS-9F
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 23:22:49 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6aff76ae-bab6-0a2a0a5309dd-0a2a4505d546-6
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 23:22:49 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6aff76b7-4cb1-0a2a45050019-ac6904feb544-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 23:22:48 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C09461855;
 Thu, 19 Nov 2026 22:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7171F000CF;
 Thu, 19 Nov 2026 22:22:45 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126966;
	bh=QsNAjfmmMEwm+oIL2cumeHDNdSqzKZcw0MOICtEU2o4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=gyREX3PFoE31vB3O/ZnGMmcqqrsMeSPqYxsCN95Rv4A6ogJpqC4znCXYEQ3T0w5+N
	 k08jbTQvTDkHRIjfsLLQTsL2z9lR/ctRQbiNUvKbzgICToITnGQXc0wtRd2BXidFmx
	 u5fWiewo1x8Fia7fcozcGen5Fa8KIZXUBdokYHBUEC5t6/9ZdqrTtR9q6c3ELmwXTd
	 cJDEppfBcZzzosFK1ImeTj0EM5pEs0p0RJI6gvCWldLHrHYshfD7dmLIdR17VsnHco
	 xRq4f8BGr3zRnaDhsX4FvQUOWddDyA1dS05HNKH7UdWsd/1uJRAKpyPYR9B21jvUfE
	 uvlv46N7J5i9w==
Date: Thu, 19 Nov 2026 14:22:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: "Halder, Ayan Kumar" <ayankuma@amd.com>
cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, 
    andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, 
    julien@xen.org, michal.orzel@amd.com, roger@xenproject.org, 
    sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [PATCH v8 23/26] docs/fusa: add NS16x50 UART requirements for
 x86
In-Reply-To: <0445ed54-9f51-4486-9e40-bce77e30eb35@amd.com>
Message-ID: <2b60d4d6-6b3b-9970-4909-8d0a1644e24f@kernel.org>
References: <20261111194800.1070016-1-dmukhin@ford.com> <20261111194800.1070016-24-dmukhin@ford.com> <0445ed54-9f51-4486-9e40-bce77e30eb35@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-665109990-1795126966=:2648157"
X-purgate-ID: tlsNG-c201ff/1795126969-F52A32A1-BBC3D83A/0/0
X-purgate-type: clean
X-purgate-size: 2997
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-665109990-1795126966=:2648157
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 19 Nov 2026, Halder, Ayan Kumar wrote:
> Hi Denis,
> 
> The requirements look good. And it is great that you have written the tests as well. 
> 
> So from a FuSa perspective, these requirements are 'covered'.
> 
> I want to confirm the tests for each of the requirements.
> 
> Refer "[XTF PATCH v1 6/6] x86: add NS16550-compatible emulator test"
> 
> On 11/11/2026 19:47, dmukhin@ford.com wrote:
> 
> From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> 
> Add the market-to-design traceability chain for the emulated
> NS16550-compatible UART exposed to x86 domains.
> 
> The design requirements are written one per row of the test_suite[]
> array in the XTF test tests/emul-ns16x50/main.c, so that each
> requirement is covered by a test case.
> 
> Additionally, document the assumptions Xen makes on the domain in order
> to provide the functionality.
> 
> Introduce XenProd~x86_emulated_uart~1 as the product requirement the
> design requirements cover, and add the two new documents to the toctree.
> 
> Finally, fill in the maintainer of the FUSA (x86) entry and extend it to
> cover the x86 product requirements.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  MAINTAINERS                                |   7 +
>  docs/fusa/reqs/design-reqs/x86/ns16x50.rst | 386 +++++++++++++++++++++
>  docs/fusa/reqs/index.rst                   |   2 +
>  docs/fusa/reqs/product-reqs/x86/reqs.rst   |  24 ++
>  4 files changed, 419 insertions(+)
>  create mode 100644 docs/fusa/reqs/design-reqs/x86/ns16x50.rst
>  create mode 100644 docs/fusa/reqs/product-reqs/x86/reqs.rst
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 327adf4641a1..2c0eaaea2d24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -335,6 +335,13 @@ F:	xen/arch/x86/include/asm/x86_*/efi*.h
>  F:	xen/common/efi/
>  F:	xen/include/efi/
>  
> +FUSA (x86)
> +M:	Denis Mukhin <dmukhin@ford.com>
> +R:	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> +S:	Supported
> +F:	docs/fusa/reqs/design-reqs/x86
> +F:	docs/fusa/reqs/product-reqs/x86

Hi Ayan, Denis,

The MAINTAINERS file is not hierarchical, so with this change the x86
directories would no longer be covered by the maintainers listed under
FUSA.

Could we have at least two maintainers listed? Ayan is already a
reviewer; if he agrees, we could make him a maintainer so that we have
two.

The rest of the patch appears to be acked, so I can make this change on
commit if we all agree.




>  FUSA
>  M:	Stefano Stabellini <sstabellini@kernel.org>
>  M:	Bertrand Marquis <bertrand.marquis@arm.com>

--8323329-665109990-1795126966=:2648157--

