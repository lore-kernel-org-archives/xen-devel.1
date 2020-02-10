Return-Path: <SRS0=MXIQ=36=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925D1C352A4
	for <xen-devel@archiver.kernel.org>; Mon, 10 Feb 2020 13:23:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71BD720715
	for <xen-devel@archiver.kernel.org>; Mon, 10 Feb 2020 13:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71BD720715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j191X-00071b-6r; Mon, 10 Feb 2020 13:22:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j191W-00071V-00
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 13:22:50 +0000
X-Inumbo-ID: 6ec98638-4c08-11ea-b4bd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ec98638-4c08-11ea-b4bd-12813bfff9fa;
 Mon, 10 Feb 2020 13:22:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 86D09ACE8;
 Mon, 10 Feb 2020 13:22:48 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200208151939.31691-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43b54452-b4e8-eaca-466b-f79480f0b2c4@suse.com>
Date: Mon, 10 Feb 2020 14:22:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200208151939.31691-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pvh: Fix segment selector ABI
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDIuMjAyMCAxNjoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS9kb2NzL21p
c2MvcHZoLnBhbmRvYwo+ICsrKyBiL2RvY3MvbWlzYy9wdmgucGFuZG9jCj4gQEAgLTIzLDcgKzIz
LDcgQEAgZm9sbG93aW5nIG1hY2hpbmUgc3RhdGU6Cj4gICAqIGBjc2A6IG11c3QgYmUgYSAzMi1i
aXQgcmVhZC9leGVjdXRlIGNvZGUgc2VnbWVudCB3aXRoIGEgYmFzZSBvZiDigJgw4oCZCj4gICAg
IGFuZCBhIGxpbWl0IG9mIOKAmDB4RkZGRkZGRkbigJkuIFRoZSBzZWxlY3RvciB2YWx1ZSBpcyB1
bnNwZWNpZmllZC4KPiAgCj4gLSAqIGBkc2AsIGBlc2A6IG11c3QgYmUgYSAzMi1iaXQgcmVhZC93
cml0ZSBkYXRhIHNlZ21lbnQgd2l0aCBhIGJhc2Ugb2YKPiArICogYGRzYCwgYGVzYCwgYHNzYDog
bXVzdCBiZSBhIDMyLWJpdCByZWFkL3dyaXRlIGRhdGEgc2VnbWVudCB3aXRoIGEgYmFzZSBvZgo+
ICAgICDigJgw4oCZIGFuZCBhIGxpbWl0IG9mIOKAmDB4RkZGRkZGRkbigJkuIFRoZSBzZWxlY3Rv
ciB2YWx1ZXMgYXJlIGFsbCB1bnNwZWNpZmllZC4KCldvdWxkbid0IHRoaXMgd2FudCBhY2NvbXBh
bnlpbmcgd2l0aCBhbiBhZGp1c3RtZW50IHRvCnhlbi9hcmNoL3g4Ni9odm0vZG9tYWluLmM6Y2hl
Y2tfc2VnbWVudCgpLCB3aGljaCByaWdodCBub3cKaXNuJ3QgaW4gbGluZSB3aXRoIGVpdGhlciBv
bGQgb3IgbmV3IHZlcnNpb24gb2YgdGhpcyBkb2M/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
