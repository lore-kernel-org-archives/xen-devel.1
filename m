Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40D9C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 12:08:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6C7220883
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 12:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6C7220883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDT43-0006Om-UO; Mon, 08 Apr 2019 12:07:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDT42-0006Oh-8m
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 12:07:50 +0000
X-Inumbo-ID: ed0f3302-59f6-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ed0f3302-59f6-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 12:07:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E6BA15BF;
 Mon,  8 Apr 2019 05:07:48 -0700 (PDT)
Received: from [10.37.12.9] (unknown [10.37.12.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A7653F718;
 Mon,  8 Apr 2019 05:07:46 -0700 (PDT)
To: Feng Kan OS <fengkan@os.amperecomputing.com>,
 Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190315083439.23068-1-vishnu@os.amperecomputing.com>
 <68101da7-87b2-5514-26f6-a4e4d5f18be2@arm.com>
 <21628b60-483a-69e5-cc5e-7c5ec98f93a7@os.amperecomputing.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3c0153aa-0662-c51f-039c-2beb7eaaa34d@arm.com>
Date: Mon, 8 Apr 2019 13:07:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <21628b60-483a-69e5-cc5e-7c5ec98f93a7@os.amperecomputing.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: p2m: configure pa_range_info table
 to support 42 bit PA systems.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408120745.nmwsozH1_uk1EUxeo-bkvJhLeWgonQLJFiiO2SZsKjo@z>

SGksCgpPbiAzLzE1LzE5IDExOjU3IFBNLCBGZW5nIEthbiBPUyB3cm90ZToKPiBUaGFua3MgSnVs
aWVuLgo+IAo+IE9uIDMvMTUvMTkgNDoyMSBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwK
Pj4KPj4gVGhhbmsgeW91IGZvciBwb3N0aW5nIHRoZSBwYXRjaC4KPj4KPj4gVGl0bGU6IE5vIG5l
ZWQgZm9yIGZ1bGwgc3RvcCBpbiB0aGUgY29tbWl0IHRpdGxlLgo+Pgo+PiBPbiAxNS8wMy8yMDE5
IDA4OjM0LCBWaXNobnUgUGFqanVyaSBPUyB3cm90ZToKPj4gSSBjYW4ndCByZW1lbWJlciB3aGlj
aCBvdGhlciBwbGF0Zm9ybXMgc3VwcG9ydCA0Mi1iaXRzIFBBLiBJIHRoaW5rIGF0Cj4+IHRoYXQg
dGltZSBpdCB3YXMgWC1HZW5lLiBBcyBsb25nIGFzIG5vIGN1cnJlbnQgZW1iZWRkZWQgcGxhdGZv
cm0gd2UKPj4gc3VwcG9ydCB1c2UgNDItYml0IFBBLCB0aGlzIGNoYW5nZSBtYXkgYmUgb2suIFN0
ZWZhbm8gZG8geW91IHJlY2FsbCB3aGF0Cj4+IHdhcyB0aGUgcGxhdGZvcm0/Cj4gQW1wZXJlIGVN
QUcgcGxhdGZvcm0gaXMgZXNzZW50aWFsbHkgdGhlIGNvbnRpbnVhdGlvbiBvZiBYLUdlbmUuIFRo
ZXNlCj4gc3lzdGVtcyBhcmUgdGFyZ2V0ZWQgYXMgc2VydmVycyB3aXRoIHVwdG8gMVRCIG9mIFJB
TS4KPj4KPj4gSW4gYW55IGNhc2UsIHRoZSBuZXcgYmVoYXZpb3IgKGFuZCBjb25zZXF1ZW5jZSkg
bmVlZHMgdG8gYmUgY2xlYXJseQo+PiBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+
IEdvdCBpdCwgd2Ugd2lsbCByZXN1Ym1pdCBpZiBTdGVmYW5vIGlzIG9rYXkgd2l0aCB0aGUgY2hh
bmdlLgoKVG8gbWFrZSBwcm9ncmVzcyBvbiB0aGlzIHBhdGNoLCBJIHdvdWxkIHN1Z2dlc3QgdG8g
cmVzdWJtaXQgaXQgd2l0aCB0aGUgCmNoYW5nZXMgcmVxdWVzdGVkLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
