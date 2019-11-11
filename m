Return-Path: <SRS0=qr0R=ZD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3E7C43331
	for <xen-devel@archiver.kernel.org>; Mon, 11 Nov 2019 10:15:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F185021655
	for <xen-devel@archiver.kernel.org>; Mon, 11 Nov 2019 10:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F185021655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU6j8-0005L2-32; Mon, 11 Nov 2019 10:15:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Nc6x=ZD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iU6j6-0005Kx-KM
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 10:15:16 +0000
X-Inumbo-ID: 27180938-046c-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27180938-046c-11ea-9631-bc764e2007e4;
 Mon, 11 Nov 2019 10:15:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4A1CBB1FB;
 Mon, 11 Nov 2019 10:15:14 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20191110092506.98925-1-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <58da82ad-9a44-21c1-8128-714da6cae1b4@suse.com>
Date: Mon, 11 Nov 2019 11:15:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191110092506.98925-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 0/2] x86/ioapic: fix
 clear_IO_APIC_pin when using interrupt remapping
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTEuMTkgMTA6MjUsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBIZWxsbywKPiAKPiBD
dXJyZW50IGNvZGUgaW4gY2xlYXJfSU9fQVBJQ19waW4gZG9lc24ndCBwcm9wZXJseSBkZWFsIHdp
dGggSU8tQVBJQwo+IGVudHJpZXMgYWxyZWFkeSBjb25maWd1cmVkIHRvIHBvaW50IHRvIGVudHJp
ZXMgaW4gdGhlIGlvbW11IGludGVycnVwdAo+IHJlbWFwcGluZyB0YWJsZSwgZml4IHRoaXMuCj4g
Cj4gUm9nZXIgUGF1IE1vbm5lICgyKToKPiAgICB4ODYvaW9hcGljOiByZW1vdmUgdXNhZ2Ugb2Yg
VFJVRSBhbmQgRkFMU0UgaW4gY2xlYXJfSU9fQVBJQ19waW4KPiAgICB4ODYvaW9hcGljOiBmaXgg
Y2xlYXJfSU9fQVBJQ19waW4gd3JpdGUgb2YgcmF3IGVudHJpZXMKPiAKPiAgIHhlbi9hcmNoL3g4
Ni9pb19hcGljLmMgfCAxMyArKysrKysrLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAoKRm9yIHRoZSBzZXJpZXM6CgpSZWxlYXNlLWFj
a2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
