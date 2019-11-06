Return-Path: <SRS0=qeuA=Y6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA597C5DF62
	for <xen-devel@archiver.kernel.org>; Wed,  6 Nov 2019 12:16:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BBD420869
	for <xen-devel@archiver.kernel.org>; Wed,  6 Nov 2019 12:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BBD420869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSKEH-0005Xe-Ru; Wed, 06 Nov 2019 12:16:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=29w3=Y6=suse.de=jgross@srs-us1.protection.inumbo.net>)
 id 1iSKCa-0005V1-AW
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 12:14:20 +0000
X-Inumbo-ID: f4ffcbba-008e-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4ffcbba-008e-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 12:14:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B9BC9AF0B;
 Wed,  6 Nov 2019 12:14:17 +0000 (UTC)
To: George Dunlap <dunlapg@umich.edu>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1911051556200.14907@sstabellini-ThinkPad-T480s>
 <CAFLBxZZcS7kt4n_HPHkff_RdH8ZE6Rc4tp4FvghrJr+7Hzxiew@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.de>
Message-ID: <9de34178-af9e-0f07-d07e-f46023d99bfb@suse.de>
Date: Wed, 6 Nov 2019 13:14:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFLBxZZcS7kt4n_HPHkff_RdH8ZE6Rc4tp4FvghrJr+7Hzxiew@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 06 Nov 2019 12:16:04 +0000
Subject: Re: [Xen-devel] Urgent for 4.13,
 Was dom0less + sched=null => broken in staging (fwd)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMTkgMTM6MTEsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gVHVlLCBOb3YgNSwg
MjAxOSBhdCAxMTo1OCBQTSBTdGVmYW5vIFN0YWJlbGxpbmkKPiA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4+Cj4+IEhpIERhcmlvLAo+Pgo+PiBJIGp1c3QgY2hlY2tlZCBhbmQgdGhl
IHBhdGNoIGlzIG5vdCBpbiBzdGFnaW5nIHlldC4gQ2FuIHdlIHBsZWFzZSBtYWtlCj4+IHN1cmUg
dGhlIHBhdGNoIGdvZXMgaW4gYXMgc29vbiBhcyBwb3NzaWJsZSwgZ2l2ZW4gdGhlIGxvb21pbmcg
cmVsZWFzZT8KPiAKPiBJIHRoaW5rIGVpdGhlciBhIGZpeCBvciBhIHJldmVydCBvZiB0aGUgb3Jp
Z2luYWwgcGF0Y2ggbmVlZHMgdG8gYmUgYQo+IHJlbGVhc2UgYmxvY2tlci4KCkkgaGF2ZSBubyBw
cm9ibGVtcyB3aXRoIHRoZSBwYXRjaC4gSXQgc2hvdWxkIGp1c3QgYmUgc2VudCBhcyBhIHByb3Bl
cgpwYXRjaCwgbm90IGluIHRoZSBtaWRkbGUgb2YgYSBtYWlsIHRocmVhZC4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
