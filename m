Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5B0C982D8
	for <xen-devel@archiver.kernel.org>; Sat, 19 Sep 2026 16:58:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1426456.1649636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7yNq-0005Tg-04; Sat, 19 Sep 2026 16:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1426456.1649636; Sat, 19 Sep 2026 16:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7yNp-0005TY-Rt; Sat, 19 Sep 2026 16:57:49 +0000
Received: by outflank-mailman (input) for mailman id 1426456;
 Sat, 19 Sep 2026 16:57:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tMR=HL=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1x7yNn-0005TP-UD
 for xen-devel@lists.xenproject.org; Sat, 19 Sep 2026 16:57:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7yNn-00FAjM-B9
 for xen-devel@lists.xenproject.org; Sat, 19 Sep 2026 18:57:47 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=3tMR=HL=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6aaebee6-2eae-0a2a0a5409dd-0a2a4505ecbc-18
 for <xen-devel@lists.xenproject.org>; Sat, 19 Sep 2026 18:57:47 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=3tMR=HL=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6aaebf0a-4cb1-0a2a45050019-8c4da68ad02c-3
 for <xen-devel@lists.xenproject.org>; Sat, 19 Sep 2026 18:57:47 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id A7E4EA02EB;
 Sat, 19 Sep 2026 18:57:46 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0dv8dflxbNV; Sat, 19 Sep 2026 18:57:46 +0200 (CEST)
Received: from end (lfbn-bor-1-980-210.w90-120.abo.wanadoo.fr [90.120.173.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 470ECA01F4;
 Sat, 19 Sep 2026 18:57:46 +0200 (CEST)
Received: from samy by end with local (Exim 4.100)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1x7yNl-0000000Bk3N-2kMG; Sat, 19 Sep 2026 18:57:45 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:In-Reply-To"; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1789837066; bh=x2rPBn3+93eD4n3f0kucW1BWRjSamWxCzqKS1cFOmIs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ue5rZiCS0jwWtbgzmQhoeFXknojdSPopoVEZqHY2Q8/N1OFXR/Sb1FcIART8Bgqwo
	 XKgPMQXfGZ4hCBfjL1CbQrdacljJTbXsmRJwxVvPv2dSnOXSHYDqPDlUaDUn7ODMqP
	 vNo4jCoXsAVRGBLZPe7AgdPEb0zyghhqjd63+rKY+Yv6juKbpFW7FEnHL4DK6TDVXX
	 E7LRRCegmh1NmH7Mr0ifCLj+bSfI2TA0TWiZWy+o55qcyLG+2zKkDxMiHaIPENcUUZ
	 tFU7g7AMAtA30uKIXWbDxh+I61LkiEf7Zz3YDiAs+Ai9IfUEAkibeOGEgEQipH0daR
	 yMoxSfz1Tx3Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1789837066; bh=x2rPBn3+93eD4n3f0kucW1BWRjSamWxCzqKS1cFOmIs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ue5rZiCS0jwWtbgzmQhoeFXknojdSPopoVEZqHY2Q8/N1OFXR/Sb1FcIART8Bgqwo
	 XKgPMQXfGZ4hCBfjL1CbQrdacljJTbXsmRJwxVvPv2dSnOXSHYDqPDlUaDUn7ODMqP
	 vNo4jCoXsAVRGBLZPe7AgdPEb0zyghhqjd63+rKY+Yv6juKbpFW7FEnHL4DK6TDVXX
	 E7LRRCegmh1NmH7Mr0ifCLj+bSfI2TA0TWiZWy+o55qcyLG+2zKkDxMiHaIPENcUUZ
	 tFU7g7AMAtA30uKIXWbDxh+I61LkiEf7Zz3YDiAs+Ai9IfUEAkibeOGEgEQipH0daR
	 yMoxSfz1Tx3Dg==
Date: Sat, 19 Sep 2026 18:57:45 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
Message-ID: <aq6_Cebyee8IHN8p@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab78351b-6b03-407c-9bcd-74b1566fd853@suse.com>
 <dbe4d409-37b9-45b9-ae5e-5bedb5df0bb4@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-c201ff/1789837067-F5EA92A1-A8B26DCB/0/0
X-purgate-type: clean
X-purgate-size: 1442

Hello,

I have submitted the pciutils MiniOS port to upstream (which I should
probably have done 18 years ago :)

https://github.com/pciutils/pciutils/pull/235
https://github.com/pciutils/pciutils/pull/236

Jan Beulich, le mer. 19 août 2026 08:40:37 +0200, a ecrit:
> On 18.08.2026 23:42, Samuel Thibault wrote:
> > Jürgen Groß, le mar. 18 août 2026 07:43:34 +0200, a ecrit:
> >> On 17.08.26 18:37, Samuel Thibault wrote:
> >>> Juergen Gross, le lun. 17 août 2026 10:24:02 +0200, a ecrit:
> >> What about adding a comment to the stubdom Makefile in a separate patch, like:
> >>
> >> # pciutils support has been removed with commit <commit-id>, revert that patch
> >> # in case it is needed again.
> >>
> >> I think this would be preferable over unused and probably bit-rotten code in
> >> the repository.

We can point people to pciutils through such a comment.

Jürgen Groß, le mer. 19 août 2026 09:12:00 +0200, a ecrit:
> On 18.08.26 23:42, Samuel Thibault wrote:
> > I don't see why it would be bit-rotten, since the pciutils version in
> > used is fixed, it's a library that has a quite stable API, and the pci
> > xen interface is supposed to keep backward compatibility.
> 
> Then I'd rather add it to Mini-OS (probably behind another CONFIG option) than
> having it in the Xen tree.

Mmm, but how? We don't really want to pull the whole pciutils build into
mini-os :)

With regards,
Samuel

