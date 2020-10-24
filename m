Return-Path: <SRS0=VpI/=D7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF1BC2D0A3
	for <xen-devel@archiver.kernel.org>; Sat, 24 Oct 2020 13:32:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B78122203
	for <xen-devel@archiver.kernel.org>; Sat, 24 Oct 2020 13:32:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uizVRQwX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B78122203
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.11601.30672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWJej-0007KG-NY; Sat, 24 Oct 2020 13:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11601.30672; Sat, 24 Oct 2020 13:32:25 +0000
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
	id 1kWJej-0007K9-KM; Sat, 24 Oct 2020 13:32:25 +0000
Received: by outflank-mailman (input) for mailman id 11601;
 Sat, 24 Oct 2020 13:32:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6JnP=D7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kWJeh-0007K4-Jw
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 13:32:23 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58d53182-45c0-4f18-80e3-c84e566bd040;
 Sat, 24 Oct 2020 13:32:22 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h7so5969933wre.4
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2020 06:32:22 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id f17sm10409284wme.22.2020.10.24.06.32.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Oct 2020 06:32:20 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6JnP=D7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kWJeh-0007K4-Jw
	for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 13:32:23 +0000
X-Inumbo-ID: 58d53182-45c0-4f18-80e3-c84e566bd040
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 58d53182-45c0-4f18-80e3-c84e566bd040;
	Sat, 24 Oct 2020 13:32:22 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h7so5969933wre.4
        for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2020 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=ykW/kGCRrp4MSwPvvIUsmz5dNalBmjO72gPf1orWJtg=;
        b=uizVRQwX822I3OdG3EBrJ3o0k7koJx8ER48dNaRlYobuGCWhL46xDmaklkkhhE2nXq
         7f7w4RRPJGmTschZsmlVP8Y5o9k1ibSAvHTpWlD+hnDBnADZgXiBfxfudAk5DirAj/IC
         PW8u0eTPlMAdTAYp2xTrdmzHPUheuKsLDd6MibPI7/yyQP3if5lhtsI98hGV1m70fiKD
         JqD7On7NMbojZR9uVQsvIHkQdvVkNMudaWyaTi7UbMMieu2W5Ex32+PGygz63LkE6Q+4
         mOS0mAuhQ+x+SLqOnij9HcF9MMWetEL9vcj8Xy4BOVEUNQhhJLmIy2z7ZZX45aoL5jK5
         6Nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=ykW/kGCRrp4MSwPvvIUsmz5dNalBmjO72gPf1orWJtg=;
        b=InfbidLmYq5avKJDDzOcd9BXB1nUxpsQYAj+RxHjumOIYny6ijxVFlaZ6Byfc7axOs
         CfI8hVZQMMYVrAPMTT0Yb4+IPzJ7mN0idbwsEaOOG7JGkXY2ohFlwfcaOw1QT2Mg/yGM
         GmtOQ4TBzyhi5AGUq/ZONAayyibh3tcG8eK2jaJIIysIn9Z0Yr4elqj0ewOi9S8qJWKx
         Q096Ii7V45nXdJ9T33FNKhFNTAOgx0JcRMoctUOHiQVmTG7TLshQcKg8UTcR31cQDspy
         YMdBGuUEiVdQN3srGLmlaFQrlXHw0ZGm0j8C3vJjo7l5IFnCMOSY3HUVWuMQskjdSEtL
         h1tA==
X-Gm-Message-State: AOAM531+22g3FMWZHjvlHN0v7enZUkrIaftKqeP6Qj31v6wvvZ6AB1h0
	ULTeP0czvKttEPUVIzzAS4M=
X-Google-Smtp-Source: ABdhPJwe0vog+Ce8D2mRs5a9B/885zA6cZFORLWAyXkLQOIoAqoOzwgl59/QOlo2Nh3Ibi1XgjawTg==
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr8207754wrl.124.1603546341501;
        Sat, 24 Oct 2020 06:32:21 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
        by smtp.gmail.com with ESMTPSA id f17sm10409284wme.22.2020.10.24.06.32.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Oct 2020 06:32:20 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <7b8ad528-b0bd-4d93-f08b-42b5af376561@suse.com>
In-Reply-To: <7b8ad528-b0bd-4d93-f08b-42b5af376561@suse.com>
Subject: RE: [PATCH] AMD/IOMMU: correct shattering of super pages
Date: Sat, 24 Oct 2020 14:32:19 +0100
Message-ID: <003201d6aa0a$19828f70$4c87ae50$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLsqfUdq1A5Y4ay/vzEavqcRMpipad5WK4w

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 20 October 2020 14:54
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant <paul@xen.org>
> Subject: [PATCH] AMD/IOMMU: correct shattering of super pages
> 
> Fill the new page table _before_ installing into a live page table
> hierarchy, as installing a blank page first risks I/O faults on
> sub-ranges of the original super page which aren't part of the range
> for which mappings are being updated.
> 
> While at it also do away with mapping and unmapping the same fresh
> intermediate page table page once per entry to be written.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Afaict this corrects presently dead code: I don't think there are ways
> for super pages to be created in the first place, i.e. none could ever
> need shattering.

I believe you are correct, yes. Certainly an improvement though so...

Reviewed-by: Paul Durrant <paul@xen.org>


