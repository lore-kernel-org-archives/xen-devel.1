Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3B9C433EF
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 12:08:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42B862067B
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 12:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42B862067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7ISV-0004XX-QE; Mon, 09 Sep 2019 12:07:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7IST-0004XS-LO
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 12:07:49 +0000
X-Inumbo-ID: 7028a694-d2fa-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7028a694-d2fa-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 12:07:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EEB45AF78;
 Mon,  9 Sep 2019 12:07:46 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f7c28a1-c503-7df6-c92d-643635ed9950@suse.com>
Date: Mon, 9 Sep 2019 14:07:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/IRQ: make 'i' debug output more tabular
 again
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgdGhlIGFmZmluaXR5IHZhbHVlcyBhcmUgbm8gbG9uZ2VyIG9mIHVuaWZvcm0gd2lkdGgs
IG1vdmUgdGhlbQpmdXJ0aGVyIHRvIHRoZSByaWdodCBzdWNoIHRoYXQgYXMgbXVjaCBvZiB0aGUg
b3V0cHV0IGFzIHBvc3NpYmxlIGNvbWVzCm91dCBhbGlnbmVkIHdpdGggb25lIGFub3RoZXIuCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4v
YXJjaC94ODYvaXJxLmMKKysrIGIveGVuL2FyY2gveDg2L2lycS5jCkBAIC0yMzk3LDkgKzIzOTcs
OSBAQCBzdGF0aWMgdm9pZCBkdW1wX2lycXModW5zaWduZWQgY2hhciBrZXkpCiAKICAgICAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJmRlc2MtPmxvY2ssIGZsYWdzKTsKIAotICAgICAgICBwcmludGso
IiAgIElSUTolNGQgYWZmOnslKnBibH0veyUqcGJsfSB2ZWM6JTAyeCAlLTE1cyBzdGF0dXM9JTAz
eCAiLAotICAgICAgICAgICAgICAgaXJxLCBDUFVNQVNLX1BSKGRlc2MtPmFmZmluaXR5KSwgQ1BV
TUFTS19QUihkZXNjLT5hcmNoLmNwdV9tYXNrKSwKLSAgICAgICAgICAgICAgIGRlc2MtPmFyY2gu
dmVjdG9yLCBkZXNjLT5oYW5kbGVyLT50eXBlbmFtZSwgZGVzYy0+c3RhdHVzKTsKKyAgICAgICAg
cHJpbnRrKCIgICBJUlE6JTRkIHZlYzolMDJ4ICUtMTVzIHN0YXR1cz0lMDN4IGFmZjp7JSpwYmx9
L3slKnBibH0gIiwKKyAgICAgICAgICAgICAgIGlycSwgZGVzYy0+YXJjaC52ZWN0b3IsIGRlc2Mt
PmhhbmRsZXItPnR5cGVuYW1lLCBkZXNjLT5zdGF0dXMsCisgICAgICAgICAgICAgICBDUFVNQVNL
X1BSKGRlc2MtPmFmZmluaXR5KSwgQ1BVTUFTS19QUihkZXNjLT5hcmNoLmNwdV9tYXNrKSk7CiAK
ICAgICAgICAgaWYgKCBzc2lkICkKICAgICAgICAgICAgIHByaW50aygiWj0lLTI1cyAiLCBzc2lk
KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
