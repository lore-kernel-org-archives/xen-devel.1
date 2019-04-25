Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D4AC43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 17:06:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDFC20684
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 17:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBDFC20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJhpK-0001OO-N3; Thu, 25 Apr 2019 17:06:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JXZu=S3=citrix.com=prvs=011b70836=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hJhpJ-0001OJ-G6
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 17:06:25 +0000
X-Inumbo-ID: 7420f4ae-677c-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7420f4ae-677c-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 17:06:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84427812"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23745.59654.348027.803997@mariner.uk.xensource.com>
Date: Thu, 25 Apr 2019 18:06:14 +0100
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com-0>
References: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com-0>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [VOTE] tagging for operational messages sent to
 xen-devel@ (was Re: Xen 4.13 Development Update)
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Pu Wen <puwen@hygon.cn>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Luwei Kang <luwei.kang@intel.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425170614.87jUIUHB7tZqG3QgBodIySqS148X7QmHAlWZfakrZ10@z>

TGFycyBLdXJ0aCB3cml0ZXMgKCJbVk9URV0gdGFnZ2luZyBmb3Igb3BlcmF0aW9uYWwgbWVzc2Fn
ZXMgc2VudCB0byB4ZW4tZGV2ZWxAICh3YXMgUmU6IFtYZW4tZGV2ZWxdIFhlbiA0LjEzIERldmVs
b3BtZW50IFVwZGF0ZSkiKToKPiBBbHJpZ2h0LAo+IAo+IHRoZXJlIHdhcyBhIGxlbmd0aHkgZGlz
Y3Vzc2lvbiBvbiB0aGlzIHRvcGljIG9uIElSQyAtIGxvZyBhdHRhY2hlZC4gVGhlIGNvbnNlbnN1
cyBhcHBlYXJzIHRvIGJlIHRvIHVzZSBDYW5vbmljYWwgbWVzc2FnZXMgd2l0aCBhIENBUElUQUxJ
U0VEIHRhZy4gRS5nLiAiW1RBR10gWGVuIDQuMTMgRGV2ZWxvcG1lbnQgVXBkYXRlIi4KPiAKPiBU
aGUgb3B0aW9ucyB3aGljaCBzZWVtZWQgdG8gaGF2ZSBsZWFzdCBvYmplY3Rpb25zIGFyZQo+IDE6
IFtBTk5PVU5DRV0KCisyCgo+IDI6IFtPUEVSQVRJT05TXSAKCisxIChvbiB0aGUgYmFzaXMgdGhh
dCB3ZSBzaG91bGQgaGF2ZSAqc29tZXRoaW5nKiBhbmQgdGhpcyB3aWxsIGRvLAogICBub3QgYmVj
YXVzZSBJIGxpa2UgaXQpCgo+IDM6IFtQUk9DRVNTXQoKLTIKCj4gQW5kIHRoYXQgd2Ugc2hvdWxk
IHVzZSB0aGVzZSBmb3Igb3RoZXIgbWVzc2FnZXMvYW5ub3VuY2VtZW50cyByZWxhdGVkIHRvIHRo
ZSBvcGVyYXRpb24gb2YgWGVuIFByb2plY3QgRGV2ZWxvcG1lbnQuCgpJYW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
