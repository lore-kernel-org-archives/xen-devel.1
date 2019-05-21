Return-Path: <SRS0=yZuk=TV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1182CC04AAF
	for <xen-devel@archiver.kernel.org>; Tue, 21 May 2019 10:04:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7F7B2173E
	for <xen-devel@archiver.kernel.org>; Tue, 21 May 2019 10:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nD2b30KT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7F7B2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT1cj-0003SQ-5M; Tue, 21 May 2019 10:03:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wdSZ=TV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hT1ci-0003SJ-5J
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:03:56 +0000
X-Inumbo-ID: bd4f6367-7baf-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bd4f6367-7baf-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 10:03:54 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a10so15315566ljf.6
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2019 03:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dnOE/3PHjO/Q7BrLpo6QVEpk2q5m/32CbmezKMsAOa4=;
 b=nD2b30KTYiswC2ljI0zb6WAzNKyfkZL0cPcpN09jceduTpuGlxFHBHUARB8ghpy4PU
 X0RGptHg+nERX8u4Fv/dknKjECF8XSCxSTHrjkjiwEfbuYymGrE1ZZML2p5b2zTqmtT/
 BW78atOigI/WU6wZYiMhHDeVVuNUY4vv4OfxsQlR19D2kaujZSyj1RDsbfhC/l4zXPoI
 pxFJO83tCVz2SfMaygH5Ii6yUdIFfCOtV9bQ/sgfLPz6NlJ9D93Zd1NjQU1A80Oqzs7m
 mmip5mbWA2vFijwMcAui0EtR4dt+mXXNttfP8H7sR0Sk/trWiIhRXSayk5NCxGpdm2lg
 skqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dnOE/3PHjO/Q7BrLpo6QVEpk2q5m/32CbmezKMsAOa4=;
 b=R+fHjvIEbRHFyCM8Av2DnBEK+QbvgiA7AYO7UOQ1qb497vcQXFo5Xru8rego2S/lLF
 H+lyEFpLEkdu/UGGfJ0Fr/dZDCu/8jIzkJUKGpPj0f40josHp2mynSnldgNn6m8DOahe
 nG9IxmUcnXBx/9bX50dFSyPemRwD/60bLnrKoGD7ti1O9sWafpASf/6q/P17eXMUGSAv
 sZ8ez7118oS68qx1HGePjdd+wG0jdaAN90GWxqSPeGFzBg31lJ+jIMjpmsnr0ibEgF2X
 35Q2bhuyk8TVUSJgBiT0+vQ2V4aKjp5AdG/Z+5hA6eJxzU2xqX/BIoQGJ1zxWGyniFLU
 f9TQ==
X-Gm-Message-State: APjAAAUXkPBOukcEu6aS9BdJGkqv5saPhGMtbmfAsxjQLrVjLIiDP6h4
 Qcsa5WVa6L/HD/HKPsGEWQ0=
X-Google-Smtp-Source: APXvYqz0MQzRMl9bkbrDlps47U4UOMuVUH/V1PCn4l7GidZUnU02ZEE2DKnuOacleoPNZOWpA64Jjw==
X-Received: by 2002:a2e:9b46:: with SMTP id o6mr3334072ljj.76.1558433032937;
 Tue, 21 May 2019 03:03:52 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 k20sm4663887lfm.30.2019.05.21.03.03.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 03:03:51 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-13-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <8a0ff5b0-f674-e65f-f304-3673d45ca212@gmail.com>
Date: Tue, 21 May 2019 13:03:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514122456.28559-13-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 12/19] xen/arm32: head:
 Always zero r3 before update a page-table entry
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
Cc: Oleksandr_Tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190521100351.Ok0hs5hdFVo9CfGWFPzu6qyIjI7oEV4xMI_43nIq3Es@z>

CgpPbiAxNC4wNS4xOSAxNToyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBib290IGNvZGUg
aXMgdXNpbmcgcjIgYW5kIHIzIHRvIGhvbGQgdGhlIHBhZ2UtdGFibGUgZW50cnkgdmFsdWUuCj4g
V2hpbGUgcjIgaXMgYWx3YXlzIHVwZGF0ZWQgYmVmb3JlIHN0b3JpbmcgdGhlIHZhbHVlLCB0aGlz
IGlzIG5vdCBhbHdheXMKPiB0aGUgY2FzZSBmb3IgcjMuCj4gCj4gVGhhbmtmdWxseSB0b2RheSwg
cjMgd2lsbCBhbHdheXMgYmUgemVybyB3aGVuIHdlIGNhcmUuIEJ1dCB0aGlzIGlzCj4gZGlmZmlj
dWx0IHRvIHRyYWNrIGFuZCBlcnJvci1wcm9uZS4KPiAKPiBTbyBhbHdheXMgemVybyByMyB3aXRo
aW4gdGhlIGZldyBpbnN0cnVjdGlvbnMgYmVmb3JlIHRoZSB3cml0ZSB0aGUKPiBwYWdlLXRhYmxl
IGVudHJ5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4gCj4gLS0tCj4gICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgIC0gVXNlIDB4
MCBpbnN0ZWFkIG9mIDAKPiAgICAgICAgICAtIFJlbW92ZSBhIGR1cGxpY2F0ZSBtb3YgcjMsICMw
Cj4gLS0tCgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5j
b20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
