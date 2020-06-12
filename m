Return-Path: <SRS0=NwDn=7Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9A3C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 01:15:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D3520842
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 01:15:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6rhnB1Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D3520842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjYI0-0004u9-8p; Fri, 12 Jun 2020 01:15:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wpuV=7Z=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jjYHz-0004u2-7i
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 01:15:23 +0000
X-Inumbo-ID: 3035231c-ac4a-11ea-b59a-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3035231c-ac4a-11ea-b59a-12813bfff9fa;
 Fri, 12 Jun 2020 01:15:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE59C206D7;
 Fri, 12 Jun 2020 01:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591924522;
 bh=wWen0H0+sBJ2dtHmvERsN63/B/oQ2CPJMCa9HkKOyxg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=G6rhnB1Yc6PDMlutIOfQdGycCu7iQNS98ml0F6COb6U7CgpKGnw+HdJpFdQJkSUso
 AHcew4RTa/22MfVuzGJKcKiQlVlHtLx/YM5smXj+kkgKZDUfD6yqUl+HJifSKUzSTH
 G41jYb7qLWxq7N3Sso6v+BFeWVzwE8aAVcRY/txs=
Date: Thu, 11 Jun 2020 18:15:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: HYPERVISOR_console_io + CONSOLEIO_write needs
 COPY_flush_dcache
In-Reply-To: <d0447d0e-5f33-cfe6-97af-31fb0411c5f4@xen.org>
Message-ID: <alpine.DEB.2.21.2006111811492.2815@sstabellini-ThinkPad-T480s>
References: <912a84d1-ca47-9c37-06e7-28bebe696b4d@epam.com>
 <b505db7c-494d-81ae-242f-e781430bd498@xen.org>
 <d0c976ad-2c16-436e-8906-ce217bc36e9c@epam.com>
 <d0447d0e-5f33-cfe6-97af-31fb0411c5f4@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George.Dunlap@citrix.com, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 11 Jun 2020, Julien Grall wrote:
> > Probably my use-case should be somewhere documented, so another time someone
> > steps into similar issues it is explained.
> 
> You would have the exact same issue if you don't use hypercalls but modify a
> buffer with MMU off and then expect it to read the content correctly after
> turning on the MMU. That's even on baremetal! (see [1])
> 
> I am afraid you have to know how the cache works when writing code that will
> run with MMU off.
> 
> Therefore I don't think it is Xen Project to document how an architecture
> works. Instead this should be a tutorial for anyone wanting to write its own
> OS.

We could have a page on wiki.xenproject.org on the topic if Oleksandr
wants to write it. (Adding George in case Oleksandr wants to write the
and he doesn't have access to the wiki yet.)

