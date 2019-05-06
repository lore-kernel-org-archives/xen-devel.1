Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46884C04AAA
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 08:28:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB352082F
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 08:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AB352082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNYyh-0008C8-Pz; Mon, 06 May 2019 08:28:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNYyg-0008C3-3H
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:28:02 +0000
X-Inumbo-ID: d76882b4-6fd8-11e9-bc6e-b3bbef4fd3a0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d76882b4-6fd8-11e9-bc6e-b3bbef4fd3a0;
 Mon, 06 May 2019 08:27:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 02:27:52 -0600
Message-Id: <5CCFF004020000780022C0D4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 02:27:48 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
In-Reply-To: <20190506065644.7415-2-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
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
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190506082748.IAgY2cSPZgSUR82GCuSHwfv-bPGPebpUw7xurO1lE6Q@z>

Pj4+IE9uIDA2LjA1LjE5IGF0IDA4OjU2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MjA3LDYgKzI1MCwxNDEgQEAgc3RhdGljIGlubGluZSB2b2lkIHNjaGVkX2ZyZWVfZG9tZGF0YShj
b25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpzLAo+ICAgICAgICAgIEFTU0VSVCghZGF0YSk7Cj4gIH0K
PiAgCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCAqc2NoZWRfYWxsb2NfcGRhdGEoY29uc3Qgc3RydWN0
IHNjaGVkdWxlciAqcywgaW50IGNwdSkKPiArewo+ICsgICAgaWYgKCBzLT5hbGxvY19wZGF0YSAp
Cj4gKyAgICAgICAgcmV0dXJuIHMtPmFsbG9jX3BkYXRhKHMsIGNwdSk7Cj4gKyAgICBlbHNlCj4g
KyAgICAgICAgcmV0dXJuIE5VTEw7Cj4gK30KCkluIGNhc2VzIGxpa2UgdGhpcyBvbmUgSSdkIGxp
a2UgdG8gYXNrIHRoYXQgZWl0aGVyID86IGJlIHVzZWQsIG9yIHRoZSBwb2ludGxlc3MKImVsc2Ui
IGJlIGRyb3BwZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
