Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8118C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:52:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B230F2073F
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B230F2073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG22P-00033Z-0d; Mon, 15 Apr 2019 13:52:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DCQv=SR=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hG22O-00033T-3k
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:52:44 +0000
X-Inumbo-ID: bd56b69a-5f85-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bd56b69a-5f85-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 13:52:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1A7C63086212;
 Mon, 15 Apr 2019 13:52:42 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-136.rdu2.redhat.com
 [10.10.121.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6E7219C77;
 Mon, 15 Apr 2019 13:52:39 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-27-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0fbcb171-d7da-09d1-bda5-4227b1c25e99@redhat.com>
Date: Mon, 15 Apr 2019 15:52:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-27-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 15 Apr 2019 13:52:42 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 26/31] OvmfPkg/XenOvmf:
 Override PcdFSBClock to Xen vLAPIC timer frequency
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415135238.Ds4e6rSKy4YYKEMP2XvpdV4xP1R7COylL36kN9yOiWw@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoYXQgdmFsdWUgaXMg
dXNlZCBieSBTZWNQZWlEeGVUaW1lckxpYkNwdSwgdGhlIFRpbWVyTGliIGltcGxlbWVudGF0aW9u
Lgo+IEl0IHdpbGwgYWxzbyBiZSB1c2VkIGJ5IFhlblRpbWVyRHhlLgoKKDEpIHBsZWFzZSBleHBh
bmQgInRoYXQgdmFsdWUiLgoKd2l0aCB0aGF0LAoKQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVy
c2VrQHJlZGhhdC5jb20+CgpUaGFua3MKTGFzemxvCgo+IAo+IENvbnRyaWJ1dGVkLXVuZGVyOiBU
aWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPiBTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoK
PiAgICAgbmV3IHBhdGNoIGluIHYyLgo+IAo+ICBPdm1mUGtnL1hlbk92bWYuZHNjIHwgMyArKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Pdm1m
UGtnL1hlbk92bWYuZHNjIGIvT3ZtZlBrZy9YZW5Pdm1mLmRzYwo+IGluZGV4IDk1MjliNDgzNGYu
LjU0NjAxYzY5N2YgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5Pdm1mLmRzYwo+ICsrKyBiL092
bWZQa2cvWGVuT3ZtZi5kc2MKPiBAQCAtNDUyLDYgKzQ1Miw5IEBAIFtQY2RzRml4ZWRBdEJ1aWxk
XQo+ICAgICMgUG9pbnQgdG8gdGhlIE1kZU1vZHVsZVBrZy9BcHBsaWNhdGlvbi9VaUFwcC9VaUFw
cC5pbmYKPiAgICBnRWZpTWRlTW9kdWxlUGtnVG9rZW5TcGFjZUd1aWQuUGNkQm9vdE1hbmFnZXJN
ZW51RmlsZXx7IDB4MjEsIDB4YWEsIDB4MmMsIDB4NDYsIDB4MTQsIDB4NzYsIDB4MDMsIDB4NDUs
IDB4ODMsIDB4NmUsIDB4OGEsIDB4YjYsIDB4ZjQsIDB4NjYsIDB4MjMsIDB4MzEgfQo+ICAKPiAr
ICAjIyBYZW4gdmxhcGljJ3MgZnJlcXVlbmNlIGlzIDEwMCBNSHoKPiArICBnRWZpTWRlUGtnVG9r
ZW5TcGFjZUd1aWQuUGNkRlNCQ2xvY2t8MTAwMDAwMDAwCj4gKwo+ICAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICAjCj4gICMgUGNkIER5bmFtaWMgU2VjdGlvbiAtIGxpc3Qgb2YgYWxsIEVESyBJ
SSBQQ0QgRW50cmllcyBkZWZpbmVkIGJ5IHRoaXMgUGxhdGZvcm0KPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
