Return-Path: <SRS0=Ft0f=44=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCD1C10F27
	for <xen-devel@archiver.kernel.org>; Wed, 11 Mar 2020 09:33:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 515832146E
	for <xen-devel@archiver.kernel.org>; Wed, 11 Mar 2020 09:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 515832146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBxjB-0005xt-9K; Wed, 11 Mar 2020 09:32:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lkak=44=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBxjA-0005xo-1X
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 09:32:36 +0000
X-Inumbo-ID: 3ce15ddd-637b-11ea-af4a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ce15ddd-637b-11ea-af4a-12813bfff9fa;
 Wed, 11 Mar 2020 09:32:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3B08B346;
 Wed, 11 Mar 2020 09:32:32 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1583863578-18063-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3918d702-adf0-511a-02eb-2bdcbc6c664f@suse.com>
Date: Wed, 11 Mar 2020 10:32:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583863578-18063-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] x86/cpu: Sync any remaining RCU
 callbacks before CPU up/down
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
Cc: jgross@suse.com, sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxOTowNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gRHVyaW5nIENQVSBk
b3duIG9wZXJhdGlvbiBSQ1UgY2FsbGJhY2tzIGFyZSBzY2hlZHVsZWQgdG8gZmluaXNoCj4gb2Zm
IHNvbWUgYWN0aW9ucyBsYXRlciBhcyBzb29uIGFzIENQVSBpcyBmdWxseSBkZWFkICh0aGUgc2Ft
ZSBhcHBsaWVzCj4gdG8gQ1BVIHVwIG9wZXJhdGlvbiBpbiBjYXNlIGVycm9yIHBhdGggaXMgdGFr
ZW4pLiBJZiBpbiB0aGUgc2FtZSBncmFjZQo+IHBlcmlvZCBhbm90aGVyIENQVSB1cCBvcGVyYXRp
b24gaXMgcGVyZm9ybWVkIG9uIHRoZSBzYW1lIENQVSwgUkNVIGNhbGxiYWNrCj4gd2lsbCBiZSBj
YWxsZWQgbGF0ZXIgb24gYSBDUFUgaW4gYSBwb3RlbnRpYWxseSB3cm9uZyAoYWxyZWFkeSB1cCBh
Z2Fpbgo+IGluc3RlYWQgb2Ygc3RpbGwgYmVpbmcgZG93bikgc3RhdGUgbGVhZGluZyB0byBldmVu
dHVhbCBzdGF0ZSBpbmNvbnNpc3RlbmN5Cj4gYW5kL29yIGNyYXNoLgo+IAo+IEluIG9yZGVyIHRv
IGF2b2lkIGl0IC0gZmx1c2ggUkNVIGNhbGxiYWNrcyBleHBsaWNpdGx5IGJlZm9yZSBzdGFydGlu
ZyB0aGUKPiBuZXh0IENQVSB1cC9kb3duIG9wZXJhdGlvbi4KPiAKPiBSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhp
bmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgoKKE5pdDogVGhlc2UgcHJlZmVyYWJseSB3
b3VsZCBjb21lIGluIGludmVyc2Ugb3JkZXIuKQoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
