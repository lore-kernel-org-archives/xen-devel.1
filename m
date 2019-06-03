Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F247C28CC6
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 09:38:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8D422CD6
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 09:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8D422CD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjPp-0002mu-VL; Mon, 03 Jun 2019 09:38:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXjPo-0002mp-7V
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 09:38:04 +0000
X-Inumbo-ID: 4817bed7-85e3-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4817bed7-85e3-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 09:38:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54296374;
 Mon,  3 Jun 2019 02:38:02 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8142C3F690;
 Mon,  3 Jun 2019 02:38:00 -0700 (PDT)
To: chenbaodong <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <d7e6554e6990789d1b619b6d489f52b7@sslemail.net>
 <33f34cf9-2b67-baa9-8b3c-98fa08e70ddd@arm.com>
 <676cd57f-99b6-22a5-c008-cf707448f5ba@mxnavi.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <10daba8f-d14a-f1f4-a0cd-d18349263ace@arm.com>
Date: Mon, 3 Jun 2019 10:37:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <676cd57f-99b6-22a5-c008-cf707448f5ba@mxnavi.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: cpu: change 'cpu_hotplug_[begin|done]'
 to inline function
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
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603093759.X1i1t_5EFIUGAtKZwPVhJ2B8sKfD27bsjiLGP8e91bA@z>

SGksCgpPbiAwMy8wNi8yMDE5IDAyOjUyLCBjaGVuYmFvZG9uZyB3cm90ZToKPiAKPiBPbiA1LzMx
LzE5IDE4OjU1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiA1LzMxLzE5IDM6
NDYgQU0sIEJhb2RvbmcgQ2hlbiB3cm90ZToKPj4+IFNpZ25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hl
biA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4KPj4+IC0tLQo+Pj4gwqAgeGVuL2NvbW1vbi9jcHUu
Y8KgwqDCoMKgwqAgfCAxMCAtLS0tLS0tLS0tCj4+PiDCoCB4ZW4vaW5jbHVkZS94ZW4vY3B1Lmgg
fMKgIDQgKystLQo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NwdS5jIGIveGVuL2Nv
bW1vbi9jcHUuYwo+Pj4gaW5kZXggZjM4OGQ4OS4uYTUyNmI1NSAxMDA2NDQKPj4+IC0tLSBhL3hl
bi9jb21tb24vY3B1LmMKPj4+ICsrKyBiL3hlbi9jb21tb24vY3B1LmMKPj4+IEBAIC01MSwxNiAr
NTEsNiBAQCB2b2lkIHB1dF9jcHVfbWFwcyh2b2lkKQo+Pj4gwqDCoMKgwqDCoCBzcGluX3VubG9j
a19yZWN1cnNpdmUoJmNwdV9hZGRfcmVtb3ZlX2xvY2spOwo+Pj4gwqAgfQo+Pj4gwqAgLWJvb2xf
dCBjcHVfaG90cGx1Z19iZWdpbih2b2lkKQo+Pj4gLXsKPj4+IC3CoMKgwqAgcmV0dXJuIGdldF9j
cHVfbWFwcygpOwo+Pj4gLX0KPj4+IC0KPj4+IC12b2lkIGNwdV9ob3RwbHVnX2RvbmUodm9pZCkK
Pj4+IC17Cj4+PiAtwqDCoMKgIHB1dF9jcHVfbWFwcygpOwo+Pj4gLX0KPj4+IC0KPj4+IMKgIHN0
YXRpYyBOT1RJRklFUl9IRUFEKGNwdV9jaGFpbik7Cj4+PiDCoCDCoCB2b2lkIF9faW5pdCByZWdp
c3Rlcl9jcHVfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYikKPj4+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS94ZW4vY3B1LmggYi94ZW4vaW5jbHVkZS94ZW4vY3B1LmgKPj4+IGlu
ZGV4IDQ2MzhjNTAuLjcwYTJkZjQgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vY3B1
LmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9jcHUuaAo+Pj4gQEAgLTEwLDggKzEwLDggQEAg
Ym9vbF90IGdldF9jcHVfbWFwcyh2b2lkKTsKPj4+IMKgIHZvaWQgcHV0X2NwdV9tYXBzKHZvaWQp
Owo+Pj4gwqAgwqAgLyogU2FmZWx5IHBlcmZvcm0gQ1BVIGhvdHBsdWcgYW5kIHVwZGF0ZSBjcHVf
b25saW5lX21hcCwgZXRjLiAqLwo+Pj4gLWJvb2xfdCBjcHVfaG90cGx1Z19iZWdpbih2b2lkKTsK
Pj4+IC12b2lkIGNwdV9ob3RwbHVnX2RvbmUodm9pZCk7Cj4+PiArc3RhdGljIGlubGluZSBib29s
X3QgY3B1X2hvdHBsdWdfYmVnaW4odm9pZCkgeyByZXR1cm4gZ2V0X2NwdV9tYXBzKCk7IH0KPj4+
ICtzdGF0aWMgaW5saW5lIHZvaWQgY3B1X2hvdHBsdWdfZG9uZSh2b2lkKSB7IHB1dF9jcHVfbWFw
cygpOyB9Cj4+Cj4+IFRoZSBjb2Rpbmcgc3R5bGUgc2hvdWxkIGJlOgo+Pgo+PiBzdGF0aWMgaW5s
aW5lLi4uLgo+PiB7Cj4+IMKgwqDCoMKgwqAgLi4uCj4+IH0KPj4KPiBZZXMsIGNsYW5nLWZvcm1h
dCBhdXRvbWF0ZWQgZm9ybWF0IGNvZGUgZm9yIG1lLCB3aWxsIGJlIGZpeGVkLgoKSG1tbSwgY2xh
bmctZm9ybWF0IGRvZXMgbm90IGhhdmUgWGVuIGNvZGluZyBzdHlsZSBzdXBwb3J0IHlldC4gRG8g
eW91IGhhdmUgCnBhdGNoZXMgb24gdG9wIHRvIGhhbmRsZSBpdD8KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
