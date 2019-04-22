Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A590CC282E1
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 09:23:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0D820685
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 09:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0D820685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIVAK-0003Pt-Is; Mon, 22 Apr 2019 09:23:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IUzO=SY=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hIVAI-0003Po-Q7
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 09:23:06 +0000
X-Inumbo-ID: 3a88a792-64e0-11e9-80e0-cbf3df4a5bc6
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a88a792-64e0-11e9-80e0-cbf3df4a5bc6;
 Mon, 22 Apr 2019 09:23:03 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4E6E43016C4A; Mon, 22 Apr 2019 12:23:02 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 45E39306E479;
 Mon, 22 Apr 2019 12:23:02 +0300 (EEST)
To: Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <5c0480bb-24bc-81cf-066b-a66b2e83d51f@bitdefender.com>
Date: Mon, 22 Apr 2019 12:22:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422092251.UMV_9Z-MOxYlJeRzdZXx7w-koQBP0aInVpSEm8MXcbg@z>

T24gNC8yMi8xOSAxOjI2IEFNLCBNYXRoaWV1IFRhcnJhbCB3cm90ZToKPiBUaGUgcHJvYmxlbSBp
cyB0aGF0IFJ0bFVzZXJUaHJlYWRTdGFydCBpcyBwYWdlZC1vdXQsIHNvIGknbSB0cnlpbmcgdG8g
cmVhY2ggaXQgdmlhIHNpbmdsZXN0ZXBwaW5nIGFzIGEgYmFja3VwIHNvbHV0aW9uLgoKRldJVywg
eW91IGNhbiBqdXN0IHVzZSB4Y19odm1faW5qZWN0X3RyYXAoKSB3aXRoIGEgVFJBUF9wYWdlX2Zh
dWx0IApwYXJhbWV0ZXIgdG8gY2F1c2UgdGhlIE9TIHRvIGJyaW5nIGEgcGFnZWQgb3V0IHBhZ2Ug
YmFjayBpbnRvIG1haW4gbWVtb3J5LgoKCkhUSCwKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
