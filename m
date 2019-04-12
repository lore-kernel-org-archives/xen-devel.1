Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7939AC10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:18:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48ACA2084D
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48ACA2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEsJy-00033C-AM; Fri, 12 Apr 2019 09:18:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCWt=SO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEsJw-000337-PM
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 09:18:04 +0000
X-Inumbo-ID: dfeafa3a-5d03-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dfeafa3a-5d03-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 09:18:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D26723097041;
 Fri, 12 Apr 2019 09:17:32 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-65.rdu2.redhat.com
 [10.10.120.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43FC5600D4;
 Fri, 12 Apr 2019 09:17:31 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-19-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <7bf30793-3740-1720-5bf6-7dc393933f70@redhat.com>
Date: Fri, 12 Apr 2019 11:17:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-19-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 12 Apr 2019 09:17:33 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 18/31]
 OvmfPkg/XenPlatformPei: Setup HyperPages earlier
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
Message-ID: <20190412091730.Kpd49E1biOMsYEmddIB2mtHPXFdLDqFtxT3G0hsxLdc@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFdlIGFyZSBnb2luZyB0
byBuZWVkIHRvIG1ha2UgYW4gaHlwZXJjYWxsIGluIG9yZGVyIHRvIHJldHJlaXZlIHRoZSBFODIw
Cj4gdGFibGUgZnJvbSB0aGUgaHlwZXJ2aXNvciBiZWZvcmUgYmVlbiBhYmxlIHRvIHNldHVwIHRo
ZSBtZW1vcnkuCj4gCj4gQ2FsbGluZyBYZW5Db25uZWN0IGVhcmxpZXIgd2lsbCBhbGxvdyB0byBz
ZXR1cCB0aGUgWGVuSHlwZXJjYWxsTGliCj4gZWFybGllciB0byBhbGxvdyB0byBtYWtlIGh5cGVy
Y2FsbHMuCj4gCj4gV2hpbGUgaGVyZSwgYWRkIHNvbWUgY29tbWVudHMgaW4gWGVuQ29ubmVjdCgp
Lgo+IAo+IENvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVu
dCAxLjEKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KPiAtLS0KPiAgT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oIHwgIDUg
KysrKysKPiAgT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jIHwgIDIgKysKPiAgT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyAgICAgIHwgMjMgKysrKysrKysrKy0tLS0tLS0tLS0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oIGIvT3ZtZlBr
Zy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCj4gaW5kZXggNTU2NWQ0N2UzNC4uYTUyNGMyM2E0
MyAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmgKPiArKysg
Yi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmgKPiBAQCAtODUsNiArODUsMTEgQEAg
SW5zdGFsbENsZWFyQ2FjaGVDYWxsYmFjayAoCj4gICAgVk9JRAo+ICAgICk7Cj4gIAo+ICtFRklf
U1RBVFVTCj4gK1hlbkNvbm5lY3QgKAo+ICsgIFZPSUQKPiArICApOwo+ICsKPiAgRUZJX1NUQVRV
Uwo+ICBJbml0aWFsaXplWGVuICgKPiAgICBWT0lECj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVu
UGxhdGZvcm1QZWkvUGxhdGZvcm0uYyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0u
Ywo+IGluZGV4IDJkNTY3YTQ3NjAuLjVlNmQ1NTNhZDUgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9Y
ZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9Q
bGF0Zm9ybS5jCj4gQEAgLTQyMSw2ICs0MjEsOCBAQCBJbml0aWFsaXplWGVuUGxhdGZvcm0gKAo+
ICAgICAgQ3B1RGVhZExvb3AgKCk7Cj4gICAgfQo+ICAKPiArICBYZW5Db25uZWN0ICgpOwo+ICsK
PiAgICBCb290TW9kZUluaXRpYWxpemF0aW9uICgpOwo+ICAgIEFkZHJlc3NXaWR0aEluaXRpYWxp
emF0aW9uICgpOwo+ICAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4u
YyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKPiBpbmRleCAyMmM3YTIyYzg4Li5iMzZl
ZmY1MjRkIDEwMDY0NAo+IC0tLSBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKPiArKysg
Yi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCj4gQEAgLTc4LDE0ICs3OCwxMSBAQCBYZW5H
ZXRFODIwTWFwICgKPiAgLyoqCj4gICAgQ29ubmVjdHMgdG8gdGhlIEh5cGVydmlzb3IuCj4gICAK
PiAtICBAcGFyYW0gIFhlbkxlYWYgICAgIENQVUlEIGluZGV4IHVzZWQgdG8gY29ubmVjdC4KPiAt
Cj4gICAgQHJldHVybiBFRklfU1RBVFVTCj4gIAo+ICAqKi8KPiAgRUZJX1NUQVRVUwo+ICBYZW5D
b25uZWN0ICgKPiAtICBVSU5UMzIgWGVuTGVhZgo+ICAgICkKPiAgewo+ICAgIFVJTlQzMiBJbmRl
eDsKPiBAQCAtOTYsNyArOTMsMTMgQEAgWGVuQ29ubmVjdCAoCj4gICAgQ0hBUjggU2lnW3NpemVv
ZiAoSW5mby0+U2lnbmF0dXJlKSArIDFdOwo+ICAgIFVJTlQzMiAqUFZIUmVzZXRWZWN0b3JEYXRh
Owo+ICAKPiAtICBBc21DcHVpZCAoWGVuTGVhZiArIDIsICZUcmFuc2ZlclBhZ2VzLCAmVHJhbnNm
ZXJSZWcsIE5VTEwsIE5VTEwpOwo+ICsgIEFTU0VSVCAobVhlbkxlYWYgIT0gMCk7Cj4gKwo+ICsg
IC8vCj4gKyAgLy8gUHJlcGFyZSBIeXBlclBhZ2VzIHRvIGJlIGFibGUgdG8gbWFrZSBoeXBlcmNh
bGxzCj4gKyAgLy8KPiArCj4gKyAgQXNtQ3B1aWQgKG1YZW5MZWFmICsgMiwgJlRyYW5zZmVyUGFn
ZXMsICZUcmFuc2ZlclJlZywgTlVMTCwgTlVMTCk7Cj4gICAgbVhlbkluZm8uSHlwZXJQYWdlcyA9
IEFsbG9jYXRlUGFnZXMgKFRyYW5zZmVyUGFnZXMpOwo+ICAgIGlmICghbVhlbkluZm8uSHlwZXJQ
YWdlcykgewo+ICAgICAgcmV0dXJuIEVGSV9PVVRfT0ZfUkVTT1VSQ0VTOwo+IEBAIC0xMDgsNyAr
MTExLDExIEBAIFhlbkNvbm5lY3QgKAo+ICAgICAgICAgICAgICAgICAgICAgKEluZGV4IDw8IEVG
SV9QQUdFX1NISUZUKSArIEluZGV4KTsKPiAgICB9Cj4gIAo+IC0gIEFzbUNwdWlkIChYZW5MZWFm
ICsgMSwgJlhlblZlcnNpb24sIE5VTEwsIE5VTEwsIE5VTEwpOwo+ICsgIC8vCj4gKyAgLy8gRmlu
ZCBvdXQgdGhlIFhlbiB2ZXJzaW9uCj4gKyAgLy8KPiArCj4gKyAgQXNtQ3B1aWQgKG1YZW5MZWFm
ICsgMSwgJlhlblZlcnNpb24sIE5VTEwsIE5VTEwsIE5VTEwpOwo+ICAgIERFQlVHICgoRUZJX0Rf
RVJST1IsICJEZXRlY3RlZCBYZW4gdmVyc2lvbiAlZC4lZFxuIiwKPiAgICAgICAgICAgIFhlblZl
cnNpb24gPj4gMTYsIFhlblZlcnNpb24gJiAweEZGRkYpKTsKPiAgICBtWGVuSW5mby5WZXJzaW9u
TWFqb3IgPSAoVUlOVDE2KShYZW5WZXJzaW9uID4+IDE2KTsKPiBAQCAtMjY1LDEyICsyNzIsNiBA
QCBJbml0aWFsaXplWGVuICgKPiAgewo+ICAgIFJFVFVSTl9TVEFUVVMgUGNkU3RhdHVzOwo+ICAK
PiAtICBpZiAobVhlbkxlYWYgPT0gMCkgewo+IC0gICAgcmV0dXJuIEVGSV9OT1RfRk9VTkQ7Cj4g
LSAgfQo+IC0KPiAtICBYZW5Db25uZWN0IChtWGVuTGVhZik7Cj4gLQo+ICAgIC8vCj4gICAgLy8g
UmVzZXJ2ZSBhd2F5IEhWTUxPQURFUiByZXNlcnZlZCBtZW1vcnkgWzB4RkMwMDAwMDAsMHhGRDAw
MDAwMCkuCj4gICAgLy8gVGhpcyBuZWVkcyB0byBtYXRjaCBIVk1MT0FERVIgUkVTRVJWRURfTUVN
QkFTRS9SRVNFUlZFRF9NRU1TSVpFLgo+IAoKQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2Vr
QHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
