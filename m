Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7F7C04AA7
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 13:59:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9975D208CA
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 13:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9975D208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBUO-00060d-PE; Mon, 13 May 2019 13:59:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBUN-000607-EW
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:59:35 +0000
X-Inumbo-ID: 55d0c1c6-7587-11e9-8253-336bf949be19
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55d0c1c6-7587-11e9-8253-336bf949be19;
 Mon, 13 May 2019 13:59:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85388318"
Date: Mon, 13 May 2019 14:59:30 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20190513135930.GJ2798@zion.uk.xensource.com>
References: <20190408110943.8987-1-george.dunlap@citrix.com>
 <ee29edd9-a23d-eb00-d403-1e8040bf3174@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee29edd9-a23d-eb00-d403-1e8040bf3174@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v2] docs/xl: Clarify documentation for
 mem-max and mem-set
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190513135930.rmxfFCFknvoWXBEq8faYwH147JhhHLTRJ-mnFY6WMJE@z>

T24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDM6NTk6NDFQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiA0LzgvMTkgMTI6MDkgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gPiBtZW0t
c2V0IGlzIHRoZSBwcmltYXJ5IGNvbW1hbmQgdGhhdCB1c2VycyB3aWxsIG5lZWQgdG8gdXNlIGFu
ZAo+ID4gdW5kZXJzdGFuZC4gIE1vdmUgaXQgZmlyc3QsIGFuZCBjbGFyaWZ5IHRoZSB3b3JkaW5n
OyBhbHNvIHNwZWNpZnkgdGhhdAo+ID4geW91IGNhbid0IHNldCB0aGUgdGFyZ2V0IGhpZ2hlciB0
aGFuIG1heG1lbSBmcm9tIHRoZSBkb21haW4gY29uZmlnLgo+ID4gCj4gPiBtZW0tbWF4IGlzIGFj
dHVhbGx5IGEgcHJldHR5IHVzZWxlc3MgY29tbWFuZCBhdCB0aGUgbW9tZW50LiAgQ2xhcmlmeQo+
ID4gdGhhdCB1c2VycyBhcmUgbm90IGV4cGVjdGVkIHRvIHVzZSBpdDsgYW5kIGRvY3VtZW50IGFs
bCBvZiBpdHMgcXVpcmt5Cj4gPiBiZWhhdmlvci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IAo+IFdlaSAvIElhbjogUGlu
Zz8KPiAKPiBKdWVyZ2VuIHJlcGxpZWQgdG8gbXkgInJldmlldyBub3RlIiBjb21tZW50LCBub3Qg
dG8gYW55dGhpbmcgYWN0aW9uYWJsZQo+IGluIHRoZSBwYXRjaCAob3IgY29tbWl0IG1lc3NhZ2Up
IGl0c2VsZi4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKKEkgYWxy
ZWFkeSBzYWlkIHRoaXMgbG9va2VkIG9rYXkgdG8gbWUgaW4gdjEpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
