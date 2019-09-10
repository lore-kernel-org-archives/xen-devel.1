Return-Path: <SRS0=zaG5=XF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D9DC3A5A2
	for <xen-devel@archiver.kernel.org>; Tue, 10 Sep 2019 06:38:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05B5420872
	for <xen-devel@archiver.kernel.org>; Tue, 10 Sep 2019 06:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05B5420872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7ZnA-0005bX-PQ; Tue, 10 Sep 2019 06:38:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7Zn8-0005bS-Jb
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 06:38:18 +0000
X-Inumbo-ID: 9169a16e-d395-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9169a16e-d395-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 06:38:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 02440B0F2;
 Tue, 10 Sep 2019 06:38:14 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190909155534.20514-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae0d104e-ad0b-73ee-46f9-900f6f49cbee@suse.com>
Date: Tue, 10 Sep 2019 08:38:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909155534.20514-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/cpuid: Fix build with CentOS 6
 following c/s 7479151106
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxNzo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBHQ0Mgb2YgYSBDZW50
T1MgNiB2aW50YWdlIGNvbXBsYWluczoKPiAKPiAgIGNwdWlkLmM6IEluIGZ1bmN0aW9uICdwYXJz
ZV94ZW5fY3B1aWQnOgo+ICAgY3B1aWQuYzozMjogZXJyb3I6ICdtaWQnIG1heSBiZSB1c2VkIHVu
aW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbgo+IAo+IFRoaXMgY2FuJ3Qgb2NjdXIgaW4gcHJh
Y3RpY2UgYmVjYXVzZSB0aGUgd2hpbGUoKSBsb29wIGlzIGd1YXJlbnRlZWQgdG8gYmUKPiBlbnRl
cmVkLCBidXQgaW5pdGlhbGlzZSBtaWQgdG8gd29yayBhcm91bmQgdGhlIGlzc3Vlcy4KPiAKPiBT
cG90dGVkIGJ5IEdpdGxhYiBDSS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWgsIHllcywgdGhhbmtzLiBJIHRvbyBoYWQgbm90
aWNlZCB0aGlzIHllc3RlcmRheSwgYnV0IGRpZG4ndCBnZXQKYXJvdW5kIHRvIGNoZWNrIHdoYXQg
dGhlIGNvcnJlY3Qgd29ya2Fyb3VuZCB3b3VsZCBiZS4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
