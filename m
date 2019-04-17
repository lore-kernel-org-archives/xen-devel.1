Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2B8C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:28:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 397F1205C9
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLglfyum"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 397F1205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGrA5-0000MX-P4; Wed, 17 Apr 2019 20:28:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGrA3-0000MO-Rh
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 20:28:03 +0000
X-Inumbo-ID: 4c6fd2e4-614f-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4c6fd2e4-614f-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 20:28:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDA1C205C9;
 Wed, 17 Apr 2019 20:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555532882;
 bh=HxycWthJCDQw5f5JNFyMipu+dZwBWA85QCZEeKHHmAs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=sLglfyumoUZJa9S3jr/JLTndltUxDUOf2AqDlPgBgpbPy6SUYOaB6JmXPnFgmlhcQ
 JnrJH7fNKuBZnAc8SAJlUf5npH7t+3z1bGt0hNXPBxil95wvwHfqG+vtBTZBc3e0r8
 4//XV3KI7x5VB3gurBYmC2aDXGqRPwMTkgGwgzbg=
Date: Wed, 17 Apr 2019 13:28:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190327184531.30986-8-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904171327100.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-8-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 07/12] xen/arm: cpuerrata: Match register
 size with value size in check_workaround_*
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417202801.gqL21eKruyhetxswM_oPKIZpdwYHDZoNqaQHnLmJDmY@z>

T24gV2VkLCAyNyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENsYW5nIGlzIHBpY2tp
ZXIgdGhhbiBHQ0MgZm9yIHRoZSByZWdpc3RlciBzaXplIGluIGFzbSBzdGF0ZW1lbnQuIEl0Cj4g
ZXhwZWN0cyB0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUgc2l6ZS4KPiAKPiBU
aGUgYXNtIHN0YXRlbWVudCBleHBlY3RzIGEgMzItYml0IChyZXNwLiA2NC1iaXQpIHZhbHVlIG9u
IEFybTMyCj4gKHJlc3AuIEFybTY0KSB3aGVyZWFzIHRoZSB2YWx1ZSBpcyBhIGJvb2xlYW4gKENs
YW5nIGNvbnNpZGVyIHRvIGJlCj4gMzItYml0KS4KPiAKPiBJdCB3b3VsZCBiZSBwb3NzaWJsZSB0
byBpbXBvc2UgMzItYml0IHJlZ2lzdGVyIGZvciBib3RoIGFyY2hpdGVjdHVyZQo+IGJ1dCB0aGlz
IHJlcXVpcmUgdGhlIGNvZGUgdG8gdXNlIF9fT1AzMi4gSG93ZXZlciwgaXQgZG9lcyBub3QgcmVh
bGx5Cj4gaW1wcm92ZSB0aGUgYXNzZW1ibHkgZ2VuZXJhdGVkLiBJbnN0ZWFkLCByZXBsYWNlIHN3
aXRjaCB0aGUgdmFyaWFibGUKPiB0byB1c2UgcmVnaXN0ZXJfdC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICB4ZW4vaW5jbHVk
ZS9hc20tYXJtL2NwdWVycmF0YS5oIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9jcHVlcnJhdGEuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZXJyYXRhLmgKPiBpbmRleCA1
NWRkZmRhMjcyLi44OGVmM2NhOTM0IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
Y3B1ZXJyYXRhLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWVycmF0YS5oCj4gQEAg
LTE0LDcgKzE0LDcgQEAgc3RhdGljIGlubGluZSBib29sIGNoZWNrX3dvcmthcm91bmRfIyNlcnJh
dHVtKHZvaWQpICAgICAgICAgICAgIFwKPiAgICAgICAgICByZXR1cm4gZmFsc2U7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgIGVsc2UgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgIHsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiAtICAgICAgICBib29sIHJldDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiArICAgICAgICByZWdpc3Rlcl90IHJldDsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICBhc20gdm9s
YXRpbGUgKEFMVEVSTkFUSVZFKCJtb3YgJTAsICMwIiwgICAgICAgICAgICAgICAgIFwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtb3YgJTAsICMxIiwgICAgICAgICAgICAg
ICAgIFwKClRoaXMgaXMgT0suIENvdWxkIHlvdSBwbGVhc2UgYWxzbyBjaGFuZ2UgdGhlIHJldHVy
biBzdGF0ZW1lbnQgYmVsb3c/Ck1heWJlIHNvbWV0aGluZyBsaWtlOgoKICByZXR1cm4gdW5saWtl
bHkoISFyZXQpOwoKVGhhbmsgeW91IQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
