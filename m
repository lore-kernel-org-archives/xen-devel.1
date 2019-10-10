Return-Path: <SRS0=/JXh=YD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A442FC4360C
	for <xen-devel@archiver.kernel.org>; Thu, 10 Oct 2019 07:24:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7079020B7C
	for <xen-devel@archiver.kernel.org>; Thu, 10 Oct 2019 07:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7079020B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iISnl-0002gd-Ps; Thu, 10 Oct 2019 07:23:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iISnk-0002gY-Pj
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 07:23:56 +0000
X-Inumbo-ID: eac28748-eb2e-11e9-8c93-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eac28748-eb2e-11e9-8c93-bc764e2007e4;
 Thu, 10 Oct 2019 07:23:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5DE6FB155;
 Thu, 10 Oct 2019 07:23:54 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
 <1570653603-9889-3-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f9287bd-1cdf-915b-2d8e-7fb7adbe3f1a@suse.com>
Date: Thu, 10 Oct 2019 09:13:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1570653603-9889-3-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 2/3] x86/efi: properly handle 0
 in pixel reserved bitmask
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 roger.pau@citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAyMjo0MCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2VmaS9lZmktYm9vdC5oCj4gKysrIGIveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5o
Cj4gQEAgLTUyOCw5ICs1MjgsMTUgQEAgc3RhdGljIHZvaWQgX19pbml0IGVmaV9hcmNoX3ZpZGVv
X2luaXQoRUZJX0dSQVBISUNTX09VVFBVVF9QUk9UT0NPTCAqZ29wLAo+ICAgICAgICAgIGJwcCA9
IHNldF9jb2xvcihtb2RlX2luZm8tPlBpeGVsSW5mb3JtYXRpb24uQmx1ZU1hc2ssIGJwcCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgJnZnYV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5ibHVl
X3BvcywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgJnZnYV9jb25zb2xlX2luZm8udS52ZXNh
X2xmYi5ibHVlX3NpemUpOwo+IC0gICAgICAgIGJwcCA9IHNldF9jb2xvcihtb2RlX2luZm8tPlBp
eGVsSW5mb3JtYXRpb24uUmVzZXJ2ZWRNYXNrLCBicHAsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICZ2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIucnN2ZF9wb3MsCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICZ2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIucnN2ZF9zaXplKTsKPiAr
ICAgICAgICBpZiAoICFtb2RlX2luZm8tPlBpeGVsSW5mb3JtYXRpb24uUmVzZXJ2ZWRNYXNrICkK
PiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHZnYV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5y
c3ZkX3BvcyA9IDA7Cj4gKyAgICAgICAgICAgIHZnYV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5y
c3ZkX3NpemUgPSAwOwo+ICsgICAgICAgIH0KPiArICAgICAgICBlbHNlCj4gKyAgICAgICAgICAg
IGJwcCA9IHNldF9jb2xvcihtb2RlX2luZm8tPlBpeGVsSW5mb3JtYXRpb24uUmVzZXJ2ZWRNYXNr
LCBicHAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdmdhX2NvbnNvbGVfaW5mby51
LnZlc2FfbGZiLnJzdmRfcG9zLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnZnYV9j
b25zb2xlX2luZm8udS52ZXNhX2xmYi5yc3ZkX3NpemUpOwoKV2h5IG5vdCBzaW1wbHkKCiAgICAg
ICAgaWYgKCBtb2RlX2luZm8tPlBpeGVsSW5mb3JtYXRpb24uUmVzZXJ2ZWRNYXNrICkKICAgICAg
ICAgICAgYnBwID0gc2V0X2NvbG9yKG1vZGVfaW5mby0+UGl4ZWxJbmZvcm1hdGlvbi5SZXNlcnZl
ZE1hc2ssIGJwcCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ2Z2FfY29uc29sZV9pbmZv
LnUudmVzYV9sZmIucnN2ZF9wb3MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdmdhX2Nv
bnNvbGVfaW5mby51LnZlc2FfbGZiLnJzdmRfc2l6ZSk7Cgo/IFRoZXJlJ3Mgbm90aGluZyBJIGNh
biBzZWUgd2hpY2ggbWlnaHQgaGF2ZSBjaGFuZ2VkCnZnYV9jb25zb2xlX2luZm8udS52ZXNhX2xm
Yi5yc3ZkX3twb3Msc2l6ZX0gZnJvbSBpdHMgemVyby1pbml0aWFsaXplZAp2YWx1ZS4gV2l0aCB0
aGlzIGFkanVzdG1lbnQgKHdoaWNoIGNvdWxkIGJlIGRvbmUgd2hpbGUgY29tbWl0dGluZykgb3IK
d2l0aCBhIHJlYXNvbiBzdXBwbGllZCBmb3IgdGhlIG1vcmUgY29tcGxleCBjb2RlClJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
