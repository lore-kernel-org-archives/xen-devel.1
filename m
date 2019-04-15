Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911B1C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:33:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69AE120833
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69AE120833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG1jV-0000kT-Rg; Mon, 15 Apr 2019 13:33:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DCQv=SR=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hG1jU-0000kN-SS
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:33:12 +0000
X-Inumbo-ID: 0353c994-5f83-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0353c994-5f83-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 13:33:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 126783680F;
 Mon, 15 Apr 2019 13:33:11 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-136.rdu2.redhat.com
 [10.10.121.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F6675D707;
 Mon, 15 Apr 2019 13:33:08 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-25-anthony.perard@citrix.com>
 <f423bad2-fc57-40fe-960b-061ac9f144aa@redhat.com>
Message-ID: <311d1bb2-1a25-6e39-9e9d-b27ef44b45b4@redhat.com>
Date: Mon, 15 Apr 2019 15:33:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <f423bad2-fc57-40fe-960b-061ac9f144aa@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 15 Apr 2019 13:33:11 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 24/31]
 OvmfPkg/XenPlatformPei: Ignore missing PCI Host Bridge on Xen PVH
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
Message-ID: <20190415133307.3E0XktrTWUjIZBYB814WuEO5-Czxp4QEjnSH1x-0Lic@z>

T24gMDQvMTUvMTkgMTU6MjksIExhc3psbyBFcnNlayB3cm90ZToKPiBPbiAwNC8wOS8xOSAxMzow
OCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IFdoZW4gdGhlIGRldmljZSBJRCBvZiB0aGUgaG9z
dCBicmlkZ2UgaXMgdW5rbm93biwgY2hlY2sgaWYgd2UgYXJlCj4+IHJ1bm5pbmcgYXMgYSBQVkgg
Z3Vlc3QgYXMgdGhlcmUgaXMgbm8gUENJIGJ1cyBpbiB0aGF0IGNhc2UuCj4+Cj4+IENvbnRyaWJ1
dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPj4gU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4+IC0t
LQo+Pgo+PiBOb3RlczoKPj4gICAgIHYyOgo+PiAgICAgLSBVc2UgbmV3IFhFTl9QVkhfUENJX0hP
U1RfQlJJREdFX0RFVklDRV9JRCBtYWNybwo+Pgo+PiAgT3ZtZlBrZy9JbmNsdWRlL092bWZQbGF0
Zm9ybXMuaCAgIHwgNiArKysrKysKPj4gIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0u
YyB8IDcgKysrKysrKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9Pdm1mUGtnL0luY2x1ZGUvT3ZtZlBsYXRmb3Jtcy5oIGIvT3ZtZlBrZy9J
bmNsdWRlL092bWZQbGF0Zm9ybXMuaAo+PiBpbmRleCBjYzY3ZjQwYTg4Li4xY2U3MWUxOGVjIDEw
MDY0NAo+PiAtLS0gYS9Pdm1mUGtnL0luY2x1ZGUvT3ZtZlBsYXRmb3Jtcy5oCj4+ICsrKyBiL092
bWZQa2cvSW5jbHVkZS9Pdm1mUGxhdGZvcm1zLmgKPj4gQEAgLTQzLDQgKzQzLDEwIEBACj4+ICAv
Lwo+PiAgI2RlZmluZSBBQ1BJX1RJTUVSX09GRlNFVCAweDgKPj4gIAo+PiArLy8KPj4gKy8vIFdo
ZW4gcnVubmluZyBPVk1GIG9uIGEgWGVuIFBWSCBndWVzdCB0aGVyZSBpcyBubyBQQ0ksCj4+ICsv
LyBzbyAtMSBpcyByZXR1cm4gZm9yIHRoZSBIb3N0IEJyaWRnZSBEZXZpY2UgSUQuCj4+ICsvLwo+
PiArI2RlZmluZSBYRU5fUFZIX1BDSV9IT1NUX0JSSURHRV9ERVZJQ0VfSUQgMHhGRkZGCj4+ICsK
Pj4gICNlbmRpZgo+IAo+IFdlIHNwbGl0IHRoZSBpNDQwZnggYW5kIFEzNSBob3N0IGJyaWRnZSBk
ZXZpY2UgSURzIHRvIHNlcGFyYXRlIGZpbGVzLAo+IHVuZGVyICJPdm1mUGtnL0luY2x1ZGUvSW5k
dXN0cnlTdGFuZGFyZC8iLCBpbiBjb21taXQgY2IyZTMwMDc2NmFlCj4gKCJPdm1mUGtnOiBzcGxp
dCBJbmNsdWRlL092bWZQbGF0Zm9ybXMuaCIsIDIwMTUtMDUtMTMpLgo+IAo+ICgxKSBJJ2QgcHJl
ZmVyIGlmIHdlIGNvdWxkIGludHJvZHVjZSB0aGUgYWJvdmUgbWFjcm8gc2ltaWxhcmx5IC0tIGFu
ZAo+IGluY2x1ZGUgdGhhdCBoZWFkZXIgb25seSBpbiBYZW5QbGF0Zm9ybVBlaSAocGx1cyB3aGVy
ZXZlciBlbHNlIGl0IGlzCj4gbmVjZXNzYXJ5KS4KCnNvcnJ5LCBmb3IgYSBzZWNvbmQgSSBtaXNz
ZWQ6CgojaW5jbHVkZSA8SW5kdXN0cnlTdGFuZGFyZC9RMzVNY2hJY2g5Lmg+CiNpbmNsdWRlIDxJ
bmR1c3RyeVN0YW5kYXJkL0k0NDBGeFBpaXg0Lmg+CgppbiAiT3ZtZlBsYXRmb3Jtcy5oIi4gU28g
aXQncyBmaW5lIHRvICNpbmNsdWRlIHRoZSBuZXcgWGVuLXNwZWNpZmljCmhlYWRlciBpbiAiT3Zt
ZlBsYXRmb3Jtcy5oIiwgY2VudHJhbGx5LgoKVGhhbmtzCkxhc3psbwoKCj4gCj4gVGhhbmtzIQo+
IExhc3psbwo+IAo+IAo+PiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0
Zm9ybS5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jCj4+IGluZGV4IDVlNmQ1
NTNhZDUuLmQ5MWNkOThiZjQgMTAwNjQ0Cj4+IC0tLSBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkv
UGxhdGZvcm0uYwo+PiArKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmMKPj4g
QEAgLTI3OCw2ICsyNzgsMTMgQEAgTWlzY0luaXRpYWxpemF0aW9uICgKPj4gICAgICAgIEFjcGlF
bkJpdCAgPSBJQ0g5X0FDUElfQ05UTF9BQ1BJX0VOOwo+PiAgICAgICAgYnJlYWs7Cj4+ICAgICAg
ZGVmYXVsdDoKPj4gKyAgICAgIGlmIChYZW5QdmhEZXRlY3RlZCAoKSkgewo+PiArICAgICAgICAv
Lwo+PiArICAgICAgICAvLyBUaGVyZSBpcyBubyBQQ0kgYnVzIGluIHRoaXMgY2FzZQo+PiArICAg
ICAgICAvLwo+PiArICAgICAgICBQY2RTZXQxNlMgKFBjZE92bWZIb3N0QnJpZGdlUGNpRGV2SWQs
IFhFTl9QVkhfUENJX0hPU1RfQlJJREdFX0RFVklDRV9JRCk7Cj4+ICsgICAgICAgIHJldHVybjsK
Pj4gKyAgICAgIH0KPj4gICAgICAgIERFQlVHICgoRUZJX0RfRVJST1IsICIlYTogVW5rbm93biBI
b3N0IEJyaWRnZSBEZXZpY2UgSUQ6IDB4JTA0eFxuIiwKPj4gICAgICAgICAgX19GVU5DVElPTl9f
LCBtSG9zdEJyaWRnZURldklkKSk7Cj4+ICAgICAgICBBU1NFUlQgKEZBTFNFKTsKPj4KPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
