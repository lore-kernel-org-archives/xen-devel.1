Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E9FC432BE
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:30:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 170E061A80
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 170E061A80
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161190.295971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N9v-0008EG-EG; Tue, 27 Jul 2021 13:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161190.295971; Tue, 27 Jul 2021 13:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N9v-0008E9-BF; Tue, 27 Jul 2021 13:30:11 +0000
Received: by outflank-mailman (input) for mailman id 161190;
 Tue, 27 Jul 2021 13:30:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N9u-0008E3-51
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:30:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N9u-000682-49
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:30:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N9u-0007xZ-3Q
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:30:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m8N9p-0002ZW-H4; Tue, 27 Jul 2021 14:30:05 +0100
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
	bh=d8C0ZlsJ9NWx1TZfi3koiNLXlaW2f/feWGO/stqtA78=; b=P1gsqcF8V5G4mLTCq0MJ0/klwG
	vAMvaDPYLgFq59y+4xjijn0tPX7fIzIKU2Okj6x3xfOUeZRWdKzTGG8xy/W1v8FDvrcSyHKNS7k9Q
	z++5Cv7MyE4YrfKvNTzEUed0x8d0CpBpqPZNNZkXP/DnxeDt144noffQ2kXUHS5/g52g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24832.2653.349970.515704@mariner.uk.xensource.com>
Date: Tue, 27 Jul 2021 14:30:05 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Scott Davis <scottwd@gmail.com>,
    <xen-devel@lists.xenproject.org>,
    Scott Davis <scott.davis@starlab.io>,
    Wei Liu <wl@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen  Gross <jgross@suse.com>,
    Daniel De Graaf <dgdegra@tycho.nsa.gov>,
    "Daniel P .  Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel
 option to xl.cfg
In-Reply-To: <dfc8bc88-ccab-bc6b-704d-c8ef95182311@citrix.com>
References: <8ee22fab0731347dd7f998c5f336eac804785c28.1627014699.git.scott.davis@starlab.io>
	<dfc8bc88-ccab-bc6b-704d-c8ef95182311@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel option to xl.cfg"):
> On 23/07/2021 05:47, Scott Davis wrote:
...
> >          ret = libxl_flask_context_to_sid(ctx, s, strlen(s),
> >                                           &d_config->b_info.device_model_ssidref);
> > +        if (ret) {
> > +            if (errno == ENOSYS) {
> > +                LOGD(WARN, domid,
> > +                     "XSM Disabled: device_model_stubdomain_init_seclabel not supported");
> > +                ret = 0;
> 
> Surely this wants to be a hard error?
> 
> Not specifying a label is one thing, but specifying a label and having
> it not take effect because code was compiled out of the hypervisor
> sounds like a security hole.
> 
> I see this is a pattern copied from elsewhere, but it seems very short
> signed.

I wonder if this is to try to make it possible to boot a system whose
config specifies XSM labels but with XSM disabled.

Marek, or someone, can you advise ?

My initial thoughts are to agree with Andrew that ignoring this error
seems to me to be a bad plan, but maybe there is a good reason.

If we do want to improve this, maybe we need to update all the
corresponding call sites.

Thanks,
Ian.

