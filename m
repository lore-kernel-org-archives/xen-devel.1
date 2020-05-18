Return-Path: <SRS0=XBwx=7A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BDCC433E1
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 13:39:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B87BC206D4
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 13:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7Na9MfI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B87BC206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jafz4-0000ZH-Q3; Mon, 18 May 2020 13:39:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VSjt=7A=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jafz2-0000ZA-KA
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 13:39:08 +0000
X-Inumbo-ID: f25ed04c-990c-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f25ed04c-990c-11ea-b9cf-bc764e2007e4;
 Mon, 18 May 2020 13:39:07 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id v12so11863829wrp.12
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=L9cL93kWhx2dXPlqi8FddZceJcA0i/90HizEBlALI1M=;
 b=N7Na9MfIYpylEkeu1Hd/8vTXagEicCuBJYnpWIUom9mplR1VAv4aCPFJQ3AaeyMq56
 RX6RuTYHVGqGUczYNzaQNp2yklux33GOHTVcV5tkqubpkBhsh7VG0KDz0ADnPAgSSdBQ
 oW4o0EWNvamTbskPYMC+Qv4kOqGzFp8Dm3z8/h9oYIqaFibAubvx3ItlAK6mGRLESpeE
 8hdJRExJRqTa5VDPcjtYPGRmNBVwkn1vLjoWSZiyijVLO28YN1isuD7zUAbRCohuLmQF
 H8F5Inc2Hbm8Y5JZgkg9xO8w0oz0D8UX7zC4rC9X0HfPZ5vOROnZdAyXfSYk2X9sKOAo
 /dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=L9cL93kWhx2dXPlqi8FddZceJcA0i/90HizEBlALI1M=;
 b=DNa8WpEvQDtLPYB1tKnlh/LY2MiopFpfWLLNIuL8hkL1cAC9Vq3EM3XbuzSxzg429w
 pAQInN4BWcV7YWBsNjb6ZSXc59gyhbhRcUUnbUHQhY3MMqYlZCkKTILALAvl86U/epXP
 LltaoJK1zK+eMr/tns8PgWoKbWfN9qrwtU5h55PqTP4iYelo8NskJ4Pjp03TjZQMmidn
 1Ku9y7Oz0/BKulnO3nEPDNxcR0tpWRypGafmFIuThrcTI98rED6LSk01XFs9cxAHa4Vo
 RdmJ9SllXH3fFoA+KsMwP3FE+0a+WYusK5tn/D4vM1gOeTt3UDI6ixQnRdTCdUnzLDbX
 rFhg==
X-Gm-Message-State: AOAM5338ZZv7NLbMOf9Bst2jVJ5p/s5Vf4Rn3GzEUjMkXIrxkUHn9KhE
 Z+b5yGp5cpu6tne52VyrWIA=
X-Google-Smtp-Source: ABdhPJxojX7SQA/wC2mYaCfEOdG3klbyhQgEwh+47mEdcKVfzg4jTFokDYYCAD2ynV9FwhlrLqDIzQ==
X-Received: by 2002:adf:fac4:: with SMTP id a4mr19058998wrs.134.1589809147010; 
 Mon, 18 May 2020 06:39:07 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.188])
 by smtp.gmail.com with ESMTPSA id 205sm14298083wmc.12.2020.05.18.06.39.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 06:39:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Denis Kirjanov'" <kda@linux-powerpc.org>,
 <xen-devel@lists.xenproject.org>
References: <1589808344-1687-1-git-send-email-kda@linux-powerpc.org>
In-Reply-To: <1589808344-1687-1-git-send-email-kda@linux-powerpc.org>
Subject: RE: [PATCH v3] public/io/netif.h: add a new extra type for XDP
Date: Mon, 18 May 2020 14:39:05 +0100
Message-ID: <000001d62d19$b3866510$1a932f30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFrOVL0IY3PjX3dJoEC4QuxiCQecqmDvxBg
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: jgross@suse.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Denis Kirjanov <kda@linux-powerpc.org>
> Sent: 18 May 2020 14:26
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; jgross@suse.com
> Subject: [PATCH v3] public/io/netif.h: add a new extra type for XDP
> 
> The patch adds a new extra type to be able to diffirentiate
> between RX responses on xen-netfront side with the adjusted offset
> required for XDP processing.
> 
> The offset value from a guest is passed via xenstore.
> 
> Signed-off-by: Denis Kirjanov <denis.kirjanov@suse.com>
> ---
> v3:
> - updated the commit message
> 
> v2:
> - added documentation
> - fixed padding for netif_extra_info
> ---
>  xen/include/public/io/netif.h | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/public/io/netif.h b/xen/include/public/io/netif.h
> index 9fcf91a..ec56a15 100644
> --- a/xen/include/public/io/netif.h
> +++ b/xen/include/public/io/netif.h
> @@ -161,6 +161,13 @@
>   */
> 
>  /*
> + * "netfront-xdp-headroom" is used to add an extra space before packet data
> + * for XDP processing. The value is passed by the frontend to be consistent
> + * between both ends. If the value is greater than zero that means that
> + * an RX response is going to be passed to an XDP program for processing.
> + */

I think 'used to add extra space' is probably the wrong phrase. How about 'is used to request that extra space is added'
It also does not state what unit the value is specified in so you need something to clarify that. I also don't understand what "The
value is passed by the frontend to be consistent between both ends" means. What happens if the backend is older and does not know
what this key means? 

  Paul

> +
> +/*
>   * Control ring
>   * ============
>   *
> @@ -985,7 +992,8 @@ typedef struct netif_tx_request netif_tx_request_t;
>  #define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
>  #define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
>  #define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
> -#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
> +#define XEN_NETIF_EXTRA_TYPE_XDP       (5)  /* u.xdp */
> +#define XEN_NETIF_EXTRA_TYPE_MAX       (6)
> 
>  /* netif_extra_info_t flags. */
>  #define _XEN_NETIF_EXTRA_FLAG_MORE (0)
> @@ -1018,6 +1026,10 @@ struct netif_extra_info {
>              uint8_t algorithm;
>              uint8_t value[4];
>          } hash;
> +        struct {
> +            uint16_t headroom;
> +            uint16_t pad[2]
> +        } xdp;
>          uint16_t pad[3];
>      } u;
>  };
> --
> 1.8.3.1



