Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785F7C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:50:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 457C1206E0
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DH1YOsQ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 457C1206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK1F8-0001c3-Do; Fri, 26 Apr 2019 13:50:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK1F6-0001bs-Pf
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:50:20 +0000
X-Inumbo-ID: 3a1b9b7b-682a-11e9-843c-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3a1b9b7b-682a-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 13:50:19 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id b12so1816496lji.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 06:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fk7dgP4FNxPYQFKvR4Q25N9W13JSpH8goryJBFm/HSA=;
 b=DH1YOsQ+RpnpPpEbNX/JOBxxdQ0x2MRXNpY9n1+Rs7phFKb2NdgOsPMb4Dur0pLWXY
 4om72VmIK3WBioKxDlLZ/5NzzDO0RvXrpdlAQPBKebAh4LdSfuiagGR8KJ4miF4Ghr9D
 fa0gXTgjwpOhJRg2FF10elV9zgx7/NkIkedWX28bAwXgH6/ebeT8RJXsIbti1aUytScw
 SCAO1Ni2pRP9nxxzz2vxAmY5klJ7AXV5hNku/18WiITUJnIdlWr8ATWE1z2bH2WiZqz9
 6fXtKWJ6C9sFhlRiTVqZoCImwtA/E93XxfoY+OK7gpnkyHarHmSObAtslmQiDroefUQV
 K1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fk7dgP4FNxPYQFKvR4Q25N9W13JSpH8goryJBFm/HSA=;
 b=jG2HLQ7ckXZX38FeaIYUgK8gvdF708EtJqfuQy+F7xEd8aHJ9q6xR0ho+FOtBFEpl6
 W/0xwLjTudpPO58gsSPZxpf4gMFr1P129BBCxIHXXAvGM9cCREPO/vFrjtQIpwJeue+V
 rWG2IjinhjZ2sE9B/R0A0XfV/VI1n9vnGwqZ/dof23TSB6SVksdDF2kbsSdFHKsftKBx
 CKI/JTnq+TkCqsqg8VyufbwDrwMSSKCJGoq8xi1uw5htL4a+SYCILyxEa8zEv0ojqxUi
 eqiiOpgLvd6ugoop0dEhQAqlVMOS1mmuGNrQQsZpa6gW7w8OpGobaY191O3hXGYsn5UC
 wRng==
X-Gm-Message-State: APjAAAWWfe7nWioIxcU/a9j2dlll5lcmZcB6f+a/QIoeOVSaaJTz4EH0
 W6T4NTA/0hpXeCU3dvGylzI=
X-Google-Smtp-Source: APXvYqxKzZFr0La0OnCO02MwCABUUxKiuha+FSCZ7MN0s+c8bt7oq8wKYDfUIGqLcPALonTim3ZiaA==
X-Received: by 2002:a2e:3a17:: with SMTP id h23mr14415703lja.105.1556286617920; 
 Fri, 26 Apr 2019 06:50:17 -0700 (PDT)
Received: from [10.17.180.55] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 j76sm5263282ljb.78.2019.04.26.06.50.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 06:50:17 -0700 (PDT)
To: Julien Grall <Julien.Grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-3-julien.grall@arm.com>
 <3fa56715-823e-985b-384c-dc8342d77364@gmail.com>
 <fb22f2a1-f3a6-a962-a9ba-54c22e5c7d2a@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <4e365b84-122d-e613-ceaa-e2df8c865262@gmail.com>
Date: Fri, 26 Apr 2019 16:50:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fb22f2a1-f3a6-a962-a9ba-54c22e5c7d2a@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/7] xen/arm: Remove
 flush_xen_text_tlb_local()
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
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426135016.2YgTm8DA0rPREpcqRo0hrhhiviz9ykFZ1CrYjpWSF-8@z>

CgpPbiAyNS4wNC4xOSAyMzozNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSB1bmRlcnN0YW5k
aW5nIGlzIGNvcnJlY3QuIEkgYW0gbm90IGVudGlyZWx5IHN1cmUgaG93IEkgY2FuIGltcHJvdmUK
PiB0aGUgY29tbWVudC4KSSd2ZSByZS1yZWFkIHRoZSBjb21tZW50IGFnYWluLCBhbmQgcmVhbGl6
ZWQgaXQgYWN0dWFsbHkgZml0cy4gU28gbGV0IGl0IGJlLgoKPiAKPiBUbyBiZSBob25lc3QsIEkg
YW0gbm90IGVudGlyZWx5IHN1cmUgd2hldGhlciB0aGUgaXNiKCkgaXMgbmVjZXNzYXJ5Cj4gaGVy
ZS4gQXQgd29yc3QsIGFuIGVudHJ5IG9mIGFuIGV4aXN0aW5nIG1hcHBpbmdzIGlzIG5vdCBjYWNo
ZWQgd2l0aCB0aGUKPiBTQ1RMUl9FTDIuV1hOIHNldC4gVGhpcyBtYXkgb25seSBkZWZlciB0aGUg
cHJvYmxlbSBpcyBhbiBlbnRyeSBpcwo+IGluY29ycmVjdGx5IGNvbmZpZ3VyZWQgYmVmb3JlIHRo
ZSBmbHVzaC4gVGhpcyBpcyBkb25lIGVhcmx5IGF0IGJvb3QgKGFuZAo+IHdpbGwgYmUgZG9uZSBt
dWNoIGVhcmxpZXIgaW4gWzFdKS5XZWxsLCBmb2xsb3dpbmcgdGhpcyBsb2dpYyB3ZSBtYXkgZmlu
aXNoIHdpdGggVExCIGZsdXNoIGlzIG5vdCBuZWVkZWQgaGVyZSBhdCBhbGwuIEJlY2F1c2UgZW50
cmllcywgYWxyZWFkeSByZWFjaGVkIFRMQiwgd2VyZSBjb25maWd1cmVkIGJlZm9yZSwgYW5kIGFy
ZSBiZWxpZXZlZCB2YWxpZC4gQWxsIHRoZSBuZXh0IHdpbGwgaGF2ZSBXWE4gc2V0LgpCdXQgaW4g
dGhpcyBjYXNlLCBJU0IgaXMgbmVlZGVkIGFzIGFuIGV4YWN0IHBvaW50IGZyb20gd2hpY2ggYWxs
IG5ldyBUTEIgZW50cmllcyB3aWxsIGhhdmUgV1hOLgoKPiBTbyBJIGFtIGtpbmQgb2YgdGVtcHRl
ZCB0byBkcm9wIHRoZQo+IGlzYigpIGhlcmUuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
