Return-Path: <SRS0=YB+K=XS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CAEC4CEC4
	for <xen-devel@archiver.kernel.org>; Mon, 23 Sep 2019 15:44:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 843DF207FD
	for <xen-devel@archiver.kernel.org>; Mon, 23 Sep 2019 15:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 843DF207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCQW8-0005ot-KL; Mon, 23 Sep 2019 15:44:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCQW7-0005of-Eg
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 15:44:47 +0000
X-Inumbo-ID: 116b777e-de19-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 116b777e-de19-11e9-a337-bc764e2007e4;
 Mon, 23 Sep 2019 15:44:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0667AE12;
 Mon, 23 Sep 2019 15:44:45 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-32-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c2f3c3e-1ba9-55f5-3a67-5981edba6cc6@suse.com>
Date: Mon, 23 Sep 2019 17:44:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-32-jgross@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBjcHVwb29sX2RvbWFp
bl9jcHVtYXNrKCkgaXMgdXNlZCBieSBzY2hlZHVsaW5nIHRvIHNlbGVjdCBjcHVzIG9yIHRvCj4g
aXRlcmF0ZSBvdmVyIGNwdXMuIEluIG9yZGVyIHRvIHN1cHBvcnQgc2NoZWR1bGluZyB1bml0cyBz
cGFubmluZwo+IG11bHRpcGxlIGNwdXMgbGV0IGNwdXBvb2xfZG9tYWluX2NwdW1hc2soKSByZXR1
cm4gYSBjcHVtYXNrIHdpdGggb25seQo+IG9uZSBiaXQgc2V0IHBlciBzY2hlZHVsaW5nIHJlc291
cmNlLgoKSSBndWVzcyB0aGlzIHJlbmRlcnMgdGhlIG5hbWUgbWlzbGVhZGluZzogSG93IGFib3V0
IGEgcmVuYW1lIHRvCmNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKCksIGFsb25nIHRoZSBs
aW5lcyBvZiAibWFzdGVyX2NwdSI/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
