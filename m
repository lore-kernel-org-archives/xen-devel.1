Return-Path: <SRS0=bRyV=TX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C221C282DD
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 08:58:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB4992081C
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 08:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB4992081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTjXv-00055l-1S; Thu, 23 May 2019 08:57:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTjXt-00055f-OE
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 08:57:53 +0000
X-Inumbo-ID: d8879407-7d38-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d8879407-7d38-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 08:57:51 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 02:57:51 -0600
Message-Id: <5CE6608D02000078002319C3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 02:57:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Igor Druzhinin" <igor.druzhinin@citrix.com>
References: <1558548634-25154-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1558548634-25154-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] libacpi: report PCI slots as enabled only
 for hotpluggable devices
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190523085749.1qJyT2sczZeOkYJL5_nGtWv92cwAFIUMZErdNsLXbPM@z>

Pj4+IE9uIDIyLjA1LjE5IGF0IDIwOjEwLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRFNEVCBmb3IgcWVtdS14ZW4gbGFja3MgX1NUQSBtZXRob2Qgb2YgUENJIHNsb3Qgb2Jq
ZWN0LiBJZiBfU1RBIG1ldGhvZAo+IGRvZXNuJ3QgZXhpc3QgdGhlbiB0aGUgc2xvdCBpcyBhc3N1
bWVkIHRvIGJlIGFsd2F5cyBwcmVzZW50IGFuZCBhY3RpdmUKPiB3aGljaCBpbiBjb25qdW5jdGlv
biB3aXRoIF9FSjAgbWV0aG9kIG1ha2VzIGV2ZXJ5IGRldmljZSBlamVjdGFibGUgZm9yCj4gYW4g
T1MgZXZlbiBpZiBpdCdzIG5vdCB0aGUgY2FzZS4KPiAKPiBxZW11LWt2bSBpcyBhYmxlIHRvIGR5
bmFtaWNhbGx5IGFkZCBfRUowIG1ldGhvZCBvbmx5IHRvIHRob3NlIHNsb3RzCj4gdGhhdCBlaXRo
ZXIgaGF2ZSBob3RwbHVnZ2FibGUgZGV2aWNlcyBvciBmcmVlIGZvciBQQ0kgcGFzc3Rocm91Z2gu
Cj4gQXMgWGVuIGxhY2tzIHRoaXMgY2FwYWJpbGl0eSB3ZSBjYW5ub3QgdXNlIHRoZWlyIHdheS4K
PiAKPiBxZW11LXhlbi10cmFkaXRpb25hbCBEU0RUIGhhcyBfU1RBIG1ldGhvZCB3aGljaCBvbmx5
IHJlcG9ydHMgdGhhdAo+IHRoZSBzbG90IGlzIHByZXNlbnQgaWYgdGhlcmUgaXMgYSBQQ0kgZGV2
aWNlcyBob3RwbHVnZ2VkIHRoZXJlLgo+IFRoaXMgaXMgZG9uZSB0aHJvdWdoIHF1ZXJ5aW5nIG9m
IGl0cyBQQ0kgaG90cGx1ZyBjb250cm9sbGVyLgo+IHFlbXUteGVuIGhhcyBzaW1pbGFyIGNhcGFi
aWxpdHkgdGhhdCByZXBvcnRzIGlmIGRldmljZSBpcyAiaG90cGx1Z2dhYmxlCj4gb3IgYWJzZW50
IiB3aGljaCB3ZSBjYW4gdXNlIHRvIGFjaGlldmUgdGhlIHNhbWUgcmVzdWx0Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgoKUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
