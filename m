Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF60C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 16:52:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3522F2133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 16:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3522F2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEcw9-0003TH-6v; Thu, 11 Apr 2019 16:52:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V9MO=SN=citrix.com=prvs=99793e752=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hEcw8-0003T7-3g
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 16:52:28 +0000
X-Inumbo-ID: 2f406577-5c7a-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f406577-5c7a-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 16:52:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,338,1549929600"; d="scan'208";a="83359267"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
 <1554779560-26204-4-git-send-email-igor.druzhinin@citrix.com>
 <86f64028-46f1-7857-99cb-82f2246d4aa0@citrix.com>
 <027594a1-b35b-3624-8fe1-10a46301198f@citrix.com>
Message-ID: <e5f75fb1-daec-5e5d-cfd6-ac498455a042@citrix.com>
Date: Thu, 11 Apr 2019 17:51:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <027594a1-b35b-3624-8fe1-10a46301198f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/3] OvmfPkg/XenSupport: turn off address
 decoding before BAR sizing
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411165123.xg_MiKuO3OdDJEaMWaA3O09n4rbj8w71TEvL9kgyB3A@z>

T24gMTEvMDQvMjAxOSAxNToxMywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMTEvMDQvMjAx
OSAxNDoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDkvMDQvMjAxOSAwNDoxMiwgSWdv
ciBEcnV6aGluaW4gd3JvdGU6Cj4+PiBPbiBYZW4sIGh2bWxvYWRlciBmaXJtd2FyZSBsZWF2ZXMg
YWRkcmVzcyBkZWNvZGluZyBlbmFibGVkIGZvcgo+Pj4gZW51bWVyYXRlZCBQQ0kgZGV2aWNlIGJl
Zm9yZSBqdW1waW5nIGludG8gT1ZNRi4gT1ZNRiBzZWVtcyB0bwo+Pj4gZXhwZWN0IGl0IHRvIGJl
IGRpc2FibGVkIGFuZCB0cmllcyB0byBzaXplIFBDSSBCQVJzIGluIHNldmVyYWwgcGxhY2VzCj4+
PiB3aXRob3V0IGRpc2FibGluZyBpdCB3aGljaCBjYXVzZXMgQkFSNjQsIGZvciBleGFtcGxlLCBi
ZWluZwo+Pj4gaW5jb3JyZWN0bHkgcGxhY2VkIGJ5IFFFTVUuCj4+Pgo+Pj4gRml4IGl0IGJ5IGRp
c2FibGluZyBQQ0kgYWRkcmVzcyBkZWNvZGluZyBleHBsaWNpdGx5IGJlZm9yZSB0aGUKPj4+IGZp
cnN0IGF0dGVtcHQgdG8gc2l6ZSBCQVJzIG9uIFhlbi4KPj4KPj4gVGhpcyBpcyBhbiBIVk1Mb2Fk
ZXIgYnVnLCBzdXJlbHk/Cj4gCj4gSSdsbCB0cnkgdG8gdHVybiBpdCBvZmYgaW4gSFZNTG9hZGVy
IGJ1dCBJJ20gbm90IHN1cmUgb3RoZXIgQklPU2VzIHdvdWxkCj4gbGlrZSBpdC4gQWx0aG91Z2gg
dGhleSBzaG91bGQgbm90IG1ha2UgYW55IGFzc3VtcHRpb25zIG9uIHdoZXRoZXIgbWVtb3J5Cj4g
ZGVjb2RpbmcgaXMgZW5hYmxlZCBvciBub3QgKHNvIGFzIE9WTUYgLSBoZW5jZSB0aGlzIHBhdGNo
KSBpdCdzIHN0aWxsCj4gcmlza3kgZnJvbSBteSBwb2ludCBvZiB2aWV3LgoKSGF2aW5nIHRlc3Rl
ZCBST01CSU9TIGFuZCBTZWFCSU9TIC0gbm9uZSBvZiB0aGVtIHdvcmtlZCB3aXRob3V0Cmh2bWxv
YWRlciBlbmFibGluZyBkZWNvZGluZy4gV2hpbGUgaXQgc2VlbXMgd3JvbmcgLSB0aGV5IG9idmlv
dXNseQpwbGFndWVkIGJ5IHRoZSBzYW1lIGFzc3VtcHRpb24gb24gc3lzdGVtIHN0YXRlIGFzIE9W
TUYuIFRoaXMgcGF0Y2gKYWRkcmVzc2VzIHRoZSBpc3N1ZSBpbiBPVk1GIGFuZCBJIHRoaW5rIHRo
YXQncyBjb3JyZWN0LiBBZGRyZXNzaW5nIHRoZQppc3N1ZSBpbiBvdGhlciBCSU9TZXMgbWlnaHQg
YmUgY29uc2lkZXJlZCBhbiBpbXByb3ZlbWVudCBmb3IgdGhlIGZ1dHVyZS4KCklnb3IKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
