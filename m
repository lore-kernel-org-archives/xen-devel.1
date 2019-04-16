Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DF3C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 19:27:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 117F2206B6
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 19:27:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/gDW7JY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 117F2206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGTjB-000368-Pl; Tue, 16 Apr 2019 19:26:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGTjB-000363-3Z
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 19:26:45 +0000
X-Inumbo-ID: 9167c740-607d-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9167c740-607d-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 19:26:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 576F1206B6;
 Tue, 16 Apr 2019 19:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555442803;
 bh=AHOqLEe2Vj4UpA2FlsMwPy7roFctPeXCjG/j8f67KK8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=p/gDW7JYubMaVOYGZoj2k1uoj8Q0A2xJlsZe+HUFjOEZkWxkI5HgysJ192VUrBWTW
 KXW2YwGtX1dU488ohZ+Jz85zfe7CHXdS2Ca23np3mS+B44HMkSKSUqvFPYIOPMCoDU
 FHLyR0mx4S7T5p3ALSHt8GUYaxmfWxOAuNiZHVYw=
Date: Tue, 16 Apr 2019 12:26:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Ian Jackson <ian.jackson@eu.citrix.com>
In-Reply-To: <20190401085619.15911-1-ian.jackson@eu.citrix.com>
Message-ID: <alpine.DEB.2.10.1904161226160.1370@sstabellini-ThinkPad-X260>
References: <20190401085619.15911-1-ian.jackson@eu.citrix.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] SUPPORT.md: Specify support lifetime for
 4.12
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 committers@xenproject.org, Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416192643.yxWHYWqEHDK2OACVegixnnp1KgkN9Xk_wP1Th3nRnKg@z>

T24gTW9uLCAxIEFwciAyMDE5LCBJYW4gSmFja3NvbiB3cm90ZToKPiBDQzogTGFycyBLdXJ0aCA8
bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Cj4gLS0tCj4gIFNVUFBPUlQubWQgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL1NVUFBPUlQu
bWQgYi9TVVBQT1JULm1kCj4gaW5kZXggMTlmYzhkNzUzMy4uZDQxNzNkNzBhZCAxMDA2NDQKPiAt
LS0gYS9TVVBQT1JULm1kCj4gKysrIGIvU1VQUE9SVC5tZAo+IEBAIC05LDEwICs5LDEwIEBAIGZv
ciB0aGUgZGVmaW5pdGlvbnMgb2YgdGhlIHN1cHBvcnQgc3RhdHVzIGxldmVscyBldGMuCj4gIAo+
ICAjIFJlbGVhc2UgU3VwcG9ydAo+ICAKPiAtICAgIFhlbi1WZXJzaW9uOiA0LjEyLXJjCj4gLSAg
ICBJbml0aWFsLVJlbGVhc2U6IG4vYQo+IC0gICAgU3VwcG9ydGVkLVVudGlsOiBUQkQKPiAtICAg
IFNlY3VyaXR5LVN1cHBvcnQtVW50aWw6IFVucmVsZWFzZWQgLSBub3QgeWV0IHNlY3VyaXR5LXN1
cHBvcnRlZAo+ICsgICAgWGVuLVZlcnNpb246IDQuMTIKPiArICAgIEluaXRpYWwtUmVsZWFzZTog
VEJECj4gKyAgICBTdXBwb3J0ZWQtVW50aWw6IDIwMjAtMTAtMDIKPiArICAgIFNlY3VyaXR5LVN1
cHBvcnQtVW50aWw6IDIwMjItMDQtMDIKPiAgCj4gIFJlbGVhc2UgTm90ZXMKPiAgOiA8YSBocmVm
PSJodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9YZW5fUHJvamVjdF9YLllZX1JlbGVh
c2VfTm90ZXMiPlJOPC9hPgoKSSBkb24ndCBrbm93IGFib3V0IHRoZSBzcGVjaWZpYyBvZiB0aGUg
ZGF0ZXMgY2hvc2VuLCBidXQgSSBhbSBhIGdyZWF0CmZ1biBvZiBoYXZpbmcgdGhlbSBpbiBTVVBQ
T1JULm1kLiBUaGFuayB5b3UhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
