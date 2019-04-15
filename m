Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F11AC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 11:39:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E783120645
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 11:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpOYd7bA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E783120645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFzwm-0007oD-5y; Mon, 15 Apr 2019 11:38:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5YYu=SR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hFzwl-0007o6-1y
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 11:38:47 +0000
X-Inumbo-ID: 063d20b5-5f73-11e9-92d7-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 063d20b5-5f73-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 11:38:45 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id v1so3492001lfg.5
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 04:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5i6D+rnl+cgjeEet9TjYJyhlPSyYWXx4R2nL37PQwtQ=;
 b=BpOYd7bACdscwuxzC0S3W2UgiWFMZbXqBFWLfvgRQOMTgxaF2O0J2eGXJ03pwQBBpS
 g6mA3lSIeNXE50QACx+DXy3MQngRIoRykuQw7Ze1JWT4wdUwCl/KWnsTt8c+klw7m5FP
 7DgirwGPq9FEiE9r7bTrW74X08k2AtMgTw3xMvyDQgu34/X3cH83z8x1tpz/Jt0fZp6A
 MZeBQW2njW0aEX4lM/3tAgOaOd7OrwqlYzlp4iKh1RZm/BsoCX3eDpjqPJyWOESJTF0n
 LGvlvYxk8edyeOZb+wi1bzHIEUfbMgsR2twMpFCPDIp/SvM6DsCpOsjzJsiIqQqFWd5o
 46cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5i6D+rnl+cgjeEet9TjYJyhlPSyYWXx4R2nL37PQwtQ=;
 b=LSeLsqIFkIDgZMFsBy9eLZ/i5gVUwd/wsB9cPyew0gXCxarTckISBybELgvUsiqKzG
 qzkXKF414VjNNss2+EJvbHP3gx3FVFVZa+gSOf+tr9XqGslgedqKTaZzAy7gUfh4jb7v
 k/omPlbSMTr/eP8w35aGaJRsfUJjdWRScNadWuuN/3M6h/g7d+WfZuKrci4uA5FJ6U2T
 RBk4YzpnF98jWb54pXiBkTZ2peIFhtChF8T6aW1Xf11c7WPrbarf+II720XZaJNx3eZH
 Yq8Pb8U3aKvJd7lxEMh3/ihpM4+VMKjau5HOxVsNoeMMiFeBOzMAUEAX3KHapPRVky0I
 UtzQ==
X-Gm-Message-State: APjAAAWNlGuqHfup+ZhEBQaVc6L2t1vOLyFYKRDRMNTg+iRwuv7P3tOD
 rpE3M37Rdj+dWdZ4GSNfI2M=
X-Google-Smtp-Source: APXvYqzBYVVxTrdhwKdrfHuE0GE4+ACcYLRs58txseWHJJ5iInCl9WeC396faSZNDAlu0aoSxIsImg==
X-Received: by 2002:a19:f705:: with SMTP id z5mr22840892lfe.93.1555328323744; 
 Mon, 15 Apr 2019 04:38:43 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m23sm9907380ljh.93.2019.04.15.04.38.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Apr 2019 04:38:42 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
 <1554718489-11318-5-git-send-email-olekstysh@gmail.com>
 <69c402ec-3a78-edf4-354d-1413b3c9c603@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <2ff19660-21e6-d2a6-6752-4c8a59433f72@gmail.com>
Date: Mon, 15 Apr 2019 14:38:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <69c402ec-3a78-edf4-354d-1413b3c9c603@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 4/5] xen/arm: Extend SCIF early prink
 code to handle other interfaces
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
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415113836.GCG-JXCXjWnhTMIMYLloIDmFyPhs2zrzfC_wifHmVn8@z>

Ck9uIDE0LjA0LjE5IDIwOjQ4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+Cj4gT24gNC84LzE5IDExOjE0IEFNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4g
RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
Pgo+Pgo+PiBFeHRlbmQgZWFybHkgcHJpbmsgY29kZSB0byBiZSBhYmxlIHRvIGhhbmRsZSBvdGhl
ciBTQ0lGKFgpCj4+IGNvbXBhdGlibGUgaW50ZXJmYWNlcyBhcyB3ZWxsLiBUaGVzZSBpbnRlcmZh
Y2VzIGhhdmUgbG90IGluIGNvbW1vbiwKPj4gYnV0IG1vc3RseSBkaWZmZXIgaW4gb2Zmc2V0cyBh
bmQgYml0cyBmb3Igc29tZSByZWdpc3RlcnMuCj4+Cj4+IEludHJvZHVjZSAiRUFSTFlfUFJJTlRL
X1ZFUlNJT04iIGNvbmZpZyBvcHRpb24gdG8gY2hvb3NlIHdoaWNoCj4+IGludGVyZmFjZSB2ZXJz
aW9uIHNob3VsZCBiZSB1c2VkICh0byBwcm9wZXJseSBhcHBseSByZWdpc3RlciBvZmZzZXRzKS4K
Pj4KPj4gUGxlYXNlIG5vdGUsIG5vdGhpbmcgaGFzIGJlZW4gdGVjaG5pY2FsbHkgY2hhbmdlZCBm
b3IgUmVuZXNhcyAiTGFnZXIiCj4+IGFuZCBvdGhlciBzdXBwb3J0ZWQgYm9hcmRzIChTQ0lGKS4K
Pj4KPj4gVGhlICJFQVJMWV9QUklOVEtfVkVSU0lPTiIgb3B0aW9uIGZvciB0aGF0IGJvYXJkIHNo
b3VsZCBiZSBlbXB0eToKPj4gQ09ORklHX0VBUkxZX1BSSU5USz1zY2lmLDB4ZTZlNjAwMDAKPj4K
Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hl
bmtvQGVwYW0uY29tPgo+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
Pj4KPj4gLS0tCj4+IMKgwqDCoMKgIENoYW5nZXMgaW4gdjM6Cj4+IMKgwqDCoMKgwqDCoMKgwqAg
LSBJdCB3YXMgZGVjaWRlZCBub3QgdG8gaW50cm9kdWNlIG5ldyBkZWJ1Zy1zY2lmYS5pbmMKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIGhhbmRsaW5nIFNDSUZBIGludGVyZmFjZSwgYnV0IHRv
IGV4dGVuZCBleGlzdGluZwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZWJ1Zy1zY2lmLmluYyBm
b3IgaGFuZGxpbmcgYm90aCBpbnRlcmZhY2VzLgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaGlz
IHBhdGNoIGlzIGEgcmVzdWx0IG9mIHNwbGl0dGluZyBhbiBpbml0aWFsIHBhdGNoCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJ4ZW4vYXJtOiBBZGQgU0NJRkEgVUFSVCBzdXBwb3J0IGZvciBlYXJs
eSBwcmludGsiCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFuZCBvbmx5IHJld29ya3MgYSBjb2Rl
Cj4+IC0tLQo+PiDCoCB4ZW4vYXJjaC9hcm0vUnVsZXMubWvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDcgKysrKysrKwo+PiDCoCB4ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMg
fCAxMyArKysrKysrKystLS0tCj4KPiBZb3Ugd2FudCB0byB1cGRhdGUgZG9jcy9taXNjL2FybS9l
YXJseS1wcmludGsudHh0IHdpdGggdGhlIG5ldyBvcHRpb24uCgpTdXJlLCB3aWxsIHVwZGF0ZS4K
Cgo+Cj4gT3RoZXJ3aXNlLCB0aGUgY29kZSBsb29rcyBnb29kIHRvIG1lLgo+Cj4gQ2hlZXJzLAo+
Ci0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
