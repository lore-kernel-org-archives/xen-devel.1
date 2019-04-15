Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E46C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 14:10:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F312087C
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 14:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87F312087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG2Jf-0004rJ-6r; Mon, 15 Apr 2019 14:10:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LxbA=SR=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hG2Je-0004rE-F7
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 14:10:34 +0000
X-Inumbo-ID: 3b31ee45-5f88-11e9-92d7-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3b31ee45-5f88-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 14:10:33 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 1FA9B305FFA3; Mon, 15 Apr 2019 17:10:32 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 0E3B0306E4AC;
 Mon, 15 Apr 2019 17:10:32 +0300 (EEST)
To: Matt Leinhos <matthew.leinhos@gmail.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <CAFLDOk8Egs_gJmx1Yg386eEkmq4gNcbBxVGkjC7Wofhz8zCe1w@mail.gmail.com>
 <1f659428-0dd1-5537-5007-e97ff16a7506@bitdefender.com>
 <CAFLDOk9j1FgXDG2N6rzi0ObO3eip2pxM59_aaTcBjg_F_63A0g@mail.gmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <a08d4a56-1da6-b373-f847-3a37197ffb53@bitdefender.com>
Date: Mon, 15 Apr 2019 17:10:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFLDOk9j1FgXDG2N6rzi0ObO3eip2pxM59_aaTcBjg_F_63A0g@mail.gmail.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] Xen 4.11.1: guest uses altp2m to crash host
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415141021.b1t8G0dvNGsyGp77Ap0fuvzvipqfiGsjEvK-oz17Zr0@z>

T24gNC8xNS8xOSA1OjA0IFBNLCBNYXR0IExlaW5ob3Mgd3JvdGU6Cj4gWW91IGFyZSBjb3JyZWN0
IC0tIGNoZXJyeSBwaWNraW5nIHRoYXQgY29tbWl0IGludG8gUkVMRUFTRS00LjExLjEgCj4gYWRk
cmVzc2VzIHRoZSBjcmFzaC4gVGhlIHByb2JsZW0gY2Fubm90IGJlIHJlcHJvZHVjZWQgb24gNC4x
Mi4KPiAKPiBJIGhvcGUgdGhpcyBoZWxwcy4KClRoYW5rIHlvdSBmb3IgY29uZmlybWluZyB0aGUg
Zml4IQoKVG8gdGhlIGRlY2lkZXJzOiB3b3VsZCBpdCBiZSByZWFzb25hYmxlIHRvIGFzayBwYXRj
aGVzIGxpa2UgdGhpcyB0byBiZSAKYmFja3BvcnRlZCB0byB0aGUgZnV0dXJlIDQuMTEgcmVsZWFz
ZT8KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
