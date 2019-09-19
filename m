Return-Path: <SRS0=QMmL=XO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82C5C49ED7
	for <xen-devel@archiver.kernel.org>; Thu, 19 Sep 2019 15:45:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C201521848
	for <xen-devel@archiver.kernel.org>; Thu, 19 Sep 2019 15:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C201521848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAycj-0000gd-MF; Thu, 19 Sep 2019 15:45:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAycj-0000gX-D6
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 15:45:37 +0000
X-Inumbo-ID: 85971c48-daf4-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85971c48-daf4-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 15:45:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 864A9BF4A;
 Thu, 19 Sep 2019 15:45:35 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-11-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f61b9f25-d9b7-53aa-dead-cccda1fff9ef@suse.com>
Date: Thu, 19 Sep 2019 17:45:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-11-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 10/47] xen/sched: add scheduler helpers
 hiding vcpu
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgdGhlIGZvbGxv
d2luZyBoZWxwZXJzIHVzaW5nIGEgc2NoZWRfdW5pdCBhcyBpbnB1dCBpbnN0ZWFkIG9mIGEKPiB2
Y3B1Ogo+IAo+IC0gaXNfaWRsZV91bml0KCkgc2ltaWxhciB0byBpc19pZGxlX3ZjcHUoKQo+IC0g
aXNfdW5pdF9vbmxpbmUoKSBzaW1pbGFyIHRvIGlzX3ZjcHVfb25saW5lKCkgKHJldHVybnMgdHJ1
ZSB3aGVuIGFueQo+ICAgb2YgaXRzIHZjcHVzIGlzIG9ubGluZSkKPiAtIHVuaXRfcnVubmFibGUo
KSBsaWtlIHZjcHVfcnVubmFibGUoKSAocmV0dXJucyB0cnVlIGlmIGFueSBvZiBpdHMKPiAgIHZj
cHVzIGlzIHJ1bm5hYmxlKQo+IC0gc2NoZWRfc2V0X3JlcygpIHRvIHNldCB0aGUgY3VycmVudCBz
Y2hlZHVsaW5nIHJlc291cmNlIG9mIGEgdW5pdAo+IC0gc2NoZWRfdW5pdF9jcHUoKSB0byBnZXQg
dGhlIGN1cnJlbnQgcHJvY2Vzc29yIG9mIGEgdW5pdCAocmV0dXJucwo+ICAgdGhlIG1hc3Rlcl9j
cHUgb2YgdGhlIHNjaGVkdWxpbmcgcmVzb3VyY2Ugb2YgYSB1bml0KQoKQW5kIGhlbmNlIHBlcmhh
cHMgYmV0dGVyIHNjaGVkX3VuaXRfbWFzdGVyKCkgb3Igc2NoZWRfdW5pdF9tYXN0ZXJfY3B1KCk/
Cgo+IC0gc2NoZWRfe3NldHxjbGVhcn1fcGF1c2VfZmxhZ3NbX2F0b21pY10oKSB0byBtb2RpZnkg
cGF1c2VfZmxhZ3Mgb2YgdGhlCj4gICBhc3NvY2lhdGVkIHZjcHUocykgKG1vZGlmaWVzIHRoZSBw
YXVzZV9mbGFncyBvZiBhbGwgdmNwdXMgb2YgdGhlCj4gICB1bml0KQoKSSBjb250aW51ZSB0byB0
aGluayB0aGF0IGl0IHdvdWxkIGhhdmUgYmVlbiBiZXR0ZXIgdG8gaGF2ZSBhbGwgb2YKdGhlc2Ug
aGF2ZSB0aGVpciBsb29wcyByaWdodCBmcm9tIHRoZSBiZWdpbm5pbmcuIEJ1dCBpdCdsbCBiZSB0
aGUKc2NoZWR1bGVyIG1haW50YWluZXJzIGFueXdheSB0byBhY2sgKG9yIG5vdCkgdGhlIHBhdGNo
IGluIGl0cwpjdXJyZW50IHNoYXBlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
