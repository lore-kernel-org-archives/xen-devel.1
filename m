Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C339C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 00:18:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395869.1634038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwqTr-0002Jt-Ol; Thu, 20 Aug 2026 00:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395869.1634038; Thu, 20 Aug 2026 00:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwqTr-0002Jl-Jc; Thu, 20 Aug 2026 00:18:03 +0000
Received: by outflank-mailman (input) for mailman id 1395869;
 Thu, 20 Aug 2026 00:18:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3AlD=GN=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1wwqTp-0002Je-JY
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 00:18:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwqTn-007Dij-6M
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 02:17:59 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=3AlD=GN=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a8647a1-8faa-0a2a0a5109dd-0a2a45029986-22
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 02:17:59 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=3AlD=GN=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a8647b6-6ca4-0a2a45020019-8c4da68abd26-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 02:17:59 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 91296A1CFD;
 Thu, 20 Aug 2026 02:17:58 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prg8_IHdEkWb; Thu, 20 Aug 2026 02:17:58 +0200 (CEST)
Received: from end (168.106.204.77.rev.sfr.net [77.204.106.168])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 37E7FA1C52;
 Thu, 20 Aug 2026 02:17:58 +0200 (CEST)
Received: from samy by end with local (Exim 4.99.4)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1wwqTl-0000000HOpw-1biG; Thu, 20 Aug 2026 02:17:57 +0200
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
	t=1787185078; bh=+nnlEIVNbEpSVwyvbAkLaDDMpsBu/R50sIcGqo6KRmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8bSObTRABOU4cVf+Qb0+W8AY+C1eusjKCfohEDlYlgxiB/NrtPfICaR305m1qjOl
	 x1xrwd7zoVG5w87VVJvNOFE/eY/RR5wx137chkJgn3g7vVud5ffGtzfaPSHd0L0rnL
	 uEj73eQzHJ5frqnSbpU9GyKWUCJl9zZ7st5Txry2znHov7d1HPg2W9CnlxOZRbTQ1g
	 HP6agE6WJXES78Gs2AxIelV6RydxpHCV5oSttfewejDDHJJLa+6MsoYhzRQbCBRXu3
	 jWBAqRmsrnOgmR9QGVL08KUGbr47ONDUD4zs3n9RFuAOlz/M4Xem3Gl0dBcf+JU2CQ
	 xtTof2zTmfPYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1787185078; bh=+nnlEIVNbEpSVwyvbAkLaDDMpsBu/R50sIcGqo6KRmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8bSObTRABOU4cVf+Qb0+W8AY+C1eusjKCfohEDlYlgxiB/NrtPfICaR305m1qjOl
	 x1xrwd7zoVG5w87VVJvNOFE/eY/RR5wx137chkJgn3g7vVud5ffGtzfaPSHd0L0rnL
	 uEj73eQzHJ5frqnSbpU9GyKWUCJl9zZ7st5Txry2znHov7d1HPg2W9CnlxOZRbTQ1g
	 HP6agE6WJXES78Gs2AxIelV6RydxpHCV5oSttfewejDDHJJLa+6MsoYhzRQbCBRXu3
	 jWBAqRmsrnOgmR9QGVL08KUGbr47ONDUD4zs3n9RFuAOlz/M4Xem3Gl0dBcf+JU2CQ
	 xtTof2zTmfPYg==
Date: Thu, 20 Aug 2026 02:17:57 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
Message-ID: <aoZHtXgJJJM3q37k@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com>
 <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com>
 <aoM4ufGg8QO51XB9@end>
 <e47cf430-dc06-4e9d-9a3b-82ed8c081a70@suse.com>
 <aoTRPKeD6__D7Qra@end>
 <41b21e6f-0049-45f8-afae-8116f09fbf22@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41b21e6f-0049-45f8-afae-8116f09fbf22@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-720697/1787185079-660A82AC-01BB67FA/0/0
X-purgate-type: clean
X-purgate-size: 1482

Jan Beulich, le mer. 19 août 2026 08:36:14 +0200, a ecrit:
> On 18.08.2026 23:40, Samuel Thibault wrote:
> > Jan Beulich, le mar. 18 août 2026 08:03:51 +0200, a ecrit:
> >> On 17.08.2026 18:37, Samuel Thibault wrote:
> >>> Juergen Gross, le lun. 17 août 2026 10:24:02 +0200, a ecrit:
> >>>> On 17.08.26 09:48, Samuel Thibault wrote:
> >>>>> Juergen Gross, le lun. 17 août 2026 09:18:41 +0200, a ecrit:
> >>>>>> There is no user of libpci left in stubdoms.
> >>>>>>
> >>>>>> Remove libpci from the stubdom build system.
> >>>>>
> >>>>> Wouldn't it be useful to keep this for anybody who would want to drive a
> >>>>> PCI card from a stubdomain?
> >>>>>
> >>>>> I mean, in the zlib case, it's really a mere question of build & link,
> >>>>> so we don't need to ship it, people can do it themselves easily like for
> >>>>> any other library.
> >>>>>
> >>>>> But here there is actual porting work, that we'd better not lose but
> >>>>> keep shipping.
> >>>>
> >>>> This is all still available via git.
> >>>
> >>> No, it is not really.
> >>
> >> Question is - does this matter in the first place? If someone wanted to
> >> drive e.g. a USB device, would we include USB code?
> > 
> > Why not? I mean, better centralize the maintenance of such code instead
> > of possibly several people having to maintain their own USB layer each.
> 
> Well, but where would you stop then?

Wherever Xen stops defining a virtualization interface for it.

Samuel

