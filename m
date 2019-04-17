Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76479C10F12
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 04:03:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D36420693
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 04:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D36420693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGbn9-0001Cp-Lq; Wed, 17 Apr 2019 04:03:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lkvo=ST=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1hGbn8-0001Ck-Op
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 04:03:22 +0000
X-Inumbo-ID: bd780586-60c5-11e9-92d7-bc764e045a96
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bd780586-60c5-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 04:03:21 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id DD9CB14E0EF3D;
 Tue, 16 Apr 2019 21:03:20 -0700 (PDT)
Date: Tue, 16 Apr 2019 21:03:20 -0700 (PDT)
Message-Id: <20190416.210320.978265746268686181.davem@davemloft.net>
To: gustavo@embeddedor.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190415211141.GA1732@embeddedor>
References: <20190415211141.GA1732@embeddedor>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 16 Apr 2019 21:03:21 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH net-next] xen-netfront: mark expected switch
 fall-through
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
Cc: jgross@suse.com, sstabellini@kernel.org, keescook@chromium.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogIkd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPg0KRGF0
ZTogTW9uLCAxNSBBcHIgMjAxOSAxNjoxMTo0MSAtMDUwMA0KDQo+IEluIHByZXBhcmF0aW9uIHRv
IGVuYWJsaW5nIC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIG1hcmsgc3dpdGNoDQo+IGNhc2VzIHdo
ZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLg0KPiANCj4gVGhpcyBwYXRjaCBm
aXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6DQo+IA0KPiBkcml2ZXJzL25ldC94ZW4tbmV0ZnJv
bnQuYzogSW4gZnVuY3Rpb24g4oCYbmV0YmFja19jaGFuZ2Vk4oCZOg0KPiBkcml2ZXJzL25ldC94
ZW4tbmV0ZnJvbnQuYzoyMDM4OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRo
cm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQ0KPiAgICBpZiAoZGV2LT5zdGF0ZSA9PSBY
ZW5idXNTdGF0ZUNsb3NlZCkNCj4gICAgICAgXg0KPiBkcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQu
YzoyMDQxOjI6IG5vdGU6IGhlcmUNCj4gICBjYXNlIFhlbmJ1c1N0YXRlQ2xvc2luZzoNCj4gICBe
fn5+DQo+IA0KPiBXYXJuaW5nIGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91
Z2g9Mw0KPiANCj4gTm90aWNlIHRoYXQsIGluIHRoaXMgcGFydGljdWxhciBjYXNlLCB0aGUgY29k
ZSBjb21tZW50IGlzIG1vZGlmaWVkDQo+IGluIGFjY29yZGFuY2Ugd2l0aCB3aGF0IEdDQyBpcyBl
eHBlY3RpbmcgdG8gZmluZC4NCj4gDQo+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2lu
ZyBlZmZvcnRzIHRvIGVuYWJsZQ0KPiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4N
Cg0KQXBwbGllZC4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
