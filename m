Return-Path: <SRS0=9fiq=HS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C42C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 18:05:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A70BC64DA1
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 18:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A70BC64DA1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.86015.161035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4if-0004pf-4h; Tue, 16 Feb 2021 18:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86015.161035; Tue, 16 Feb 2021 18:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4if-0004pY-1P; Tue, 16 Feb 2021 18:05:05 +0000
Received: by outflank-mailman (input) for mailman id 86015;
 Tue, 16 Feb 2021 18:05:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4id-0004pT-Ns
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 18:05:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4id-0006B6-LM
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 18:05:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC4id-00026J-KO
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 18:05:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC4ia-00014T-GV; Tue, 16 Feb 2021 18:05:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=z+ZPSMf938mJ4x62YBWP/JOKWCZStOwFzCP7XTqj4CM=; b=fC/fO8IHjiMhiOH+pS1PtwBGAU
	ZtxMLaMmHg3gnd5Nf6oTDPDdiaNjnzNFg8DepbBnveLAlgdwXqNY7tVujAgXq0AeXwCF1mORbxZeN
	GMb6ZxI10j51m2LRrHD7+GOp1py/z5L7FxA+kwYgjK0+1SLyApQy1GDz3XVFbrBnmpuc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24620.2380.253008.883244@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 18:05:00 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 04/10] tools/libxl: Fix uninitialised variable in libxl__domain_get_device_model_uid()
In-Reply-To: <24620.1955.243860.253052@mariner.uk.xensource.com>
References: <20210212153953.4582-5-andrew.cooper3@citrix.com>
	<20210216174327.8086-1-andrew.cooper3@citrix.com>
	<24620.1955.243860.253052@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [PATCH v2 04/10] tools/libxl: Fix uninitialised variable in libxl__domain_get_device_model_uid()"):
> Uhhhhh.  I think this and the other one seem to be stray hunks which
> each introduce a new uninitialised variable bug ?

I now think (following irc discussion) that I was wrong about this.

Use of intended_uid is conditional on user being set.  This is very
confusing.  This code is simulating a sum type.  If only we had sum
types.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

I think, given how confusing this is, that I would like another
careful review before I give my release-ack.

Ian.

