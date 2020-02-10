Return-Path: <SRS0=MXIQ=36=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AEFC352A3
	for <xen-devel@archiver.kernel.org>; Mon, 10 Feb 2020 16:52:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B1E20661
	for <xen-devel@archiver.kernel.org>; Mon, 10 Feb 2020 16:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1B1E20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1CIO-0003bw-B5; Mon, 10 Feb 2020 16:52:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1CIM-0003bc-MD
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 16:52:26 +0000
X-Inumbo-ID: b6763e5b-4c25-11ea-b4e3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6763e5b-4c25-11ea-b4e3-12813bfff9fa;
 Mon, 10 Feb 2020 16:52:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A99AAE84;
 Mon, 10 Feb 2020 16:52:24 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200210114206.17115-1-andrew.cooper3@citrix.com>
 <20200210120956.GH4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b432b65b-5fa8-eb3b-9974-77f1f04b44a7@suse.com>
Date: Mon, 10 Feb 2020 17:52:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200210120956.GH4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/svm: Reduce vmentry latency
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

T24gMTAuMDIuMjAyMCAxMzowOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEZl
YiAxMCwgMjAyMCBhdCAxMTo0MjowNkFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBX
cml0aW5nIHRvIHRoZSBzdGFjayBwb2ludGVyIGluIHRoZSBtaWRkbGUgb2YgYSBsaW5lIG9mIHBv
cCBvcGVyYXRpb25zIGlzCj4+IHNwZWNpZmljYWxseSByZWNvbW1lbmRlZCBhZ2FpbnN0IGJ5IHRo
ZSBvcHRpbWlzYXRpb24gZ3VpZGUsIGFuZCBpcyBhIHRlY2huaXF1ZQo+PiB1c2VkIGJ5IFNwZWN1
bGF0aXZlIExvYWQgSGFyZGVuaW5nIHRvIGNvbWJhdCBTcGVjdHJlUlNCLgo+Pgo+PiBJbiBwcmFj
dGljZSwgaXQgY2F1c2VzIGFsbCBmdXJ0aGVyIHN0YWNrLXJlbGF0aXZlIGFjY2Vzc2VzIHRvIGJs
b2NrIHVudGlsIHRoZQo+PiB3cml0ZSB0byB0aGUgc3RhY2sgcG9pbnRlciByZXRpcmVzLCBzbyB0
aGUgc3RhY2sgZW5naW5lIGNhbiBnZXQgYmFjayBpbiBzeW5jLgo+Pgo+PiBQb3AgaW50byBhbnkg
ZGVhZCByZWdpc3RlciB0byBkaXNjYXJkICVyYXgncyB2YWx1ZSB3aXRob3V0IGNsb2JiZXJpbmcg
dGhlCj4+IHN0YWNrIGVuZ2luZS4gIFNtYWxsZXIgY29tcGlsZWQgY29kZSwgYW5kIHJ1bnMgZmFz
dGVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
