Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712E7C10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:39:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DC0920693
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DC0920693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFiAN-0004F0-VD; Sun, 14 Apr 2019 16:39:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bMma=SQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hFiAM-0004Ev-E1
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 16:39:38 +0000
X-Inumbo-ID: e415ac84-5ed3-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e415ac84-5ed3-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 16:39:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C9A8374;
 Sun, 14 Apr 2019 09:39:06 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B688C3F68F;
 Sun, 14 Apr 2019 09:39:05 -0700 (PDT)
To: Amit Tomer <amittomer25@gmail.com>
References: <1555223611-10263-1-git-send-email-amittomer25@gmail.com>
 <7e3b90ce-d4ea-d1ba-2c39-f5920e12d73b@arm.com>
 <CABHD4K8MExLnsP3rk4WyB0UvP7+mo2kH+Fd0mKWo9-K8J=w62Q@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cac8c40b-4cd7-ef8c-01dd-be79131715ed@arm.com>
Date: Sun, 14 Apr 2019 17:39:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABHD4K8MExLnsP3rk4WyB0UvP7+mo2kH+Fd0mKWo9-K8J=w62Q@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen/arm: Add Amlogic Meson SoCs
 earlyprintk support
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190414163903.lxxSHfBirTt2H2EHwmFU3H4PcWExX2y-VS3WkvUy6WE@z>

CgpPbiA0LzE0LzE5IDU6MzUgUE0sIEFtaXQgVG9tZXIgd3JvdGU6Cj4gSGVsbG8sCgpIaSwKCj4+
IERvIGFsbCB0aGUgZmlybXdhcmUgZXhpc3RpbmcgZm9yIHRoaXMgcGxhdGZvcm0gaW5pdGlhbGl6
ZSB0aGUgVUFSVD8KPiAKPiBVLWJvb3QgZG9lcyBhbHNvIGluaXRpYWxpemUgdGhlIHVhcnQgZm9y
IHRoaXMgcGxhdGZvcm0uCj4gaHR0cHM6Ly9naXRodWIuY29tL3UtYm9vdC91LWJvb3QvYmxvYi9t
YXN0ZXIvZHJpdmVycy9zZXJpYWwvc2VyaWFsX21lc29uLmMjTDQ0CgpIb3cgYWJvdXQgcmVwbGFj
aW5nICJJdCByZWxpZXMgb24gZmlybXdhcmUuLi4iIGJ5ICJBVEYgYW5kIFUtYm9vdCAKYWxyZWFk
eSBpbml0aWFsaXplIHRoZSBVQVJUIGZvciB1cy4gU28gbm8gbmVlZCB0byBkbyBpdCBhZ2Fpbi4i
CgpTbyB0aGUgdXNlciBhdCBsZWFzdCBrbm93IHdoYXQgaGFzIGJlZW4gdmVyaWZpZWQuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
