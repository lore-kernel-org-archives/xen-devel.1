Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6D3C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:50:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7997206BA
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7997206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJxV0-0006kH-R1; Fri, 26 Apr 2019 09:50:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJxUz-0006kB-Rd
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 09:50:29 +0000
X-Inumbo-ID: b89f989a-6808-11e9-9762-2399618828e7
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b89f989a-6808-11e9-9762-2399618828e7;
 Fri, 26 Apr 2019 09:50:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 26 Apr 2019 03:50:27 -0600
Message-Id: <5CC2D45F020000780022960B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 26 Apr 2019 03:50:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Lars Kurth" <lars.kurth@citrix.com>
References: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com>
In-Reply-To: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>, committers@xenproject.org,
 Pu Wen <puwen@hygon.cn>, Luwei Kang <luwei.kang@intel.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426095023.NcOrnvcEjy2J5a35qlz12q2rRB3Mlp-OKAlNzDvfC5U@z>

Pj4+IE9uIDI1LjA0LjE5IGF0IDE4OjM2LCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToK
PiBBbHJpZ2h0LAo+IAo+IHRoZXJlIHdhcyBhIGxlbmd0aHkgZGlzY3Vzc2lvbiBvbiB0aGlzIHRv
cGljIG9uIElSQyAtIGxvZyBhdHRhY2hlZC4gVGhlIAo+IGNvbnNlbnN1cyBhcHBlYXJzIHRvIGJl
IHRvIHVzZSBDYW5vbmljYWwgbWVzc2FnZXMgd2l0aCBhIENBUElUQUxJU0VEIHRhZy4gCj4gRS5n
LiAiW1RBR10gWGVuIDQuMTMgRGV2ZWxvcG1lbnQgVXBkYXRlIi4KPiAKPiBUaGUgb3B0aW9ucyB3
aGljaCBzZWVtZWQgdG8gaGF2ZSBsZWFzdCBvYmplY3Rpb25zIGFyZQo+IDE6IFtBTk5PVU5DRV0K
CisxCgpJZiBtYWlscyB0byB4ZW4tYW5ub3VuY2UgcmVhbGx5IGdldCByZWZsZWN0ZWQgdG8geGVu
LWRldmVsIChJIGRpZG4ndAprbm93IHRoaXMsIGFuZCBoZW5jZSB3b3VsZCBoYXZlIHBvaW50bGVz
c2x5IHNlbnQgc3RhYmxlIHJlbGVhc2UKYW5ub3VuY2VtZW50cyB0byBib3RoIGxpc3RzKSwgdGhl
biBwcmVmZXJhYmx5IHdpdGggdGhlIHRhZwpnZXR0aW5nIGFkZGVkIGluIHRoZSBwcm9jZXNzIG9m
IHJlZmxlY3RpbmcuCgo+IDI6IFtPUEVSQVRJT05TXSAKCi0xCgo+IDM6IFtQUk9DRVNTXQoKMAoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
