Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F24C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:08:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C0A2075B
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjw1VPKi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C0A2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG9ln-0008JV-3k; Mon, 15 Apr 2019 22:08:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ip/=SR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hG9ll-0008JP-Un
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:08:05 +0000
X-Inumbo-ID: f104299c-5fca-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f104299c-5fca-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 22:08:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A512520880;
 Mon, 15 Apr 2019 22:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555366084;
 bh=7jPwHOhKrD/grJaMgRt1SHY7V3FYxxqr5XN2rLC2oxk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=mjw1VPKiPKN3ww3WV9hWFcIwuCf52F2/M6589uv1a5eqQDAbUtg2ca7MB9RIoP03u
 2LqHXNrZHzIewFbA5MxYnmg+pERTUAvmGM0c7HiX9BHpap4stG4IRKDGBU6OrngsAc
 rmSRznAdGmONLNOTszky7xLSvP2n8Czb0rYbiYNw=
Date: Mon, 15 Apr 2019 15:08:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190218113600.9540-8-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904151506470.29275@sstabellini-ThinkPad-X260>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-8-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-next 7/9] xen: Convert is_xen_heap_mfn
 to use typesafe MFN
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
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415220803.voIGtOT5k_UJW_M3g9EH8WuaCRK9s2tqkMbxGSOoWGQ@z>

T24gTW9uLCAxOCBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKPiBpbmRl
eCBiNTYwMThhYWNlLi5hOWM4MzUyYjk0IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vbW0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+IEBAIC0xMzgsMTYgKzEz
OCwxNiBAQCBleHRlcm4gdmFkZHJfdCB4ZW5oZWFwX3ZpcnRfc3RhcnQ7Cj4gICNlbmRpZgo+ICAK
PiAgI2lmZGVmIENPTkZJR19BUk1fMzIKPiAtI2RlZmluZSBpc194ZW5faGVhcF9wYWdlKHBhZ2Up
IGlzX3hlbl9oZWFwX21mbihtZm5feChwYWdlX3RvX21mbihwYWdlKSkpCj4gKyNkZWZpbmUgaXNf
eGVuX2hlYXBfcGFnZShwYWdlKSBpc194ZW5faGVhcF9tZm4ocGFnZV90b19tZm4ocGFnZSkpCj4g
ICNkZWZpbmUgaXNfeGVuX2hlYXBfbWZuKG1mbikgKHsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gLSAgICB1bnNpZ25lZCBsb25nIG1mbl8gPSAobWZuKTsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICB1bnNpZ25lZCBsb25nIG1mbl8gPSBtZm5feCht
Zm4pOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAobWZuXyA+PSBtZm5feCh4
ZW5oZWFwX21mbl9zdGFydCkgJiYgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgbWZu
XyA8IG1mbl94KHhlbmhlYXBfbWZuX2VuZCkpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gIH0pCj4gICNlbHNlCj4gICNkZWZpbmUgaXNfeGVuX2hlYXBfcGFnZShwYWdlKSAoKHBhZ2Up
LT5jb3VudF9pbmZvICYgUEdDX3hlbl9oZWFwKQo+ICAjZGVmaW5lIGlzX3hlbl9oZWFwX21mbiht
Zm4pIFwKPiAtICAgIChtZm5fdmFsaWQoX21mbihtZm4pKSAmJiBpc194ZW5faGVhcF9wYWdlKG1m
bl90b19wYWdlKF9tZm4obWZuKSkpKQo+ICsgICAgKG1mbl92YWxpZChtZm4pICYmIGlzX3hlbl9o
ZWFwX3BhZ2UobWZuX3RvX3BhZ2UobWZuKSkpCj4gICNlbmRpZgo+ICAKPiAgI2RlZmluZSBpc194
ZW5fZml4ZWRfbWZuKG1mbikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiBA
QCAtMjQ2LDcgKzI0Niw3IEBAIHN0YXRpYyBpbmxpbmUgcGFkZHJfdCBfX3ZpcnRfdG9fbWFkZHIo
dmFkZHJfdCB2YSkKPiAgI2lmZGVmIENPTkZJR19BUk1fMzIKPiAgc3RhdGljIGlubGluZSB2b2lk
ICptYWRkcl90b192aXJ0KHBhZGRyX3QgbWEpCj4gIHsKPiAtICAgIEFTU0VSVChpc194ZW5faGVh
cF9tZm4obWEgPj4gUEFHRV9TSElGVCkpOwo+ICsgICAgQVNTRVJUKGlzX3hlbl9oZWFwX21mbiht
YWRkcl90b19tZm4obWEpKSk7Cj4gICAgICBtYSAtPSBtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5f
c3RhcnQpOwo+ICAgICAgcmV0dXJuICh2b2lkICopKHVuc2lnbmVkIGxvbmcpIG1hICsgWEVOSEVB
UF9WSVJUX1NUQVJUOwo+ICB9CgpGb3IgdGhlIEFSTSBwYXJ0czoKCkFja2VkLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
