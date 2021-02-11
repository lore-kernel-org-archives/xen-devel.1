Return-Path: <SRS0=WbUH=HN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD51C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 11 Feb 2021 14:15:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E429F64E38
	for <xen-devel@archiver.kernel.org>; Thu, 11 Feb 2021 14:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E429F64E38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83914.157179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lACkN-0001ep-0P; Thu, 11 Feb 2021 14:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83914.157179; Thu, 11 Feb 2021 14:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lACkM-0001ei-TN; Thu, 11 Feb 2021 14:15:06 +0000
Received: by outflank-mailman (input) for mailman id 83914;
 Thu, 11 Feb 2021 14:15:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qXs=HN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lACkL-0001ec-AB
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 14:15:05 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fa85e1c-7f64-47e5-88fe-316f17e06a3e;
 Thu, 11 Feb 2021 14:15:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id n10so4027162wmq.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 06:15:04 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:f088:412:4748:4eb1])
 by smtp.gmail.com with ESMTPSA id f2sm5093215wrt.7.2021.02.11.06.15.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Feb 2021 06:15:03 -0800 (PST)
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
X-Inumbo-ID: 7fa85e1c-7f64-47e5-88fe-316f17e06a3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=NqJl+7VgG2HfaF9Ked4qUIjOghassFCSe0BNnEt7qj8=;
        b=mPb+s7DITo6YbAtQjaqPCEBNGHpfyHFE4s9EjjWPnx5M8SIZYlPQ9vx4O6elsYgKPY
         +Ej7zP1LSif9NfKboWhGb5BXjisNCMPjXtL6b6THXoqm+F/neJTqbQzUUtQollpmiZdt
         IUpDSRHAT0zzr2yZuzdKroI87pI9a3TqJ1V/ihNLDVMzh1o79Q3Yfok7RhPlJwGA0Vak
         jyLyfyiNscakfPrS2GE8hoP64a9C1ODvEonaJRDa/Qqf7MTD3wXuZiVFOvjueTst8tll
         dZ4VqQdHT0ZLYLZTiuJ0Vy8rhIKV3NfpDzpEK2NmonwJVvCyCILbpuBN7xyALDZbqf9v
         ZBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=NqJl+7VgG2HfaF9Ked4qUIjOghassFCSe0BNnEt7qj8=;
        b=Cad+MD1LM8ccs50zmN647CubzYTI2SDPwg4IcgfUvaQlfxL59VKNgkw0ect6RyLVcs
         bLI0tOvDDKFVtscwZqHrSt4HNAa1PPsq+U1i6G2XR9OF8ntJ1CCE1Agr/bQNIE2zHdby
         RXXl6s5kK8SoaNNkaGWDIDikfoQMHCkyr7elAVQMzW0koA8s+nqbVjvEIY2iJF+cksQp
         2LRNOy/nMP+x12btafR5zUqijKROSK8DqP+CwAg+KRUdcagTCAqSgzFucmDM7WtsrllG
         cbTENG41bnirwkxoXaxkSR+OeE+JS2BedxKiRtOvfkqXI8zRwzdk8cqo3lrxSVFJJlfy
         0uiQ==
X-Gm-Message-State: AOAM530ezE5COQKZf327HJs/c7k1VjQBkcmo0u81sUXRywrf/leqtdCU
	eK7R1+olLutTVqy62c2BeA8=
X-Google-Smtp-Source: ABdhPJzMRxugvXnzrQVDPQcGqkvzFNvBaMKVtpKaUKUX/H65FT6SVTHvQwoSqVx3xmLWZ2SNHe4UNQ==
X-Received: by 2002:a1c:6a09:: with SMTP id f9mr5485740wmc.104.1613052903733;
        Thu, 11 Feb 2021 06:15:03 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>,
	<netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: "'Wei Liu'" <wei.liu@kernel.org>,
	"'David S. Miller'" <davem@davemloft.net>,
	"'Jakub Kicinski'" <kuba@kernel.org>
References: <20210211101616.13788-1-jgross@suse.com> <20210211101616.13788-5-jgross@suse.com>
In-Reply-To: <20210211101616.13788-5-jgross@suse.com>
Subject: RE: [PATCH v2 4/8] xen/netback: fix spurious event detection for common event case
Date: Thu, 11 Feb 2021 14:15:02 -0000
Message-ID: <001d01d70080$4a5446d0$defcd470$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJuRSjpYwlLGVvLkRJGigHTv/cnpwJEXRo/qRJS+MA=

> -----Original Message-----
> From: Juergen Gross <jgross@suse.com>
> Sent: 11 February 2021 10:16
> To: xen-devel@lists.xenproject.org; netdev@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Juergen Gross <jgross@suse.com>; Wei Liu <wei.liu@kernel.org>; Paul Durrant <paul@xen.org>; David
> S. Miller <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>
> Subject: [PATCH v2 4/8] xen/netback: fix spurious event detection for common event case
> 
> In case of a common event for rx and tx queue the event should be
> regarded to be spurious if no rx and no tx requests are pending.
> 
> Unfortunately the condition for testing that is wrong causing to
> decide a event being spurious if no rx OR no tx requests are
> pending.
> 
> Fix that plus using local variables for rx/tx pending indicators in
> order to split function calls and if condition.
> 

Definitely neater.

> Fixes: 23025393dbeb3b ("xen/netback: use lateeoi irq binding")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>


