Return-Path: <SRS0=k/ot=X2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6998FC352AA
	for <xen-devel@archiver.kernel.org>; Tue,  1 Oct 2019 13:40:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3725C20815
	for <xen-devel@archiver.kernel.org>; Tue,  1 Oct 2019 13:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="ncfbMELA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3725C20815
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFINp-00057f-Ju; Tue, 01 Oct 2019 13:40:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q5vT=X2=amazon.com=prvs=17096c9fa=hongyax@srs-us1.protection.inumbo.net>)
 id 1iFINn-00051F-Gt
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 13:40:03 +0000
X-Inumbo-ID: f8808dce-e450-11e9-96fd-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id f8808dce-e450-11e9-96fd-12813bfff9fa;
 Tue, 01 Oct 2019 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569937202; x=1601473202;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FzL+YhfPlhkhdTqSZCWbf61z0CAAZ0gtCP4UUpkMeAo=;
 b=ncfbMELA6SYc/6ttHKHFCEjRsLMQlUHN3u70NNdKK5eizt/QLe7/GtmI
 l2hS0V6ucCsccrAkNWQPaVmjEsZEP839O40E2jDLecHqdNMsNN3b/XFVM
 Mkx9sr+M9UchfPYj4QoLDJjujtwDxrdjE0FadcZKHu5lPqYObOGWesC73 g=;
X-IronPort-AV: E=Sophos;i="5.64,571,1559520000"; d="scan'208";a="788807124"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 01 Oct 2019 13:40:01 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 79781A2A7C; Tue,  1 Oct 2019 13:40:00 +0000 (UTC)
Received: from EX13D06UEA001.ant.amazon.com (10.43.61.154) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 13:39:59 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D06UEA001.ant.amazon.com (10.43.61.154) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 13:39:59 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 1 Oct 2019 13:39:59 +0000
To: Wei Liu <wl@xen.org>
References: <cover.1569833766.git.hongyax@amazon.com>
 <4429f3d4cb3075d3dc2f30b3f8273e3620b8d995.1569833766.git.hongyax@amazon.com>
 <20191001115114.yim3dbmbmbeirxmy@debian>
From: Hongyan Xia <hongyax@amazon.com>
Message-ID: <1f1c673e-bec8-80b8-a598-832f0e5f5391@amazon.com>
Date: Tue, 1 Oct 2019 14:39:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001115114.yim3dbmbmbeirxmy@debian>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 22/55] x86_64/mm: switch to new APIs in
 paging_init
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMTAvMjAxOSAxMjo1MSwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIFNlcCAzMCwgMjAx
OSBhdCAxMTozMzoxNEFNICswMTAwLCBIb25neWFuIFhpYSB3cm90ZToKPj4gRnJvbTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4KPj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhA
YW1hem9uLmNvbT4KPj4KPj4gLS0tCj4+IENoYW5nZWQgc2luY2UgdjE6Cj4+ICAgICogdXNlIGEg
Z2xvYmFsIG1hcHBpbmcgZm9yIGNvbXBhdF9pZGxlX3BnX3RhYmxlX2wyLCBvdGhlcndpc2UKPj4g
ICAgICBsMl9yb19tcHQgd2lsbCB1bm1hcCBpdC4KPiAKPiBIbW1tLi4uIEkgd29uZGVyIHdoeSBY
VEYgZGlkbid0IGNhdGNoIHRoaXMuCj4gCgpXZWxsLCBwcm9iYWJseSBiZWNhdXNlIHRoaXMgb25s
eSBzaG93cyB1cCB3aGVuIHdlIGFjdHVhbGx5IHJlbW92ZSBhbGwgZmFzdCAKcGF0aHMgYW5kIHRo
ZSBkaXJlY3QgbWFwLiBJZiB3ZSBqdXN0IGFwcGx5IHRoaXMgYmF0Y2gsIHVubWFwIG9uIHRoZSBk
aXJlY3QgbWFwIAppcyBqdXN0IGEgbm8tb3AuIEkgY2F1Z2h0IHRoaXMgd2l0aCBteSBsYXRlciBw
YXRjaGVzLgoKPiBJZiB3ZSByZWFsbHkgd2FudCB0byBnbyBhbGwgdGhlIHdheSB0byBlbGltaW5h
dGUgcGVyc2lzdGVudCBtYXBwaW5ncwo+IGZvciBwYWdlIHRhYmxlcywgdGhlIGNvZGUgc2hvdWxk
IGJlIGNoYW5nZWQgc3VjaCB0aGF0Ogo+IAo+IDEuIGNvbXBhdF9pZGxlX3BnX3RhYmxlX2wyIHNo
b3VsZCBiZSBjaGFuZ2VkIHRvIHN0b3JlIG1mbiwgbm90IHZhLgo+IDIuIG1hcCBhbmQgdW5tYXAg
dGhhdCBtZm4gd2hlbiBhY2Nlc3MgdG8gdGhlIGNvbXBhdCBwYWdlIHRhYmxlIGlzCj4gICAgIHJl
cXVpcmVkLgo+IAoKU291bmRzIHNlbnNpYmxlIGFuZCBtb3JlIGNvbnNpc3RlbnQgd2l0aCBvdGhl
ciBQVEVzLgoKSG9uZ3lhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
