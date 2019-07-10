Return-Path: <SRS0=r7lW=VH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD80C606CF
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jul 2019 12:31:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F3B32064B
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jul 2019 12:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F3B32064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlBkZ-0001J7-ID; Wed, 10 Jul 2019 12:31:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6kBj=VH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hlBkY-0001Iy-6s
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 12:31:06 +0000
X-Inumbo-ID: 951feb04-a30e-11e9-93a0-a306622b38f8
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 951feb04-a30e-11e9-93a0-a306622b38f8;
 Wed, 10 Jul 2019 12:31:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91F43AF5D;
 Wed, 10 Jul 2019 12:31:03 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190709152845.18217-1-andrew.cooper3@citrix.com>
 <20190709152845.18217-3-andrew.cooper3@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <938b8a52-c765-082c-c39e-84ae0fac2fa2@suse.com>
Date: Wed, 10 Jul 2019 14:31:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709152845.18217-3-andrew.cooper3@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 2/2] tools/xenstored: Drop mapping of the
 ring via foreign map
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDcuMTkgMTc6MjgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhpcyBpcyBhIHZlc3Rp
Z2lhbCByZW1uZW50IG9mIHRoZSBwcmUgeGVuc3RvcmVkIHN0dWIgZG9tYWluIGRheXMuCj4gCj4g
Rm9yZWlnbiBtYXBwaW5nIHZpYSBNRk4gaXMgYSBwcml2aWxlZ2VkIG9wZXJhdGlvbiB3aGljaCBp
cyBub3QKPiBuZWNlc3NhcnksIGJlY2F1c2UgZ3JhbnQgZGV0YWlscyBhcmUgdW5jb25kaXRpb25h
bGx5IHNldCB1cCBkdXJpbmcKPiBkb21haW4gY29uc3RydWN0aW9uLiAgSW4gcHJhY3RpY2UsIHRo
aXMgbWVhbnMgeGVuc3RvcmVkIG5ldmVyIHVzZXMgaXRzCj4gYWJpbGl0eSB0byBmb3JlaWduIG1h
cCB0aGUgcmluZy4KPiAKPiBEcm9wIHRoZSBhYmlsaXR5IGNvbXBsZXRlbHksIHdoaWNoIHJlbW92
ZXMgdGhlIHBlbnVsdGltYXRlIHVzZSBvZiB0aGUKPiB1bnN0YWJsZSBsaWJ4YyBpbnRlcmZhY2Uu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
