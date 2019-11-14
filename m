Return-Path: <SRS0=jwRU=ZG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D083C432C3
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 16:42:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54193206DB
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 16:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54193206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVIC8-000562-LF; Thu, 14 Nov 2019 16:42:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVIC7-00055x-1g
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 16:42:07 +0000
X-Inumbo-ID: a0cd0542-06fd-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0cd0542-06fd-11ea-9631-bc764e2007e4;
 Thu, 14 Nov 2019 16:42:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD5EAAC93;
 Thu, 14 Nov 2019 16:41:37 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <8e8866de-33a8-68c0-3352-d6dfeec4a9b6@suse.com>
Date: Thu, 14 Nov 2019 17:41:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 0/2] AMD/IOMMU: re-work mode updating
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
Cc: Juergen Gross <jgross@suse.com>, Sander Eikelenboom <linux@eikelenboom.it>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dXBkYXRlX3BhZ2luZ19tb2RlKCkgaW4gdGhlIEFNRCBJT01NVSBjb2RlIGV4cGVjdHMgdG8gYmUg
aW52b2tlZCB3aXRoCnRoZSBQQ0kgZGV2aWNlcyBsb2NrIGhlbGQuIFRoZSBjaGVjayBvY2N1cnJp
bmcgb25seSB3aGVuIHRoZSBtb2RlCmFjdHVhbGx5IG5lZWRzIHVwZGF0aW5nLCB0aGUgdmlvbGF0
aW9uIG9mIHRoaXMgcnVsZSBieSB0aGUgbWFqb3JpdHkKb2YgY2FsbGVycyBkaWQgZ28gdW5ub3Rp
Y2VkIHVudGlsIHBlci1kb21haW4gSU9NTVUgc2V0dXAgd2FzIGNoYW5nZWQKdG8gZG8gYXdheSB3
aXRoIG9uLWRlbWFuZCBjcmVhdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcy4KClVuZm9ydHVuYXRl
bHkgdGhlIG9ubHkgaGFsZiB3YXkgcmVhc29uYWJsZSBmaXggdG8gdGhpcyB0aGF0IEkgY291bGQK
Y29tZSB1cCB3aXRoIHJlcXVpcmVzIG1vcmUgcmUtd29yayB0aGFuIHdvdWxkIHNlZW0gZGVzaXJh
YmxlIGF0IHRoaXMKdGltZSBvZiB0aGUgcmVsZWFzZSBwcm9jZXNzLCBidXQgYWRkcmVzc2luZyB0
aGUgaXNzdWUgc2VlbXMKdW5hdm9pZGFibGUgdG8gbWUgYXMgaXRzIG1hbmlmZXN0YXRpb24gaXMg
YSByZWdyZXNzaW9uIGZyb20gdGhlCklPTU1VIHBhZ2UgdGFibGUgc2V0dXAgcmUtd29yay4gVGhl
IGNoYW5nZSBhbHNvIGlzbid0IHdpdGhvdXQgcmlzawpvZiBmdXJ0aGVyIHJlZ3Jlc3Npb25zIC0g
aWYgaW4gcGF0Y2ggMiBJJ3ZlIG1pc3NlZCBhIGNvZGUgcGF0aCB0aGF0CndvdWxkIGFsc28gbmVl
ZCB0byBpbnZva2UgdGhlIG5ldyBob29rLCB0aGVuIHRoaXMgbWlnaHQgbWVhbiBub24tCndvcmtp
bmcgZ3Vlc3RzICh3aXRoIHBhc3NlZC10aHJvdWdoIGRldmljZXMgb24gQU1EIGhhcmR3YXJlKS4K
CjE6IGludHJvZHVjZSBHRk4gbm90aWZpY2F0aW9uIGZvciB0cmFuc2xhdGVkIGRvbWFpbnMKMjog
QU1EL0lPTU1VOiB1c2Ugbm90aWZ5X2RmbigpIGhvb2sgdG8gdXBkYXRlIHBhZ2luZyBtb2RlCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
