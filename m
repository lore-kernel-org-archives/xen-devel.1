Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D727C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 11:23:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FD7320818
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 11:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FD7320818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEBKF-0006Wi-Lk; Wed, 10 Apr 2019 11:23:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PZ5s=SM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hEBKE-0006Wd-IE
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 11:23:30 +0000
X-Inumbo-ID: 108c9b24-5b83-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 108c9b24-5b83-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 11:23:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86A7C15AB;
 Wed, 10 Apr 2019 04:23:28 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6FFB3F68F;
 Wed, 10 Apr 2019 04:23:27 -0700 (PDT)
To: jinchen <jinchen1227@qq.com>, xen-devel <xen-devel@lists.xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
References: <tencent_DA6EA655E660F6F60C353F2674306A989F0A@qq.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <86a5cc61-00de-cc29-a06c-8f0956c38ea4@arm.com>
Date: Wed, 10 Apr 2019 12:23:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <tencent_DA6EA655E660F6F60C353F2674306A989F0A@qq.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen ARM dom0less use PV drivers
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
Message-ID: <20190410112326.C_xI6FgoGErBj68hsNAhMhnd5Sg0XApjbloJamDZZg4@z>

SGksCgpDQ2luZyBTdGVmYW5vIHdobyBpcyBsb29raW5nIGFmdGVyIGRvbTBsZXNzLgoKT24gMDgv
MDQvMjAxOSAwMzoxNywgamluY2hlbiB3cm90ZToKPiBIZWxsbyBleHBlcnRzOgo+ICDCoCDCoCBU
aGUgeGVuIDQuMTIgc3VwcG9ydCB0aGUgRG9tMGxlc3MgVk0gdGhhdCBzdGFydCBkb211IGZyb20g
eGVuIG5vdCB4bCwgYnV0IAo+IHRoZSBQViBkcml2ZXJzIGhhc24ndCBiZWVuIHN1cHBvcnRlZC4K
PiBEbyB5b3UgaGF2ZSBzb21lIGd1aWRhbmNlIGZvciBob3cgdG8gZW5hYmxlIFBWIGRyaXZlcnMg
d2hlbiB1c2luZyBkb20wbGVzcz8KPiAgwqAgwqAgRHVlIHRvIGtlcm5lbCB1c2UgeGVuYnVzIGFu
ZCB4ZW5zdG9yZSB0byBwcm9iZSBQViBkcml2ZXJzLCB0aGVzZSBtZWNoYW5pc20gCj4gc2hvdWxk
wqByZW1haW4gZm9yIGNvbXBhdGliaWxpdHk/Cj4gIMKgIMKgIFJlbW92YWwgdGhlIHhlbnN0b3Jl
IG1lY2hhbmlzbSB0byB4ZW4gaW50ZXJuYWwgb3Igc29tZSBvdGhlciB3YXk/Cj4gIMKgIMKgIFRo
YW5rIHlvdSB2ZXJ5IG11Y2jvvIEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVsCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
