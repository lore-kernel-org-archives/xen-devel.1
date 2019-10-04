Return-Path: <SRS0=IlRI=X5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B065C47404
	for <xen-devel@archiver.kernel.org>; Fri,  4 Oct 2019 13:04:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 575A6207FF
	for <xen-devel@archiver.kernel.org>; Fri,  4 Oct 2019 13:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 575A6207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGNG8-0005Vv-7t; Fri, 04 Oct 2019 13:04:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iGNG7-0005Vq-To
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 13:04:35 +0000
X-Inumbo-ID: 830fff9e-e6a7-11e9-9754-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 830fff9e-e6a7-11e9-9754-12813bfff9fa;
 Fri, 04 Oct 2019 13:04:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1E2B1B195;
 Fri,  4 Oct 2019 13:04:34 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
 <1570110555-24287-3-git-send-email-igor.druzhinin@citrix.com>
 <4d82e6f6-e362-7fc0-efa9-d024088d9f9f@suse.com>
 <7bb04327-f442-5455-fda5-3d457b06fd68@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43939023-3fd9-d124-a11a-861211f3206f@suse.com>
Date: Fri, 4 Oct 2019 15:04:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7bb04327-f442-5455-fda5-3d457b06fd68@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] efi/boot: make sure chosen mode is set
 even if firmware tell it is
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

T24gMDQuMTAuMjAxOSAxMzozMywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMDQvMTAvMjAx
OSAxMTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAzLjEwLjIwMTkgMTU6NDksIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gSWYgYSBib290bG9hZGVyIGlzIHVzaW5nIG5hdGl2ZSBkcml2
ZXIgaW5zdGVhZCBvZiBFRkkgR09QIGl0IG1pZ2h0Cj4+PiByZXNldCBncmFwaGljcyBtb2RlIHRv
IGJlIGRpZmZlcmVudCBmcm9tIHdoYXQgZmlybXdhcmUgdGhpbmtzIGl0Cj4+PiBjdXJyZW50bHkg
aXMuIFNldCBjaG9zZW4gbW9kZSB1bmNvbmRpdGlvbmFsbHkgdG8gZml4IHRoaXMgcG9zc2libGUK
Pj4+IG1pc2FsaWdubWVudC4KPj4+Cj4+PiBPYnNlcnZlZCB3aXRoIEVGSSBHUlVCMiBjb21waWxl
ZCB3aXRoIGFsbCBwb3NzaWJsZSB2aWRlbyBkcml2ZXJzIHdoZXJlCj4+PiBuYXRpdmUgZHJpdmVy
cyB0YWtlIHByaW9yaXR5IG92ZXIgZmlybXdhcmUuCj4+Cj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBj
YXNlIGNhbiBoYXBwZW4gd2l0aCBqdXN0IHBsYWluIEVGSS4gVGhlcmVmb3JlIC4uLgo+Pgo+IAo+
IENvdWxkIHlvdSBjbGFyaWZ5IHdoYXQgeW91IG1lYW4gYnkgInBsYWluIEVGSSIgaGVyZT8gRG8g
eW91IG1lYW4gYmVpbmcKPiBib290ZWQgYXMgRUZJIGJpbmFyeSB1bmxpa2UgdGhyb3VnaCBtdWx0
aWJvb3QgcHJvdG9jb2w/CgpZZXMgLSBsaWtlIHdoZW4gcnVubmluZyB4ZW4uZWZpIGZyb20gdGhl
IEVGSSBzaGVsbCBjb21tYW5kIGxpbmUuCgo+IEkgdGhpbmsgaW4gYm90aAo+IGNhc2VzIGl0J3Mg
cG9zc2libGUgdG8gY29tZSB0aGVyZSB0aHJvdWdoIGEgYm9vdGxvYWRlci4KCkFueXRoaW5nIGlu
dm9raW5nIGFuIEVGSSBhcHBsaWNhdGlvbiB3aXRoIGEgc2NyZXdlZCB1cCBFRkkKZW52aXJvbm1l
bnQgaXMgYm9ndXMuIEkgY2FuIHNlZSBob3cgZ3J1YiB3b3VsZCB2aW9sYXRlIHN1Y2gKYXNzdW1w
dGlvbnMgdGhvdWdoLCBhbmQgaG93IG9uZSBtaWdodCBjYWxsIHRoaXMgdmFsaWQgd2hlbgppbnZv
a2luZyB0aGUgbmV4dCBiaW5hcnkgd2l0aCBhIHByb3RvY29sIG90aGVyIHRoYW4gd2hhdCBwbGFp
bgpFRkkgcHJvdmlkZXMgKHJlYWQ6IE1CMiBoZXJlKS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
