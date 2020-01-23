Return-Path: <SRS0=7Ixj=3M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C9AC2D0DB
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jan 2020 10:05:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AEC82467F
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jan 2020 10:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AEC82467F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuZLw-0002Ns-4n; Thu, 23 Jan 2020 10:04:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuZLv-0002Nn-Jb
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 10:04:43 +0000
X-Inumbo-ID: c17edea4-3dc7-11ea-8e9a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c17edea4-3dc7-11ea-8e9a-bc764e2007e4;
 Thu, 23 Jan 2020 10:04:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C0DB6B2CD;
 Thu, 23 Jan 2020 10:04:33 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-3-liuwe@microsoft.com>
 <2bea187c-7c4d-721b-9229-a28066c7fc5a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f920a520-e4c3-d834-bc22-bbf134852be2@suse.com>
Date: Thu, 23 Jan 2020 11:04:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <2bea187c-7c4d-721b-9229-a28066c7fc5a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/7] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAyMjozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMi8wMS8yMDIw
IDIwOjIzLCBXZWkgTGl1IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5jCj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKPj4gKwkgKi8KPj4gKyAgICAgICAgdW5zaWduZWQgaW50
IHBoeXNfYml0cyA9IGZpbmRfcGh5c19hZGRyX2JpdHMoKTsKPj4gKyAgICAgICAgdW5zaWduZWQg
bG9uZyBoY2FsbF9wZm4gPQo+PiArICAgICAgICAgICgoMXVsbCA8PCBwaHlzX2JpdHMpIC0gMSkg
Pj4gUEFHRV9TSElGVDsKPiAKPiAoMXVsbCA8PCAocGh5c19iaXRzIC0gUEFHRV9TSElGVCkpIC0g
MSBpcyBlcXVpdmFsZW50LCBhbmQgZG9lc24ndAo+IHJlcXVpcmUgYSByaWdodCBzaGlmdC7CoCBJ
IGRvbid0IGtub3cgaWYgdGhlIGNvbXBpbGVyIGlzIHNtYXJ0IGVub3VnaCB0bwo+IG1ha2UgdGhp
cyBvcHRpbWlzYXRpb24gYXV0b21hdGljYWxseS4KCkl0J3Mgbm90IGFsbG93ZWQgdG8sIHdpdGhv
dXQgaGF2aW5nIGEgd2F5IHRvIGtub3cgdGhhdCBwaHlzX2JpdHMgaXMKbm8gbGVzcyB0aGFuIFBB
R0VfU0hJRlQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
