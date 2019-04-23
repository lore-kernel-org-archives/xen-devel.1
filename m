Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C47FC10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:50:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7316320843
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7316320843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIs4J-0002Is-5X; Tue, 23 Apr 2019 09:50:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GOvG=SZ=citrix.com=prvs=0096ed56b=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hIs4H-0002Ik-Cb
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:50:25 +0000
X-Inumbo-ID: 3613f45a-65ad-11e9-8531-afd789f07f0e
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3613f45a-65ad-11e9-8531-afd789f07f0e;
 Tue, 23 Apr 2019 09:50:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,385,1549929600"; d="scan'208";a="89162917"
From: George Dunlap <George.Dunlap@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Thread-Topic: [PATCH 2/2] xen: sched: we never get into context_switch() with
 prev==next
Thread-Index: AQHU9400lr2/WwibokabK+s4dKGZWqZJY0sA
Date: Tue, 23 Apr 2019 09:50:21 +0000
Message-ID: <38C4FE16-299B-4726-9BC2-9AC99D6D1F59@citrix.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
In-Reply-To: <155577388740.25746.3780283868034526234.stgit@wayrath>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.8)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C3D0AC04F9955D45967DC0051FD9E7CE@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423095021.PLtmEEe5LeqcJoa_492IMgmgUgmeE9flc9ngwbee0pU@z>

DQoNCj4gT24gQXByIDIwLCAyMDE5LCBhdCA0OjI0IFBNLCBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dp
b2xpQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IEluIHNjaGVkdWxlKCksIGlmIHdlIHBpY2ssIGFz
IHRoZSBuZXh0IHZjcHUgdG8gcnVuIChuZXh0KSB0aGUgc2FtZSBvbmUNCj4gdGhhdCBpcyBydW5u
aW5nIGFscmVhZHkgKHByZXYpLCB3ZSBuZXZlciBnZXQgdG8gY2FsbCBjb250ZXh0X3N3aXRjaCgp
Lg0KPiANCj4gV2UgY2FuLCB0aGVyZWZvcmUsIGdldCByaWQgb2YgYWxsIHRoZSBgaWZgLXMgdGVz
dGluZyBwcmV2IGFuZCBuZXh0IGJlaW5nDQo+IGRpZmZlcmVudCwgdHJhZGluZyB0aGVtIHdpdGgg
YW4gQVNTRVJUKCkgKG9uIEFSTSwgdGhlIEFTU0VSVCgpIHdhcyBldmVuDQo+IGFscmVhZHkgdGhl
cmUhKQ0KDQpLZWVwaW5nIGluIG1pbmQgdGhhdCBBU1NFUlQoKSBpcyBtZXJlbHkgYSBkZWJ1Z2dp
bmcgYWlkOiBzdXBwb3NlIHRoYXQgdGVzdGluZyBkaWRu4oCZdCBkaXNjb3ZlciB0aGlzLCBhbmQg
YSBidWcgdGhhdCB2aW9sYXRlZCB0aGlzIGFzc3VtcHRpb24gc2xpcHBlZCBpbnRvIHByb2R1Y3Rp
b24uICBXb3VsZCB0aGUgcGF0Y2hlZCBjb2RlIERUUlQ/DQoNCkl0IHNvcnQgb2YgbG9va3MgbGlr
ZSB0aGUgcHJldi9uZXh0IGNoZWNraW5nIGlzIGFuIG9wdGltaXphdGlvbiwgYW5kIHRoYXQgZHVw
bGljYXRlIGNoZWNraW5nIHNob3VsZG7igJl0IGNhdXNlIGFueSBwcm9ibGVtcy4gIElzIHRoYXQg
dGhlIGNhc2U/DQoNCiAtR2VvcmdlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
