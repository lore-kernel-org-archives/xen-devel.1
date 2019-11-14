Return-Path: <SRS0=jwRU=ZG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7402FC432C3
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 22:37:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F12B2070E
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 22:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkbSrK6b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F12B2070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVNkB-0004En-D0; Thu, 14 Nov 2019 22:37:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=174C=ZG=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iVNkA-0004Ei-7E
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 22:37:38 +0000
X-Inumbo-ID: 5ba52436-072f-11ea-9631-bc764e2007e4
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ba52436-072f-11ea-9631-bc764e2007e4;
 Thu, 14 Nov 2019 22:37:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w9so8737405wrr.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2019 14:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QRXH/NZYhvROE5KahlhyfY3P7FOLVUs1212noBG6aiA=;
 b=PkbSrK6b1KjxjCLZMt/2dFTJdtUB9b6rBC2WV+2R71aSXc7GNY8CifDvW0hRLzX/VH
 GHHjPCq3TWpsprnKfz9PCinsLY03meeB3IrNaNXzTO9nTld5fIGzZVrMVnH3m4k9AUG7
 D/MqRyg2zkHtAk5gsVOeNm6grMB/+WJE3WBCJLpAY7dItZa4QDd9dBr362UTvuFpZN8B
 3NW8t9GYirVA2kdSrBBuV6x70wUP3MUi2CCz+A5TXv8eFTbkebgbg3SXBlEUqsZAlPij
 jqRYxTretDBqlKVet+ODzp4r9pMYVX2hIrlazY9KUooc1wszIihuzh4/CEkm/MH3syx0
 8/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QRXH/NZYhvROE5KahlhyfY3P7FOLVUs1212noBG6aiA=;
 b=sfRD28UL9B22rZZWHKOwSHTP4/ZxJKNw3hJ4Tpzw8Mw0z6f3WVmsVkw6d5ST9tWhyg
 CiCQZAwEVCOqexXixaf5SBOmVMxNIeJ7lXEsa1rdayBy78dcjHaU0cRapJ4ITb25DS7+
 XU+NYXNonxrLDZvZzdnAf0T9FHeHI1r7gLW1ZL5HPb3Usv0AROJzh0g90lRaDWZfwGEV
 LweChWUQDWfgausqqqrypBwOfc50GbX8BH4Mwfj89HnokwmQa4jeu0GCwztEl4LLNpK6
 /uR2uxyIq5g7nuyFNUnKMOplI3PEgpPVk1sTyYiwPHe+3VlJVVaGQIO7SeyoKPki4Xc6
 79rQ==
X-Gm-Message-State: APjAAAVWGnVd3rD7K0c5S6Gf4e/o1KEH/ajgvHApJKvfWfWuZvHuyjDO
 kfyaCY3fZa2lJtKZ48Vk50VWDoPaJK/4yeSsKew=
X-Google-Smtp-Source: APXvYqxAQMHf05kPSd/BbOm3S5DymjVMgfIyk75DocjWTZVw0ek6irjq9PbYxCOviAKyjMQgrHRNHHIjBkYzR2lsRRE=
X-Received: by 2002:a5d:5391:: with SMTP id d17mr12321908wrv.382.1573771056523; 
 Thu, 14 Nov 2019 14:37:36 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhkB6M8sTMdSU2t+BQqfZ6jTQjU5k9Q3337Jx8APnowxZg@mail.gmail.com>
 <d981d5d9-6ee0-4bf6-6c76-a217be918aac@citrix.com>
In-Reply-To: <d981d5d9-6ee0-4bf6-6c76-a217be918aac@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 14 Nov 2019 15:36:59 -0700
Message-ID: <CABfawhnyNcnizN1yr-GqiowJFbcWUAOxLegNUEELS84Ftfv6Eg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [TESTDAY] Test report
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMTE6MzkgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxNC8xMS8yMDE5IDE4OjM0LCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiAqIENvbW1lbnRzOiBBbGwgd29ya3MsIGFsdHAybStpbnRyb3Nw
ZWN0aW9uIHJlcXVpcmVzIHRoZSBlcHQ9cG1sPTAKPiA+IGJvb3QgZmxhZyBzcGVjaWZpZWQgdG8g
d29ya2Fyb3VuZCBhIGRlYWRsb2NrIGluIFhlbgo+Cj4gSXMgdGhpcyBzZXBhcmF0ZSBmcm9tIHRo
ZSBnZW5lcmFsIHByb2JsZW0gd2l0aCBFUFQgQS9EIGFuZAo+IHdyaXRlLXByb3RlY3RpbmcgcGFn
ZXRhYmxlcz8KPgoKSXQgc291bmRzIGxpa2UgaXQgaXMsIGl0IGhhcHBlbnMgd2l0aG91dCB3cml0
ZS1wcm90ZWN0aW5nIGluLWd1ZXN0CnBhZ2V0YWJsZXMuIEkgZGlkbid0IGhhdmUgdGltZSB0byBp
bnZlc3RpZ2F0ZSB3aGVyZSB0aGUgZGVhZGxvY2sKaGFwcGVucyBhbmQgc2luY2UgdGhlIHdvcmth
cm91bmQgaXMgZmluZSBmb3IgdGhlIHVzZWNhc2UgaXQgd2Fzbid0IGEKcHJpb3JpdHkgdG8gZmln
dXJlIG91dC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
