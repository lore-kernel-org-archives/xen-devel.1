Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698C5C4740A
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 14:33:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B06020863
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 14:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYjD6s3D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B06020863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7KjU-0001x9-BN; Mon, 09 Sep 2019 14:33:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MMG2=XE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i7KjT-0001ws-Fp
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:33:31 +0000
X-Inumbo-ID: c9aa17f2-d30e-11e9-a337-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9aa17f2-d30e-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 14:33:28 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r134so10655864lff.12
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2019 07:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0YhNkEdJ6IiJ1C9b9O07IR20BasShrf0CDfJ6l69dXc=;
 b=fYjD6s3DXxlzDf612Wa/HzD8o1+1L0zdqbN/1aLkcM/wDbsHvQc0fLHIBHzuDR6XGG
 6101zcAwhTjtrT5+MeAvONuLRR6F9K770S5w4F/kJukZVyDn0bq1Po0yMnpeqFzI5vvi
 2N+FJjxpauF8P9E4Kr7bPU/sV4WjKzYaI4diixFD6sMqXXAAuBK57M+iRYHa4lsEYxuA
 +xk2rouExNGAAHXDvo6gHjutmu/B5AZE+XO78VDKuOlQ/sbrQkWkUxr6khgSsGKWugPT
 /LLKmzY7NkYrrJJWNGDM/imcABsKduyJjpUkp8jej9LlNyjsXbd8ZQSnVMjjNPqVKgZT
 LkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0YhNkEdJ6IiJ1C9b9O07IR20BasShrf0CDfJ6l69dXc=;
 b=kXByv+6V0tPBpxJCOhr0tTkt8ndbs/Zbgz06XQfxEzUk0vDF9vmoHL5UsnG0wYsS/y
 eOPOL7+StVTE4oc36u21iXnVEjEL16pzDVxDRtuHhC4+HV4jFLNoNILY5ehmVhxWvaPo
 N8tPGt/ATn7iKuY68pm0r4jAEcUjLqYgSDr5/fSsUmXi/dEExI1t7DdPUDmknQNJxAqq
 dZ4VDXtgSH+A+DyulD6s3V0BVJhAyqyjViVNVZFbP88aGRKfTUbRTEpyU8Z+GAOx4uiu
 rjUpX0X1FfGVN/dRv7gaNgF2WqEQ8HQIWhvryF2kZZxKUl59VyngLx99+fw08uoDjtcx
 ArcQ==
X-Gm-Message-State: APjAAAWCyihI0FK6zr6OvSuPiD+zEAmjhKc680vLpb7ltMRKaUPiaynF
 DO/adVIMw40YxriDFhMIkUw=
X-Google-Smtp-Source: APXvYqyYpIEELFNU+xDT7tWNlvFov+vI3WoRkcRPbavWT16NXmpK5kSZH4TEjCFkdZZjnB61uF9ErA==
X-Received: by 2002:ac2:47e3:: with SMTP id b3mr15968926lfp.80.1568039607381; 
 Mon, 09 Sep 2019 07:33:27 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id v17sm3093916ljh.8.2019.09.09.07.33.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 07:33:26 -0700 (PDT)
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-9-git-send-email-olekstysh@gmail.com>
 <TYAPR01MB4544A44A2BDFADD533AF6D1AD8A20@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <1fef0ad1-3aaf-de88-262d-da0f5ae3f510@gmail.com>
 <TYAPR01MB454477F3AC979748BAA02D99D8BE0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <37fdfd98-fc36-3d42-e4fd-346969356f7c@gmail.com>
Date: Mon, 9 Sep 2019 17:33:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <TYAPR01MB454477F3AC979748BAA02D99D8BE0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 8/8] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAyLjA5LjE5IDEwOjA0LCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToKPiBIaSBPbGVrc2Fu
ZHItc2FuLAoKSGksIFNoaW1vZGEtc2FuCgoKPgo+PiBGcm9tOiBPbGVrc2FuZHIsIFNlbnQ6IFRo
dXJzZGF5LCBBdWd1c3QgMjksIDIwMTkgNzo1NiBQTQo+IDxzbmlwPgo+Pj4gQWJvdXQgdGhpcyBo
YXJkd2FyZSBoYW5kbGluZywgdGhpcyBwYXRjaCBzZWVtcyBnb29kIHRvIG1lLiBCdXQsIHNpbmNl
Cj4+PiBJJ20gbm90IGZhbWlsaWFyIGFib3V0IFhlbiBwYXNzdGhyb3VnaCBmcmFtZXdvcmssIEkg
dGhpbmsgSSBjYW5ub3QKPj4+IGFkZCBteSBSZXZpZXdlZC1ieSB0YWcgaW50byB0aGlzIHBhdGNo
LiBXaGF0IGRvIHlvdSB0aGluaz8KPj4gSSBhbSBub3QgY29tcGxldGVseSBzdXJlIHJlZ2FyZGlu
ZyB0aGF0LCBidXQgSSBoYXZlIHNlZW4gY2FzZXMgd2hlbiB0aGUKPj4gcGVvcGxlIGdpdmUgdGhl
aXIgUi1iIG5vdCBmb3IgdGhlIGVudGlyZSBwYXRjaCwgYnV0IGZvciBhIHBhcnQgb2YgaXQuCj4+
Cj4+IEVzcGVjaWFsbHksIHdoZW4gcGF0Y2ggdG91Y2hlcyBtYW55IHN1Yi1zeXN0ZW1zL2FyY2hz
LiBXb3VsZCB5b3UgbWluZCBpZgo+PiBJIHNwZWNpZnkgd2hhdCB5b3VyIFItYiBjb3ZlcnM/IC0+
IFtmb3IgdGhlIElQTU1VIEgvVyBiaXRzXQo+IEkgZ290IGl0LiBXaGVuIHlvdSBzdWJtaXQgdjQg
cGF0Y2gsIEknbGwgcmV2aWV3IGFuZCBzZW5kIHN1Y2ggYSB0YWcuCgpUaGFuayB5b3UuCgoKLS0g
ClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
