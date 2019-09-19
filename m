Return-Path: <SRS0=QMmL=XO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9927DC3A5A6
	for <xen-devel@archiver.kernel.org>; Thu, 19 Sep 2019 14:06:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7593C20882
	for <xen-devel@archiver.kernel.org>; Thu, 19 Sep 2019 14:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7593C20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAx41-0000A5-O7; Thu, 19 Sep 2019 14:05:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAx40-00009w-Nl
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 14:05:40 +0000
X-Inumbo-ID: 8f48086e-dae6-11e9-9660-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f48086e-dae6-11e9-9660-12813bfff9fa;
 Thu, 19 Sep 2019 14:05:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D78D9AEB3;
 Thu, 19 Sep 2019 14:05:38 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>
References: <20190917132125.13033-1-julien.grall@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <327209e6-0c59-9df1-2585-b48b7ae888d2@suse.com>
Date: Thu, 19 Sep 2019 16:05:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917132125.13033-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm32: setup: Give a xenheap page to
 the boot allocator
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAxNToyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFmdGVyIGNvbW1pdCA2
ZTNlNzcxMjAzICJ4ZW4vYXJtOiBzZXR1cDogUmVsb2NhdGUgdGhlIERldmljZS1UcmVlIGxhdGVy
IG9uCj4gaW4gdGhlIGJvb3QiLCB0aGUgYm9vdCBhbGxvY2F0b3Igd2lsbCBub3QgcmVjZWl2ZSBh
bnkgeGVuaGVhcCBwYWdlIChpLmUuCj4gbWFwcGVkIHBhZ2UpIG9uIEFybTMyLgo+IAo+IEhvd2V2
ZXIsIHRoZSBib290IGFsbG9jYXRvciBpbXBsaWNpdGVseSByZWx5IG9uIGhhdmluZyB0aGUgZmly
c3QgcGFnZQo+IGFscmVhZHkgbWFwcGVkIGFuZCB0aGVyZWZvcmUgcmVzdWx0IHRvIGJyZWFrIGJv
b3Qgb24gQXJtMzIuCj4gCj4gVGhlIGVhc2llc3Qgd2F5IGZvciBub3cgaXMgdG8gZ2l2ZSBhIHhl
bmhlYXAgcGFnZSB0byB0aGUgYm9vdCBhbGxvY2F0b3IuCj4gV2UgbWF5IHdhbnQgdG8gcmV0aGlu
ayB0aGUgaW50ZXJmYWNlIGluIHRoZSBmdXR1cmUuCj4gCj4gRml4ZXM6IDZlM2U3NzEyMDMgKCd4
ZW4vYXJtOiBzZXR1cDogUmVsb2NhdGUgdGhlIERldmljZS1UcmVlIGxhdGVyIG9uIGluIHRoZSBi
b290JykKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgoKRldJVyAvIGluIGNhc2UgaXQgaGVscHM6ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
