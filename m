Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C60AC04AB5
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 14:32:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0CF27A8B
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 14:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE0CF27A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXo0J-0000Hy-2f; Mon, 03 Jun 2019 14:32:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGpH=UC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hXo0H-0000Hl-Of
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:32:01 +0000
X-Inumbo-ID: 580373ee-860c-11e9-8980-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 580373ee-860c-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 14:31:59 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 234E430747CA; Mon,  3 Jun 2019 17:31:58 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 69262306E4AC;
 Mon,  3 Jun 2019 17:31:57 +0300 (EEST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
 <1559564728-17167-4-git-send-email-andrew.cooper3@citrix.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <9b0878cc-df5b-3bb5-d5de-9a3046d7b979@bitdefender.com>
Date: Mon, 3 Jun 2019 17:31:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559564728-17167-4-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH 3/5] xen/vm-event: Remove unnecessary
 vm_event_domain indirection
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603143153.ti37insr5fBY56OWS_GG4xXewi4lZY1gShVWOtXRLd0@z>

T24gNi8zLzE5IDM6MjUgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhlIHVzZSBvZiAoKnZl
ZCktPiBsZWFkcyB0byBwb29yIGNvZGUgZ2VuZXJhdGlvbiwgYXMgdGhlIGNvbXBpbGVyIGNhbid0
Cj4gYXNzdW1lIHRoZSBwb2ludGVyIGhhc24ndCBjaGFuZ2VkLCBhbmQgcmVzdWx0cyBpbiBoYXJk
LXRvLWZvbGxvdyBjb2RlLgo+IAo+IEZvciBib3RoIHZtX2V2ZW50X3tlbixkaXN9YWJsZSgpLCBy
ZW5hbWUgdGhlIHZlZCBwYXJhbWV0ZXIgdG8gcF92ZWQsIGFuZAo+IHdvcmsgcHJpbWFyaWx5IHdp
dGggYSBsb2NhbCB2ZWQgcG9pbnRlci4KPiAKPiBUaGlzIGhhcyBhIGtleSBhZHZhbnRhZ2UgaW4g
dm1fZXZlbnRfZW5hYmxlKCksIGluIHRoYXQgdGhlIHBhcnRpYWxseQo+IGNvbnN0cnVjdGVkIHZt
X2V2ZW50X2RvbWFpbiBvbmx5IGJlY29tZXMgZ2xvYmFsbHkgdmlzaWJsZSBvbmNlIGl0IGlzCj4g
ZnVsbHkgY29uc3RydWN0ZWQuICBBcyBhIGNvbnNlcXVlbmNlLCB0aGUgc3BpbmxvY2sgZG9lc24n
dCBuZWVkIGhvbGRpbmcuCj4gCj4gRnVydGhlcm1vcmUsIHJlYXJyYW5nZSB0aGUgb3JkZXIgb2Yg
b3BlcmF0aW9ucyB0byBiZSBtb3JlIHNlbnNpYmxlLgo+IENoZWNrIGZvciByZXBlYXRlZCBlbmFi
bGVzIGFuZCBhbiBiYWQgSFZNX1BBUkFNIGJlZm9yZSBhbGxvY2F0aW5nCj4gbWVtb3J5LCBhbmQg
Z2F0aGVyIHRoZSB0cml2aWFsIHNldHVwIGludG8gb25lIHBsYWNlLCBkcm9wcGluZyB0aGUKPiBy
ZWR1bmRhbnQgemVyb2luZy4KPiAKPiBObyBwcmFjdGljYWwgY2hhbmdlIHRoYXQgY2FsbGVycyB3
aWxsIG5vdGljZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0
ZGVmZW5kZXIuY29tPgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
