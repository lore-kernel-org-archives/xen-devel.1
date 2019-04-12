Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31094C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 10:07:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0815C2084D
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 10:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0815C2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEt5L-0007NB-R1; Fri, 12 Apr 2019 10:07:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCWt=SO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEt5K-0007N5-S8
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 10:07:02 +0000
X-Inumbo-ID: b711970b-5d0a-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b711970b-5d0a-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 10:07:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1004D81E03;
 Fri, 12 Apr 2019 10:06:31 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-65.rdu2.redhat.com
 [10.10.120.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5273F5D705;
 Fri, 12 Apr 2019 10:06:29 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: edk2-devel-groups-io <devel@edk2.groups.io>
References: <20190410125809.21985-1-lersek@redhat.com>
Message-ID: <823ac3df-2a0f-ab83-0a65-96ac1c87e0d9@redhat.com>
Date: Fri, 12 Apr 2019 12:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190410125809.21985-1-lersek@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 12 Apr 2019 10:06:31 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 0/4] OvmfPkg: replace MIT
 license blocks with SPDX IDs
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
Reply-To: devel@edk2.groups.io, lersek@redhat.com
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412100628.SgSbZz6Mi1iPCi3x_RZ5PW17t5L6o9iJoCpRideEtaM@z>

T24gMDQvMTAvMTkgMTQ6NTgsIExhc3psbyBFcnNlayB3cm90ZToKPiBSZXBvOiAgIGh0dHBzOi8v
Z2l0aHViLmNvbS9sZXJzZWsvZWRrMi5naXQKPiBCcmFuY2g6IG92bWZfc3BkeF9taXQKPiAKPiBG
b3IgPGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTM3Mz4s
IHdlIHJlcGxhY2VkCj4gb3Blbi1jb2RlZCBsaWNlbnNlIHRleHQgYmxvY2tzIHdpdGggIlNQRFgt
TGljZW5zZS1JZGVudGlmaWVyInMsIGFsbW9zdAo+IGFsbCBvdmVyIHRoZSBlZGsyIHRyZWUuCj4g
Cj4gVGhhdCBjaGFuZ2UgaG93ZXZlciB3YXMgdGllZCB0byBhIGxpY2Vuc2UgdXBkYXRlIC8gQ0xB
IHVwZGF0ZSB0b28KPiAocGxlYXNlIHNlZSBkZXRhaWxzIGluIFRpYW5vQ29yZSMxMzczLCByZWZl
cmVuY2VkIGFib3ZlKSwgYW5kIHRoZXJlZm9yZQo+IHRoZSBNSVQtY292ZXJlZCBmaWxlcyB1bmRl
ciBPdm1mUGtnIHdlcmUgb3V0IG9mIHNjb3BlLiBXZSBmaWxlZCBhCj4gcmVtaW5kZXIgYXQgPGh0
dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY1ND4sIGFuZAo+
IHRoaXMgc2VyaWVzIGludGVuZHMgdG8gYWRkcmVzcyB0aGF0IC0tIGkuZS4sIHRvIHJlcGxhY2Ug
dGhlIE1JVCBsaWNlbnNlCj4gYmxvY2tzIHdpdGggdGhlIGNvcnJlc3BvbmRpbmcgU1BEWCBMaWNl
bnNlIElEcy4KPiAKPiBDYzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+Cj4gQ2M6IEFyZCBCaWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgo+IENj
OiBKb3JkYW4gSnVzdGVuIDxqb3JkYW4ubC5qdXN0ZW5AaW50ZWwuY29tPgo+IENjOiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IENjOiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRo
QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IAo+IFRo
YW5rcywKPiBMYXN6bG8KPiAKPiBMYXN6bG8gRXJzZWsgKDQpOgo+ICAgT3ZtZlBrZy9MaWNlbnNl
LnR4dDogcmVtb3ZlIFhlblB2QmxrRHhlIGZyb20gdGhlIE1JVCBsaWNlbnNlZCBkaXIgbGlzdAo+
ICAgT3ZtZlBrZy9MaWNlbnNlLnR4dDogcmVmcmVzaCB0aGUgTUlUIGxpY2Vuc2UgdGV4dCBhbmQg
aW5jbHVkZSB0aGUgU1BEWAo+ICAgICBJRAo+ICAgT3ZtZlBrZy9JbmR1c3RyeVN0YW5kYXJkL1hl
bjogcmVwbGFjZSBNSVQgbGljZW5zZSB0ZXh0IHdpdGggU1BEWCBJRAo+ICAgT3ZtZlBrZy9YZW5C
dXNEeGU6IHJlcGxhY2UgTUlUIGxpY2Vuc2UgdGV4dCB3aXRoIFNQRFggSUQKPiAKPiAgT3ZtZlBr
Zy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL2FyY2gtYXJtL3hlbi5oICAgICAgICB8IDE4
ICstLS0tLS0tLS0tLS0tLS0tLQo+ICBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9Y
ZW4vYXJjaC14ODYveGVuLXg4Nl8zMi5oIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCj4gIE92bWZQ
a2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9hcmNoLXg4Ni94ZW4teDg2XzY0LmggfCAx
OCArLS0tLS0tLS0tLS0tLS0tLS0KPiAgT3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQv
WGVuL2FyY2gteDg2L3hlbi5oICAgICAgICB8IDE4ICstLS0tLS0tLS0tLS0tLS0tLQo+ICBPdm1m
UGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vZXZlbnRfY2hhbm5lbC5oICAgICAgIHwg
MTggKy0tLS0tLS0tLS0tLS0tLS0tCj4gIE92bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJk
L1hlbi9ncmFudF90YWJsZS5oICAgICAgICAgfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KPiAgT3Zt
ZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL2h2bS9odm1fb3AuaCAgICAgICAgICB8
IDE4ICstLS0tLS0tLS0tLS0tLS0tLQo+ICBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFy
ZC9YZW4vaHZtL3BhcmFtcy5oICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCj4gIE92
bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9pby9ibGtpZi5oICAgICAgICAgICAg
fCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KPiAgT3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRh
cmQvWGVuL2lvL2NvbnNvbGUuaCAgICAgICAgICB8IDE4ICstLS0tLS0tLS0tLS0tLS0tLQo+ICBP
dm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vaW8vcHJvdG9jb2xzLmggICAgICAg
IHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCj4gIE92bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5k
YXJkL1hlbi9pby9yaW5nLmggICAgICAgICAgICAgfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KPiAg
T3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL2lvL3hlbmJ1cy5oICAgICAgICAg
ICB8IDE4ICstLS0tLS0tLS0tLS0tLS0tLQo+ICBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFu
ZGFyZC9YZW4vaW8veHNfd2lyZS5oICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCj4g
IE92bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9tZW1vcnkuaCAgICAgICAgICAg
ICAgfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KPiAgT3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3Rh
bmRhcmQvWGVuL3hlbi1jb21wYXQuaCAgICAgICAgICB8IDE4ICstLS0tLS0tLS0tLS0tLS0tLQo+
ICBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4veGVuLmggICAgICAgICAgICAg
ICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCj4gIE92bWZQa2cvTGljZW5zZS50eHQgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKy0tLQo+ICBPdm1mUGtn
L1hlbkJ1c0R4ZS9YZW5CdXMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTgg
Ky0tLS0tLS0tLS0tLS0tLS0tCj4gIE92bWZQa2cvWGVuQnVzRHhlL1hlblN0b3JlLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KPiAgT3ZtZlBr
Zy9YZW5CdXNEeGUvWGVuU3RvcmUuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE4
ICstLS0tLS0tLS0tLS0tLS0tLQo+ICAyMSBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCsp
LCAzNDMgZGVsZXRpb25zKC0pCj4gCgoKVGhhbmtzIGV2ZXJ5b25lIGZvciB0aGUgcmV2aWV3czsg
SSBwdXNoZWQgdGhlIHNlcmllcyBhcyBjb21taXQgcmFuZ2UKZTBmZDllY2UyNmM5Li4zNDEzMWUx
YjVjMDkuCgpDaGVlcnMKTGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
