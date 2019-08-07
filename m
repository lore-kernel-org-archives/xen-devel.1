Return-Path: <SRS0=NT3h=WD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90267C32751
	for <xen-devel@archiver.kernel.org>; Wed,  7 Aug 2019 16:46:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67AA821E6C
	for <xen-devel@archiver.kernel.org>; Wed,  7 Aug 2019 16:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67AA821E6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvP54-00078h-GB; Wed, 07 Aug 2019 16:46:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvP53-00078b-2p
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:46:29 +0000
X-Inumbo-ID: e64eea29-b932-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e64eea29-b932-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:46:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E84C344;
 Wed,  7 Aug 2019 09:46:27 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B62B03F694;
 Wed,  7 Aug 2019 09:46:26 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-3-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f796767f-6644-43f4-3e13-7a0aa40c5441@arm.com>
Date: Wed, 7 Aug 2019 17:46:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806214925.7534-3-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/7] xen/arm: keep track of
 reserved-memory regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNi8wOC8yMDE5IDIyOjQ5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gICBzdGF0
aWMgdm9pZCBfX2luaXQgcHJvY2Vzc19tdWx0aWJvb3Rfbm9kZShjb25zdCB2b2lkICpmZHQsIGlu
dCBub2RlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgY2hhciAqbmFtZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHUzMiBhZGRyZXNzX2NlbGxzLCB1MzIgc2l6ZV9jZWxscykKPiBAQCAtMzA3LDcgKzMzNCwx
MSBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9zY2FuX25vZGUoY29uc3Qgdm9pZCAqZmR0LAo+
ICAgCj4gICAgICAgaWYgKCBkZXZpY2VfdHJlZV9ub2RlX21hdGNoZXMoZmR0LCBub2RlLCAibWVt
b3J5IikgKQo+ICAgICAgICAgICByYyA9IHByb2Nlc3NfbWVtb3J5X25vZGUoZmR0LCBub2RlLCBu
YW1lLCBkZXB0aCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWRkcmVzc19j
ZWxscywgc2l6ZV9jZWxscywgTlVMTCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMsICZib290aW5mby5tZW0pOwo+ICsgICAgZWxz
ZSBpZiAoIGRlcHRoID09IDEgJiYgIXN0cmNtcChuYW1lLCAicmVzZXJ2ZWQtbWVtb3J5IikgJiYK
PiArICAgICAgICAgICAgICBzdHJsZW4obmFtZSkgPT0gc3RybGVuKCJyZXNlcnZlZC1tZW1vcnki
KSApCgpVbmxlc3MgbXkgc3RkbGliIGtub3dsZWRnZSBpcyBydXN0eSwgc3RyY21wKCkgd2lsbCBv
bmx5IHJldHVybiAwIGlmIHRoZSB0d28gCnN0cmluZyBleGFjdGx5IG1hdGNoZXMuIFRoaXMgaW1w
bGllcyB0aGUgdHdvIHN0cmluZ3MgYXJlIGV4YWN0bHkgdGhlIHNhbWUgbGVuZ3RoLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
