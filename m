Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7AAC43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:01:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8102B206BF
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:01:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjVEMwBe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8102B206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJig9-000677-HX; Thu, 25 Apr 2019 18:01:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+mKo=S3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hJig8-00066u-Ln
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:01:00 +0000
X-Inumbo-ID: 148c3d2e-6784-11e9-843c-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 148c3d2e-6784-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 18:00:59 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h21so415247ljk.13
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 11:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9xWT4JcLFk3bm5iDU/YuFAzR21r1AOIbL/2T503jT7Q=;
 b=IjVEMwBeyORyuU5HudgCdy+BlgMEcSxoSJ/DI9yyQwWgLlxuAKe4UcQk30Lf4G5nzn
 CDOeH1u4PvhGRLmK/u76h3s1PgAT2eoeIR4JhS6P2bR4RBmsbaGVI+MP+ezIxtBuBSuQ
 dv70eA8YruUrsZAV7IiB57qiaKvJi926gjyacmuEJkgrtU3Lb4MrgFpyAeGOsR1sSlF5
 aOkcU6uUo3S7w+5Bd0t2n0sBes+eX4VL6ZlWc9stnCJaXX76KCLpdr+4DR17tDa2oNBQ
 J6KIusCAZNr2ogwspwq5ZkSNSWcfw+Pufy6ZJHooe+Sc919KIM++5+fODCWot2absN4f
 0egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9xWT4JcLFk3bm5iDU/YuFAzR21r1AOIbL/2T503jT7Q=;
 b=hQ2nDKNAYpfinGlfVwuWcJKARK8Q1qKKcToCIlzuNIX9zAA8ji1HmUe12scPWLQLuN
 FqjYqYjJwuptcd42cMCo0x+oSm26WlfhIrrtMfbRIeHeKpT36cAa1QjMfKKDL6OyyaJ+
 h/8ZgiamEwLyjKT9p3hcBqrOzyqZyEkxraJiznXHvNDJhRh1pUfHK97qtdQkzgcCj7ed
 iVejnjY5QH0SJunyZM2yI8geZYXFnx9VFpRnrdnIGTch5Abv7Zxfp1keqZm/Wmzar7XD
 fnH0BCx+2hv7OkCjMw10ZY4Jr0PXz6Y5GpR2ZhGRDphUsK6v5b/382KFWCD8Qtw8nxua
 V0TA==
X-Gm-Message-State: APjAAAWs7SNv0kjSCGgUvUSHlK/MOIsb+pW0l3o+HEm7xT39gp+u1erv
 jPUi2Kc9EygNhJdWIxnpX8E=
X-Google-Smtp-Source: APXvYqzf8V1ROG0iqvLvnsv16RaRELeAF/tkSETuMHRe2bYwpAfJr+wvbQ8bI6eXdBYWWDsItrhv0g==
X-Received: by 2002:a2e:9097:: with SMTP id l23mr6652559ljg.43.1556215258488; 
 Thu, 25 Apr 2019 11:00:58 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 77sm4763129ljs.58.2019.04.25.11.00.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2019 11:00:57 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-4-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <7c176414-4e3c-d2ed-e50d-2cf5992fa2cd@gmail.com>
Date: Thu, 25 Apr 2019 21:00:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417175815.16905-4-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/7] xen/arm: tlbflush: Clarify the TLB
 helpers name
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
Message-ID: <20190425180056.XbiekbublO7o5MSngXxnrgIBGKQGy6aSkq0mV6OMF2A@z>

CgpPbiAxNy4wNC4xOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRMQiBoZWxwZXJzIGlu
IHRoZSBoZWFkZXJzIHRsYmZsdXNoLmggYXJlIGN1cnJlbnRseSBxdWl0ZSBjb25mdXNpbmcgdG8K
PiB1c2UgdGhlIG5hbWUgbWF5IGxlYWQgdG8gdGhpbmsgdGhleSBhcmUgZGVhbGluZyB3aXRoIGh5
cGVydmlzb3JzIFRMQnMKPiB3aGlsZSB0aGV5IGFjdHVhbGx5IGRlYWwgd2l0aCBndWVzdCBUTEJz
Lgo+IAo+IFJlbmFtZSB0aGVtIHRvIG1ha2UgaXQgY2xlYXJlciB0aGF0IHdlIGFyZSBkZWFsaW5n
IHdpdGggZ3Vlc3QgVExCcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlz
b3ZAZXBhbS5jb20+CgoKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
