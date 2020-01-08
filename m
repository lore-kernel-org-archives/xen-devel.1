Return-Path: <SRS0=xJ9Z=25=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D034C282DD
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jan 2020 13:21:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FD820692
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jan 2020 13:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FD820692
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipBGI-0008NV-V5; Wed, 08 Jan 2020 13:20:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipBGH-0008My-EP
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 13:20:37 +0000
X-Inumbo-ID: a7ab247e-3219-11ea-b7f3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7ab247e-3219-11ea-b7f3-12813bfff9fa;
 Wed, 08 Jan 2020 13:20:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 48753ADCF;
 Wed,  8 Jan 2020 13:20:35 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200108110148.18988-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <879882aa-9bd8-d56c-c567-fbd556361d97@suse.com>
Date: Wed, 8 Jan 2020 14:20:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108110148.18988-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxMjowMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvc21wYm9vdC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+IEBAIC05NDUs
NiArOTQ1LDggQEAgc3RhdGljIHZvaWQgY3B1X3NtcGJvb3RfZnJlZSh1bnNpZ25lZCBpbnQgY3B1
LCBib29sIHJlbW92ZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocGVyX2NwdShz
dHVicy5hZGRyLCBjcHUpIHwgflBBR0VfTUFTSykgKyAxKTsKPiAgICAgICAgICBpZiAoIGkgPT0g
U1RVQlNfUEVSX1BBR0UgKQo+ICAgICAgICAgICAgICBmcmVlX2RvbWhlYXBfcGFnZShtZm5fdG9f
cGFnZShtZm4pKTsKPiArICAgICAgICBwZXJfY3B1KHN0dWJzLmFkZHIsIGNwdSkgPSAwOwo+ICsg
ICAgICAgIHBlcl9jcHUoc3R1YnMubWZuLCBjcHUpID0gMDsKPiAgICAgIH0KCkFmYWljdCB0aGlz
IHdhcyBhIHJlZ3Jlc3Npb24gZnJvbSB0aGUgaW50cm9kdWN0aW9uIG9mIENQVSBwYXJraW5nOgpQ
cmlvciB0byB0aGF0LCBwZXItQ1BVIGRhdGEgd291bGQgaGF2ZSBiZWVuIHplcm9lZCBpbiBhbGwg
Y2FzZXMKYmVmb3JlIGEgbmV3IENQVSB3YXMgdW5sZWFzaGVkLiBJIHRoaW5rIGl0IHdvdWxkIGJl
IGhlbHBmdWwgaXQKdGhpcyB3YXMgbWVudGlvbmVkIGluIHRoZSBkZXNjcmlwdGlvbiAocG9zc2li
bHkgYnkgd2F5IG9mIGEgRml4ZXM6CnRhZykuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
