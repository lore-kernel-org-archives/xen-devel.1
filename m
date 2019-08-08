Return-Path: <SRS0=JtEA=WE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F2FC433FF
	for <xen-devel@archiver.kernel.org>; Thu,  8 Aug 2019 10:28:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF592173E
	for <xen-devel@archiver.kernel.org>; Thu,  8 Aug 2019 10:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEF592173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvfej-000191-E4; Thu, 08 Aug 2019 10:28:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=islG=WE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvfei-00018v-02
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:28:24 +0000
X-Inumbo-ID: 3e445098-b9c7-11e9-9569-3bc4e6a65f36
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3e445098-b9c7-11e9-9569-3bc4e6a65f36;
 Thu, 08 Aug 2019 10:28:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7656B28;
 Thu,  8 Aug 2019 03:28:20 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C546C3F694;
 Thu,  8 Aug 2019 03:28:18 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-2-jgross@suse.com>
 <60000ee4-7d2d-097e-dad6-584155c08ade@suse.com>
 <7220f9b0-92e8-033f-e22d-e369f797c80f@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <65da8b20-716d-34f2-945f-2dbc6abd2ef9@arm.com>
Date: Thu, 8 Aug 2019 11:28:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7220f9b0-92e8-033f-e22d-e369f797c80f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] xen/spinlocks: in debug builds store
 cpu holding the lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwOC8wOC8yMDE5IDA4OjUxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA4LjA4LjE5
IDA4OjU4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDcuMDguMjAxOSAxNjozMSwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4gRG8gd2UgaGF2ZSBhbiBpbXBsaWVkIGFzc3VtcHRpb24gc29tZXdo
ZXJlIHRoYXQgdW5zaWduZWQgc2hvcnQgaXMKPj4gZXhhY3RseSAxNiBiaXRzIHdpZGU/IEkgdGhp
bmsgInZhbCIgd2FudHMgdG8gYmUgdWludDE2X3QgaGVyZSAoYXMKPj4geW91IHJlYWxseSBtZWFu
ICJleGFjdGx5IDE2IGJpdHMiKSwgdGhlIHR3byBib29sZWFuIGZpZWxkcyB3YW50Cj4+IHRvIGJl
IGJvb2wsIGFuZCB0aGUgcmVtYWluaW5nIHR3byBvbmVzIHVuc2lnbmVkIGludC4KPiAKPiBCdXQg
dGhhdCB3b3VsZCBpbmNyZWFzZSB0aGUgc2l6ZSBvZiB0aGUgdW5pb24gdG8gNCBieXRlcyBpbnN0
ZWFkIG9mIDIuCj4gU28gYXQgbGVhc3QgcGFkIGFuZCBjcHUgbXVzdCBiZSB1bnNpZ25lZCBzaG9y
dCBvciAoYmV0dGVyKSB1aW50MTZfdC4KCkhvdyBhYm91dCBib29sIGlycV9zYWZlOjE/CgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
