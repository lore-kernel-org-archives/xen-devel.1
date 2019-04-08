Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF58C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:25:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFC5F20833
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFC5F20833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDRSI-0005PK-GP; Mon, 08 Apr 2019 10:24:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDRSH-0005PF-1F
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:24:45 +0000
X-Inumbo-ID: 868f44f9-59e8-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 868f44f9-59e8-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 10:24:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C9FF168F;
 Mon,  8 Apr 2019 03:24:43 -0700 (PDT)
Received: from [10.37.12.9] (unknown [10.37.12.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5C043F718;
 Mon,  8 Apr 2019 03:24:42 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Lukas Juenger <juenger@ice.rwth-aachen.de>, xen-devel@lists.xenproject.org
References: <abc8ea85-fe26-46b6-af1a-dcaaa877fd7d@rwthex-w1-a.rwth-ad.de>
 <e68dfbce-c369-eb90-97a8-894267351c8e@arm.com>
Message-ID: <7aa5af51-2b28-fef6-1b71-50bc078c0069@arm.com>
Date: Mon, 8 Apr 2019 11:24:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e68dfbce-c369-eb90-97a8-894267351c8e@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: Cap the number of interrupt
 lines for dom0
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
Message-ID: <20190408102441.muHYmYoIBSorL-3eaCxImP9dLOZYR4jgb7a016o4HTw@z>

CgpPbiA0LzgvMTkgMTE6MTUgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBMdWthcywKPiAK
PiBPbiA0LzUvMTkgMjo1NCBQTSwgTHVrYXMgSnVlbmdlciB3cm90ZToKPj4gRG9tMCB2R0lDIHdp
bGwgdXNlIHRoZSBzYW1lIG51bWJlciBvZiBpbnRlcnJ1cHQgbGluZXMgYXMgdGhlIGhhcmR3YXJl
IAo+PiBHSUMuCj4+IFdoaWxlIHRoZSBoYXJkd2FyZSBHSUMgY2FuIHN1cHBvcnQgdXAgdG8gMTAy
MCBpbnRlcnJ1cHQgbGluZXMsCj4+IHRoZSB2R0lDIGlzIG9ubHkgc3VwcG9ydGluZyB1cCB0byA5
OTIgaW50ZXJydXB0IGxpbmVzLgo+PiBUaGlzIG1lYW5zIHRoYXQgWGVuIHdpbGwgbm90IGJlIGFi
bGUgdG8gYm9vdCBvbiBwbGF0Zm9ybXMgd2hlcmUgdGhlIAo+PiBoYXJkd2FyZQo+PiBHSUMgc3Vw
cG9ydHMgbW9yZSB0aGFuIDk5MiBpbnRlcnJ1cHQgbGluZXMuCj4+IFdoaWxlIGl0IHdvdWxkIG1h
a2Ugc2Vuc2UgdG8gaW5jcmVhc2UgdGhlIGxpbWl0cyBpbiB0aGUgdkdJQ3MsIHRoaXMgaXMgCj4+
IG5vdAo+PiB0cml2aWFsIGJlY2F1c2Ugb2YgdGhlIGRlc2lnbiBjaG9pY2VzLgo+PiBBdCB0aGUg
bW9tZW50LCBvbmx5IG1vZGVscyBzZWVtIHRvIHJlcG9ydCB0aGUgbWF4aW11bSBvZiBpbnRlcnJ1
cHQgbGluZXMuCj4+IFRoZXkgYWxzbyBkbyBub3QgaGF2ZSBhbnkgaW50ZXJydXB0IHdpcmVkIGFi
b3ZlIHRoZSA5OTIgbGltaXQuCj4+IFNvIGl0IHNob3VsZCBiZSBmaW5lIHRvIGNhcCB0aGUgbnVt
YmVyIG9mIGludGVycnVwdCBsaW5lcyBmb3IgZG9tMCB0byAKPj4gOTkyIGxpbmVzLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBMdWthcyBKdWVuZ2VyIDxqdWVuZ2VyQGljZS5yd3RoLWFhY2hlbi5kZT4K
PiAKPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCk5vdyBw
dXNoZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
