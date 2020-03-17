Return-Path: <SRS0=G0Zv=5C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1476C10F29
	for <xen-devel@archiver.kernel.org>; Tue, 17 Mar 2020 14:22:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 997CA20663
	for <xen-devel@archiver.kernel.org>; Tue, 17 Mar 2020 14:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 997CA20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jED6a-0004zA-LI; Tue, 17 Mar 2020 14:22:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jED6Z-0004z5-JN
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 14:22:03 +0000
X-Inumbo-ID: abbdbad2-685a-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abbdbad2-685a-11ea-a6c1-bc764e2007e4;
 Tue, 17 Mar 2020 14:22:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97FE4AF6E;
 Tue, 17 Mar 2020 14:22:01 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200313130614.27265-1-jgross@suse.com>
 <20200313130614.27265-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1305ebb6-b185-8337-5fde-28479f555cd3@suse.com>
Date: Tue, 17 Mar 2020 15:22:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313130614.27265-3-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 2/4] xen: don't process rcu callbacks
 when holding a rcu_read_lock()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAyMCAxNDowNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBTb21lIGtleWhhbmRs
ZXJzIGFyZSBjYWxsaW5nIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpIHdoaWxlIGhvbGRpbmcK
PiBhIHJjdV9yZWFkX2xvY2soKS4gVGhpcyBpcyB3cm9uZywgYXMgcHJvY2Vzc19wZW5kaW5nX3Nv
ZnRpcnFzKCkgbWlnaHQKPiBhY3RpdmF0ZSByY3UgY2FsbHMgd2hpY2ggc2hvdWxkIG5vdCBoYXBw
ZW4gaW5zaWRlIGEgcmN1X3JlYWRfbG9jaygpLgo+IAo+IEZvciB0aGF0IHB1cnBvc2UgbW9kaWZ5
IHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpIHRvIG5vdCBhbGxvdyByY3UKPiBjYWxsYmFjayBw
cm9jZXNzaW5nIHdoZW4gYSByY3VfcmVhZF9sb2NrKCkgaXMgYmVpbmcgaGVsZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
