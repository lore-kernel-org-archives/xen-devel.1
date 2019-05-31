Return-Path: <SRS0=e+jd=T7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC54C04AB6
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 17:25:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD9E23774
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 17:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BD9E23774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWlHL-0005eu-Se; Fri, 31 May 2019 17:25:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IB02=T7=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hWlHJ-0005ep-Se
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 17:25:17 +0000
X-Inumbo-ID: 0e43168e-83c9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 0e43168e-83c9-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 17:25:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F089BA78;
 Fri, 31 May 2019 10:25:15 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D63A63F59C;
 Fri, 31 May 2019 10:25:14 -0700 (PDT)
Date: Fri, 31 May 2019 18:25:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190531182511.7de8ff68@donnerap.cambridge.arm.com>
In-Reply-To: <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190531172511.JEUnLMt-VoZOPO7fQiCm0bOOzpCqMnxjl866mMrqTbo@z>

T24gVHVlLCAyOCBNYXkgMjAxOSAxODowNzoxOSArMDEwMApKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPiB3cm90ZToKClsgLi4uIF0KCj4gV2hpbGUgbG9va2luZyBhdCB0aGUgY29k
ZSwgSSBub3RpY2VkIHRoYXQgaW4gdGhlIG5ldyB2Z2ljIHZnaWNfZ2V0X2lycSgpIAo+IGxvb2tz
IHVuc2FmZSB0byBiZSBjYWxsZWQgd2l0aCBpbnRlcnJ1cHQgdW5tYXNrZWQuIFRoaXMgaXMgYmVj
YXVzZSBvbmUgCj4gb2YgdGhlIGNhbGxlZSAodmdpY19nZXRfbHBpKCkpIHRha2VzIGEgc3Bpbmxv
Y2sgYW5kIG5vdCBhIHNwaW5sb2NrX2lycS4gCj4gQW5kcmUsIHdoYXQgZG8geW91IHRoaW5rPwoK
SSB0aGluayB5b3UgYXJlIHJpZ2h0LiBJbiB2Z2ljX2luamVjdF9pcnEoKSwgcmlnaHQgYWZ0ZXIg
dGhlIGNhbGwgdG8gdmdpY19nZXRfaXJxKCksIHdlIHVzZSBzcGluX2xvY2tfaXJxc2F2ZSgpIG9u
IHRoZSBpcnFfbG9jaywgc28gdXNpbmcgdGhlIHNhbWUgaXJxc2F2ZSB2ZXJzaW9uIG9uIHRoZSBs
cGlfbGlzdF9sb2NrIHNlZW1zIG5lZWRlZC4gQnV0IHRoaXMgaXMgc29tZXdoYXQgdGhlb3JldGlj
YWwgYXQgdGhlIG1vbWVudCwgYXMgSSB0aGluayB3ZSB3aWxsIG5ldmVyIExQSXMgdGhyb3VnaCB0
aGUgbmV3IFZHSUMgYXQgdGhlIG1vbWVudC4KCkNoZWVycywKQW5kcmUuCgo+ID4gU2lnbmVkLW9m
Zi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPiA+IC0tLQo+ID4g
Cj4gPiBDaGFuZ2VzOgo+ID4gCj4gPiAgICAgIGluIHYyOiBEcm9wIGlycSBlbmFibGluZyBmb3Ig
bHBpIHByb2Nlc3NpbmcgYXMgd2VsbC4KPiA+IAo+ID4gCj4gPiAtLS0KPiA+ICAgeGVuL2FyY2gv
YXJtL2dpYy5jIHwgNCAtLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVuL2FyY2gvYXJtL2dp
Yy5jCj4gPiBpbmRleCA2Y2M3ZGVjLi4xMTM2NTVhIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gv
YXJtL2dpYy5jCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMKPiA+IEBAIC0zODYsMTcgKzM4
NiwxMyBAQCB2b2lkIGdpY19pbnRlcnJ1cHQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGlu
dCBpc19maXEpCj4gPiAgIAo+ID4gICAgICAgICAgIGlmICggbGlrZWx5KGlycSA+PSAxNiAmJiBp
cnEgPCAxMDIwKSApCj4gPiAgICAgICAgICAgewo+ID4gLSAgICAgICAgICAgIGxvY2FsX2lycV9l
bmFibGUoKTsKPiA+ICAgICAgICAgICAgICAgaXNiKCk7Cj4gPiAgICAgICAgICAgICAgIGRvX0lS
UShyZWdzLCBpcnEsIGlzX2ZpcSk7Cj4gPiAtICAgICAgICAgICAgbG9jYWxfaXJxX2Rpc2FibGUo
KTsKPiA+ICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgZWxzZSBpZiAoIGlzX2xwaShpcnEpICkK
PiA+ICAgICAgICAgICB7Cj4gPiAtICAgICAgICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwo+ID4g
ICAgICAgICAgICAgICBpc2IoKTsKPiA+ICAgICAgICAgICAgICAgZ2ljX2h3X29wcy0+ZG9fTFBJ
KGlycSk7Cj4gPiAtICAgICAgICAgICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsKPiA+ICAgICAgICAg
ICB9Cj4gPiAgICAgICAgICAgZWxzZSBpZiAoIHVubGlrZWx5KGlycSA8IDE2KSApCj4gPiAgICAg
ICAgICAgewo+ID4gICAKPiAKPiBDaGVlcnMsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
