Return-Path: <SRS0=H5Oh=2I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D314DC43603
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 12:28:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2E3D21582
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 12:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2E3D21582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihYQh-000786-EK; Wed, 18 Dec 2019 12:27:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihYQg-000781-6X
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:27:50 +0000
X-Inumbo-ID: c7b718ba-2191-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7b718ba-2191-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 12:27:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C3EA8B164;
 Wed, 18 Dec 2019 12:27:38 +0000 (UTC)
To: SeongJae Park <sjpark@amazon.com>, axboe@kernel.dk,
 konrad.wilk@oracle.com, roger.pau@citrix.com
References: <20191218104232.9606-1-sjpark@amazon.com>
 <20191218104232.9606-3-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <af02058a-fa76-5eb5-5c2b-60555273bac2@suse.com>
Date: Wed, 18 Dec 2019 13:27:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191218104232.9606-3-sjpark@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v12 2/5] xenbus/backend: Protect xenbus
 callback with lock
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
Cc: linux-block@vger.kernel.org, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMTkgMTE6NDIsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gRnJvbTogU2VvbmdKYWUg
UGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiAKPiAncmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIGNh
biByYWNlIHdpdGggYSBkcml2ZXIgY29kZSBhcyB0aGlzIGNhbGxiYWNrCj4gd2lsbCBiZSBjYWxs
ZWQgZnJvbSBhbnkgbWVtb3J5IHByZXNzdXJlIGRldGVjdGVkIGNvbnRleHQuICBUbyBkZWFsIHdp
dGgKPiB0aGUgY2FzZSwgdGhpcyBjb21taXQgYWRkcyBhIHNwaW5sb2NrIGluIHRoZSAneGVuYnVz
X2RldmljZScuICBXaGVuZXZlcgo+ICdyZWNsYWltX21lbW9yeScgY2FsbGJhY2sgaXMgY2FsbGVk
LCB0aGUgbG9jayBvZiB0aGUgZGV2aWNlIHdoaWNoIHBhc3NlZAo+IHRvIHRoZSBjYWxsYmFjayBh
cyBpdHMgYXJndW1lbnQgaXMgbG9ja2VkLiAgVGh1cywgZHJpdmVycyByZWdpc3RlcmluZwo+IHRo
ZWlyICdyZWNsYWltX21lbW9yeScgY2FsbGJhY2sgc2hvdWxkIHByb3RlY3QgdGhlIGRhdGEgdGhh
dCBtaWdodCByYWNlCj4gd2l0aCB0aGUgY2FsbGJhY2sgd2l0aCB0aGUgbG9jayBieSB0aGVtc2Vs
dmVzLgoKQW55IHJlYXNvbiB5b3UgZG9uJ3QgdGFrZSB0aGUgbG9jayBhcm91bmQgdGhlIC5wcm9i
ZSgpIGFuZCAucmVtb3ZlKCkKY2FsbHMgb2YgdGhlIGJhY2tlbmQgKHhlbmJ1c19kZXZfcHJvYmUo
KSBhbmQgeGVuYnVzX2Rldl9yZW1vdmUoKSk/IFRoaXMKd291bGQgZWxpbWluYXRlIHRoZSBuZWVk
IHRvIGRvIHRoYXQgaW4gZWFjaCBiYWNrZW5kIGluc3RlYWQuCgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
