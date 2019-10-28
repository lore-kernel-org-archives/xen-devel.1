Return-Path: <SRS0=n02L=YV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0886CA9EA0
	for <xen-devel@archiver.kernel.org>; Mon, 28 Oct 2019 09:06:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 897DF214E0
	for <xen-devel@archiver.kernel.org>; Mon, 28 Oct 2019 09:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 897DF214E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP0z5-0001ER-PQ; Mon, 28 Oct 2019 09:06:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iP0z3-0001EL-U9
 for xen-devel@lists.xen.org; Mon, 28 Oct 2019 09:06:41 +0000
X-Inumbo-ID: 405230a0-f962-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 405230a0-f962-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 09:06:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C3730B04F;
 Mon, 28 Oct 2019 09:06:38 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191028085603.32037-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e55613e7-179d-ee5c-34a4-bc3e41997869@suse.com>
Date: Mon, 28 Oct 2019 10:06:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028085603.32037-1-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for 4.13] x86/shim: don't reserve 640k - 1M
 region in E820
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMjAxOSAwOTo1NiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBDb252ZXJ0aW5nIGEg
Z3Vlc3QgZnJvbSBQViB0byBQVi1pbi1QVkggbWFrZXMgdGhlIGd1ZXN0IHRvIGhhdmUgMzg0awo+
IGxlc3MgbWVtb3J5LCB3aGljaCBtYXkgY29uZnVzZSBndWVzdCdzIGJhbGxvb24gZHJpdmVyLiBU
aGlzIGhhcHBlbnMKPiBiZWNhdXNlIFhlbiB1bmNvbmRpdGlvbmFsbHkgcmVzZXJ2ZXMgNjQwayAt
IDFNIHJlZ2lvbiBpbiBFODIwIGRlc3BpdGUKPiB0aGUgZmFjdCB0aGF0IGl0J3MgcmVhbGx5IGEg
dXNhYmxlIFJBTSBpbiBQVkggYm9vdCBtb2RlLgoKVGhpcyBpcyBhIFBWSCBwcm9wZXJ0eSBhY2Nv
cmRpbmcgdG8geW91ciBkZXNjcmlwdGlvbiBhbmQgYWNjb3JkaW5nCnRvIG15IHVuZGVyc3RhbmRp
bmcuIFdoeSB3b3VsZCB5b3UgdGhlbiAuLi4KCj4gRml4IHRoaXMgYnkgc2tpcHBpbmcgdGhlIHJl
Z2lvbiB0eXBlIGNoYW5nZSBmb3IgcHYtc2hpbSBtb2RlLgoKLi4uIGFsdGVyIGJlaGF2aW9yIGZv
ciBzaGltIG1vZGUgb25seSwgcmF0aGVyIHRoYW4gd2hlbiBib290ZWQgaW4KUFZIIG1vZGUgaW4g
Z2VuZXJhbD8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
