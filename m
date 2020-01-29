Return-Path: <SRS0=uIqA=3S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8811C2D0DB
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 12:48:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C31842070E
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 12:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C31842070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmku-0002n4-Os; Wed, 29 Jan 2020 12:47:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwmkt-0002mz-Bf
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:47:39 +0000
X-Inumbo-ID: 878fa732-4295-11ea-88ae-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 878fa732-4295-11ea-88ae-12813bfff9fa;
 Wed, 29 Jan 2020 12:47:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A11FAB17A;
 Wed, 29 Jan 2020 12:47:37 +0000 (UTC)
To: pdurrant@amazon.com
References: <20200129123618.1202-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2de0978b-ad66-47a7-7d9b-07444f955f7a@suse.com>
Date: Wed, 29 Jan 2020 13:47:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129123618.1202-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.14 Development Update
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxMzozNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID09PSB4ODYgPT09IAo+
IAo+ICogIEludGVsIFByb2Nlc3NvciBUcmFjZSB2aXJ0dWFsaXphdGlvbiBlbmFibGluZyAodjEp
Cj4gICAtICBMdXdlaSBLYW5nCj4gCj4gKiAgTGludXggc3R1YiBkb21haW5zIChSRkMgdjIpCj4g
ICAtICBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kKPiAKPiAqICBGaXhlcyB0byAjREIgaW5q
ZWN0aW9uCj4gICAtICBBbmRyZXcgQ29vcGVyCj4gCj4gKiAgQ1BVSUQvTVNSIFhlbi90b29sc3Rh
Y2sgaW1wcm92ZW1lbnRzCj4gICAtICBBbmRyZXcgQ29vcGVyCj4gCj4gKiAgSW1wcm92ZW1lbnRz
IHRvIGRvbWFpbl9jcmFzaCgpCj4gICAtICBBbmRyZXcgQ29vcGVyCj4gCj4gKiAgRUlCUlMKPiAg
IC0gIEFuZHJldyBDb29wZXIKPiAKPiAqICBYZW4gaW9yZXEgc2VydmVyICh2MykKPiAgIC0gIFJv
Z2VyIFBhdSBNb25uZQoKRG8geW91IHdhbnQgdG8gYWRkICJ4ODYvSFZNOiBpbXBsZW1lbnQgbWVt
b3J5IHJlYWQgY2FjaGluZyIKKGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxOC0wOS9tc2cwMDk3Ni5odG1sKQpoZXJlPyBJIHRoaW5rIEkgbm93
IGhhdmUgc29tZXRoaW5nIGNvbWluZyBhIGxpdHRsZSBjbG9zZXIgdG8Kd2hhdCBBbmRyZXcgd2Fu
dHMuIEl0IGhhcyBpdHMgb3duIGRvd25zaWRlcywgc28gdGhlcmUgYmVpbmcgYQp2NCAoYWZ0ZXIg
d2VsbCBvdmVyIGEgeWVhcikgZG9lc24ndCBtZWFuIHRoaXMgd2lsbCBnZXQgaXQgYW55CmNsb3Nl
ciB0byBnb2luZyBpbi4KCkRvIHlvdSBhbHNvIHdhbnQgdG8gYWRkIHRoZSBvbmdvaW5nIHg4NiBp
bnNuIGVtdWxhdG9yIHdvcmsKaGVyZT8gU29tZSBwYXJ0cyB3ZXJlIHBvc3RlZCwgc29tZSBwYXJ0
cyBhcmUgc3RpbGwgaW4gbmVlZGVkCm9mIGZpbmRpbmcgdGltZSB0byBjYXJyeSBvdXQsIGFuZCBz
b21lIHBhcnRzIGFyZSBzdGlsbCBwcmV0dHkKdmFndWUuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
