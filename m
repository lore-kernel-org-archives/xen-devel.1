Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BCDC10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:55:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CB6A20644
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CB6A20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJdje-0002am-1T; Thu, 25 Apr 2019 12:44:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJdjd-0002af-27
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:44:17 +0000
X-Inumbo-ID: d529a476-6757-11e9-a045-e395bcd98af8
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d529a476-6757-11e9-a045-e395bcd98af8;
 Thu, 25 Apr 2019 12:44:15 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 06:44:14 -0600
Message-Id: <5CC1AB9902000078002290CE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 06:44:09 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1556034593-3692-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1556034593-3692-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/timers: Fix memory leak with cpu
 unplug/plug (take 2)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425124409.0uXjYElmXr7HSRB4laITmpwwbkRLtxODVWyAgPTjFJ0@z>

Pj4+IE9uIDIzLjA0LjE5IGF0IDE3OjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gUHJldmlvdXMgYXR0ZW1wdHMgdG8gZml4IHRoaXMgbGVhayBmYWlsZWQgdG8gaWRlbnRp
ZnkgdGhlIHJvb3QgY2F1c2UsIGFuZAo+IHVsdGltYXRlbHkgZmFpbGVkLiAgVGhlIGNhdXNlIGlz
IHRoZSBDUFVfVVBfUFJFUEFSRSBjYXNlIChyZSlpbml0aWFsaXNpbmcKPiB0cy0+aGVhcCBiYWNr
IHRvIGR1bW15X2hlYXAsIHdoaWNoIGxlYWtzIHRoZSBwcmV2aW91cyBhbGxvY2F0aW9uLgo+IAo+
IFJlYXJyYW5nZSB0aGUgbG9naWMgdG8gb25seSBpbml0aWFsaXNlIHRzIG9uY2UuICBUaGlzIGFs
c28gYXZvaWRzIHRoZQo+IHJlZHVuZGFudCAoYnV0IGJlbmlnbiwgZHVlIHRvIHRzLT5pbmFjdGl2
ZSBhbHdheXMgYmVpbmcgZW1wdHkpIGluaXRpYWxpc2luZyBvZgo+IHRoZSBvdGhlciB0cyBmaWVs
ZHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
