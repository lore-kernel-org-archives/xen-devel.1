Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71898C04AB6
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 08:31:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C1BB27D8F
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 08:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C1BB27D8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXiN7-0005WB-Dz; Mon, 03 Jun 2019 08:31:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXiN6-0005W6-4X
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 08:31:12 +0000
X-Inumbo-ID: f0a3ce66-85d9-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f0a3ce66-85d9-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 08:31:10 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 02:31:09 -0600
Message-Id: <5CF4DAC90200007800234711@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 02:31:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Baodong Chen" <chenbaodong@mxnavi.com>
References: <35519b1efa94833e1ba3597925b409ec@sslemail.net>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
 <216d2eb7-66ae-1128-318d-86a314a79d69@mxnavi.com>
In-Reply-To: <216d2eb7-66ae-1128-318d-86a314a79d69@mxnavi.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen: make tracebuffer configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603083105.1X428p_Hfpi7rXDSfWRp7kjXkcDlUny20IFEgrsYvW0@z>

Pj4+IE9uIDAzLjA2LjE5IGF0IDA1OjA3LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6
Cj4gT24gNS8zMS8xOSAxOToxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDMwLjA1LjE5
IGF0IDEyOjE3LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6Cj4+PiBEZWZhdWx0OiBl
bmFibGVkLgo+Pj4gQ2FuIGJlIGRpc2FibGVkIGZvciBzbWFsbGVyIGNvZGUgZm9vdHByaW50Lgo+
PiBCdXQgeW91J3JlIGF3YXJlIHRoYXQgd2UncmUsIGZvciBub3cgYXQgbGVhc3QsIHRyeWluZyB0
byBsaW1pdCB0aGUKPj4gbnVtYmVyIG9mIGluZGVwZW5kZW50bHkgc2VsZWN0YWJsZSBjb25maWcg
b3B0aW9ucz8gT25lcyBkZXBlbmRpbmcKPj4gb24gRVhQRVJUIGFyZSBzb3J0IG9mIGFuIGV4Y2Vw
dGlvbiBpbiBjZXJ0YWluIGNhc2VzLgo+IAo+IExpbWl0IHRoZSBudW1iZXIgb2YgaW5kZXBlbmRl
bnRseSBzZWxlY3RhYmxlIGNvbmZpZyBzb3VuZHMgZ29vZCB0byBtZS4KPiAKPiBEb2VzIHRoZSBm
b2xsb3dpbmcgbG9va3MgZ29vZD8KPiAKPiArY29uZmlnIEhBU19UUkFDRUJVRkZFUgo+ICsgICAg
ICAgYm9vbCAiRW5hYmxlL0Rpc2FibGUgdHJhY2VidWZmZXIiICBpZiBFWFBFUlQgPSAieSIKPiAr
ICAgICAgIC0tLWhlbHAtLS0KPiArICAgICAgICAgRW5hYmxlIG9yIGRpc2FibGUgdHJhY2VidWZm
ZXIgZnVuY3Rpb24uCj4gKyAgICAgICAgIFhlbiBpbnRlcm5hbCBydW5uaW5nIHN0YXR1cyh0cmFj
ZSBldmVudCkgd2lsbCBiZSBzYXZlZCB0byAKPiB0cmFjZSBtZW1vcnkKPiArICAgICAgICAgd2hl
biBlbmFibGVkLgo+ICsKClRoZSBFWFBFUlQgYWRkaXRpb24gbWFrZSBpbnRyb2R1Y2luZyB0aGlz
IGZpbmUgYnkgbWUuIEJ1dCBpdHMgbmFtZQppcyBzdGlsbCB3cm9uZywgYW5kIHRoZSBoZWxwIHRl
eHQgYWxzbyBuZWVkcyBmdXJ0aGVyIGltcHJvdmVtZW50IGltby4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
