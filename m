Return-Path: <SRS0=uIqA=3S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FE4C33CB2
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 05:51:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C7922063A
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 05:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C7922063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwgG3-0006Gw-5d; Wed, 29 Jan 2020 05:51:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GwGO=3S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iwgG2-0006Gr-8s
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 05:51:22 +0000
X-Inumbo-ID: 5f6b923c-425b-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f6b923c-425b-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 05:51:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 76AF5AD5F;
 Wed, 29 Jan 2020 05:51:19 +0000 (UTC)
To: pgnet.dev@gmail.com, xen-devel@lists.xenproject.org
References: <4bd83180-1b44-bcdd-bfe6-42724cda8a44@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5ac8716e-daba-9788-c362-acad18a44dfe@suse.com>
Date: Wed, 29 Jan 2020 06:51:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <4bd83180-1b44-bcdd-bfe6-42724cda8a44@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] FAILED/MISSING cstate/cpufreq/cpupower support with
 Xen 4.13 + kernel 5.4.14; withOUT xen/hypervisor, WORKS. bug or config?
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAgMTg6NDEsIFBHTmV0IERldiB3cm90ZToKPiAoIHBvc3RlZCB0aGlzIGFscmVh
ZHkgdG8geGVuLXVzZXJzLCBhbmQgQCBkaXN0cm8gbGlzdDsgYWR2aXNlZCB0byBicmluZyBpdCBo
ZXJlICkKPiAKPiBJJ20gcnVubmluZyBsaW51eCBrZXJuZWwKPiAKPiAJbHNiX3JlbGVhc2UgLXJk
Cj4gCQlEZXNjcmlwdGlvbjogICAgb3BlblNVU0UgTGVhcCAxNS4xCj4gCQlSZWxlYXNlOiAgICAg
ICAgMTUuMQo+IAo+IAl1bmFtZSAtcm0KPiAJCTUuNC4xNC0yNS5nMTcwNTI0Yy1kZWZhdWx0IHg4
Nl82NAoKLi4uCgo+IFhlbiBjbWQgbGluZSBpbmNsdWRlcywKPiAKPiAJZ3JlcCBvcHRpb25zPSAv
Ym9vdC9ncnViMi94ZW4tNC4xMy4wXzA0LWxwMTUxLjY4OC5jZmcKPiAJCVtjb25maWcuMV0KPiAJ
CW9wdGlvbnM9ZG9tMD1wdmggZG9tMC1pb21tdT1tYXAtcmVzZXJ2ZWQgZG9tMF9tZW09NDAxNk0s
bWF4OjQwOTZNIGRvbTBfbWF4X3ZjcHVzPTQgY3B1ZnJlcT14ZW4gY3B1aWRsZSB1Y29kZT1zY2Fu
IC4uLgoKV2hhdCBpZiB5b3UgdXNlIHRoZSBzdGFuZGFyZCBmb3IgZG9tMCAoX25vdF8gcHZoKT8g
RG9tMCBQVkggc3VwcG9ydCBpcwpzdGlsbCBleHBlcmltZW50YWwgYW5kIGl0IGlzIGxhZ2dpbmcg
c29tZSBmZWF0dXJlcy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
