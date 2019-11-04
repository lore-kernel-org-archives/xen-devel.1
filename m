Return-Path: <SRS0=Ov7q=Y4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CE7CA9EB5
	for <xen-devel@archiver.kernel.org>; Mon,  4 Nov 2019 13:35:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69FA620B7C
	for <xen-devel@archiver.kernel.org>; Mon,  4 Nov 2019 13:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69FA620B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRcVX-0004rx-CR; Mon, 04 Nov 2019 13:34:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRcVW-0004rr-2w
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 13:34:58 +0000
X-Inumbo-ID: e415a9d8-ff07-11e9-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e415a9d8-ff07-11e9-9631-bc764e2007e4;
 Mon, 04 Nov 2019 13:34:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8A59CB390;
 Mon,  4 Nov 2019 13:34:56 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <753484d4-86f9-199b-2972-ac8044ac414c@suse.com>
Date: Mon, 4 Nov 2019 14:35:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191101202502.31750-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] x86/e820: fix 640k - 1M region
 reservation logic
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Sergey Dyasli <sergey.dyasli@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTEuMjAxOSAyMToyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBGcm9tOiBTZXJnZXkg
RHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Cj4gCj4gQ29udmVydGluZyBhIGd1ZXN0
IGZyb20gUFYgdG8gUFYtaW4tUFZIIG1ha2VzIHRoZSBndWVzdCB0byBoYXZlIDM4NGsKPiBsZXNz
IG1lbW9yeSwgd2hpY2ggbWF5IGNvbmZ1c2UgZ3Vlc3QncyBiYWxsb29uIGRyaXZlci4gVGhpcyBo
YXBwZW5zCj4gYmVjYXVzZSBYZW4gdW5jb25kaXRpb25hbGx5IHJlc2VydmVzIDY0MGsgLSAxTSBy
ZWdpb24gaW4gRTgyMCBkZXNwaXRlCj4gdGhlIGZhY3QgdGhhdCBpdCdzIHJlYWxseSBhIHVzYWJs
ZSBSQU0gaW4gUFZIIGJvb3QgbW9kZS4KPiAKPiBGaXggdGhpcyBieSBza2lwcGluZyByZWdpb24g
dHlwZSBjaGFuZ2UgaW4gdmlydHVhbGlzZWQgZW52aXJvbm1lbnRzLAo+IHRydXN0aW5nIHdoYXRl
dmVyIG1lbW9yeSBtYXAgb3VyIGh5cGVydmlzb3IgaGFzIHByb3ZpZGVkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KClJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
