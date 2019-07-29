Return-Path: <SRS0=h4f+=V2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B37CC433FF
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jul 2019 20:42:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D68C20659
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jul 2019 20:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZV0pFGI+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D68C20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsCTH-0002LI-Tr; Mon, 29 Jul 2019 20:42:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsCTG-0002LD-CE
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 20:42:14 +0000
X-Inumbo-ID: 57dce245-b241-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 57dce245-b241-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 20:42:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 373ED20659;
 Mon, 29 Jul 2019 20:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564432932;
 bh=Ln5jXQKZAHErglAL22/AwAWOJpAGU6hJzvUFU6VOeeA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZV0pFGI+er+IVDai9Z3ON3JOhTFCLYwft3lf2fBdhXZ6Lcu2n/VX/JKiFg59/WEao
 Nz24zBBMFhnLbOe4YC4JisTbszGwRCgQ0hWTAYcwTK+Gcec3EEQR8jxcoW079AXDyd
 ZPrL5x9kSwGqz2EtdKIQ93tMtr7DiW/hSgoxS+98=
Date: Mon, 29 Jul 2019 13:42:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
In-Reply-To: <1b25dd21-cf9f-a4ce-f1ca-e97b31e12063@bitdefender.com>
Message-ID: <alpine.DEB.2.21.1907291338470.1237@sstabellini-ThinkPad-T480s>
References: <20190603160829.31912-1-julien.grall@arm.com>
 <1b25dd21-cf9f-a4ce-f1ca-e97b31e12063@bitdefender.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/public: arch-arm: Use xen_mk_ullong
 instead of suffixing value with ULL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNiBKdW4gMjAxOSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gTG9v
a3MgZ29vZCB0byBtZQo+IAo+ID4gVGhlcmUgYXJlIGEgZmV3IHBsYWNlcyBpbiBpbmNsdWRlL3B1
YmxpYy9hcmNoLWFybS5oIHRoYXQgYXJlIHN0aWxsCj4gPiBzdWZmaXhpbmcgaW1tZWRpYXRlIHdp
dGggVUxMIGluc3RlYWQgb2YgdXNpbmcgeGVuX21rX3VsbG9uZy4KPiA+IAo+ID4gVGhlIGxhdHRl
ciBhbGxvd3MgYSBjb25zdW1lciB0byBlYXNpbHkgdHdlYWsgdGhlIGhlYWRlciBpZiBVTEwgaXMg
bm90Cj4gPiBzdXBwb3J0ZWQuCj4gPiAKPiA+IFNvIHN3aXRjaCB0aGUgcmVtYWluaW5nIHVzZXJz
IG9mIFVMTCB0byB4ZW5fbWtfdWxsb25nLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IFJldmlld2VkLWJ5OiBBbGV4YW5kcnUg
SXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
