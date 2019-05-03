Return-Path: <SRS0=JVlm=TD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8A8C43219
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 15:57:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2179E2075C
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 15:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUuiModE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2179E2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaYl-0006un-0D; Fri, 03 May 2019 15:57:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaYj-0006uC-KM
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:13 +0000
X-Inumbo-ID: 1cfa929a-6dbc-11e9-843c-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1cfa929a-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:57:12 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f23so5672212ljc.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6UQvlzhJS3XVf+RLb9pOXgKPYtvwD1gLsCyt8PdRjGk=;
 b=IUuiModEnDUrnMciCLIt47KbXEyzi6fe9NqgI55wciciIGpJzLLnBcubTdvetxuM4f
 uovS+D0CeY60QCzxKFnNWIV64QeWFQ3DLGSag3hUy/notT9MQCfLs7iySBjECwYQrQk/
 wf+ADSgHxxEdbUE3TbyVRTNxX+8zsZJ28+kFtMOhLRqDMTt3/wlHj/snNPcMwRyJxV61
 m7vSyC3g93buzL43PybtHXU1EVPOsLi7pQOOToFIdUf9qsnviRpJsjBYW7fCtGNUYjn8
 EiWq4tXcWdI4pxlR83kIdCUZHas7Oe06paZQwzI/qdPZmHL+dRGA3WDBlBCGI8opJbwq
 si9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6UQvlzhJS3XVf+RLb9pOXgKPYtvwD1gLsCyt8PdRjGk=;
 b=bqm+fOIfKIRADobuFSVFOIEuVfqe4+J5jUJfWubKSxKkxwTMLrtQmsTWxYYGHl7Ukb
 TddrDwuNqKQM0eex+n13vjpHoksirbWPqt8QY3X877Rh3v3VCLEhsFKFhYrD5zUhTiZn
 ug6yHvaP2oFfIOWJ60WfZI448WKHwAg8jJjHDIvakDX2D7nZiHms/RRyr8s+mApvkXzM
 7dKuvoDRAxRyucjxb17kdN53iKvLkB5kPxA2ItMu3YyTypFROCYdYdYbv8c7J/mWR0Z3
 bdVLWVtrLJTTwEYujnlWRW3GQ9b7l7G4ev8yCYUrbgYAFTQN0zR2GMYJwUhN395Wxp9R
 Pr2w==
X-Gm-Message-State: APjAAAUbV12BQONcfOQo7UpV/JHGt7PnVBgZu/Uu2NFuCM9RWUWoZLcw
 pMHOsMRH7rRZ3IFPYZEFBU8=
X-Google-Smtp-Source: APXvYqww+6OoXPoNwIxnEPKXNOKjFo2LzLmvhSI1+ZTt6+z9iM2FolKS+G08myhmHaRTKm2Ac3dD+A==
X-Received: by 2002:a2e:844a:: with SMTP id u10mr5531448ljh.41.1556899031429; 
 Fri, 03 May 2019 08:57:11 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 a2sm494449lfi.13.2019.05.03.08.57.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:57:10 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-10-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <380e76dc-9a06-66b0-8edb-0eb6e04eed14@gmail.com>
Date: Fri, 3 May 2019 18:57:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-10-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/20] xen/arm64: head: Correctly report the
 HW CPU ID
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
Message-ID: <20190503155709.P3u3sLgq0EWhV2llE_OKqKume2K5F8eCpVzDz-bCfgw@z>

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGVyZSBhcmUgbm8gcmVhc29uIHRvIGNvbnNpZGVyIHRoZSBIVyBDUFUgSUQgd2lsbCBiZSAwIHdo
ZW4gdGhlCj4gcHJvY2Vzc29yIGlzIHBhcnQgb2YgYSB1bmlwcm9jZXNzb3Igc3lzdGVtLiBBdCBi
ZXN0LCB0aGlzIHdpbGwgcmVzdWx0IHRvCj4gY29uZmxpY3Rpbmcgb3V0cHV0IGFzIHRoZSByZXN0
IG9mIFhlbiB1c2UgdGhlIHZhbHVlIGRpcmVjdGx5IHJlYWQgZnJvbQo+IE1QSURSX0VMMS4KPiAK
PiBTbyByZW1vdmUgdGhlIHplcm9pbmcgYW5kIGxvZ2ljIHRvIGNoZWNrIGlmIHRoZSBDUFUgaXMg
cGFydCBvZiBhCj4gdW5pcHJvY2Vzc29yIHN5c3RlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKClJldmlld2VkLWJ5OiBBbmRyaWkgQW5p
c292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNv
di4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
