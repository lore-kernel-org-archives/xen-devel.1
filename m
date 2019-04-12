Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB48C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:10:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8090F20850
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8090F20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEsCa-0002kr-GH; Fri, 12 Apr 2019 09:10:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCWt=SO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEsCZ-0002ki-WA
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 09:10:28 +0000
X-Inumbo-ID: cfe46820-5d02-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cfe46820-5d02-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 09:10:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D953E8831E;
 Fri, 12 Apr 2019 09:09:56 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-65.rdu2.redhat.com
 [10.10.120.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BFA95C21E;
 Fri, 12 Apr 2019 09:09:55 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-18-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <274ac146-58a6-14c1-23c3-51ab14e6f37f@redhat.com>
Date: Fri, 12 Apr 2019 11:09:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-18-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 12 Apr 2019 09:09:56 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 17/31]
 OvmfPkg/XenPlatformPei: Reserve hvmloader's memory only when it as runned
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
Message-ID: <20190412090954.Z27Z3zRGY8YBI0h6O4X04LHOcE_jZFqgeEL4CTDK9q4@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IENvbnRyaWJ1dGVkLXVu
ZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVu
UGxhdGZvcm1QZWkvWGVuLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCj4gaW5kZXgg
ODk5MzNlYzNlOS4uMjJjN2EyMmM4OCAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3Jt
UGVpL1hlbi5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+IEBAIC0yNzUs
NyArMjc1LDkgQEAgSW5pdGlhbGl6ZVhlbiAoCj4gICAgLy8gUmVzZXJ2ZSBhd2F5IEhWTUxPQURF
UiByZXNlcnZlZCBtZW1vcnkgWzB4RkMwMDAwMDAsMHhGRDAwMDAwMCkuCj4gICAgLy8gVGhpcyBu
ZWVkcyB0byBtYXRjaCBIVk1MT0FERVIgUkVTRVJWRURfTUVNQkFTRS9SRVNFUlZFRF9NRU1TSVpF
Lgo+ICAgIC8vCj4gLSAgQWRkUmVzZXJ2ZWRNZW1vcnlCYXNlU2l6ZUhvYiAoMHhGQzAwMDAwMCwg
MHgxMDAwMDAwLCBGQUxTRSk7Cj4gKyAgaWYgKFhlbkh2bWxvYWRlckRldGVjdGVkICgpKSB7Cj4g
KyAgICBBZGRSZXNlcnZlZE1lbW9yeUJhc2VTaXplSG9iICgweEZDMDAwMDAwLCAweDEwMDAwMDAs
IEZBTFNFKTsKPiArICB9Cj4gIAo+ICAgIFBjZFN0YXR1cyA9IFBjZFNldEJvb2xTIChQY2RQY2lE
aXNhYmxlQnVzRW51bWVyYXRpb24sIFRSVUUpOwo+ICAgIEFTU0VSVF9SRVRVUk5fRVJST1IgKFBj
ZFN0YXR1cyk7Cj4gCgooMSkgcGxlYXNlIGZpeCB0aGUgc3ViamVjdDogcy9hcyBydW5uZWQvaGFz
IHJ1bi8KCigyKSBwbGVhc2Ugd3JpdGUgYSBub25lbXB0eSBjb21taXQgbWVzc2FnZSBib2R5LgoK
V2l0aCB0aGF0OgoKQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpU
aGFua3MKTGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
