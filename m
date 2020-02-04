Return-Path: <SRS0=o/65=3Y=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6522AC35247
	for <xen-devel@archiver.kernel.org>; Tue,  4 Feb 2020 17:07:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36EC82084E
	for <xen-devel@archiver.kernel.org>; Tue,  4 Feb 2020 17:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36EC82084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz1f7-0002mq-EF; Tue, 04 Feb 2020 17:06:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iz1f6-0002mj-Im
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 17:06:56 +0000
X-Inumbo-ID: befec222-4770-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id befec222-4770-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 17:06:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E9112AD45;
 Tue,  4 Feb 2020 17:06:54 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200204165535.17214-1-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e488f84-bc56-5bcf-0c60-3cdee48770e8@suse.com>
Date: Tue, 4 Feb 2020 18:07:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204165535.17214-1-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: fix off-by-one error when printing
 memory ranges
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxNzo1NSwgV2VpIExpdSB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZTgyMC5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAuYyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMK
PiBpbmRleCBiOWY1ODljYWMzLi5kNjczODdmMTM3IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9lODIwLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZTgyMC5jCj4gQEAgLTk0LDcgKzk0LDcgQEAg
c3RhdGljIHZvaWQgX19pbml0IHByaW50X2U4MjBfbWVtb3J5X21hcChzdHJ1Y3QgZTgyMGVudHJ5
ICptYXAsIHVuc2lnbmVkIGludCBlbnQKPiAgICAgIGZvciAoaSA9IDA7IGkgPCBlbnRyaWVzOyBp
KyspIHsKPiAgICAgICAgICBwcmludGsoIiAlMDE2THggLSAlMDE2THggIiwKPiAgICAgICAgICAg
ICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZykobWFwW2ldLmFkZHIpLAo+IC0gICAgICAgICAgICAg
ICAodW5zaWduZWQgbG9uZyBsb25nKShtYXBbaV0uYWRkciArIG1hcFtpXS5zaXplKSk7Cj4gKyAg
ICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpKG1hcFtpXS5hZGRyICsgbWFwW2ldLnNp
emUpIC0gMSk7CgpXaHkgd2FzIHRoaXMgYW4gZXJyb3I/IElmIHdlIHVzZWQgWyxdIGxpa2UgTGlu
dXggZG9lcyAtIHN1cmUuCkJ1dCB3ZSBkb24ndC4gVGhlIHByZXNlbnRhdGlvbiwgd2l0aG91dCBs
b29raW5nIGF0IHRoZSBzb3VyY2UsCnNpbXBseSBsZWF2ZXMgb3BlbiB3aGV0aGVyIHRoaXMgd2Fz
IG1lYW50IHRvIGJlIFssXSBvciBbLCkuCkFuZCBpdCBjb250aW51ZXMgdG8gYmUgbGVmdCBvcGVu
IHdpdGggdGhlIGFkanVzdG1lbnQgbWFkZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
