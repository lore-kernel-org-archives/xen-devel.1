Return-Path: <SRS0=trq0=HZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CB3C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 23 Feb 2021 09:27:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A31A064DE9
	for <xen-devel@archiver.kernel.org>; Tue, 23 Feb 2021 09:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A31A064DE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.88658.166813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETyY-0005Dw-OT; Tue, 23 Feb 2021 09:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88658.166813; Tue, 23 Feb 2021 09:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETyY-0005Dp-KE; Tue, 23 Feb 2021 09:27:26 +0000
Received: by outflank-mailman (input) for mailman id 88658;
 Tue, 23 Feb 2021 09:27:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wmaw=HZ=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1lETyY-0005Di-1L
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 09:27:26 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7be0412-0d7f-41ab-904c-9595b6b1c5e7;
 Tue, 23 Feb 2021 09:27:24 +0000 (UTC)
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
X-Inumbo-ID: b7be0412-0d7f-41ab-904c-9595b6b1c5e7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614072444;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=elkiEyw/x+p4Mzp82r1PU6gv61RdX2VzYrI0EcXBgiE=;
  b=As6UcGJK6bypwN1OEdqFVkppT+JLta/yNR3b8tIx/9GSesWdEfA5AD4W
   uQm/dwo/4rwPoGqnrQE0/8ZFpKcHCGD09eyB5yNpL+MpXGka4dLgX34l5
   qc/lDpvFo8Ep8sb/UQY1IQ7426bp4SzyRIdWZIm45QELvLh9jupohnyJ2
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: r+v2a+pAcLkDXkvtq+LmVooxIXl9Yi1OFFOUqXQVl7OPoBQ/F1wR39/aL26u9L65xhinLzNmzD
 IkM5sCEPjCfpmf9zzrGZh3QpaL3V+Q5QWq+TyAXm2mwA4eOOjMRr16+CUyDyewQEuJfODY5MbN
 wFE9A627oR/uIUpbMpS8JESAt4rQ0ZHYTeHTVyqMz0CtZl4/Eu4i5+crISP29PhiJDm9wpiP9E
 8gWCC28x4GMlXuCPvXKvUr/Ak6638Jo/O1FCh/AH4ug72oJzWRID7AuaDHkXLapWfmKY7SqObb
 oGk=
X-SBRS: 5.1
X-MesageID: 37826829
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,199,1610427600"; 
   d="scan'208";a="37826829"
Subject: Re: [PATCH v3 2/8] xen/events: don't unmask an event channel when an
 eoi is pending
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <stable@vger.kernel.org>, Julien Grall
	<julien@xen.org>
References: <20210219154030.10892-1-jgross@suse.com>
 <20210219154030.10892-3-jgross@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <d368a948-17d6-4e64-110e-bede3158f49f@citrix.com>
Date: Tue, 23 Feb 2021 09:26:49 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219154030.10892-3-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2021-02-19 15:40, Juergen Gross wrote:
> An event channel should be kept masked when an eoi is pending for it.
> When being migrated to another cpu it might be unmasked, though.
> 
> In order to avoid this keep three different flags for each event channel
> to be able to distinguish "normal" masking/unmasking from eoi related
> masking/unmasking and temporary masking. The event channel should only
> be able to generate an interrupt if all flags are cleared.
> 
> Cc: stable@vger.kernel.org
> Fixes: 54c9de89895e0a36047 ("xen/events: add a new late EOI evtchn framework")
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>

I tested this patch series backported to a 4.19 kernel and found that
when doing a reboot loop of Windows with PV drivers, occasionally it will
end up in a state with some event channels pending and masked in dom0
which breaks networking in the guest.

The issue seems to have been introduced with this patch, though at first
glance it appears correct. I haven't yet looked into why it is happening.
Have you seen anything like this with this patch?

Thanks,
Ross

