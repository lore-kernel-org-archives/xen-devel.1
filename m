Return-Path: <SRS0=NT3h=WD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FE9C433FF
	for <xen-devel@archiver.kernel.org>; Wed,  7 Aug 2019 09:58:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F63F21E6A
	for <xen-devel@archiver.kernel.org>; Wed,  7 Aug 2019 09:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F63F21E6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvIhw-0001TA-Ol; Wed, 07 Aug 2019 09:58:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvIhv-0001T4-7I
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 09:58:11 +0000
X-Inumbo-ID: dbeb8498-b8f9-11e9-bfb0-eb27d05fd2df
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbeb8498-b8f9-11e9-bfb0-eb27d05fd2df;
 Wed, 07 Aug 2019 09:58:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7EFE5AD20;
 Wed,  7 Aug 2019 09:58:08 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
 <06b8a3a1-8e24-3b77-2a21-7802f4fb19af@suse.com>
 <98a940e5-c811-f7a1-2316-db173facfb7f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aeb7fcb8-b7a0-b6fe-5d0d-9296a7e866f3@suse.com>
Date: Wed, 7 Aug 2019 11:58:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <98a940e5-c811-f7a1-2316-db173facfb7f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 02/10] AMD/IOMMU: drop stray "else"
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
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxMTo0OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wOC8yMDE5
IDE0OjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIGJsYW5rIGxpbmUgYmV0d2VlbiBpdCBh
bmQgdGhlIHByaW9yIGlmKCkgY2xlYXJseSBpbmRpY2F0ZXMgdGhhdCB0aGlzCj4+IHdhcyBtZWFu
dCB0byBiZSBhIHN0YW5kYWxvbmUgaWYoKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IExvb2tzIGxpa2UgdGhpcyB3YXMgeW91IGluIGMv
cyAwZThlMGEwODU0YQoKUmlnaHQgLSBxdWl0ZSBlbWJhcnJhc3NpbmcuIEkgY2FuIG9ubHkgYXNz
dW1lIHRoYXQgdGhlcmUgd2FzIGEKcGxhaW4gaWYoKSBwYWlyZWQgd2l0aCBpdCBlYXJsaWVyIG9u
LCBhbmQgSSBkaWRuJ3Qgbm90aWNlIHRoYXQKdGhlIGVsc2Ugc2hvdWxkIGdvIGF3YXkgd2hlbiBk
cm9wcGluZy9tb3ZpbmcgaXQuCgo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKVGhhbmtzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
