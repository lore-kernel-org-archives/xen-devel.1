Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBD2C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 17:34:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C882214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 17:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCPic97g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C882214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIcpO-0001x9-An; Mon, 22 Apr 2019 17:34:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c0q/=SY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hIcpM-0001x4-MZ
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 17:34:00 +0000
X-Inumbo-ID: d02dde36-6524-11e9-a7ac-c743ccfb21a0
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d02dde36-6524-11e9-a7ac-c743ccfb21a0;
 Mon, 22 Apr 2019 17:34:00 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3480214AF;
 Mon, 22 Apr 2019 17:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555954439;
 bh=Oc0SIW0isA/KUXewtFkJNCwrRoCfMvwDXupWNeJXy/Y=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=QCPic97g1uKs2/RfEHdcVZ9nLzRZJPx7LrWhIdzoUa0VTThXxJNPNLUls8IARrwfT
 U0fXfhhXJWTCZUItp8g0oAsr1hAHEYFKx8z2dvuvGxPVmvBmN8TG8J0dic5HjAUyjY
 /EaARg4jNj5N+HlLAYd6ni1O9sOTBaOcPgH3JgCI=
Date: Mon, 22 Apr 2019 10:33:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <aad78004-8aec-edc3-13b6-20baff39c9e5@arm.com>
Message-ID: <alpine.DEB.2.10.1904221030440.1370@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <c3716c11-6d87-4f2d-25d7-3d83537a9ca7@arm.com>
 <alpine.DEB.2.10.1904191618390.1370@sstabellini-ThinkPad-X260>
 <aad78004-8aec-edc3-13b6-20baff39c9e5@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 andrew.cooper3@citrix.com, JBeulich@suse.com,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422173354.6loN9d40Y89PnektGQ17JeovVom2Jhm7RbcH70JqreQ@z>

T24gU3VuLCAyMSBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNC8yMC8xOSAxMjoyMCBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
V2VkLCAyNyBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPiA+ID4gPiBpbmRleCAz
MGNmYjAxLi41YjhmY2M1IDEwMDY0NAo+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYwo+
ID4gPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+ID4gPiA+IEBAIC0xMDY4LDkgKzEwNjgs
MjQgQEAgaW50IHVubWFwX3JlZ2lvbnNfcDJtdChzdHJ1Y3QgZG9tYWluICpkLAo+ID4gPiA+ICAg
IGludCBtYXBfbW1pb19yZWdpb25zKHN0cnVjdCBkb21haW4gKmQsCj4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgZ2ZuX3Qgc3RhcnRfZ2ZuLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgbnIsCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgIG1m
bl90IG1mbikKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuLAo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBjYWNoZV9wb2xpY3kpCj4gPiA+IAo+ID4g
PiBSYXRoZXIgdGhhbiBleHRlbmRpbmcgbWFwX21taW9fcmVnaW9ucywgSSB3b3VsZCBwcmVmZXIg
aWYgd2Uga2lsbCB0aGlzCj4gPiA+IGZ1bmN0aW9uIChhbmQgdW5tYXBfbW1pb19tbWlvX3JlZ2lv
bnMpIGFuZCBpbnN0ZWFkIHVzZSBtYXBfcmVnaW9uc19wMm10Lgo+ID4gPiAKPiA+ID4gVGhpcyBt
ZWFucyB0aGUgY29udmVyc2F0aW9uIHRvIHAybXQgc2hvdWxkIGJlIGRvbmUgaW4gdGhlIERPTUNU
TCBoYW5kbGluZy4KPiA+IAo+ID4gbWFwX3JlZ2lvbnNfcDJtdCBpcyBhbiBhcm0gc3BlY2lmaWMg
ZnVuY3Rpb24uIG1hcF9tbWlvX3JlZ2lvbnMgaXMgdGhlCj4gPiBjb21tb24gZnVuY3Rpb24gYWNy
b3NzIHg4NiBhbmQgYXJtLCBjYWxsZWQgZnJvbSBjb21tb24gY29kZS4KPiAKPiBJIHJlYWxseSBk
aXNsaWtlIHRoZSBpZGVhIHRvIGhhdmUgdHdvIGZ1bmN0aW9ucyBkb2luZyBleGFjdGx5IHRoZSBz
YW1lIGJ1dAo+IGhhdmUgZGlmZmVyZW50IHBhcmFtZXRlcnMuCgpJbiBhbGwgZmFpcm5lc3MsIGl0
IHdhcyBhbHJlYWR5IHRoZSBjYXNlIGJlZm9yZSB0aGlzIHBhdGNoIHNlcmllczoKCiBpbnQgbWFw
X21taW9fcmVnaW9ucyhzdHJ1Y3QgZG9tYWluICpkLAogICAgICAgICAgICAgICAgICAgICAgZ2Zu
X3Qgc3RhcnRfZ2ZuLAogICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBuciwKICAg
ICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbik7CiBpbnQgbWFwX3JlZ2lvbnNfcDJtdChzdHJ1
Y3QgZG9tYWluICpkLAogICAgICAgICAgICAgICAgICAgICAgZ2ZuX3QgZ2ZuLAogICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBuciwKICAgICAgICAgICAgICAgICAgICAgIG1mbl90
IG1mbiwKICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgcDJtdCk7CgoKPiBJZiBtYXBf
cmVnaW9uc19wMm10IGNhbid0IGJlIHVzZWQgaW4gdGhlIGNvbW1vbiBjb2RlLCB0aGVuIEkgd291
bGQgbGlrZSB0aGF0Cj4gbWFwX21taW9fcmVnaW9ucyB0byBiZSByZW5hbWVkIHRvIGFyY2hfZG9t
Y3RsX21hcF9tbWlvX3JlZ2lvbnMgKG9yIHNvbWV0aGluZwo+IHNpbWlsYXIpLiBTbyBpdCBpcyBw
cmV0dHkgY2xlYXIgaXQgc2hvdWxkIGJlIG5vdCB1c2VkIGluIG90aGVyIHBsYWNlcy4KPiAKPiBB
bGwgdGhlIG90aGVyIGNhbGxlcnMgb2YgbWFwX21taW9fcmVnaW9ucyBzaG91bGQgYmUgcmVwbGFj
ZWQgd2l0aAo+IG1hcF9yZWdpb25zX3AybXQuCgpFaXRoZXIgd2F5IHdvcmtzLCBidXQgSSB3b3Vs
ZCBsaWtlIGFuIGFncmVlbWVudCB3aXRoIHRoZSB4ODYgbWFpbnRhaW5lcnMKYmVmb3JlIEkgbWFr
ZSBhbnkgY2hhbmdlcyB0byB0aGUgY29tbW9uIGludGVyZmFjZS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
