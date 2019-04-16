Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5276C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 20:48:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761602075B
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 20:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcxjzW0r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 761602075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGV0N-0001Fd-QN; Tue, 16 Apr 2019 20:48:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGV0M-0001FY-9l
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 20:48:34 +0000
X-Inumbo-ID: ff59d02e-6088-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff59d02e-6088-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 20:48:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0679E2075B;
 Tue, 16 Apr 2019 20:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555447712;
 bh=OC38P2CIFVOTzfRoVDkh4l1uC23aMHtnGIiuuXEOF+g=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=UcxjzW0rZ1OmHtu/zrQRyKGJIXA5+o5/kUZboMK3sZ//s889leFlyIjpkpALXwRFe
 LQwl7RK8+4OHHoSjEFWFPRQyST6tAY15zYN7osF6+fnovg5t+hHZLRp2XL7uRHr6vI
 RN02E7JFZ3xqpkM0iq+oyh+9yj4b4NXYFGb/0Vts=
Date: Tue, 16 Apr 2019 13:48:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190402164238.1815-5-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904161348230.1370@sstabellini-ThinkPad-X260>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-5-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/4] xen/console: Simplify domU console
 handling in guest_console_write
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416204831.12dRDCTrxIZ0rv3-slITKdap_UfuTt33t9M_4vk8m6E@z>

T24gVHVlLCAyIEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gMiBwYXRocyBpbiB0aGUg
ZG9tVSBjb25zb2xlIGhhbmRsaW5nIGFyZSBub3cgdGhlIHNhbWUuIFNvIHRoZXkgY2FuIGJlCj4g
bWVyZ2VkIHRvIG1ha2UgdGhlIGNvZGUgc2ltcGxlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+ICB4ZW4vZHJpdmVycy9j
aGFyL2NvbnNvbGUuYyB8IDkgKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIv
Y29uc29sZS5jIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPiBpbmRleCBiMTE5YmY5ODBi
Li41NDgzZDY2NTEyIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4g
KysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPiBAQCAtNTg0LDEzICs1ODQsOCBAQCBz
dGF0aWMgbG9uZyBndWVzdF9jb25zb2xlX3dyaXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY2hh
cikgYnVmZmVyLCBpbnQgY291bnQpCj4gICAgICAgICAgICAgICprb3V0ID0gJ1wwJzsKPiAgICAg
ICAgICAgICAgc3Bpbl9sb2NrKCZjZC0+cGJ1Zl9sb2NrKTsKPiAgICAgICAgICAgICAga2NvdW50
ID0ga2luIC0ga2J1ZjsKPiAtICAgICAgICAgICAgaWYgKCBjID09ICdcbicgKQo+IC0gICAgICAg
ICAgICB7Cj4gLSAgICAgICAgICAgICAgICBjZC0+cGJ1ZltjZC0+cGJ1Zl9pZHhdID0gJ1wwJzsK
PiAtICAgICAgICAgICAgICAgIGd1ZXN0X3ByaW50ayhjZCwgWEVOTE9HX0dfREVCVUcgIiVzJXNc
biIsIGNkLT5wYnVmLCBrYnVmKTsKPiAtICAgICAgICAgICAgICAgIGNkLT5wYnVmX2lkeCA9IDA7
Cj4gLSAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgZWxzZSBpZiAoIGNkLT5wYnVmX2lkeCAr
IChrb3V0IC0ga2J1ZikgPCAoRE9NQUlOX1BCVUZfU0laRSAtIDEpICkKPiArICAgICAgICAgICAg
aWYgKCBjICE9ICdcbicgJiYKPiArICAgICAgICAgICAgICAgIChjZC0+cGJ1Zl9pZHggKyAoa291
dCAtIGtidWYpIDwgKERPTUFJTl9QQlVGX1NJWkUgLSAxKSkgKQo+ICAgICAgICAgICAgICB7Cj4g
ICAgICAgICAgICAgICAgICAvKiBidWZmZXIgdGhlIG91dHB1dCB1bnRpbCBhIG5ld2xpbmUgKi8K
PiAgICAgICAgICAgICAgICAgIG1lbWNweShjZC0+cGJ1ZiArIGNkLT5wYnVmX2lkeCwga2J1Ziwg
a291dCAtIGtidWYpOwo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
