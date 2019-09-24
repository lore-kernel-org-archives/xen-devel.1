Return-Path: <SRS0=VluW=XT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0D1C432C1
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 14:45:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB9C520640
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 14:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB9C520640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCm4E-00029v-N2; Tue, 24 Sep 2019 14:45:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCm4D-00029q-AV
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:45:25 +0000
X-Inumbo-ID: f0e97db8-ded9-11e9-961f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f0e97db8-ded9-11e9-961f-12813bfff9fa;
 Tue, 24 Sep 2019 14:45:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B853FAFFA;
 Tue, 24 Sep 2019 14:45:23 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-32-jgross@suse.com>
 <1c2f3c3e-1ba9-55f5-3a67-5981edba6cc6@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <13eaa84a-cc57-ff0a-ae55-04683300f574@suse.com>
Date: Tue, 24 Sep 2019 16:45:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1c2f3c3e-1ba9-55f5-3a67-5981edba6cc6@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 31/47] xen/sched: modify
 cpupool_domain_cpumask() to be an unit mask
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMTkgMTc6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IGNwdXBvb2xfZG9tYWluX2NwdW1hc2soKSBpcyB1
c2VkIGJ5IHNjaGVkdWxpbmcgdG8gc2VsZWN0IGNwdXMgb3IgdG8KPj4gaXRlcmF0ZSBvdmVyIGNw
dXMuIEluIG9yZGVyIHRvIHN1cHBvcnQgc2NoZWR1bGluZyB1bml0cyBzcGFubmluZwo+PiBtdWx0
aXBsZSBjcHVzIGxldCBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKCkgcmV0dXJuIGEgY3B1bWFzayB3
aXRoIG9ubHkKPj4gb25lIGJpdCBzZXQgcGVyIHNjaGVkdWxpbmcgcmVzb3VyY2UuCj4gCj4gSSBn
dWVzcyB0aGlzIHJlbmRlcnMgdGhlIG5hbWUgbWlzbGVhZGluZzogSG93IGFib3V0IGEgcmVuYW1l
IHRvCj4gY3B1cG9vbF9kb21haW5fbWFzdGVyX2NwdW1hc2soKSwgYWxvbmcgdGhlIGxpbmVzIG9m
ICJtYXN0ZXJfY3B1Ij8KCkZpbmUgd2l0aCBtZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
