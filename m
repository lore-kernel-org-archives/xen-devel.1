Return-Path: <SRS0=9xPH=TC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7409C43219
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 15:04:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFD672075E
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 15:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFD672075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMDFX-0007G2-4M; Thu, 02 May 2019 15:03:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMDFW-0007Fx-LU
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 15:03:50 +0000
X-Inumbo-ID: 79e390a6-6ceb-11e9-a64c-5b4b80e47bea
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79e390a6-6ceb-11e9-a64c-5b4b80e47bea;
 Thu, 02 May 2019 15:03:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 09:03:42 -0600
Message-Id: <5CCB06C9020000780022B577@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 09:03:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
In-Reply-To: <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 02/10] xen: rename un/map_mmio_regions to
 un/map_regions
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190502150337.UxAvt1Ik1jx_1RYzCCCtvKAaK7S4SR4ePup7fAmYMPo@z>

Pj4+IE9uIDMwLjA0LjE5IGF0IDIzOjAyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gTm93IHRoYXQgbWFwX21taW9fcmVnaW9ucyB0YWtlcyBhIHAybXQgcGFyYW1ldGVyLCB0aGVy
ZSBpcyBubyBuZWVkIHRvCj4ga2VlcCAibW1pbyIgaW4gdGhlIG5hbWUuIFRoZSBwMm10IHBhcmFt
ZXRlciBkb2VzIGEgYmV0dGVyIGpvYiBhdAo+IGV4cHJlc3Npbmcgd2hhdCB0aGUgbWFwcGluZyBp
cyBhYm91dC4gTGV0J3Mgc2F2ZSB0aGUgZW52aXJvbm1lbnQgNQo+IGNoYXJhY3RlcnMgYXQgYSB0
aW1lLgoKQnV0IGFzIHBlciB0aGUgY292ZXIgbGV0dGVyIHRoZSBwdXJwb3NlIGlzIHRvIGFsbG93
IG1hcHBpbmcKaW9tZW0gKHdoaWNoIEkgdGFrZSBpcyBqdXN0IGFuIGFsdGVybmF0aXZlIHRlcm0g
Zm9yIE1NSU8pLgpFdmVuIGlmIHRoYXQncyBtaXNsZWFkaW5nLCB7LHVufW1hcF9yZWdpb25zKCkg
aXMgYSBsaXR0bGUgdG9vCnVuc3BlY2lmaWMgZm9yIG15IHRhc3RlLiBBdCB3aGljaCBwb2ludCBh
dCBsZWFzdCB0aGUKZW52aXJvbm1lbnQgc2F2aW5nIGFyZ3VtZW50IGdvZXMgYXdheSA7LSkKCkFz
IHRvIHRoZSBzZXJpZXMgYXMgYSB3aG9sZSwgSSBndWVzcyB5b3UgZmlyc3Qgd2FudCB0byBjb21l
CnRvIGFuIGFncmVlbWVudCB3aXRoIEp1bGllbi4gT25seSB0aGVuIGl0J2xsIG1ha2Ugc2Vuc2Ug
dG8KYWN0dWFsbHkgcmV2aWV3IHRoZSBjaGFuZ2VzLCBJIHRoaW5rLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
