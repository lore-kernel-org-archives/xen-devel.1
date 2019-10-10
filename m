Return-Path: <SRS0=/JXh=YD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03461C10F14
	for <xen-devel@archiver.kernel.org>; Thu, 10 Oct 2019 07:34:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7D5218AC
	for <xen-devel@archiver.kernel.org>; Thu, 10 Oct 2019 07:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD7D5218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iISxT-0003dL-TF; Thu, 10 Oct 2019 07:33:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iISxR-0003dG-VA
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 07:33:57 +0000
X-Inumbo-ID: 5151d76a-eb30-11e9-9bee-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5151d76a-eb30-11e9-9bee-bc764e2007e4;
 Thu, 10 Oct 2019 07:33:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70789B14B;
 Thu, 10 Oct 2019 07:33:55 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
 <1570653603-9889-4-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0868db93-7cd6-740d-2b68-23d12be57965@suse.com>
Date: Thu, 10 Oct 2019 09:14:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1570653603-9889-4-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 3/3] efi/boot: make sure
 graphics mode is set while booting through MB2
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 roger.pau@citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAyMjo0MCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gSWYgYSBib290bG9h
ZGVyIGlzIHVzaW5nIG5hdGl2ZSBkcml2ZXIgaW5zdGVhZCBvZiBFRkkgR09QIGl0IG1pZ2h0Cj4g
cmVzZXQgZ3JhcGhpY3MgbW9kZSB0byBiZSBkaWZmZXJlbnQgZnJvbSB3aGF0IGhhcyBiZWVuIG9y
aWdpbmFsbHkgc2V0Cj4gYnkgZmlybXdhcmUuIFdoaWxlIGJvb3RpbmcgdGhyb3VnaCBNQjIgWGVu
IGVpdGhlciBuZWVkIHRvIHBhcnNlIHZpZGVvCj4gc2V0dGluZyBwYXNzZWQgYnkgTUIyIGFuZCB1
c2UgdGhlbSBpbnN0ZWFkIG9mIHdoYXQgR09QIHJlcG9ydHMgb3IKPiByZXNldCB0aGUgbW9kZSB0
byBzeW5jaHJvbmlzZSBpdCB3aXRoIGZpcm13YXJlIC0gcHJlZmVyIHRoZSBsYXR0ZXIuCj4gCj4g
T2JzZXJ2ZWQgd2hpbGUgYm9vdGluZyBYZW4gdXNpbmcgTUIyIHdpdGggRUZJIEdSVUIyIGNvbXBp
bGVkIHdpdGgKPiBhbGwgcG9zc2libGUgdmlkZW8gZHJpdmVycyB3aGVyZSBuYXRpdmUgZHJpdmVy
cyB0YWtlIHByaW9yaXR5IG92ZXIgZmlybXdhcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWdvciBE
cnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
