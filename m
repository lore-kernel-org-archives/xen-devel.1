Return-Path: <SRS0=ufJU=23=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA3DC32771
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jan 2020 08:39:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6415E21734
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jan 2020 08:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6415E21734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioNuX-0004fI-MT; Mon, 06 Jan 2020 08:38:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VEq/=23=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ioNuW-0004fD-K9
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 08:38:52 +0000
X-Inumbo-ID: f1da9dec-305f-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1da9dec-305f-11ea-b6f1-bc764e2007e4;
 Mon, 06 Jan 2020 08:38:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21DEDACEF;
 Mon,  6 Jan 2020 08:38:42 +0000 (UTC)
To: Santucco <santucco@mail.ru>, xen-devel@lists.xenproject.org
References: <1578297407.255542354@f149.i.mail.ru>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9ead165f-440a-31b7-c587-c228b8692a7e@suse.com>
Date: Mon, 6 Jan 2020 09:38:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1578297407.255542354@f149.i.mail.ru>
Content-Language: en-US
Subject: Re: [Xen-devel] PV DRM doesn't work without auto_translated_physmap
 feature in Dom0
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAgMDg6NTYsIFNhbnR1Y2NvIHdyb3RlOgo+IEhlbGxvLAo+IAo+IEnigJltIHRy
eWluZyB0byB1c2UgdmRpc3BsIGludGVyZmFjZSBmcm9tIFBWIE9TLCBpdCBkb2VzbuKAmXQgd29y
ay4KPiBDb25maWd1cmF0aW9uIGRldGFpbHM6Cj4gICAgICBYZW4gNC4xMi4xCj4gICAgICBEb20w
OiBMaW51eCA0LjIwLjE3LWdlbnRvbyAjMTMgU01QIFNhdCBEZWMgMjggMTE6MTI6MjQgTVNLIDIw
MTkgeDg2XzY0IEludGVsKFIpIENlbGVyb24oUikgQ1BVIE4zMDUwIEAgMS42MEdIeiBHZW51aW5l
SW50ZWwgR05VL0xpbnV4Cj4gICAgICBEb21VOiB4ODbCoFBsYW45LCBQVgo+ICAgICAgZGlzcGxf
YmUgYXMgYSBiYWNrZW5kIGZvciB2ZGlzcGwgYW5kIHZrYgo+IAo+IHdoZW4gVk0gc3RhcnRzLCBk
aXNwbF9iZSByZXBvcnRzIGFib3V0IGFuIGVycm9yOgo+IGdudHRhYjogZXJyb3I6IGlvY3RsIERN
QUJVRl9FWFBfRlJPTV9SRUZTIGZhaWxlZDogSW52YWxpZCBhcmd1bWVudCAoZGlzcGxfYmUubG9n
OjIyMSkKPiAKPiByZWxhdGVkwqBEb20wIG91dHB1dCBpczoKPiBbICAxOTEuNTc5Mjc4XSBDYW5u
b3QgcHJvdmlkZSBkbWEtYnVmOiB1c2VfcHRlbW9kZSAxIChkbWVzZy5jcmVhdGUubG9nOjEyMykK
ClRoaXMgc2VlbXMgdG8gYmUgYSBsaW1pdGF0aW9uIG9mIHRoZSB4ZW4gZG1hLWJ1ZiBkcml2ZXIu
IEl0IHdhcyB3cml0dGVuCmZvciBiZWluZyB1c2VkIG9uIEFSTSBpbml0aWFsbHkgd2hlcmUgUFYg
aXMgbm90IGF2YWlsYWJsZS4KCkNDLWluZyBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3aG8gaXMg
dGhlIGF1dGhvciBvZiB0aGF0IGRyaXZlci4gSGUKc2hvdWxkIGJlIGFibGUgdG8gdGVsbCB1cyB3
aGF0IHdvdWxkIGJlIG5lZWRlZCB0byBlbmFibGUgUFYgZG9tMC4KCkRlcGVuZGluZyBvbiB5b3Vy
IHVzZSBjYXNlIGl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIHVzZSBQVkggZG9tMCwgYnV0CnN1cHBv
cnQgZm9yIHRoaXMgbW9kZSBpcyAiZXhwZXJpbWVudGFsIiBvbmx5IGFuZCBzb21lIGZlYXR1cmVz
IGFyZSBub3QKeWV0IHdvcmtpbmcuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
