Return-Path: <SRS0=NS8K=57=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6F2C2BA19
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2020 11:22:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E90720575
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2020 11:22:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="CDh4SfHv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E90720575
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOg7P-0008VI-SC; Wed, 15 Apr 2020 11:22:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j72F=57=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jOg7O-0008Ul-AD
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:22:10 +0000
X-Inumbo-ID: 58b6af34-7f0b-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58b6af34-7f0b-11ea-9e09-bc764e2007e4;
 Wed, 15 Apr 2020 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=ge8/awGPFcL356SsWTT1df7dwyO0aIf9/UbP1gM8ze4=; b=CDh4SfHv85tjWe8KOuMcAsenPt
 VAmOMyRDuyn0rAKP4/agpEMnrGeEYOWCpWBtsh1wnJv/H2rwN6AyHpeZPthhCcdxLBRpF3IXcM501
 VTttX50z5rrJwOwRRDx+9RCxnnv+oV5LxpddTpRKBlW3UpkiKz8qaCM8gZl3f6E9p66g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg7M-0001Tq-PP; Wed, 15 Apr 2020 11:22:08 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg7M-00062d-G2; Wed, 15 Apr 2020 11:22:08 +0000
Date: Wed, 15 Apr 2020 12:22:05 +0100
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 04/12] xen: split alloc_heap_pages in two halves for
 reusability
Message-ID: <20200415112205.zan6w7ycgztni7aj@debian>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-4-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415010255.10081-4-sstabellini@kernel.org>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, Wei Liu <wl@xen.org>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, jbeulich@suse.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 14, 2020 at 06:02:47PM -0700, Stefano Stabellini wrote:
> This patch splits the implementation of alloc_heap_pages into two halves
> so that the second half can be reused by the next patch.

It would be good if you can put a summary on what each half does here so
that we can check you intent against the implementation.

Wei.

