Return-Path: <SRS0=Sbqy=ZF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3723FC43331
	for <xen-devel@archiver.kernel.org>; Wed, 13 Nov 2019 14:29:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 012E2222D0
	for <xen-devel@archiver.kernel.org>; Wed, 13 Nov 2019 14:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 012E2222D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUteM-0007Fw-Kb; Wed, 13 Nov 2019 14:29:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUteL-0007Fl-Be
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:29:37 +0000
X-Inumbo-ID: 0421904a-0622-11ea-a231-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0421904a-0622-11ea-a231-12813bfff9fa;
 Wed, 13 Nov 2019 14:29:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 482A4B3D6;
 Wed, 13 Nov 2019 14:29:35 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191113134136.16180-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fb576a98-2f98-881a-8dc3-86bd1b59905c@suse.com>
Date: Wed, 13 Nov 2019 15:29:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113134136.16180-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] AMD/IOMMU: Fix crash in 'V'
 debugkey
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMjAxOSAxNDo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBjL3MgYmIwMzhmMzEx
NjggIkFNRC9JT01NVTogcmVwbGFjZSBJTlRSRU1BUF9FTlRSSUVTIiBpbnRyb2R1Y2VzIGEgY2Fs
bCB0bwo+IGludHJlbWFwX3RhYmxlX2VudHJpZXMoKSBpbiBkdW1wX2ludHJlbWFwX3RhYmxlKCkg
YmVmb3JlIHRibC5wdHIgaXMgY2hlY2tlZAo+IGZvciBOVUxMLgo+IAo+IGludHJlbWFwX3RhYmxl
X2VudHJpZXMoKSBpbnRlcm5hbGx5IHVzZXMgdmlydF90b19wYWdlKCkgd2hpY2ggZmFsbHMgb3Zl
cgo+IAo+ICAgQVNTRVJUKHZhID49IFhFTl9WSVJUX1NUQVJUKTsKPiAKPiBpbiBfX3ZpcnRfdG9f
cGFnZSgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
