Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C3FC04AB5
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 22:05:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F6E26741
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 22:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F6E26741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXv5I-0003tF-6V; Mon, 03 Jun 2019 22:05:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXv5H-0003t9-LG
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:05:39 +0000
X-Inumbo-ID: b806a598-864b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b806a598-864b-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 22:05:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0297A78;
 Mon,  3 Jun 2019 15:05:37 -0700 (PDT)
Received: from [10.37.12.69] (unknown [10.37.12.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEE733F5AF;
 Mon,  3 Jun 2019 15:05:35 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
 <20190603220245.22750-3-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8fe2cf58-d890-bdd4-3572-1785fe6aa607@arm.com>
Date: Mon, 3 Jun 2019 23:05:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190603220245.22750-3-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/3] xen/arm: fix mask calculation in
 pdx_init_mask
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com,
 konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, JBeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603220534.uKQRBqWievcP584fScmfYuGPSQWno2F_o9ahGG31zf0@z>

SGksCgpPbiA2LzMvMTkgMTE6MDIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9wZHguYyBiL3hlbi9jb21tb24vcGR4LmMKPiBpbmRleCBiYjdl
NDM3MDQ5Li5hM2M2ZjRjMWVlIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vcGR4LmMKPiArKysg
Yi94ZW4vY29tbW9uL3BkeC5jCj4gQEAgLTUwLDkgKzUwLDEyIEBAIHN0YXRpYyB1NjQgX19pbml0
IGZpbGxfbWFzayh1NjQgbWFzaykKPiAgICAgICByZXR1cm4gbWFzazsKPiAgIH0KPiAgIAo+ICsv
Kgo+ICsgKiBXZSBkb24ndCBjb21wcmVzcyB0aGUgZmlyc3QgTUFYX09SREVSIGJpdCBvZiB0aGUg
YWRkcmVzc2VzLgo+ICsgKi8KPiAgIHU2NCBfX2luaXQgcGR4X2luaXRfbWFzayh1NjQgYmFzZV9h
ZGRyKQo+ICAgewo+IC0gICAgcmV0dXJuIGZpbGxfbWFzayhiYXNlX2FkZHIgLSAxKTsKPiArICAg
IHJldHVybiBmaWxsX21hc2sobWF4KGJhc2VfYWRkciwgKHU2NCkxIDw8IChNQVhfT1JERVIgKyBQ
QUdFX1NISUZUKSkgLSAxKTsKClNlZSBteSBjb21tZW50IG9uIHYyIHJlZ2FyZGluZyB1NjQgdnMg
dWludDY0X3QuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
