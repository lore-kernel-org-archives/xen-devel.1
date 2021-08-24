Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74E9C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 19:29:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FAD460FD8
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 19:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FAD460FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.171685.313264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIc6y-000562-J1; Tue, 24 Aug 2021 19:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171685.313264; Tue, 24 Aug 2021 19:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIc6y-00055v-FX; Tue, 24 Aug 2021 19:29:28 +0000
Received: by outflank-mailman (input) for mailman id 171685;
 Tue, 24 Aug 2021 19:29:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wDk/=NP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mIc6x-00055p-Ce
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 19:29:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a80b4c3-9361-44e7-b335-5b1149ffd831;
 Tue, 24 Aug 2021 19:29:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65E0761002;
 Tue, 24 Aug 2021 19:29:25 +0000 (UTC)
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
X-Inumbo-ID: 3a80b4c3-9361-44e7-b335-5b1149ffd831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629833365;
	bh=7dbkBATlgc+VfeRRq8x5C9FsYuix4DR+wum6KfFN8xk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qUDxfHgro2OhY8eCIs6UFjIcBtNDiV2DuJs+ZTrTDg3pXajw48USbYp82nB7yW57K
	 t90KwVw37mtgrLwB+OQEzgGRD8ayU7uqifDWyfVEASAIwKbvCfum6Sd7sc9xnAv9GT
	 bQ8pWgRCQ8XFyTs8aVTxb0J1zOPDH/tyquXbbRmkqOHwteaVeGUUCDwlA2VUznMoRP
	 o56Bocd2Vf335n4XmeU0seBnET38tlOZ6GiH1A+DK0rBEnuqrU6aR5uSUqJKZzMPvr
	 1rt48DT/C9L8OMXW7yXcgqznomwlYngVE/Rv5aCKHQpVYslY6zK0dKGZmk46VWNWy7
	 v3FX/fJBhmvPQ==
Date: Tue, 24 Aug 2021 12:29:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
    xen-devel@lists.xenproject.org, George Dunlap <George.Dunlap@citrix.com>, 
    committers@xenproject.org
Subject: Re: Xen 4.16: Proposed release manager and schedule
In-Reply-To: <db112874-eb0a-c9ad-4509-6d048b056038@xen.org>
Message-ID: <alpine.DEB.2.21.2108241229070.24433@sstabellini-ThinkPad-T480s>
References: <24861.8902.217023.673705@mariner.uk.xensource.com> <5198b3ce-8a7c-a5b1-4ddd-f2052e1d4181@suse.com> <24862.31351.137596.242803@mariner.uk.xensource.com> <db112874-eb0a-c9ad-4509-6d048b056038@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Aug 2021, Julien Grall wrote:
> > Some of the thinness of this release in particular relates to an
> > unusual combination of substantial leave taken by many key
> > contributors, so maybe this is a thing we should consider.
> > Even my proposing this schedule was rather late, in part for those
> > reasons.
> > 
> > I don't personally have a strong opinion about the right decision.
> > But if we are intending to release in December, I think something like
> > my proposed schedule is probably about right.  Perhaps it could be
> > compressed a bit due to the lack of major contributions so far.
> 
> At the moment, my preference is to stick with the release in December. We
> don't have major contributions checked in yet on Arm, but there is a chance to
> have a couple of them with the current schedule on Arm.

+1

