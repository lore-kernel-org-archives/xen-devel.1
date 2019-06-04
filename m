Return-Path: <SRS0=m2Ej=UD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F0EC282CE
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 09:21:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72F9224BB7
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 09:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72F9224BB7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY5d8-00087E-Er; Tue, 04 Jun 2019 09:21:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY5d6-000879-Qb
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 09:21:16 +0000
X-Inumbo-ID: 176a2a88-86aa-11e9-9dfe-d7017b7000fd
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 176a2a88-86aa-11e9-9dfe-d7017b7000fd;
 Tue, 04 Jun 2019 09:21:11 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 03:21:10 -0600
Message-Id: <5CF638040200007800234F11@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 03:21:08 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
 <abc6106c-0c38-d891-0cbb-5b4d79c8093a@citrix.com>
In-Reply-To: <abc6106c-0c38-d891-0cbb-5b4d79c8093a@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190604092108.6QUxOi3nscbIk8E2FVYTAOYr-R6VRZteKqZtqvCFdB4@z>

Pj4+IE9uIDA0LjA2LjE5IGF0IDExOjA0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDMvMDYvMjAxOSAxNDowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoaXMgcmV2
ZXJ0cyBjb21taXQgYjZiZDAyYjdhODc3ZjlmYWMyZGU2OWU2NGQ4MjQ1ZDU2ZjkyYWIyNS4gVGhl
IGNoYW5nZQo+PiB3YXMgcmVkdW5kYW50IHdpdGggYW1kX2lvbW11X2RldGVjdF9vbmVfYWNwaSgp
IGFscmVhZHkgY2FsbGluZwo+PiBwY2lfcm9fZGV2aWNlKCkuCj4gCj4gU2VlaW5nIGFzIGFtZF9p
b21tdV9kZXRlY3Rfb25lX2FjcGkoKSBoYXNuJ3QgY2hhbmdlZCBmb3IgbWFueSB5ZWFycywgYW5k
Cj4gYjZiZDAyYjcgd2FzIGEgZnVuY3Rpb25hbCBmaXggZm9yIGJvb3RpbmcgUFZIIG9uIEFNRCwg
SSBjYW4ndCBzZWUgd2hhdAo+IHdvdWxkIG1ha2UgdGhpcyB0cnVlIG5vdy4KCkknZCBsaWtlIHRv
IGNvdW50ZXIgdGhpczogSSBjYW4ndCBzZWUgd2h5IHRoYXQgY2hhbmdlIHdhcyBuZWVkZWQuCkNs
ZWFybHksIGlmIHRoaXMgd2FzIGluZGVlZCBuZWVkZWQgZm9yIFBWSCBEb20wIGJvb3QsIHRoZXJl
IHdhcwppbnN1ZmZpY2llbnQgcmVhc29uaW5nIGFzIHRvIHdoeSB0aGUgZXhpc3RpbmcgcGNpX3Jv
X2RldmljZSgpCmludm9jYXRpb24gd2FzIG5vdCBlbm91Z2guIEksIGZvciBvbmUsIHN1cmVseSBk
aWRuJ3QgZXZlbiByZWNhbGwKaXQgd2FzIHRoZXJlIHdoZW4gcmV2aWV3aW5nIHRoZSBwYXRjaCwg
b3IgZWxzZSBJIHdvdWxkIGhhdmUgYXNrZWQKZm9yIGEgbW9yZSBjb21wbGV0ZSBkZXNjcmlwdGlv
bi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
