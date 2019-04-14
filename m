Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2CEC10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:58:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C9F20880
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99C9F20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFiSH-0005nj-Pq; Sun, 14 Apr 2019 16:58:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bMma=SQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hFiSF-0005nd-MQ
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 16:58:07 +0000
X-Inumbo-ID: 7962430a-5ed6-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7962430a-5ed6-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 16:58:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3876D374;
 Sun, 14 Apr 2019 09:57:36 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54B2E3F68F;
 Sun, 14 Apr 2019 09:57:35 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
 <1554718489-11318-4-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <27ed97d0-b30b-6c7b-9308-6f69644fce03@arm.com>
Date: Sun, 14 Apr 2019 17:57:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554718489-11318-4-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 3/5] xen/arm: drivers: scif: Add support
 for SCIFA compatible UARTs
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
Message-ID: <20190414165733.BpPfQKwjI7vHHjpiL_QuC1KvYXUkqxrOv0vCjadT_5o@z>

SGkgT2xla2Fuc2RyLAoKT24gNC84LzE5IDExOjE0IEFNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9zY2lmLXVhcnQuYyBiL3hlbi9k
cml2ZXJzL2NoYXIvc2NpZi11YXJ0LmMKPiBpbmRleCA5NThmNzE3Li45NGNiMjMwIDEwMDY0NAo+
IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvc2NpZi11YXJ0LmMKPiArKysgYi94ZW4vZHJpdmVycy9j
aGFyL3NjaWYtdWFydC5jCj4gQEAgLTEsNyArMSw3IEBACj4gICAvKgo+ICAgICogeGVuL2RyaXZl
cnMvY2hhci9zY2lmLXVhcnQuYwo+ICAgICoKPiAtICogRHJpdmVyIGZvciBTQ0lGIChTZXJpYWwg
Y29tbXVuaWNhdGlvbiBpbnRlcmZhY2Ugd2l0aCBGSUZPKQo+ICsgKiBEcml2ZXIgZm9yIFNDSUYo
QSkgKFNlcmlhbCBjb21tdW5pY2F0aW9uIGludGVyZmFjZSB3aXRoIEZJRk8gKEEpKQo+ICAgICog
Y29tcGF0aWJsZSBVQVJULgo+ICAgICoKPiAgICAqIE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVr
c2FuZHIudHlzaGNoZW5rb0BnbG9iYWxsb2dpYy5jb20+Cj4gQEAgLTQ2LDYgKzQ2LDcgQEAgc3Rh
dGljIHN0cnVjdCBzY2lmX3VhcnQgewo+ICAgZW51bSBwb3J0X3R5cGVzCj4gICB7Cj4gICAgICAg
U0NJRl9QT1JULAo+ICsgICAgU0NJRkFfUE9SVCwKPiAgICAgICBOUl9QT1JUUywKPiAgIH07Cj4g
ICAKPiBAQCAtNzQsNiArNzUsMjAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwb3J0X3BhcmFtcyBw
b3J0X3BhcmFtc1tOUl9QT1JUU10gPQo+ICAgICAgICAgICAuaXJxX2ZsYWdzICAgID0gU0NTQ1Jf
UklFIHwgU0NTQ1JfVElFIHwgU0NTQ1JfUkVJRSwKPiAgICAgICAgICAgLmZpZm9fc2l6ZSAgICA9
IDE2LAo+ICAgICAgIH0sCj4gKwo+ICsgICAgW1NDSUZBX1BPUlRdID0KPiArICAgIHsKPiArICAg
ICAgICAuc3RhdHVzX3JlZyAgID0gU0NJRkFfU0NBU1NSLAo+ICsgICAgICAgIC50eF9maWZvX3Jl
ZyAgPSBTQ0lGQV9TQ0FGVERSLAo+ICsgICAgICAgIC5yeF9maWZvX3JlZyAgPSBTQ0lGQV9TQ0FG
UkRSLAo+ICsgICAgICAgIC5vdmVycnVuX3JlZyAgPSBTQ0lGQV9TQ0FTU1IsCj4gKyAgICAgICAg
Lm92ZXJydW5fbWFzayA9IFNDQVNTUl9PUkVSLAoKQXMgbWVudGlvbmVkIGluIHBhdGNoICMyLCBv
dmVycnVuX21hc2sgd2lsbCBuZXZlciBiZSB1c2VkIGhlcmUuIENhbiB5b3UgCnBsZWFzZSBjb25m
aXJtIHdoZXRoZXIgdGhpcyBpcyBpbnRlbmRlZD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
