Return-Path: <SRS0=iSTY=TK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101F9C04A6B
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 06:31:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1FE217D6
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 06:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE1FE217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOz41-0003Bd-SS; Fri, 10 May 2019 06:31:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wlzL=TK=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hOz41-0003BY-0p
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 06:31:25 +0000
X-Inumbo-ID: 3a70fe09-72ed-11e9-8980-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3a70fe09-72ed-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 06:31:23 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 286A13031FCA; Fri, 10 May 2019 09:31:22 +0300 (EEST)
Received: from [192.168.228.119] (5-12-58-57.residential.rdsnet.ro
 [5.12.58.57])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id BDF3D306E4AC;
 Fri, 10 May 2019 09:31:21 +0300 (EEST)
To: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <QEYcx2UUWYxlJ02osYlearQNzGJ8v6MEW5XgfTTtnx2KS5tTQakOF-DTvIEqfClWbQlZYvWoyeWkiOKp3SyWmK1NeEQChNxG5drxloJyjEI=@protonmail.com>
 <66aeafd6-a87e-2f76-e0a3-6d0ad1e6f35f@bitdefender.com>
 <bf8797be-72f8-b38a-0e61-56ed69269652@citrix.com>
 <b09c9ca3-7ea7-da79-4a92-38119b5ff651@bitdefender.com>
 <CABfawhn-Qhjr3ES=g2n9kskauXC0JV9eoQBAZ23U-0cHR8YsNQ@mail.gmail.com>
 <596cae03-a96b-0521-7a08-4e91f02460fe@citrix.com>
 <CABfawhmyzW9bnVyV-JV7ecXO+d7sgz9iV4CgF=0fAQ-PtaLpsg@mail.gmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <c776dff0-4f82-237f-a154-a16bc9af5f47@bitdefender.com>
Date: Fri, 10 May 2019 09:31:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawhmyzW9bnVyV-JV7ecXO+d7sgz9iV4CgF=0fAQ-PtaLpsg@mail.gmail.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [VMI] How to add support for MOV-TO-DRx events ?
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190510063108.R2pY4jp4frMjqUNx4eroKvFrn0gFRKgAHm581WiDW4E@z>

T24gNS8xMC8xOSAyOjAzIEFNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+IEVpdGhlciB3YXks
IGV2ZXJ5dGhpbmcgY29tZXMgZG93biB0byB3aGF0IGJlaGF2aW91ciBpcyB3YW50ZWQgdG8gc3Rh
cnQgd2l0aC4KPiBBcyBJIHNhaWQsIEkgdGhpbmsgYWRkaW5nIHRoYXQgbW9uaXRvcmluZyBjYXBh
YmlsaXR5IGlzIGZpbmUgYXMgbG9uZwo+IGFzIGl0cyBsaW1pdGF0aW9uIGlzIGNsZWFybHkgZG9j
dW1lbnRlZC4KClJpZ2h0LiBNeSB0aG91Z2h0cyBhcyB3ZWxsLgoKClRoYW5rcywKUmF6dmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
