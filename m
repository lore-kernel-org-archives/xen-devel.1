Return-Path: <SRS0=g3ET=HL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D18C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 18:01:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E2E164DBA
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 18:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E2E164DBA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83381.155076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XKI-0000nW-Sq; Tue, 09 Feb 2021 18:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83381.155076; Tue, 09 Feb 2021 18:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XKI-0000nP-Pq; Tue, 09 Feb 2021 18:01:26 +0000
Received: by outflank-mailman (input) for mailman id 83381;
 Tue, 09 Feb 2021 18:01:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9XKH-0000nA-Hv
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 18:01:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9XKH-00048P-HG
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 18:01:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9XKH-0004zb-G4
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 18:01:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9XK7-00067b-Q2; Tue, 09 Feb 2021 18:01:15 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=2LtKfQVabQUGbBjUgqbS2v50wctm2buFD9ChFc83YQY=; b=pD6j6uxh4JmPOxUbXiaJEQhtzj
	nt8hFsQIhN5YC0OyFmSzUIu+Tq1hJiTC9syQc/z1hXLh8jJ2krnDqMkPMOhB1vid6dnErxwsmH1gw
	yKhWrl04rlLCAQc2y7xUEzWCPooGJtbAN28HwwGE7hg/6zuF0sojF5WRa8VbLcfFyuKA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24610.52715.533963.858366@mariner.uk.xensource.com>
Date: Tue, 9 Feb 2021 18:01:15 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19
 processors
In-Reply-To: <6f44ae66-9956-3312-c4c8-b0f1e4b568bb@citrix.com>
References: <20210209153336.4016-1-andrew.cooper3@citrix.com>
	<c09110f7-6459-e1f7-2175-09d535ad03ce@suse.com>
	<24610.50089.887907.573064@mariner.uk.xensource.com>
	<6f44ae66-9956-3312-c4c8-b0f1e4b568bb@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19 processors"):
> On 09/02/2021 17:17, Ian Jackson wrote:
> > Jan Beulich writes ("Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19 processors"):
...
> >> How certain is it that there's not going to be another increase?
> >> And in comparison, how bad would it be if we pulled this upper
> >> limit to something that's at least slightly less of an "odd"
> >> number, e.g. 0x1800, and thus provide some headroom?
> > 5568 does seem really an excessively magic number...
> 
> It reads better in hex - 0x15c0.  It is exactly the header,
> match/patch-ram, and the digital signature of a fixed algorithm.
> 
> Its far simpler than Intel's format which contains multiple embedded
> blobs, and support for minor platform variations within the same blob.
> 
> There are a lot of problems with how we do patch verification on AMD
> right now, but its all a consequence of the header not containing a
> length field.
> 
> This number wont change now.  Zen3 processors are out in the world.

Err.  This Is Fine.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

