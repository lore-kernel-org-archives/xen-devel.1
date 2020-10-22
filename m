Return-Path: <SRS0=UfNL=D5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0161BC55179
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 11:17:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DFD622267
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 11:17:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="PdDpV182"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DFD622267
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10373.27602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVYay-0006GY-0D; Thu, 22 Oct 2020 11:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10373.27602; Thu, 22 Oct 2020 11:17:23 +0000
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
	id 1kVYax-0006GR-Tb; Thu, 22 Oct 2020 11:17:23 +0000
Received: by outflank-mailman (input) for mailman id 10373;
 Thu, 22 Oct 2020 11:17:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVYaw-0006Fi-IZ
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 11:17:22 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da8b5dac-2abb-45e1-809a-d7e83a5cc64e;
 Thu, 22 Oct 2020 11:17:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVYaw-0006Fi-IZ
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 11:17:22 +0000
X-Inumbo-ID: da8b5dac-2abb-45e1-809a-d7e83a5cc64e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id da8b5dac-2abb-45e1-809a-d7e83a5cc64e;
	Thu, 22 Oct 2020 11:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603365442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=skjN9q8/nTEh5lu/TM7UYNGn5QCEmu0rcjUMMXxXrQg=;
  b=PdDpV182p/XGoQe7D1tB7LdH6c3ouo1YHHFf0kzRZ0B+cm0Rd32DOJCm
   vmAzjAMHM6UDrmgNN8n06HXXmFyUV9Rgan/zsjTbUoJbtYZ3C8UXlbdM0
   M+lLWcibHgzU3ipq3X0hA6JzNnyfpNfYprf1vcah23unWvz0UQX79zhoo
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nztF+dxPBXyakSpRbZ4sVTF0NL6HTI1gmkAjNGqe8as/rZW59KAb9IUiA0EB7HuLxSCXBweFOE
 gm4aMuYyDOB1kXlWxrVcoL5gw7Z21NhGtVIqGQ1wjE2xHc8DUzE66OSGcrqVRHJ0xEZ7vZLoXk
 ZtUHOq1+UmnvB9OhpJxrba0FZeXrHRHTYfBmzLq1AWtVT0dkaSO/wed5ss/Jug4zrKGhzakg/U
 vsP4HuZJAVhB3FDJmIxVxOmvRIz5oXAYp1IbOkPLLzU0fpiccDFwH+TWjQJhCJcveTeNAhDy6Z
 Zao=
X-SBRS: None
X-MesageID: 29889853
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,404,1596513600"; 
   d="scan'208";a="29889853"
Date: Thu, 22 Oct 2020 13:17:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 4/8] evtchn: let evtchn_set_priority() acquire the
 per-channel lock
Message-ID: <20201022111712.g7kvaducfgwa6whn@Air-de-Roger>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <266c9178-700b-5663-4b5f-69f160a165ab@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <266c9178-700b-5663-4b5f-69f160a165ab@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Tue, Oct 20, 2020 at 04:09:41PM +0200, Jan Beulich wrote:
> Some lock wants to be held to make sure the port doesn't change state,
> but there's no point holding the per-domain event lock here. Switch to
> using the finer grained per-channel lock instead.

While true that's a fine grained lock, it also disables interrupts,
which the global event_lock didn't.

> FAOD this doesn't guarantee anything towards in particular
> evtchn_fifo_set_pending(), as for interdomain channels that function
> would be called with the remote side's per-channel lock held.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

