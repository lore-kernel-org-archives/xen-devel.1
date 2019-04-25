Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4125EC10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:12:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19847206BA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19847206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJbM7-0006Z4-FW; Thu, 25 Apr 2019 10:11:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJbM5-0006Yz-OB
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 10:11:49 +0000
X-Inumbo-ID: 879db086-6742-11e9-83ad-a3600a55de9d
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 879db086-6742-11e9-83ad-a3600a55de9d;
 Thu, 25 Apr 2019 10:11:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 04:09:44 -0600
Message-Id: <5CC187640200007800228F4C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 04:09:40 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
 <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
 <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
 <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
 <726f5f58-bdae-8379-34c5-f31879fd1edd@arm.com>
In-Reply-To: <726f5f58-bdae-8379-34c5-f31879fd1edd@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425100940.VfLnjua1IW_TWk7hC1sbECbAZ7IeHk1fsCKUEFNCcC4@z>

Pj4+IE9uIDE2LjA0LjE5IGF0IDExOjU0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDQvOS8xOSAxMjo0MiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA5LjA0LjE5
IGF0IDEzOjI2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4gT24gMDMvMDQvMjAx
OSAxNDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gQWxzbyBwbGVhc2Ugbm90ZSB0aGUgcXVv
dGF0aW9uIHVzZWQgYnkgdGhlIG1lbnRpb25lZAo+Pj4+IGV4aXN0aW5nIGRvYyBjb21tZW50cywg
YXMgd2VsbCBhcyBhIGZldyBvdGhlciBmb3JtYWwgYXNwZWN0cwo+Pj4+IChsaWtlIHRoZW0gYWxz
byBtYWtpbmcgY2xlYXIgd2hhdCB0aGUgcmV0dXJuIHR5cGUgaXMpLiBJIHRoaW5rCj4+Pj4gdGhh
dCdzIGEgbW9kZWwgdXNlZCBlbHNld2hlcmUgYXMgd2VsbCwgc28gSSB0aGluayB5b3Ugc2hvdWxk
Cj4+Pj4gZm9sbG93IGl0IGhlcmUuCj4+Pgo+Pj4gSSBoYXZlbid0IHJlcGxpY2F0ZWQgdGhlIGAg
YmVjYXVzZSBJIGhhdmUgbm8gaWRlYSB3aGF0IHRoZXkgYXJlIHVzZWQgZm9yLiBJCj4+PiB3b3Vs
ZCBhcHByZWNpYXRlIGlmIHlvdSBwcm92aWRlIHBvaW50ZXIgaG93IHRvIHVzZSB0aGVtLgo+PiAK
Pj4gV2VsbCwgSSBjYW4gb25seSBwb2ludCB5b3UgYXQgdGhlIGhpc3Rvcnkgb2YgdGhpbmdzLCBl
LmcuCj4+IDI2MmUxMThhMzcgImRvY3MvaHRtbC86IEFubm90YXRpb25zIGZvciB0d28gaHlwZXJj
YWxscyIuCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcG9pbnRlci4gSG93ZXZlciwgd2UgZG9uJ3Qg
c2VlbSB0byB1c2UgdGhpcyBmb3JtYXR0aW5nIAo+IGV2ZXJ5d2hlcmUuIEZvciBpbnN0YW5jZSwg
dGhlIGZvcm1hdHRpbmcgdXNlZCBpbiBteSBwYXRjaCBzZWVtcyB0byBiZSAKPiBjb25zaXN0ZW50
IHdpdGggeGVuL2luY2x1ZGUvcHVibGljL3ZjcHUuaC4KPiAKPiBGdXJ0aGVybW9yZSwgdGhlIGRl
c2NyaXB0aW9uIG9mIHRoZSBoeXBlcmNhbGwgaXMgZG9uZSBvbiB0b3Agb2YgdGhlIAo+IGRlZmlu
aXRpb24gb2YgdGhlIGh5cGVyY2FsbCBudW1iZXIuIEJlZm9yZSBJIHJld29yayB0aGlzIHBhdGNo
LCBjb3VsZCB3ZSAKPiBhZ3JlZSBvbiB3aGF0IGZvcm1hdHRpbmcgd2Ugd2FudD8KCldlbGwsIEZB
T0QgKHNlZSBJYW4ncyBlYXJsaWVyIHJlcGx5KSB0aGUgc3R5bGUgdG8gYmUgdXNlZCBpcyBhcyBz
dWdnZXN0ZWQsCmFuZCBldmVudHVhbGx5IHZjcHUuaCBzaG91bGQgYmUgc3dpdGNoZWQgdG9vLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
