Return-Path: <SRS0=4rCt=ZV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E88C432C3
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 14:46:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4836821736
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 14:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4836821736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahXR-0004AS-2u; Fri, 29 Nov 2019 14:46:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iahXP-0004AL-SC
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:46:27 +0000
X-Inumbo-ID: 057981a4-12b7-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 057981a4-12b7-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 14:46:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8E10FAD19;
 Fri, 29 Nov 2019 14:46:26 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191125172213.1904-1-roger.pau@citrix.com>
 <20191125172213.1904-3-roger.pau@citrix.com>
 <8f77f970-9b3b-2878-f1e7-6b87c9dfa25e@suse.com>
 <6954ab5e-3c40-e1ed-4610-1d336f50331a@citrix.com>
 <20191129143646.GY980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <15f4517f-8627-2fb3-6cae-ab07740d3a27@suse.com>
Date: Fri, 29 Nov 2019 15:46:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129143646.GY980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/pvshim: do not enable global pages
 in shim mode
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxNTozNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gRnJpLCBO
b3YgMjksIDIwMTkgYXQgMTI6MTI6NTFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4g
SSBhZ3JlZSB0aGF0IHRoaXMgd2FudHMgYSBjb21tYW5kIGxpbmUgY29udHJvbCwgYnV0IGl0IHdh
bnRzIHRvIGJlCj4+IGVuYWJsZWQgYnkgZGVmYXVsdCBhbnkgdGltZSB3ZSBmaW5kIG91cnNlbHZl
cyBuZXN0ZWQgb24gQU1EIGhhcmR3YXJlLAo+PiBub3QganVzdCBpbiBzaGltLgo+IAo+IE9ubHkg
b24gQU1EIGhhcmR3YXJlPyBOZXdlciB2ZXJzaW9ucyBvZiBYZW4gZG9uJ3QgdHJhcCBDUjQgUEdF
IHdyaXRlcywKPiBidXQgd2hhdCBhYm91dCBvdGhlciBoeXBlcnZpc29ycz8KCkkgZ3Vlc3MgYWxs
IGh5cGVydmlzb3JzIHdpbGwgc3RyaXZlIHRvIGZvcmNlIGFzIGxpdHRsZSBleGl0cyBhcwpwb3Nz
aWJsZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
