Return-Path: <SRS0=YB+K=XS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCA6C3A5A6
	for <xen-devel@archiver.kernel.org>; Mon, 23 Sep 2019 08:17:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FE3620835
	for <xen-devel@archiver.kernel.org>; Mon, 23 Sep 2019 08:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FE3620835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCJXF-00053r-BN; Mon, 23 Sep 2019 08:17:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCJXE-00053m-0y
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 08:17:28 +0000
X-Inumbo-ID: 93c2455c-ddda-11e9-95f6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93c2455c-ddda-11e9-95f6-12813bfff9fa;
 Mon, 23 Sep 2019 08:17:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CC4FDAAB2;
 Mon, 23 Sep 2019 08:17:25 +0000 (UTC)
To: Andreas Kinzler <hfp@posteo.de>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d406fbf-d057-a515-5364-6f0e2f6955c7@suse.com>
Date: Mon, 23 Sep 2019 10:17:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
Content-Language: en-US
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul.Durrant@citrix.com,
 Steven Haigh <netwiz@crc.id.au>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDguMjAxOSAyMjozNiwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+IE9uIDIwLjA4LjIw
MTkgMjA6MTIsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBYZW4gdmVyc2lvbiA0LjEwLjIuIGRv
bTAga2VybmVsIDQuMTMuMTYuIFRoZSBCSU9TIHZlcnNpb24gaXMgdW5jaGFuZ2VkCj4+PiBmcm9t
IDI3MDBYICh3b3JraW5nKSB0byAzNzAwWCAoY3Jhc2hpbmcpLgo+PiBTbyB5b3UndmUgZG9uZSBh
IFplbiB2MSA9PiBaZW4gdjIgQ1BVIHVwZ3JhZGUgYW5kIGFuIGV4aXN0aW5nIHN5c3RlbT8KPiAK
PiBXaXRoICJleGlzdGluZyBzeXN0ZW0iIHlvdSBtZWFuIHRoZSBXaW5kb3dzIGluc3RhbGxhdGlv
bj8gWWVzLCBidXQgaXQgaXMgCj4gbm90IHJlbGV2YW50LiBUaGUgc2FtZSBCU09EcyBoYXBwZW4g
aWYgeW91IGJvb3QgdGhlIEhWTSB3aXRoIGp1c3QgdGhlIAo+IGlzbyBpbnN0YWxsYXRpb24gbWVk
aXVtIGFuZCBubyBkaXNrcy4KPiAKPj4+IElzIGl0IGEga25vd24gcHJvYmxlbT8gRGlkIHNvbWVv
bmUgdGVzdCB0aGUgbmV3IEVQWUNzPwo+PiBUaGlzIGxvb2tzIGZhbWlsaWFyLCBhbmQgaXMgc3Rp
bGwgc29tZXdoZXJlIG9uIG15IFRPRE8gbGlzdC4KPiAKPiBEbyB5b3UgYWxyZWFkeSBrbm93IHRo
ZSByZWFzb24gb3IgaXMgdGhhdCBzdGlsbCB0byBpbnZlc3RpZ2F0ZT8KPiAKPj4gRG9lcyBib290
aW5nIHdpdGggYSBzaW5nbGUgdkNQVSB3b3JrPwo+IAo+IE51bWJlciBvZiB2Q1BVcyBtYWtlIG5v
IGRpZmZlcmVuY2UKCldlbGwsIGFjY29yZGluZyB0byBTdGV2ZW4gaXQgZG9lcywgd2l0aCB2aXJp
ZGlhbj0wLiBDb3VsZCB5b3UKcmUtY2hlY2sgdGhpcz8KCldoaWxlLCBhY2NvcmRpbmcgdG8gQU1E
J3MgcHJvY2Vzc29yIHNwZWNzIHBhZ2UsIHRoZSAzNzAwWCBpcyBqdXN0IGFuCjgtY29yZSBjaGlw
LCBJIHdvbmRlciB3aGV0aGVyCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxOS0wOS9tc2cwMTk1NC5odG1sCnN0aWxsIGFmZmVjdHMgdGhpcyBj
b25maWd1cmF0aW9uIGFzIHdlbGwuIENvdWxkIHlvdSBnaXZlIHRoaXMgYSB0cnkgaW4KYXQgbGVh
c3QgdGhlIHZpcmlkaWFuPTAgY2FzZT8gQXMgdG8gTGludXgsIGRpZCB5b3UgY2hlY2sgdGhhdCBQ
VkgKKG9yIEhWTSwgd2hpY2ggeW91IGRvbid0IG1lbnRpb24pIGd1ZXN0cyBhY3R1YWxseSBzdGFy
dCBhbGwgdGhlaXIgdkNQVS1zCnN1Y2Nlc3NmdWxseT8KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
