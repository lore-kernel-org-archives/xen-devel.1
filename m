Return-Path: <SRS0=bi2U=XH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDC9C47404
	for <xen-devel@archiver.kernel.org>; Thu, 12 Sep 2019 11:46:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 563F620693
	for <xen-devel@archiver.kernel.org>; Thu, 12 Sep 2019 11:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 563F620693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8NYJ-0004DZ-TJ; Thu, 12 Sep 2019 11:46:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8NYI-0004DT-P8
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 11:46:18 +0000
X-Inumbo-ID: ee295bec-d552-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee295bec-d552-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 11:46:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 86D53B68A;
 Thu, 12 Sep 2019 11:46:16 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-22-jgross@suse.com>
 <18ec96a1-b3c3-adbf-4b0e-1fcb7185e046@suse.com>
 <13f2cf63-2b61-07fa-f43d-044c61601bca@suse.com>
 <5aeddfeb-e01f-2cef-59ff-d66bcc067d37@suse.com>
 <3fcb3db8-cda6-a90a-50c3-58f503057bcb@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e98a0253-4da5-a306-871b-b822cb925cc7@suse.com>
Date: Thu, 12 Sep 2019 13:46:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3fcb3db8-cda6-a90a-50c3-58f503057bcb@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 21/48] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxMzoxNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMi4wOS4xOSAx
MjowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEyLjA5LjIwMTkgMTE6MzQsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwOS4wOS4xOSAxNjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDkuMDguMjAxOSAxNjo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gQEAgLTE4
MjUsOCArMTgyNSw5IEBAIHN0YXRpYyBzdHJ1Y3QgdGFza19zbGljZQo+Pj4+PiAgICBjc2NoZWRf
c2NoZWR1bGUoCj4+Pj4+ICAgICAgICBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHNfdGlt
ZV90IG5vdywgYm9vbF90IHRhc2tsZXRfd29ya19zY2hlZHVsZWQpCj4+Pj4+ICAgIHsKPj4+Pj4g
LSAgICBjb25zdCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+Pj4+PiAtICAgIHN0cnVj
dCBsaXN0X2hlYWQgKiBjb25zdCBydW5xID0gUlVOUShjcHUpOwo+Pj4+PiArICAgIGNvbnN0IHVu
c2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4+Pj4+ICsgICAgY29uc3QgdW5z
aWduZWQgaW50IHNjaGVkX2NwdSA9IHNjaGVkX2dldF9yZXNvdXJjZV9jcHUoY3B1KTsKPj4+Pj4g
KyAgICBzdHJ1Y3QgbGlzdF9oZWFkICogY29uc3QgcnVucSA9IFJVTlEoc2NoZWRfY3B1KTsKPj4+
Pgo+Pj4+IEJ5IHJldGFpbmluZyBhIGxvY2FsIHZhcmlhYmxlIG5hbWVkICJjcHUiIHlvdSBtYWtl
IGl0IGNsb3NlIHRvCj4+Pj4gaW1wb3NzaWJsZSB0byBub3RpY2UsIGR1cmluZyBhIHJlLWJhc2Us
IGFuIGFkZGl0aW9uIHRvIHRoZQo+Pj4+IGZ1bmN0aW9uIHN0aWxsIHJlZmVyZW5jaW5nIGEgdmFy
aWFibGUgb2YgdGhpcyBuYW1lLiBTaW1pbGFybHkKPj4+PiByZXZpZXcgaXMgYmVpbmcgbWFkZSBo
YXJkZXIgYmVjYXVzZSBvbmUgbmVlZHMgdG8gZ28gaHVudCBhbGwKPj4+PiB0aGUgcmVtYWluaW5n
IHVzZXMgb2YgImNwdSIuIEZvciBleGFtcGxlIHRoZXJlIGEgdHJhY2UgZW50cnkKPj4+PiBiZWlu
ZyBnZW5lcmF0ZWQsIGFuZCBpdCdzIG5vdCBvYnZpb3VzIHRvIG1lIHdoZXRoZXIgdGhpcyB3b3Vs
ZG4ndAo+Pj4+IGJldHRlciBhbHNvIHVzZWQgc2NoZWRfY3B1Lgo+Pj4KPj4+IE9rYXl5LCBJJ2xs
IHJlbmFtZSAiY3B1IiB0byAibXlfY3B1Ii4KPj4KPj4gV2UndmUgZ290IGEgbnVtYmVyIG9mIGlu
c3RhbmNlcyBvZiAidGhpc19jcHUiIGluIHN1Y2ggY2FzZXMgYWxyZWFkeSwKPj4gYnV0IG5vIHNp
bmdsZSAibXlfY3B1Ii4gTWF5IEkgc3VnZ2VzdCB0byBzdGljayB0byB0aGlzIG5hbWluZyBoZXJl
Cj4+IGFzIHdlbGw/Cj4gCj4gSG1tLCBkb24ndCB5b3UgdGhpbmsgYWRkaW5nIGZ1cnRoZXIgb3Zl
cmxvYWRpbmcgb2YgInRoaXNfY3B1IiBpcyBhIGJhZAo+IGlkZWE/CgpOb3QgYXQgYWxsLCBuby4g
QSBmdW5jdGlvbi1saWtlIG1hY3JvIGFuZCBhIHZhcmlhYmxlIG9mIHRoZSBzYW1lCm5hbWUgd2ls
bCBoYXBwaWx5IGNvZXhpc3QuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
