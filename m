Return-Path: <SRS0=w8Ow=ZH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53389C432C3
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 10:29:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27F1C206DB
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 10:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27F1C206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVYqr-0002Hg-O1; Fri, 15 Nov 2019 10:29:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jkvn=ZH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iVYqq-0002Hb-1x
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 10:29:16 +0000
X-Inumbo-ID: c51c396e-0792-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c51c396e-0792-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 10:29:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9DB67ABB1;
 Fri, 15 Nov 2019 10:29:13 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191115070414.3862-1-jgross@suse.com>
 <20191115102631.poifbgjw4jhgav72@debian>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4bf27b8f-1ee4-f527-643f-d26880daa4e6@suse.com>
Date: Fri, 15 Nov 2019 11:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191115102631.poifbgjw4jhgav72@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] libxl: fix device model timeout in
 libxl__dm_resume()
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMTkgMTE6MjYsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBOb3YgMTUsIDIwMTkg
YXQgMDg6MDQ6MTRBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gbGlieGxfX2RtX3Jl
c3VtZSgpIGlzIHVzaW5nIGEgd3JvbmcgdGltZW91dCBmb3IgdGhlIHN0YXJ0IG9mIHRoZQo+PiBk
ZXZpY2UgbW9kZWwuIEluc3RlYWQgb2YgNjAgc2Vjb25kcyB0aGUgdGltZW91dCBpcyBzZXQgdG8g
NjAKPj4gbWlsbGlzZWNvbmRzLgo+Pgo+PiBSZXBvcnRlZC1ieTogUm9tYW4gU2hhcG9zaG5payA8
cm9tYW5AemVkZWRhLmNvbT4KPj4gRml4ZXM6IDYyOThmMGViOGY0NDM3ICgibGlieGw6IFJlLWlu
dHJvZHVjZSBsaWJ4bF9fZG9tYWluX3Jlc3VtZSIpCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KPiAKCkFuZCBvZiBjb3Vyc2U6CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
