Return-Path: <SRS0=B7AJ=FS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D17C2BB40
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 21:43:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47B0922258
	for <xen-devel@archiver.kernel.org>; Mon, 14 Dec 2020 21:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47B0922258
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.52621.92000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kovcl-0006Vr-Ii; Mon, 14 Dec 2020 21:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52621.92000; Mon, 14 Dec 2020 21:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kovcl-0006Vk-FR; Mon, 14 Dec 2020 21:43:19 +0000
Received: by outflank-mailman (input) for mailman id 52621;
 Mon, 14 Dec 2020 18:53:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V0bF=FS=canonical.com=guilherme.piccoli@srs-us1.protection.inumbo.net>)
 id 1kosyS-0007CE-Tm
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 18:53:32 +0000
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30e49d43-231a-4219-9fb1-1a396327b478;
 Mon, 14 Dec 2020 18:53:32 +0000 (UTC)
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <guilherme.piccoli@canonical.com>) id 1kosyR-0001Ba-El
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 18:53:31 +0000
Received: by mail-ed1-f69.google.com with SMTP id cm4so8722326edb.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Dec 2020 10:53:31 -0800 (PST)
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
X-Inumbo-ID: 30e49d43-231a-4219-9fb1-1a396327b478
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JG5ef47m2BX+tEst66UNr3S/GTFXEHs77QPAKIP06kc=;
        b=qc/G0RuwmIYK/5sXGAIAovTJZ4RfmfvkxuA9IdqHSl090aV1Kxkn//4KTh6277K25M
         d7lPnvC78kQ5Hb5Clh9UUSZmd+tjNzxi00Y1Ep0Vmlj+qFKmxP3rb06etyDtpWFfxxWI
         qr6bvxp2sVeWUn5t0C09reE5aUEz8KDL4n9efPFRZH39O+ZIy5J6J9TPBsHjYvCRYJPU
         AwdDCDgCNX2lCwncD+93TxTXYJW8J6OPh0+mkjXaEdtdfGPcukmgsku23DUQOYfqPnnk
         1R/bVZsPSUXRu2grS7O/fY21ysiUrVmkqGNZ8thKkYQ/IengU4SfZ0YAFjc4Rwnrwbov
         X8rA==
X-Gm-Message-State: AOAM53313Dttsuz6W1NcXF9Tfdrr2t0V+3Ym64eryZZmZQCXymOVrGXD
	GmAPBBax2jgzcP1EG1LcDk89l54Fi1OVD9B62EvDtiTw5TPOrBk69ZtHITFjF989CgMImNFgpfW
	OC6+StC9uuOGkXwQzoy0Nnr4GRPs6XAC8feTXtFJdZrWi5EBBHqX2IOED149N
X-Received: by 2002:a17:906:af49:: with SMTP id ly9mr23184948ejb.38.1607972010996;
        Mon, 14 Dec 2020 10:53:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw43xBOl1hR1+1GkFo7KHmuG2ixIL07q9pTifoNj7cWg8JF3A9PBHyJJ95TRUo2ZmCc7oxgmsLixgh/hpH644U=
X-Received: by 2002:a17:906:af49:: with SMTP id ly9mr23184940ejb.38.1607972010806;
 Mon, 14 Dec 2020 10:53:30 -0800 (PST)
MIME-Version: 1.0
References: <87h7oudcbx.fsf@vps.thesusis.net>
In-Reply-To: <87h7oudcbx.fsf@vps.thesusis.net>
From: "Guilherme G. Piccoli" <guilherme.piccoli@canonical.com>
Date: Mon, 14 Dec 2020 15:52:55 -0300
Message-ID: <CAHD1Q_zcruQ6KVHApvhb=0+mG0m80T+tmg1UzjQBki8j+aR51A@mail.gmail.com>
Subject: Re: kexec not working in xen domU?
To: Phillip Susi <phill@thesusis.net>
Cc: kexec mailing list <kexec@lists.infradead.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 4:13 PM Phillip Susi <phill@thesusis.net> wrote:
>
> Whenever I try to use kexec in a xen domU, the domain just reboots all
> the way through the bios rather than loading the kexec'ed kernel with
> the given command line.  Is this a known issue?  I've tried with both
> systemctl kexec and kexec -e.
>

Can you capture the serial console in a pastebin? Maybe add something
like "earlyprintk=ttySX", where ttySX is your known-to-work serial
console output. This helps to determine if it's a shutdown issue or an
early boot problem.
Also, worth to CC Xen mailing-list in this discussion I guess, I'm CCing them.
Cheers,


Guilherme

