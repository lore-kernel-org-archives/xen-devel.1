Return-Path: <SRS0=BXCD=X3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D07BC352AA
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 09:13:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC5221783
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 09:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC5221783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFagZ-0005t9-Vl; Wed, 02 Oct 2019 09:12:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFagY-0005t3-JW
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 09:12:38 +0000
X-Inumbo-ID: c72df348-e4f4-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id c72df348-e4f4-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 09:12:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5930A1000;
 Wed,  2 Oct 2019 02:12:37 -0700 (PDT)
Received: from [10.37.10.48] (unknown [10.37.10.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23E663F706;
 Wed,  2 Oct 2019 02:12:35 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-4-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011312180.20899@sstabellini-ThinkPad-T480s>
 <af8c7f32-699b-7611-495b-575a81361952@arm.com>
 <alpine.DEB.2.21.1910011714570.2943@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6ca204a6-286c-6406-58cd-69eaf4a6dbc7@arm.com>
Date: Wed, 2 Oct 2019 10:12:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910011714570.2943@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework
 entry/exit from the guest path
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDEwLzIvMTkgMToxNiBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIFR1ZSwgMSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAwMS8xMC8y
MDE5IDIxOjEyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBUaHUsIDI2IFNlcCAy
MDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBJIGFtIE9LIHdpdGggdGhlIGdlbmVyYWwgYXBw
cm9hY2ggYnV0IG9uZSB0aGluZyB0byBub3RlIGlzIHRoYXQgdGhlIGZpcQo+Pj4gaGFuZGxlciBk
b2Vzbid0IHVzZSB0aGUgZ3Vlc3RfdmVjdG9yIG1hY3JvIGF0IHRoZSBtb21lbnQuCj4+Cj4+IGRv
X3RyYXBfZmlxKCkgaXMgbm90IGNhbGxlZCBmcm9tIGFybTY0IEluc3RlYWQsIHdlIGNhbGwgZG9f
YmFkX21vZGUoKS4KPj4gU28gSSBkb24ndCBzZWUgYW4gaXNzdWUgaGVyZS4KPj4KPj4gQXMgZG9f
YmFkX21vZGUoKSBkb2VzIG5vdCBjYWxsIGVudGVyX2h5cGVydmlzb3JfaGVhZCgpLCB0aGUgZmlx
IGhhbmRsZXIKPj4gZG9lcyBub3QgdXNlIGd1ZXN0X3ZlY3Rvci4KPj4KPj4gVGhhdCBzYWlkLCBp
dCBpcyBpbnRlcmVzdGluZyB0byBzZWUgdGhhdCB3ZSBkb24ndCBkZWFsIHRoZSBzYW1lIHdheSB0
aGUKPj4gRklRIG9uIEFybTMyIGFuZCBBcm02NC4gT24gdGhlIGZvcm1lciwgd2Ugd2lsbCBjYWxs
IGRvX0lSUSB3aGlsZSB0aGUKPj4gbGF0dGVyIHdpbGwgY3Jhc2ggdGhlIGd1ZXN0Lgo+Pgo+PiBJ
dCB3b3VsZCBiZSBnb29kIGlmIHdlIGNhbiBoYXZlIHRoZSBzYW1lIGJlaGF2aW9yIGFjY3Jvc3Mg
dGhlIHR3byBhcmNoCj4+IGlmIHBvc3NpYmxlLiBJIHZhZ3VlbHkgcmVjYWxsIHNvbWVvbmUgKEFu
ZHJlPykgbWVudGlvbmluZyBzb21lIGNoYW5nZXMKPj4gYXJvdW5kIEZJUSBpbiBLVk0gcmVjZW50
bHkuIEFuZHJlLCBhcmUgRklRIG1lYW50IHRvIHdvcmsgd2l0aCBHdWVzdD8KPj4KPj4gQWxzbywg
YSBzaWRlIGVmZmVjdCBvZiBub3QgY2FsbGluZyBlbnRlcl9oeXBlcnZpc29yX2hlYWQoKSBpcyB3
b3JrYXJvdW5kCj4+IGFyZSBub3QgcmUtZW5hYmxlZC4gV2UgYXJlIGdvaW5nIHRvIHBhbmljIHNv
b24gYWZ0ZXIsIHNvIGl0IG1heSBub3QgYmUKPj4gdGhhdCBtdWNoIGFuIGlzc3VlLgo+IAo+IFJp
Z2h0LCB0aGF0IGlzIHdoYXQgSSB3YXMgdGhpbmtpbmcgdG9vLCBidXQgSSB3YW50ZWQgdG8gaGln
aGxpZ2h0IGl0LiBBdAo+IGxlYXN0IGl0IHdvdWxkIGJlIHdvcnRoIGFkZGluZyBhIHNlbnRlbmNl
IHRvIHRoZSBjb21taXQgbWVzc2FnZSBhYm91dAo+IGl0LgpBcyBJIHBvaW50ZWQgb3V0IGFib3Zl
LCB0aGlzIHBhdGNoIGRvZXMgbm90IGNoYW5nZSBhbnl0aGluZyBpbiB0aGlzIApwYXJ0aWN1bGFy
IEFybTY0IHZlY3RvciBzbyBJIGRvbid0IHNlZSB3aHkgSSBzaG91bGQgbWVudGlvbiBpdCBpbiB0
aGUgCmNvbW1pdCBtZXNzYWdlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
