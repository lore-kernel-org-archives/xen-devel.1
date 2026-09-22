Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0441C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:40:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428203.1650923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uB4-0006q2-N3; Tue, 22 Sep 2026 06:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428203.1650923; Tue, 22 Sep 2026 06:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uB4-0006pv-KF; Tue, 22 Sep 2026 06:40:30 +0000
Received: by outflank-mailman (input) for mailman id 1428203;
 Tue, 22 Sep 2026 06:40:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//xF=HO=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1x8uB3-0006pd-LA
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:40:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uB3-00FFAr-21
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:40:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=//xF=HO=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6ab222da-8faa-0a2a0a5109dd-0a2a4505bbc2-4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:40:29 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=//xF=HO=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6ab222dc-4cb1-0a2a45050019-8c4da68aec6c-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:40:28 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 87D1DA48B8;
 Tue, 22 Sep 2026 08:40:28 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jTYKII3fA-hX; Tue, 22 Sep 2026 08:40:28 +0200 (CEST)
Received: from end (unknown [212.133.41.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id E7EA0A1BC6;
 Tue, 22 Sep 2026 08:40:27 +0200 (CEST)
Received: from samy by end with local (Exim 4.100)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1x8uAz-00000005s74-15lP; Tue, 22 Sep 2026 08:40:25 +0200
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
	t=1790059228; bh=2cxc3TuQvyCkPh46rnZm8LQN7bXu7Mdt2ZjnZMKcfcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2ppNzJ7nxCPRoNIpS3Bz/ANsEB3mpubETlOA3l58HWPf94Vvvw/wxwdPqWpK7eZl
	 a/eXVx7xvY3BlI2arr58UQ6LRj/5uadxMOETBlQBUaumqTii5KY1zamPfXCgoxcX7A
	 tgoeqwpiJHs0m4IHSP7ha+DPLF1kuDn6OC+ojRBsFNwa2sJY7I06OTK8/V+UNPT+vo
	 vIBR0kemZxCPRdCm1VXnOoO7VFEgz2Q7UX5Ok4SWvznIDfx4TzG7a55wUV1rlygM6b
	 h1zmBBiHEOPj1Mwcy58F6mLlY85LMkUZOmeCDj5jI9XBdWudMkXmglEyQnlgTjK0SI
	 Lp9nwSOaPhYWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1790059228; bh=2cxc3TuQvyCkPh46rnZm8LQN7bXu7Mdt2ZjnZMKcfcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2ppNzJ7nxCPRoNIpS3Bz/ANsEB3mpubETlOA3l58HWPf94Vvvw/wxwdPqWpK7eZl
	 a/eXVx7xvY3BlI2arr58UQ6LRj/5uadxMOETBlQBUaumqTii5KY1zamPfXCgoxcX7A
	 tgoeqwpiJHs0m4IHSP7ha+DPLF1kuDn6OC+ojRBsFNwa2sJY7I06OTK8/V+UNPT+vo
	 vIBR0kemZxCPRdCm1VXnOoO7VFEgz2Q7UX5Ok4SWvznIDfx4TzG7a55wUV1rlygM6b
	 h1zmBBiHEOPj1Mwcy58F6mLlY85LMkUZOmeCDj5jI9XBdWudMkXmglEyQnlgTjK0SI
	 Lp9nwSOaPhYWA==
Date: Tue, 22 Sep 2026 08:40:25 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/4] stubdom: remove build of zlib
Message-ID: <arIi2YpJ0_0ZD0aO@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
References: <20260917075351.37208-1-jgross@suse.com>
 <20260917075351.37208-3-jgross@suse.com>
 <6f9965b4-4d06-46a2-ae18-8014b1a1c4cf@suse.com>
 <d69cbb72-e46f-488c-bd35-109d8707731c@suse.com>
 <09190c27-fd5f-4f7b-9d2b-be03785c7bbc@suse.com>
 <f464b3ac-87a0-4c28-a588-511e44356516@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f464b3ac-87a0-4c28-a588-511e44356516@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-c201ff/1790059228-722AB2A1-B018D235/0/0
X-purgate-type: clean
X-purgate-size: 437

Hello,

Jürgen Groß, le lun. 21 sept. 2026 11:08:12 +0200, a ecrit:
> > We can point people to pciutils through such a comment.
> 
> Do you mean pointing at the upstream pciutils, or the stubdom one using the
> commit-id of the removal patch?

I mean pointing at the upstream pciutils, more specifically

https://github.com/pciutils/pciutils/pull/236

Or upstream's README.MiniOS itself once the PR gets merged.

Samuel

