Return-Path: <SRS0=u+XK=ZZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8C6C432C3
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 11:31:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AB992068E
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 11:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AB992068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic6Om-0001S1-BC; Tue, 03 Dec 2019 11:31:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic6Ol-0001Rw-JU
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 11:31:19 +0000
X-Inumbo-ID: 6c293f82-15c0-11ea-81d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c293f82-15c0-11ea-81d9-12813bfff9fa;
 Tue, 03 Dec 2019 11:31:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0D23B24D;
 Tue,  3 Dec 2019 11:31:17 +0000 (UTC)
To: Lars Kurth <lars.kurth@citrix.com>
References: <70BC97F0-8DD8-44F4-A64D-5C2060C76C7B@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4aa5436a-f94d-b1eb-fb72-28710d120447@suse.com>
Date: Tue, 3 Dec 2019 12:31:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <70BC97F0-8DD8-44F4-A64D-5C2060C76C7B@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Community Call: Call for Agenda Items and call
 details for Dec 4, 16:00 - 17:00 UTC
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMjAxOSAwMzowNSwgTGFycyBLdXJ0aCB3cm90ZToKPiBEZWFywqBjb21tdW5pdHnC
oG1lbWJlcnMsCj4gwqAKPiBwbGVhc2Ugc2VuZCBtZcKgYWdlbmRhwqBpdGVtc8KgZm9ywqB0aGlz
IEZyaWRheeKAmXPCoGNvbW11bml0ecKgY2FsbCAoc29ycnkKPiBmb3IgdGhlIGxhdGUgbm90aWNl
LCBJIHdhcyBvbiBQVE8gbGFzdCB3ZWVrKS4gQSBkcmFmdMKgYWdlbmRhwqBpcyBhdAo+IGh0dHBz
Oi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9QQ3RCcGhvWGtDVGlYQUJKOGNkTDBLdVov
IAoKSSdtIGNvbmZ1c2VkOiBUaGUgdGl0bGUgc2F5cyBEZWMgNCwgd2hpY2ggaXMgV2VkbmVzZGF5
LiBUaGUgdGV4dAphYm92ZSBzYXlzIEZyaWRheS4gSWlyYyB3ZSB1c2VkIHRvIHJ1biB0aGlzIG9u
IFRodXJzZGF5cy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
