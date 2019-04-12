Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF898C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 12:03:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88E982082E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 12:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88E982082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEuu8-0000mS-1a; Fri, 12 Apr 2019 12:03:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEuu7-0000mK-DI
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 12:03:35 +0000
X-Inumbo-ID: ff38af9f-5d1a-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff38af9f-5d1a-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 12:03:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 12 Apr 2019 06:01:33 -0600
Message-Id: <5CB07E1D0200007800226E14@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 12 Apr 2019 06:01:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190412042930.2867-1-tamas@tklengyel.com>
 <20190412042930.2867-2-tamas@tklengyel.com>
In-Reply-To: <20190412042930.2867-2-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] RFC: x86/mm: conditionally check
 page_lock/page_unlock ownership
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412120133.dPcImWjD2zazp5IHcfwRFfGxqTJTD0H5LcWNMd1Ys3U@z>

Pj4+IE9uIDEyLjA0LjE5IGF0IDA2OjI5LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
UGF0Y2ggY2Y0YjMwZGNhMGEgIkFkZCBkZWJ1ZyBjb2RlIHRvIGRldGVjdCBpbGxlZ2FsIHBhZ2Vf
bG9jayBhbmQgcHV0X3BhZ2VfdHlwZQo+IG9yZGVyaW5nIiBhZGRlZCBleHRyYSBzYW5pdHkgY2hl
Y2tpbmcgdG8gcGFnZV9sb2NrL3BhZ2VfdW5sb2NrIGZvciBkZWJ1ZyBidWlsZHMKPiB3aXRoIHRo
ZSBhc3N1bXB0aW9uIHRoYXQgbm8gaHlwZXJ2aXNvciBwYXRoIGV2ZXIgbG9ja3MgdHdvIHBhZ2Vz
IGF0IG9uY2UuCj4gCj4gVGhpcyBhc3N1bXB0aW9uIGRvZXNuJ3QgaG9sZCBkdXJpbmcgbWVtb3J5
IHNoYXJpbmcuCgpBIGZ1bmRhbWVudGFsIHF1ZXN0aW9uIGlzIC0gZG9lc24ndCBtZW0tc2hhcmlu
ZyBhYnVzZSBwYWdlX2xvY2soKT8KSSd2ZSBuZXZlciB1bmRlcnN0b29kIHdoeSBpdCB1c2VzIGl0
LCBhbmQgYmFjayB3aGVuIGl0IHdhcyBpbnRyb2R1Y2VkCnRoZSBmdW5jdGlvbiBjbGVhcmx5IHdh
c24ndCBtZWFudCB0byBiZSB1c2VkIG91dHNpZGUgb2YgUFYgbWVtb3J5Cm1hbmFnZW1lbnQgY29k
ZS4KCk9uZSBtaW5pbWFsIHJlbWFyayBvbiB0aGUgcGF0Y2ggaXRzZWxmOiBQbGVhc2UgdXNlIHRy
dWUvZmFsc2UgaW5zdGVhZApvZiAxLzAgd2hlbiBwYXNzaW5nIGJvb2wgYXJndW1lbnRzLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
