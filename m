Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FB2C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 11:25:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075B72084D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 11:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 075B72084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEXps-0000ou-Cw; Thu, 11 Apr 2019 11:25:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i8R2=SN=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEXpr-0000oj-EW
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 11:25:39 +0000
X-Inumbo-ID: 87c546f9-5c4c-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 87c546f9-5c4c-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 11:25:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2437F3084269;
 Thu, 11 Apr 2019 11:25:07 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-225.rdu2.redhat.com
 [10.10.120.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3942C1001E82;
 Thu, 11 Apr 2019 11:25:04 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-10-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <7dbe25f9-841c-6e98-f961-29e5f4505725@redhat.com>
Date: Thu, 11 Apr 2019 13:25:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-10-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 11 Apr 2019 11:25:07 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 09/31] OvmfPkg/XenOvmf: use
 a TimerLib instance that depends only on the CPU
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
Message-ID: <20190411112504.3ApyRFzU_KxnQymMgXKQLCI-KHjyHDXmyIs0G2pIYsI@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEFDUEkgVGltZXIgZG9l
cyBub3Qgd29yayBpbiBhIFBWSCBndWVzdCwgYnV0IGxvY2FsIEFQSUMgd29ya3Mgb24gYm90aAo+
IFBWSCBhbmQgSFZNLgo+IAo+IENvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0
aW9uIEFncmVlbWVudCAxLjEKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgT3ZtZlBrZy9YZW5Pdm1mLmRzYyB8IDEyICsr
KysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlbk92bWYuZHNjIGIvT3ZtZlBrZy9YZW5P
dm1mLmRzYwo+IGluZGV4IDdiOGExZmRmNmIuLmNjNTFiYWMzYmUgMTAwNjQ0Cj4gLS0tIGEvT3Zt
ZlBrZy9YZW5Pdm1mLmRzYwo+ICsrKyBiL092bWZQa2cvWGVuT3ZtZi5kc2MKPiBAQCAtMTA0LDcg
KzEwNCw3IEBAIFtTa3VJZHNdCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIFtMaWJyYXJ5
Q2xhc3Nlc10KPiAgICBQY2RMaWJ8TWRlUGtnL0xpYnJhcnkvQmFzZVBjZExpYk51bGwvQmFzZVBj
ZExpYk51bGwuaW5mCj4gLSAgVGltZXJMaWJ8T3ZtZlBrZy9MaWJyYXJ5L0FjcGlUaW1lckxpYi9C
YXNlQWNwaVRpbWVyTGliLmluZgo+ICsgIFRpbWVyTGlifE1kZVBrZy9MaWJyYXJ5L1NlY1BlaUR4
ZVRpbWVyTGliQ3B1L1NlY1BlaUR4ZVRpbWVyTGliQ3B1LmluZgo+ICAgIFByaW50TGlifE1kZVBr
Zy9MaWJyYXJ5L0Jhc2VQcmludExpYi9CYXNlUHJpbnRMaWIuaW5mCj4gICAgQmFzZU1lbW9yeUxp
YnxNZGVQa2cvTGlicmFyeS9CYXNlTWVtb3J5TGliUmVwU3RyL0Jhc2VNZW1vcnlMaWJSZXBTdHIu
aW5mCj4gICAgQmFzZUxpYnxNZGVQa2cvTGlicmFyeS9CYXNlTGliL0Jhc2VMaWIuaW5mCj4gQEAg
LTIwNSw3ICsyMDUsNyBAQCBbTGlicmFyeUNsYXNzZXMuY29tbW9uXQo+ICAgIEJhc2VDcnlwdExp
YnxDcnlwdG9Qa2cvTGlicmFyeS9CYXNlQ3J5cHRMaWIvQmFzZUNyeXB0TGliLmluZgo+ICAKPiAg
W0xpYnJhcnlDbGFzc2VzLmNvbW1vbi5TRUNdCj4gLSAgVGltZXJMaWJ8T3ZtZlBrZy9MaWJyYXJ5
L0FjcGlUaW1lckxpYi9CYXNlUm9tQWNwaVRpbWVyTGliLmluZgo+ICsgIFRpbWVyTGlifE1kZVBr
Zy9MaWJyYXJ5L1NlY1BlaUR4ZVRpbWVyTGliQ3B1L1NlY1BlaUR4ZVRpbWVyTGliQ3B1LmluZgo+
ICAgIFFlbXVGd0NmZ0xpYnxPdm1mUGtnL0xpYnJhcnkvUWVtdUZ3Q2ZnTGliL1FlbXVGd0NmZ1Nl
Y0xpYi5pbmYKPiAgIWlmZGVmICQoREVCVUdfT05fU0VSSUFMX1BPUlQpCj4gICAgRGVidWdMaWJ8
TWRlUGtnL0xpYnJhcnkvQmFzZURlYnVnTGliU2VyaWFsUG9ydC9CYXNlRGVidWdMaWJTZXJpYWxQ
b3J0LmluZgo+IEBAIC0yODQsNyArMjg0LDcgQEAgW0xpYnJhcnlDbGFzc2VzLmNvbW1vbi5EWEVf
Q09SRV0KPiAgCj4gIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24uRFhFX1JVTlRJTUVfRFJJVkVSXQo+
ICAgIFBjZExpYnxNZGVQa2cvTGlicmFyeS9EeGVQY2RMaWIvRHhlUGNkTGliLmluZgo+IC0gIFRp
bWVyTGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJMaWIvRHhlQWNwaVRpbWVyTGliLmluZgo+
ICsgIFRpbWVyTGlifE1kZVBrZy9MaWJyYXJ5L1NlY1BlaUR4ZVRpbWVyTGliQ3B1L1NlY1BlaUR4
ZVRpbWVyTGliQ3B1LmluZgo+ICAgIEhvYkxpYnxNZGVQa2cvTGlicmFyeS9EeGVIb2JMaWIvRHhl
SG9iTGliLmluZgo+ICAgIER4ZUNvcmVFbnRyeVBvaW50fE1kZVBrZy9MaWJyYXJ5L0R4ZUNvcmVF
bnRyeVBvaW50L0R4ZUNvcmVFbnRyeVBvaW50LmluZgo+ICAgIE1lbW9yeUFsbG9jYXRpb25MaWJ8
TWRlUGtnL0xpYnJhcnkvVWVmaU1lbW9yeUFsbG9jYXRpb25MaWIvVWVmaU1lbW9yeUFsbG9jYXRp
b25MaWIuaW5mCj4gQEAgLTMwMSw3ICszMDEsNyBAQCBbTGlicmFyeUNsYXNzZXMuY29tbW9uLkRY
RV9SVU5USU1FX0RSSVZFUl0KPiAgCj4gIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24uVUVGSV9EUklW
RVJdCj4gICAgUGNkTGlifE1kZVBrZy9MaWJyYXJ5L0R4ZVBjZExpYi9EeGVQY2RMaWIuaW5mCj4g
LSAgVGltZXJMaWJ8T3ZtZlBrZy9MaWJyYXJ5L0FjcGlUaW1lckxpYi9EeGVBY3BpVGltZXJMaWIu
aW5mCj4gKyAgVGltZXJMaWJ8TWRlUGtnL0xpYnJhcnkvU2VjUGVpRHhlVGltZXJMaWJDcHUvU2Vj
UGVpRHhlVGltZXJMaWJDcHUuaW5mCj4gICAgSG9iTGlifE1kZVBrZy9MaWJyYXJ5L0R4ZUhvYkxp
Yi9EeGVIb2JMaWIuaW5mCj4gICAgRHhlQ29yZUVudHJ5UG9pbnR8TWRlUGtnL0xpYnJhcnkvRHhl
Q29yZUVudHJ5UG9pbnQvRHhlQ29yZUVudHJ5UG9pbnQuaW5mCj4gICAgTWVtb3J5QWxsb2NhdGlv
bkxpYnxNZGVQa2cvTGlicmFyeS9VZWZpTWVtb3J5QWxsb2NhdGlvbkxpYi9VZWZpTWVtb3J5QWxs
b2NhdGlvbkxpYi5pbmYKPiBAQCAtMzE2LDcgKzMxNiw3IEBAIFtMaWJyYXJ5Q2xhc3Nlcy5jb21t
b24uVUVGSV9EUklWRVJdCj4gIAo+ICBbTGlicmFyeUNsYXNzZXMuY29tbW9uLkRYRV9EUklWRVJd
Cj4gICAgUGNkTGlifE1kZVBrZy9MaWJyYXJ5L0R4ZVBjZExpYi9EeGVQY2RMaWIuaW5mCj4gLSAg
VGltZXJMaWJ8T3ZtZlBrZy9MaWJyYXJ5L0FjcGlUaW1lckxpYi9EeGVBY3BpVGltZXJMaWIuaW5m
Cj4gKyAgVGltZXJMaWJ8TWRlUGtnL0xpYnJhcnkvU2VjUGVpRHhlVGltZXJMaWJDcHUvU2VjUGVp
RHhlVGltZXJMaWJDcHUuaW5mCj4gICAgSG9iTGlifE1kZVBrZy9MaWJyYXJ5L0R4ZUhvYkxpYi9E
eGVIb2JMaWIuaW5mCj4gICAgTWVtb3J5QWxsb2NhdGlvbkxpYnxNZGVQa2cvTGlicmFyeS9VZWZp
TWVtb3J5QWxsb2NhdGlvbkxpYi9VZWZpTWVtb3J5QWxsb2NhdGlvbkxpYi5pbmYKPiAgICBSZXBv
cnRTdGF0dXNDb2RlTGlifE1kZU1vZHVsZVBrZy9MaWJyYXJ5L0R4ZVJlcG9ydFN0YXR1c0NvZGVM
aWIvRHhlUmVwb3J0U3RhdHVzQ29kZUxpYi5pbmYKPiBAQCAtMzQ0LDcgKzM0NCw3IEBAIFtMaWJy
YXJ5Q2xhc3Nlcy5jb21tb24uRFhFX0RSSVZFUl0KPiAgCj4gIFtMaWJyYXJ5Q2xhc3Nlcy5jb21t
b24uVUVGSV9BUFBMSUNBVElPTl0KPiAgICBQY2RMaWJ8TWRlUGtnL0xpYnJhcnkvRHhlUGNkTGli
L0R4ZVBjZExpYi5pbmYKPiAtICBUaW1lckxpYnxPdm1mUGtnL0xpYnJhcnkvQWNwaVRpbWVyTGli
L0R4ZUFjcGlUaW1lckxpYi5pbmYKPiArICBUaW1lckxpYnxNZGVQa2cvTGlicmFyeS9TZWNQZWlE
eGVUaW1lckxpYkNwdS9TZWNQZWlEeGVUaW1lckxpYkNwdS5pbmYKPiAgICBIb2JMaWJ8TWRlUGtn
L0xpYnJhcnkvRHhlSG9iTGliL0R4ZUhvYkxpYi5pbmYKPiAgICBNZW1vcnlBbGxvY2F0aW9uTGli
fE1kZVBrZy9MaWJyYXJ5L1VlZmlNZW1vcnlBbGxvY2F0aW9uTGliL1VlZmlNZW1vcnlBbGxvY2F0
aW9uTGliLmluZgo+ICAgIFJlcG9ydFN0YXR1c0NvZGVMaWJ8TWRlTW9kdWxlUGtnL0xpYnJhcnkv
RHhlUmVwb3J0U3RhdHVzQ29kZUxpYi9EeGVSZXBvcnRTdGF0dXNDb2RlTGliLmluZgo+IAoKKDEp
IEkgc3VnZ2VzdCBzaW1wbGlmeWluZyB0aGlzIHBhdGNoIGJ5OgotIGRlbGV0aW5nIGFsbCBUaW1l
ckxpYiByZXNvbHV0aW9ucyBleGNlcHQgdGhlIG9uZSB1bmRlcgogIFtMaWJyYXJ5Q2xhc3Nlc10s
Ci0gdXBkYXRpbmcgdGhhdCBvbmUgKHJlbWFpbmluZykgcmVzb2x1dGlvbiB0byBTZWNQZWlEeGVU
aW1lckxpYkNwdS5pbmYuCgpXaXRoIHRoYXQ6CgpBY2tlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJz
ZWtAcmVkaGF0LmNvbT4KClRoYW5rcwpMYXN6bG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
