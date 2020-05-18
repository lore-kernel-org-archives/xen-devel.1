Return-Path: <SRS0=XBwx=7A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE61CC433E1
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 09:53:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ADAE2070A
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 09:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linux-powerpc-org.20150623.gappssmtp.com header.i=@linux-powerpc-org.20150623.gappssmtp.com header.b="ATAngUCp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ADAE2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-powerpc.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jacSC-0005DF-0h; Mon, 18 May 2020 09:53:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPYZ=7A=linux-powerpc.org=kda@srs-us1.protection.inumbo.net>)
 id 1jacSA-0005DA-L3
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 09:52:58 +0000
X-Inumbo-ID: 59ef185e-98ed-11ea-ae69-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59ef185e-98ed-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 09:52:57 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id x1so8305170ejd.8
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 02:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wlvXmRK547HKma4/tSG5+s6wQquNKkAgiXenRCOwyvU=;
 b=ATAngUCpF0JT8O+foKhMGeC513W5YVxEkqRyzeLl1b4i2cqRtnYdA/MxUOipnDGfa9
 98p8e8YuJgCXrxzwP3Pt2I+uWDPiiFqEFCglZn7enQ2j3bcpilbc7EwmFGQDaxl3tIHq
 +ZSoAN21T1xfAt+ZESdOIQB0aCIkOg5HDN1DR3GathzJN2X1rD7bzrnDQO8YYt+BhM/0
 jKlkkiNVzxREdsx2Om/lhrddk3V8MPTkjeQp4IjJYHd7RV0gbCtvq9JAg26q3OdiGL3/
 IXWXriaZxhQS152DQ7LWi5bmbCZFw/twYI/W9KfH5HB7vGJC1q6GPETIKgn+qn4jQE1s
 xIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wlvXmRK547HKma4/tSG5+s6wQquNKkAgiXenRCOwyvU=;
 b=cB5JOCKnXZQMPv7cXtpR7QROWShvQTaReCMrBrZwATaPDdjm/gmNSpz4ZmvaC0uXjC
 FeKvd+jT3eenvH6DTkTOyHRemRpdCplSq4pftVB7Oilfn9otaXentLBSmy8YYp+3Gmg5
 OD5lMMriZ+hs16dnY2PbwqoUwwdHamekUBQysEt96SHwaXTJ+s1a5dcejg6+MJDyjk6z
 whQ9cYa3N33v7xwLRRvgL/kf+8KbwVwlHun5Ez91M5tG//o+mY+5v9A11ffu7qnpqW+b
 1ghvHaPogpO5nZwS6AI7dSxvcwWLsb3JfGs/HmPGwUYJXGUQC6TK96C5firgu39EyOuu
 GY3g==
X-Gm-Message-State: AOAM532W/W5TKS543BH+Bo+kvg5xEWlf5etAV9KCPbCSIkHVLhN8C49q
 NFDj6vAc2YUhQzs3/gj+hDH36cT/44uw9wBBhDUv0A==
X-Google-Smtp-Source: ABdhPJzotjNJfhl9+jFaNCvkqmqJ+9X05lWSIqXzTZTpY1eYYfRCuna7yD9Y8IePMfLZbeOnDIIfmXKT7AIX4Kw2s8M=
X-Received: by 2002:a17:906:bce6:: with SMTP id
 op6mr14274713ejb.337.1589795576762; 
 Mon, 18 May 2020 02:52:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:34e:0:0:0:0:0 with HTTP;
 Mon, 18 May 2020 02:52:56 -0700 (PDT)
X-Originating-IP: [5.35.46.227]
In-Reply-To: <bbd8a83a-a676-9fa1-b03b-526e5122966f@suse.com>
References: <1589790285-1250-1-git-send-email-kda@linux-powerpc.org>
 <bbd8a83a-a676-9fa1-b03b-526e5122966f@suse.com>
From: Denis Kirjanov <kda@linux-powerpc.org>
Date: Mon, 18 May 2020 12:52:56 +0300
Message-ID: <CAOJe8K2pUv4Upvxya3LFPj0CxZ1-_hDZcrv-r6Q2EaxC8Ym6Ow@mail.gmail.com>
Subject: Re: [PATCH] public/io/netif.h: add a new extra type for XDP
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: xen-devel@lists.xenproject.org, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/18/20, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote:
> On 18.05.20 10:24, Denis Kirjanov wrote:
>> The patch adds a new extra type to be able to diffirentiate
>> between RX responses on xen-netfront side with the adjusted offset
>> required for XDP processing.
>>
>> For Linux the offset value is going to be passed via xenstore.
>
> Why? I can only see disadvantages by using a different communication
> mechanism.
I see it like other features passed through xenstore and it requires
less changes to
other structures with the same final result.

>
>>
>> Signed-off-by: Denis Kirjanov <denis.kirjanov@suse.com>
>> ---
>>   xen/include/public/io/netif.h | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/include/public/io/netif.h
>> b/xen/include/public/io/netif.h
>> index 9fcf91a..759c88a 100644
>> --- a/xen/include/public/io/netif.h
>> +++ b/xen/include/public/io/netif.h
>> @@ -985,7 +985,8 @@ typedef struct netif_tx_request netif_tx_request_t;
>>   #define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
>>   #define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
>>   #define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
>> -#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
>> +#define XEN_NETIF_EXTRA_TYPE_XDP       (5)  /* u.xdp */
>> +#define XEN_NETIF_EXTRA_TYPE_MAX       (6)
>>
>>   /* netif_extra_info_t flags. */
>>   #define _XEN_NETIF_EXTRA_FLAG_MORE (0)
>> @@ -1018,6 +1019,10 @@ struct netif_extra_info {
>>               uint8_t algorithm;
>>               uint8_t value[4];
>>           } hash;
>> +        struct {
>> +            uint16_t headroom;
>> +            uint32_t pad;
>
> Please use uint16_t pad[2] in order to avoid padding holes.
>
> Additionally you are missing the addition of the related feature
> Xenstore nodes in the comment area further up in the same file.

Done.

>
>
> Juergen
>

