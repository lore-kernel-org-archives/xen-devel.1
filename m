Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F17C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:22:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D31F2064A
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D31F2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3c2-00069Y-53; Fri, 26 Apr 2019 16:22:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK3c1-00069P-0N
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:22:09 +0000
X-Inumbo-ID: 6f31b4c4-683f-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6f31b4c4-683f-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 16:22:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9C5280D;
 Fri, 26 Apr 2019 09:22:06 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 046063F557;
 Fri, 26 Apr 2019 09:22:04 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
 <f136a702e983d174613238619acb2f64bf914fdc.camel@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b0ab9ed7-135b-6240-a0e8-8200e478b6f8@arm.com>
Date: Fri, 26 Apr 2019 17:22:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f136a702e983d174613238619acb2f64bf914fdc.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426162203.FWFHe7yYPCZTn6qGPkq4eccQv-MbXQMdYC87Yu2WjFQ@z>

SGkgRGFyaW8sCgpPbiAyNi8wNC8yMDE5IDE2OjEzLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiBP
biBUdWUsIDIwMTktMDQtMjMgYXQgMTI6MTMgKzAzMDAsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+
IEhlbGxvIERhcmlvLAo+Pgo+PiBPbiAyMC4wNC4xOSAxODoyNCwgRGFyaW8gRmFnZ2lvbGkgd3Jv
dGU6Cj4+PiBJbiBzY2hlZHVsZSgpLCBpZiB3ZSBwaWNrLCBhcyB0aGUgbmV4dCB2Y3B1IHRvIHJ1
biAobmV4dCkgdGhlIHNhbWUKPj4+IG9uZQo+Pj4gdGhhdCBpcyBydW5uaW5nIGFscmVhZHkgKHBy
ZXYpLCB3ZSBuZXZlciBnZXQgdG8gY2FsbAo+Pj4gY29udGV4dF9zd2l0Y2goKS4KPj4KPj4gQW5k
IHdoYXQgYWJvdXQgYGlmICggcHJldiAhPSBjdXJyZW50IClgIGluCj4+IGFybS9kb21haW4uYzpz
Y2hlZHVsZV90YWlsKCkgPwo+Pgo+IFlvdSdyZSBzdWdnZXN0aW5nIHRoYXQncyByZWR1bmRhbnQg
dG9vLCBhcmVuJ3QgeW91Pwo+IAo+ICBGcm9tIGEgcXVpY2sgbG9vaywgaXQgc2VlbXMgdG8gbWUg
YXMgd2VsbCB0aGF0IGl0IHdvdWxkIGJlLiBJJ20gb2sKPiB0YWtpbmcgY2FyZSBvZiBpdCwgbm90
IHN1cmUgaWYgaW4gdGhpcyBwYXRjaCwgb3IgaW4gYW5vdGhlciBvbmUuCgpJIHRob3VnaHQgQW5k
cmV3IGFscmVhZHkgcXVldWVkIHRoaXMgcGF0Y2g/CgpBbnl3YXksIEkgdGhpbmsgeW91IGFyZSBy
aWdodC4gV2UgY2FuIGRyb3AgdGhlIGNoZWNrIGluIHNjaGVkdWxlX3RhaWwoKSBhcyB3ZWxsLgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
