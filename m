Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA72C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:03:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B061720717
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:03:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ez6jnAyY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B061720717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJiiL-0006gI-23; Thu, 25 Apr 2019 18:03:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+mKo=S3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hJiiJ-0006g2-Sa
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:03:15 +0000
X-Inumbo-ID: 64f63177-6784-11e9-843c-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 64f63177-6784-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 18:03:14 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id i186so451802lji.9
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 11:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bebe3740+LroLyEmR1FQwJ+L0+znf8eDdG2qTaUS5V8=;
 b=Ez6jnAyYNGKhaL2oLoG6wXKMeWZeB5tWwxzFwHhj3yR/KuMd27B0yE6DXolik9oAat
 8ru5WU1I7EExZaFvcAgOVQV3YtBuzEvSt0Vr+oVFXFt+xo8D8H11HJwYoNAROuJXChpW
 isOkJPcZVtIo8RNmjVql3GemZaEh4YRo/y5DfEq9lQDPp8okzYKFOcuMcCl+WtV5L+q2
 lOUfqCAtwLMYrrNbXcg6+QuPAwa8i9Q/6eeZwjRjJRiKHr4AMsFBrsHnTUKtxSlDEOZm
 u05pl+/oGn46zWR1QBbONGADspfBJRlLFF9KuRtUI6ShKW4CVSgTPTygOywG7pkaYbvb
 xjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bebe3740+LroLyEmR1FQwJ+L0+znf8eDdG2qTaUS5V8=;
 b=fc/kgMeVxdaa/PBCIZXdL4MOFRXWoSGibZANILOpWyyFV1GN8FuRBKxTVKc5XFznj+
 p2LHgEFXjovQmlpUVVjOgpYHHakotelc9tCtUovesYvEHS0M95DNVwZhHVL9Ho4h+xTa
 +kYu8G3PDoTk7gPuEyzGvXCqMp7BxFmY4EP+b2joKXaMbgzV9g20V+Ef+Bj5vHvlTONS
 jEY3AnsdZOEz2d6G926SfEDNtpt7IErc+RwvfLzsF9gUjrmls8/HVC1MYSkvsEtwKaj7
 r1vBvda/VjvfyHTKIBvrgexLCTvnxJbngKWSgUCo2EW1Y17tRDp0/LWN1Udzvh18JAN7
 1yCw==
X-Gm-Message-State: APjAAAVmNTrI9NamZNlhz6BKgfztr1HVGfEoYBF2tNxgNkWpQcNt/nlI
 iYHQrg6z9eVKik9XOoiKDa1gEnawAIo=
X-Google-Smtp-Source: APXvYqx6TwI78kum+kivn2bPgeUhDVWJbUTDG9Ci2+hlGA+7ND/p07tntmWyh4Ujs+qT0ImniL9y4A==
X-Received: by 2002:a2e:81da:: with SMTP id s26mr21806552ljg.86.1556215393416; 
 Thu, 25 Apr 2019 11:03:13 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 b14sm4852128ljf.53.2019.04.25.11.03.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2019 11:03:12 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-8-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <24101c05-5613-6819-af3c-82937ad319df@gmail.com>
Date: Thu, 25 Apr 2019 21:03:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417175815.16905-8-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 7/7] xen/arm: mm: Flush the TLBs even if a
 mapping failed in create_xen_entries
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425180311.OStics2wM84qjlnsWI2-lOPdBPtoGLUe10Nbs0RG6wo@z>

CgpPbiAxNy4wNC4xOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IGNyZWF0ZV94ZW5fZW50cmllcyB3aWxsIG9ubHkgZmx1c2ggdGhlIFRMQnMgaWYgdGhlIGZ1bGwK
PiByYW5nZSBoYXMgc3VjY2Vzc2Z1bGx5IGJlZW4gdXBkYXRlZC4gVGhpcyBtYXkgbGVhZCB0byBs
ZWF2ZSB1bndhbnRlZAo+IGVudHJpZXMgaW4gdGhlIFRMQnMgaWYgd2UgZmFpbCB0byB1cGRhdGUg
c29tZSBlbnRyaWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2Fu
aXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
