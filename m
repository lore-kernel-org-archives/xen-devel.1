Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC157C10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:43:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3666206BA
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3666206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIrwz-0001Ct-Gw; Tue, 23 Apr 2019 09:42:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hJhn=SZ=citrix.com=prvs=009aac223=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hIrwx-0001Co-Pa
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:42:51 +0000
X-Inumbo-ID: 27c6f021-65ac-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27c6f021-65ac-11e9-92d7-bc764e045a96;
 Tue, 23 Apr 2019 09:42:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,385,1549929600"; d="scan'208";a="89162592"
Date: Tue, 23 Apr 2019 11:42:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190423094240.ksiq2qtow44tzbmf@Air-de-Roger>
References: <20190423092829.67915-1-roger.pau@citrix.com>
 <20190423092829.67915-2-roger.pau@citrix.com>
 <ec713432-338e-9d14-f626-759b0f3f94d7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec713432-338e-9d14-f626-759b0f3f94d7@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] xen/pvh: correctly setup the PV EFI
 interface for dom0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Darren Hart <dvhart@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMTE6MzY6MTBBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyMy8wNC8yMDE5IDExOjI4LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4veGVuLW9wcy5oIGIvaW5jbHVkZS94ZW4veGVuLW9wcy5o
Cj4gPiBpbmRleCA0OTY5ODE3MTI0YTguLjUxZWY5OGU5NmQ4OCAxMDA2NDQKPiA+IC0tLSBhL2lu
Y2x1ZGUveGVuL3hlbi1vcHMuaAo+ID4gKysrIGIvaW5jbHVkZS94ZW4veGVuLW9wcy5oCj4gPiBA
QCAtMjA5LDYgKzIwOSw3IEBAIGludCB4ZW5feGxhdGVfbWFwX2JhbGxvb25lZF9wYWdlcyh4ZW5f
cGZuX3QgKipwZm5zLCB2b2lkICoqdmFkZHIsCj4gPiAgCj4gPiAgYm9vbCB4ZW5fcnVubmluZ19v
bl92ZXJzaW9uX29yX2xhdGVyKHVuc2lnbmVkIGludCBtYWpvciwgdW5zaWduZWQgaW50IG1pbm9y
KTsKPiA+ICAKPiA+ICsjaWZkZWYgQ09ORklHX1hFTl9FRkkKPiA+ICBlZmlfc3RhdHVzX3QgeGVu
X2VmaV9nZXRfdGltZShlZmlfdGltZV90ICp0bSwgZWZpX3RpbWVfY2FwX3QgKnRjKTsKPiA+ICBl
Zmlfc3RhdHVzX3QgeGVuX2VmaV9zZXRfdGltZShlZmlfdGltZV90ICp0bSk7Cj4gPiAgZWZpX3N0
YXR1c190IHhlbl9lZmlfZ2V0X3dha2V1cF90aW1lKGVmaV9ib29sX3QgKmVuYWJsZWQsIGVmaV9i
b29sX3QgKnBlbmRpbmcsCj4gPiBAQCAtMjMzLDcgKzIzNCwxMiBAQCBlZmlfc3RhdHVzX3QgeGVu
X2VmaV9xdWVyeV9jYXBzdWxlX2NhcHMoZWZpX2NhcHN1bGVfaGVhZGVyX3QgKipjYXBzdWxlcywK
PiA+ICAJCQkJCWludCAqcmVzZXRfdHlwZSk7Cj4gPiAgdm9pZCB4ZW5fZWZpX3Jlc2V0X3N5c3Rl
bShpbnQgcmVzZXRfdHlwZSwgZWZpX3N0YXR1c190IHN0YXR1cywKPiA+ICAJCQkgIHVuc2lnbmVk
IGxvbmcgZGF0YV9zaXplLCBlZmlfY2hhcjE2X3QgKmRhdGEpOwo+ID4gLQo+ID4gK2V4dGVybiB2
b2lkIHhlbl9lZmlfaW5pdChzdHJ1Y3QgYm9vdF9wYXJhbXMgKmJvb3RfcGFyYW1zKTsKPiA+ICsj
ZWxzZQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX2luaXQgeGVuX2VmaV9pbml0KHN0cnVjdCBi
b290X3BhcmFtcyAqYm9vdF9wYXJhbXMpCj4gCj4gSXMgc3RydWN0IGJvb3RfcGFyYW1zIGRlZmlu
ZWQgb24gQVJNPwoKU2VlbXMgdG8gYmUgZGVmaW5lZCBmb3IgeDg2IGFuZCBzb21lIG1pcHMgb25s
eSwgc28gSSB3aWxsIGhhdmUgdG8gZmluZAphbm90aGVyIGhlYWRlci4gV2lsbCBwb3N0IHYyIHNo
b3J0bHkuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
