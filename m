Return-Path: <SRS0=H5Oh=2I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A626C43603
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 11:51:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30D61206E0
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 11:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30D61206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXrd-0003L5-QR; Wed, 18 Dec 2019 11:51:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihXrc-0003Kv-Db
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:51:36 +0000
X-Inumbo-ID: bdc8fbd4-218c-11ea-9066-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdc8fbd4-218c-11ea-9066-12813bfff9fa;
 Wed, 18 Dec 2019 11:51:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE55DAA35;
 Wed, 18 Dec 2019 11:51:34 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <fe06b109-7a64-a4f1-f8a8-b436b04a6ac1@suse.com>
 <e934e305-cb3b-39d6-8719-6b054f52fcee@citrix.com>
 <7c0348ab-c3a4-6706-da66-9861cfce50c6@suse.com>
 <48466d93-0a16-84de-7d3e-aa3fc627e437@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b7d7bef-74b9-1131-9690-6536c9f77b4b@suse.com>
Date: Wed, 18 Dec 2019 12:52:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <48466d93-0a16-84de-7d3e-aa3fc627e437@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/6] x86/suspend: State cleanup
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

T24gMTguMTIuMjAxOSAxMjozOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJbiBwcmFjdGljZSwg
Y2FsbCBnYXRlcyB3aGVyZSBraWxsZWQgYnkgU1lTe0NBTEwsRU5URVJ9L3tSRVQsRVhJVH0gYmVp
bmcKPiA0eCBmYXN0ZXIgdGhhbiBhbnl0aGluZyByZWZlcmVuY2luZyB0aGUgSURUL0dEVCwgYW5k
IEwqUyBoYXZlIGhhZCBhCj4gY29tcGxpY2F0ZWQgaGlzdG9yeSBvZiBhdmFpbGFiaWxpdHkgZXZl
biBpbiB0aGUgMzJiaXQgZGF5cy4KCkknbSBjdXJpb3VzIC0gd2hhdCBjb21wbGljYXRlZCBoaXN0
b3J5PyBUaGV5J2QgYmVlbiBhZGRlZCB3aXRoIHRoZQozODYsIGFuZCBJIGRvbid0IHJlY2FsbCBh
bnkgcXVpcmtzIG9yIGlzc3VlcyB3aXRoIHRoZW0uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
