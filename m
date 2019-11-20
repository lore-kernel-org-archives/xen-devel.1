Return-Path: <SRS0=DbOf=ZM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48ACDC432C0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 17:15:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F90920B7C
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 17:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F90920B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXTZH-0006CT-V5; Wed, 20 Nov 2019 17:15:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXTZG-0006CI-DO
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 17:15:02 +0000
X-Inumbo-ID: 48638906-0bb9-11ea-a31b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48638906-0bb9-11ea-a31b-12813bfff9fa;
 Wed, 20 Nov 2019 17:15:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 78455BC7C;
 Wed, 20 Nov 2019 17:14:59 +0000 (UTC)
To: Hongyan Xia <hongyax@amazon.com>, Wei Liu <wl@xen.org>
References: <cover.1570034362.git.hongyax@amazon.com>
 <55b6fbdac35d5c5b299a6c19315f462308ed6f3a.1570034362.git.hongyax@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <840e4254-3b5f-3d95-98e9-e099742c96c1@suse.com>
Date: Wed, 20 Nov 2019 18:14:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <55b6fbdac35d5c5b299a6c19315f462308ed6f3a.1570034362.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 9/9] x86/mm: change pl*e to l*t in
 virt_to_xen_l*e
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxOToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gRnJvbTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBXZSB3aWxsIG5lZWQgdG8gaGF2ZSBhIHZhcmlhYmxl
IG5hbWVkIHBsKmUgd2hlbiB3ZSByZXdyaXRlCj4gdmlydF90b194ZW5fbCplLiBDaGFuZ2UgcGwq
ZSB0byBsKnQgdG8gcmVmbGVjdCBiZXR0ZXIgaXRzIHB1cnBvc2UuCj4gVGhpcyB3aWxsIG1ha2Ug
cmV2aWV3aW5nIGxhdGVyIHBhdGNoIGVhc2llci4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+CgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
