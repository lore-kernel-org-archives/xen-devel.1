Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54531C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:09:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2562F2084F
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2562F2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJdBP-0007h5-Hc; Thu, 25 Apr 2019 12:08:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJdBN-0007h0-Li
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:08:53 +0000
X-Inumbo-ID: e36568ae-6752-11e9-a005-bb44baf6d069
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e36568ae-6752-11e9-a005-bb44baf6d069;
 Thu, 25 Apr 2019 12:08:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 06:08:50 -0600
Message-Id: <5CC1A34E0200007800229078@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 06:08:46 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Sander Eikelenboom" <linux@eikelenboom.it>
References: <5c7df313-2454-817f-41be-6ae5a09085f0@eikelenboom.it>
In-Reply-To: <5c7df313-2454-817f-41be-6ae5a09085f0@eikelenboom.it>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] xen-stable-4.12 branch,
 few commits short and hasn't got the RELEASE-4.12.0 tag.
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425120846.08ouA7HirL-VwcVLpWKYBfEQyHU1sh6vza_FaY0kxys@z>

Pj4+IE9uIDE1LjA0LjE5IGF0IDEwOjQ4LCA8bGludXhAZWlrZWxlbmJvb20uaXQ+IHdyb3RlOgo+
IEFsdGhvdWdoIHhlbi1zdGFibGUtNC4xMiBpcyByZWxlYXNlZCBub3cgZm9yIHNvbWUgdGltZSAo
dGhhbmtzIGZvciB0aGUgCj4gdGltZWx5IHJlbGVhc2UgISksIAo+IHRoZSByZWxlYXNlIHRhZyAg
IlJFTEVBU0UtNC4xMi4wIiBpcyBzdGlsbCBvbmx5IGF2YWlsYWJsZSBpbiB0aGUgCj4gInN0YWdp
bmctNC4xMiIgYnJhbmNoIG9mIHRoZSBYZW4gZ2l0IHRyZWUuCj4gVGhlICJzdGFibGUtNC4xMiIg
aXMgc3RpbGwgYSBmZXcgKHJlbGVhc2UtKSBjb21taXRzIHNob3J0LCBpdCBzZWVtcyBhIGJpdCAK
PiBhd2t3YXJkLgoKVGhlcmUncyBub3RoaW5nIHdlIGNhbiBkbyBhYm91dCBpdCBvdGhlciB0aGFu
IGhvcGUgZm9yIGEKc3VjY2Vzc2Z1bCBvc3N0ZXN0IGZsaWdodCwgd2hpY2ggd291bGQgdGhlbiBy
ZXN1bHQgaW4gYSBwdXNoLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
