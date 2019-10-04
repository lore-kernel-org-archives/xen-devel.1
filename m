Return-Path: <SRS0=IlRI=X5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A805C47404
	for <xen-devel@archiver.kernel.org>; Fri,  4 Oct 2019 14:25:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB742070B
	for <xen-devel@archiver.kernel.org>; Fri,  4 Oct 2019 14:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB742070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGOVn-0004dO-MP; Fri, 04 Oct 2019 14:24:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iGOVm-0004dJ-HM
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 14:24:50 +0000
X-Inumbo-ID: b8d1e52e-e6b2-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8d1e52e-e6b2-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 14:24:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 973B4AD22;
 Fri,  4 Oct 2019 14:24:48 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191004064010.25646-1-jgross@suse.com>
 <a2e23594-04ae-a87d-5512-f8775a21552b@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e8364443-4f7f-62b7-f00d-4687ae07628b@suse.com>
Date: Fri, 4 Oct 2019 16:24:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a2e23594-04ae-a87d-5512-f8775a21552b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix locking in
 sched_tick_[suspend|resume]()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTAuMTkgMTY6MDgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMTAvNC8xOSA3OjQw
IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBzY2hlZF90aWNrX3N1c3BlbmQoKSBhbmQgc2No
ZWRfdGlja19yZXN1bWUoKSBzaG91bGQgbm90IGNhbGwgdGhlCj4+IHNjaGVkdWxlciBzcGVjaWZp
YyB0aW1lciBoYW5kbGVycyBpbiBjYXNlIHRoZSBjcHUgdGhleSBhcmUgcnVubmluZyBvbgo+PiBp
cyBqdXN0IGJlaW5nIG1vdmVkIHRvIG9yIGZyb20gYSBjcHVwb29sLgo+Pgo+PiBVc2UgYSBuZXcg
cGVyY3B1IGxvY2sgZm9yIHRoYXQgcHVycG9zZS4KPiAKPiBJcyB0aGVyZSBhIHJlYXNvbiB3ZSBj
YW4ndCB1c2UgdGhlIHBjcHVfc2NoZWR1bGVfbG9jaygpIGluc3RlYWQgb2YKPiBpbnRyb2R1Y2lu
ZyBhIG5ldyBvbmU/ICBTb3JyeSBpZiB0aGlzIGlzIG9idmlvdXMsIGJ1dCBpdCdzIGJlZW4gYSB3
aGlsZQo+IHNpbmNlIEkgcG9rZWQgYXJvdW5kIHRoaXMgY29kZS4KCkxvY2sgY29udGVudGlvbiB3
b3VsZCBiZSBoaWdoZXIgZXNwZWNpYWxseSB3aXRoIGNyZWRpdDIgd2hpY2ggaXMgdXNpbmcgYQpw
ZXItY29yZSBvciBldmVuIHBlci1zb2NrZXQgbG9jay4gV2UgZG9uJ3QgY2FyZSBhYm91dCBvdGhl
ciBzY2hlZHVsaW5nCmFjdGl2aXR5IGhlcmUsIGFsbCB3ZSBuZWVkIGlzIGEgZ3VhcmQgYWdhaW5z
dCBvdXIgcGVyLWNwdSBzY2hlZHVsZXIKZGF0YSBiZWluZyBjaGFuZ2VkIGJlbmVhdGggb3VyIGZl
ZXQuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
