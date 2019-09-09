Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3510CC4740A
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 14:28:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 055DF20863
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 14:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgjfMzZH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 055DF20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7KeW-0000TV-Np; Mon, 09 Sep 2019 14:28:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MMG2=XE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i7KeV-0000TQ-RN
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:28:23 +0000
X-Inumbo-ID: 13a90fc6-d30e-11e9-978d-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13a90fc6-d30e-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 14:28:23 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y23so12951130lje.9
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2019 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Tbg8wYuWJi/YLLsIxvRhFpL/qD8vkOU0RjjHPDJSKlQ=;
 b=bgjfMzZHZUuaITzZh8Z5WtTwc4qHgcTqDva6A+btpaXn7UCRUoAPcqeN4wHanzKEcY
 3mC2CzDEHJCo1e4OrLHB5MdnUUPTBd/RxctJD6o4Yec4xcjWpGhBNTk2xjuhWLNAEV1F
 rIJKdM0EiJSuB7S2O1m20wnkjY5Qo1w0sdIbCdR2uqtYkDebWQs+u9ydfAgrvrus2cuA
 2vmT+1CFubkMfPq6+18CjVLGt5OO80eg/dK6FVhpkf89l2okaI+KP8e88CEBoa9ZNDkn
 EOclQU+Jx609W3Pr2DNWlra447cd/0LkH6CErMTvdUCarJ/PSZ8NRJgO55IV2IXPQJJx
 eERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Tbg8wYuWJi/YLLsIxvRhFpL/qD8vkOU0RjjHPDJSKlQ=;
 b=a1kWKlPNt0UBTWDyxeUw0O7ne0aK0i7XmcTHy6J7vlAmg4ZXFZjIh2/EIAY60tkQV+
 WCR7VWdzUM7TKqsFmPpWybBEwZ3tOsgHOvxSfjwzLjWuB110chEUSMGrujpXzb/Q79Ej
 tEPVf2F7zO9A+ALCG3wskvqbahPGBWGzN668ksi/j8tlc0eBNB0EulBsFvd+rafXiLNC
 qITUd7dY6Sc1wTe/UIhiZVCOzcTPpPfLQWC5maYgIL/zoj9hwudxgQkbZCeUpVsnvol6
 kLaaaHUoGWXumTjLfbYPrL2w9mW4/ok8lMCaK/K2eFiL03cQ9b/H0vgV+B6CL+p8wyjp
 jaWQ==
X-Gm-Message-State: APjAAAVlowfvlbsyLfb0DQxVS7TokHNhPFWPqo4cwNltHI3enikXxg9+
 UmmJk1lVQDFdFFlgFSYza/CdUXjV
X-Google-Smtp-Source: APXvYqzqf49EcAAhqp1KmXzaRM/a3OrXuoPMKEqKbRV+J8ivwmwBlH1gzPqczTxqhy0pRhJy1ySUbA==
X-Received: by 2002:a2e:7d15:: with SMTP id y21mr9166177ljc.28.1568039301713; 
 Mon, 09 Sep 2019 07:28:21 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id z21sm3079308ljn.100.2019.09.09.07.28.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 07:28:21 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-7-git-send-email-olekstysh@gmail.com>
 <20f3a150-3619-deea-d0cd-fefe7f062a4f@suse.com>
 <d38bc9d3-1e34-66d4-8eea-baa1ebe0f195@gmail.com>
 <3a2d392f-a976-8a0f-af5f-041b2904325c@suse.com>
 <34824398-d170-9c60-ee38-ee14c70e4aa8@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <efb98ee8-355b-fa1d-217e-7be61f27d130@gmail.com>
Date: Mon, 9 Sep 2019 17:28:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <34824398-d170-9c60-ee38-ee14c70e4aa8@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 6/8] iommu: Add of_xlate callback
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
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDA5LjA5LjE5IDE1OjM3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSwgYWxsLgoK
Cj4KPgo+IE9uIDgvMjcvMTkgNDoxMSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI3LjA4
LjIwMTkgMTY6NTksIE9sZWtzYW5kciB3cm90ZToKPj4+IFRoZXJlIHdhcyBhIHByZWZlcmVuY2Ug
dG8gaW50cm9kdWNlIGNhbGxiYWNrIGluIGEgc2VwYXJhdGUgcGF0Y2ggCj4+PiBbMl0uIEFueXdh
eSwgc2hhbGwgSSBmb2xkIGl0Pwo+Pgo+PiBIbW0sIEkgZGlzYWdyZWUgd2l0aCBKdWxpZW4gaGVy
ZS4gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgaGF2ZSB1bnVzZWQKPj4gaG9va3MgaW4gdGhlIHRy
ZWUsIG5vdCBldmVuIGludGVybWVkaWF0ZWx5Lgo+Cj4gSSBoYXZlIHN0YXRlZCBteSBwcmVmZXJl
bmNlIGJlZm9yZSwgYnV0IHRoaXMgaXMgbm90IGEgc3Ryb25nIG9uZSBub3IgYSAKPiBtdXN0LiBJ
ZiB0aGlzIGlzIHlvdXIgY29uZGl0aW9uIHRvIGdldCB0aGUgc2VyaWVzIGFjY2VwdGVkLCB0aGVu
IAo+IE9sZWtzYW5kciBzaG91bGQgZm9sbG93IHlvdXIgcmVxdWVzdGVkLgoKV2lsbCBmb2xkIGl0
IGFzIHJlcXVlc3RlZC4gQW5kIHdpbGwgcmVuYW1lIGNhbGxiYWNrIHRvICJkdF94bGF0ZSIuCgoK
Pgo+IENoZWVycywKPgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
