Return-Path: <SRS0=DRPg=XA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9E8C3A5A5
	for <xen-devel@archiver.kernel.org>; Thu,  5 Sep 2019 13:56:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6383520820
	for <xen-devel@archiver.kernel.org>; Thu,  5 Sep 2019 13:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6383520820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5sF0-0008MM-OJ; Thu, 05 Sep 2019 13:56:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5sEz-0008MF-0P
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 13:56:01 +0000
X-Inumbo-ID: e3e2e072-cfe4-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3e2e072-cfe4-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 13:55:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AF39BAF84;
 Thu,  5 Sep 2019 13:55:58 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190905132703.5554-1-roger.pau@citrix.com>
 <20190905132703.5554-2-roger.pau@citrix.com>
 <6a10bf51ca454c16a3e9db17fd48dab8@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <99d0aef2-ecef-3894-06ed-c2c3122a671e@suse.com>
Date: Thu, 5 Sep 2019 15:56:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6a10bf51ca454c16a3e9db17fd48dab8@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] sysctl: report existing physcaps on
 ARM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, IanJackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAxNTo1MywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBGcm9tOiBYZW4tZGV2
ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2Yg
Um9nZXIgUGF1IE1vbm5lCj4+IFNlbnQ6IDA1IFNlcHRlbWJlciAyMDE5IDE0OjI3Cj4+Cj4+IEN1
cnJlbnQgcGh5c2NhcHMgaW4gWEVOX1NZU0NUTF9waHlzaW5mbyBhcmUgb25seSB1c2VkIGJ5IHg4
NiwgYWxiZWl0Cj4+IHRoZSBjYXBhYmlsaXRpZXMgdGhlbXNlbHZlcyBhcmUgbm90IHg4NiBzcGVj
aWZpYy4KPj4KPj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIGFsc28gcmVwb3J0aW5nIHRo
ZSBjdXJyZW50IGNhcGFiaWxpdGllcyBvbgo+PiBBUk0gaGFyZHdhcmUuIE5vdGUgdGhhdCBvbiBB
Uk0gUEhZU0NBUF9odm0gaXMgYWx3YXlzIHJlcG9ydGVkLCBhbmQKPj4gc2V0dGluZyBQSFlTQ0FQ
X2RpcmVjdGlvIGhhcyBiZWVuIG1vdmVkIHRvIGNvbW1vbiBjb2RlIHNpbmNlIHRoZSBzYW1lCj4+
IGxvZ2ljIHRvIHNldCBpdCBpcyB1c2VkIGJ5IHg4NiBhbmQgQVJNLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdl
ZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
