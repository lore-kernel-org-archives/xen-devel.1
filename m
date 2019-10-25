Return-Path: <SRS0=nyXv=YS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947E1CA9EA0
	for <xen-devel@archiver.kernel.org>; Fri, 25 Oct 2019 14:12:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F92C20663
	for <xen-devel@archiver.kernel.org>; Fri, 25 Oct 2019 14:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F92C20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO0KC-0000Rn-Iy; Fri, 25 Oct 2019 14:12:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iO0KB-0000Rh-Su
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 14:12:19 +0000
X-Inumbo-ID: 718aec80-f731-11e9-94ca-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 718aec80-f731-11e9-94ca-12813bfff9fa;
 Fri, 25 Oct 2019 14:12:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D624BBAE3;
 Fri, 25 Oct 2019 14:12:13 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
 <d9e965c0e19759f7be398044945b7be9eff41f3d.1571888583.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4594707-7c0f-e5d5-c4fa-c1fb9fb3a13a@suse.com>
Date: Fri, 25 Oct 2019 16:12:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d9e965c0e19759f7be398044945b7be9eff41f3d.1571888583.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/3] xen/efi: use directmap to access
 runtime services table
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMjAxOSAwNTo0NSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IERvIG5vdCByZXF1aXJlIHN3aXRjaGluZyBwYWdlIHRhYmxlcyB0byBhY2Nlc3MgKHN0YXRpYykg
aW5mb3JtYXRpb24gaW4KPiB0aGUgcnVudGltZSBzZXJ2aWNlcyB0YWJsZSBpdHNlbGYsIHVzZSBk
aXJlY3RtYXAgZm9yIHRoaXMuIFRoaXMgYWxsb3dzCj4gZXhpdGluZyBlYXJseSBmcm9tIFhFTl9F
RklfcXVlcnlfY2Fwc3VsZV9jYXBhYmlsaXRpZXMsCj4gWEVOX0VGSV91cGRhdGVfY2Fwc3VsZSBh
bmQgWEVOX0VGSV9xdWVyeV92YXJpYWJsZV9pbmZvIChpbiBjYXNlIG9mIG5vdAo+IHN1cHBvcnRl
ZCBjYWxsKSB3aXRob3V0IGFsbCB0aGUgaW1wYWN0IG9mIHBhZ2UgdGFibGUgc3dpdGNoLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52
aXNpYmxldGhpbmdzbGFiLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpBcyBzYWlkIEkgd291bGQgaGF2ZSBwcmVmZXJyZWQgdGhpcyB0byBiZSBwYXRj
aCAxIG9mIHRoZSBzZXJpZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
