Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D432FC10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 14:02:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACBE52083D
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 14:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACBE52083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH7ca-00060W-Ex; Thu, 18 Apr 2019 14:02:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH7cZ-00060L-BD
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 14:02:35 +0000
X-Inumbo-ID: 9aad480e-61e2-11e9-8565-335730fa5415
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9aad480e-61e2-11e9-8565-335730fa5415;
 Thu, 18 Apr 2019 14:02:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83894280"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23736.33638.713410.602994@mariner.uk.xensource.com>
Date: Thu, 18 Apr 2019 15:02:14 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
 <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] Xen project CI systems and committer workflow
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Committers <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418140214.FSwvPyv5eSU-6lQJ0aOUn3JXkDngiamMLFSbwmDV5OA@z>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogWGVuIHByb2plY3QgQ0kgc3lzdGVtcyBhbmQgY29t
bWl0dGVyIHdvcmtmbG93Iik6Cj4gV2hpbGUgZXZlcnl0aGluZyBwcmVzZW50ZWQgaGVyZSBpcyBm
aW5lIHRvIGRvIGFzIGEgbWF0dGVyIG9mIHBvbGljeSwgdGhlCj4gY29tbWl0dGVycyBzdGlsbCBu
ZWVkIHRvIHJldGFpbiB0aGUgYWJpbGl0eSB0byBhY3R1YWxseSBwdXNoIGRpcmVjdGx5IHRvCj4g
dGhlIHN0YWdpbmcgYnJhbmNoZXMgb24geGVuLmdpdAoKV2h5ID8KCkluIHBhcnRpY3VsYXIsIHRo
aXMgc2VlbXMgdG8gcHJlc3VwcG9zZSB0aGF0IHRoZXNlICJzdGFnaW5nIiBicmFuY2hlcwpjb250
aW51ZSB0byBleGlzdC4KCk9uZSBvZiBvdXIgc3RyYW5nZSBwcmFjdGljZXMgaXMgdGhhdCB3ZSBw
dXNoIHRoaW5ncyB0byBhIG5vbi1yZXdpbmRpbmcKYnJhbmNoIGJlZm9yZSB0aGV5IGhhdmUgYmVl
biB0ZXN0ZWQuICBOb3csIE9LLCB3ZSBoYXZlIGJlZW4gZG9pbmcgdGhhdApmb3Igb3ZlciBhIGRl
Y2FkZSAtIHNpbmNlIGJlZm9yZSBwZW9wbGUgcmVhbGx5IGludmVudGVkIHRoZSBtb2Rlcm4KY29u
Y2VwdCBvZiAiQ0kiIC0gYnV0IHRoYXQgZG9lc24ndCBtYWtlIGl0IHNlbnNpYmxlLgoKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
