Return-Path: <SRS0=JVlm=TD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C2DC43219
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 08:09:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 998F52075C
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 08:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 998F52075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMTFh-0004M4-GG; Fri, 03 May 2019 08:09:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMTFg-0004Lz-Mz
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 08:09:04 +0000
X-Inumbo-ID: b6fddb42-6d7a-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b6fddb42-6d7a-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 08:09:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 03 May 2019 02:09:03 -0600
Message-Id: <5CCBF720020000780022B848@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 03 May 2019 02:09:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190502225430.5565-1-tamas@tklengyel.com>
In-Reply-To: <20190502225430.5565-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3] x86/vm_event: add gdtr_base to the
 vm_event structure
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190503080904.TkQhdNQU4BIFjCO6BdHWcM5URVRFC5UREuHhEOLQIdE@z>

Pj4+IE9uIDAzLjA1LjE5IGF0IDAwOjU0LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
UmVjZWl2aW5nIHRoaXMgcmVnaXN0ZXIgaXMgdXNlZnVsIGZvciBpbnRyb3NwZWN0aW5nIDMyLWJp
dCBXaW5kb3dzIHdoZW4gdGhlCj4gZXZlbnQgYmVpbmcgdHJhcHBlZCBoYXBwZW5lZCB3aGlsZSBp
biByaW5nMy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVu
Z3llbC5jb20+Cj4gQ2M6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNv
bT4KPiBDYzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+IENjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4g
Q2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gdjI6IGFk
ZCBnZHRyIGxpbWl0Cj4gdjM6IHVzZSB1aW50MzJfdCB0byBmaXQgdGhlIDIwIGJpdHMKCkFzIHBl
ciBBbmRyZXcncyByZXNwb25zZSBJIHRoaW5rIHYyIGlzIGl0LgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
