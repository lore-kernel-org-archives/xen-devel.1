Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEB5C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:26:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428149.1650851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8txb-0000bC-Ki; Tue, 22 Sep 2026 06:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428149.1650851; Tue, 22 Sep 2026 06:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8txb-0000b5-Hm; Tue, 22 Sep 2026 06:26:35 +0000
Received: by outflank-mailman (input) for mailman id 1428149;
 Tue, 22 Sep 2026 06:26:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//xF=HO=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1x8txa-0000au-5q
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:26:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8txZ-004Rnx-Ie
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:26:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=//xF=HO=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6ab21f8f-8faa-0a2a0a5109dd-0a2a4506e306-24
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:26:33 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=//xF=HO=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6ab21f99-195a-0a2a45060019-8c4da68ab53e-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:26:33 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 020CEA1B39;
 Tue, 22 Sep 2026 08:26:33 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k_dzSoLLs6mJ; Tue, 22 Sep 2026 08:26:32 +0200 (CEST)
Received: from end (unknown [212.133.41.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 66F2FA1AB4;
 Tue, 22 Sep 2026 08:26:32 +0200 (CEST)
Received: from samy by end with local (Exim 4.100)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1x8txV-00000005pQf-05Yy; Tue, 22 Sep 2026 08:26:29 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1790058393; bh=pjuFor96sFNkkiXu5u9PhE8S37iExvNJpi6S87/8E8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cxLPVxLonV/K5AfnmZ7jXLQPlqlUOQ7jbeT1Z90vNmAnF0Ubm5FneGBvetzhDvY+8
	 YdPfmrye6sNuCeouENKf/WqyRtcIqlvMeHHt4JmCtBMgMV/CbT9k1VTJbPdbpUEnLG
	 TUyt1WpqYlXwqHKPrxDHehIxna+Axl6ULr8lEOjkb9RlHnOhdPhBlyYKPrO+FDMWjj
	 a5gnXLbP4oH36uUQ47lR5d0y5NAZpL7zC4vyGoaxNrHgVNG1bI3nku3BItGMzmWyd/
	 Vwv+fB3kXuRDKe7anmLhLeOwJbNSNrPYmMiqJ3kq6LHPIsY6niMRs7KlGi4efvBmqD
	 soppYtNMGlhjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1790058392; bh=pjuFor96sFNkkiXu5u9PhE8S37iExvNJpi6S87/8E8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pTfyQrcZE4aq9DOaKaX+KbkvSxhSk9wDB734smklqaHddNp/KKAhOj8RXxMzlq20L
	 qypca5C/7bAseDfwyjHVGbsjB58ZsTksbHqVfG/5okPIRXiOJpJnwBpC/ICA9FylvR
	 6UipEEoqQdYykwnNHJ3X/Vm/eIK8qmayhG+48Jgop7alEo8dPt6FgXAXShCL0mEmnZ
	 V5UCQPLcx5RaR/cEiqAgnaRtu8Ebfkz58RqhcpkB5x3kPC5PBxQpGobaaECRrEo/fX
	 9gUuvOc+VbEUmPd+uuQuAc6yeKtoRA/VNN14fVUj7BH+VHbcuamwY3ygPsa/PhL7YB
	 IQ10VMT7KdElQ==
Date: Tue, 22 Sep 2026 08:26:29 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
Message-ID: <arIflUpxLB2DE7Kx@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
References: <aq6_Cebyee8IHN8p@end>
 <1f814c72-6fa2-4177-8da0-e17e0406e473@suse.com>
 <arIZEeYpAwSTUcrb@end>
 <624eb81f-9134-4181-9021-b315cf2fb10d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <624eb81f-9134-4181-9021-b315cf2fb10d@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-16d1c6/1790058393-FE27077B-80C55E08/0/0
X-purgate-type: clean
X-purgate-size: 979

Jürgen Groß, le mar. 22 sept. 2026 08:21:09 +0200, a ecrit:
> On 22.09.26 07:58, Samuel Thibault wrote:
> > Nowadays stubdom-ioemu is away, but stubdom/ still builds xenstore,
> > so it makes sense that it's xen that builds it along building the
> > non-stubdom version.
> 
> I agree it makes sense that xen is triggering the build, like it is doing
> it for e.g. qemu. Qemu is a good example how it should be: a configure call
> and then a make call, both using the qemu build mechanisms.
> 
> But having the non-Xen libraries related to Mini-OS and the related patches
> to be able to use them with Mini-OS in the Xen tree is making things much
> harder than they should be.
> 
> Building a Xenstore stubdom should just trigger the Mini-OS build with some
> configuration options, including the pointing to the Xenstore source directory
> and a make target for the Xenstore make invocation.

Ok, if it ends up being simpler then that's all good.

Samuel

