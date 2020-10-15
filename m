Return-Path: <SRS0=IsAa=DW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0E5C433E7
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2020 13:17:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBFCB2225C
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2020 13:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="sr6xgljp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBFCB2225C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.7363.19215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT38H-0005oR-3B; Thu, 15 Oct 2020 13:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7363.19215; Thu, 15 Oct 2020 13:17:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT38H-0005oK-0D; Thu, 15 Oct 2020 13:17:25 +0000
Received: by outflank-mailman (input) for mailman id 7363;
 Thu, 15 Oct 2020 13:17:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sl3P=DW=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kT38F-0005oF-4C
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:17:23 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e806a902-b08e-40e8-b24b-6d9d8d91bf72;
 Thu, 15 Oct 2020 13:17:22 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kT38D-0004hh-St
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:17:21 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kT38D-0001Q0-Rd
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:17:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kT38A-0000P7-K1; Thu, 15 Oct 2020 14:17:18 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sl3P=DW=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
	id 1kT38F-0005oF-4C
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:17:23 +0000
X-Inumbo-ID: e806a902-b08e-40e8-b24b-6d9d8d91bf72
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e806a902-b08e-40e8-b24b-6d9d8d91bf72;
	Thu, 15 Oct 2020 13:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=H1KJpw10QLjHojNNuOFi9pGzZtl2DP3GHXC4cJ7LdlE=; b=sr6xgljpk2fT98oIk6E82bGeXl
	/kAsCZ1uk2oEzWjJ50vQN9pDFl7kL2APdStu73gMK8HfqgHTRywTsVmf6QLFwkevkP+q299JTXnQE
	buZazHyQV9JGx2K7meLp6cJmy++tBZTDuqyMSDxwa7s4ErOcvd1zTELejMvoGSCyS2KU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kT38D-0004hh-St
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:17:21 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kT38D-0001Q0-Rd
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:17:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
	(envelope-from <iwj@xenproject.org>)
	id 1kT38A-0000P7-K1; Thu, 15 Oct 2020 14:17:18 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24456.19422.318790.279648@mariner.uk.xensource.com>
Date: Thu, 15 Oct 2020 14:17:18 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Elena Ufimtseva <elena.ufimtseva@oracle.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/gdbsx: drop stray recursion into tools/include/
In-Reply-To: <ece6c5c2-43f8-36d2-370c-37d988baeb87@suse.com>
References: <ece6c5c2-43f8-36d2-370c-37d988baeb87@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] tools/gdbsx: drop stray recursion into tools/include/"):
> Doing so isn't appropriate here - this gets done very early in the build
> process. If the directory is mean to to be buildable on its own,
> different arrangements would be needed.
> 
> The issue has become more pronounced by 47654a0d7320 ("tools/include:
> fix (drop) dependencies of when to populate xen/"), but was there before
> afaict.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

