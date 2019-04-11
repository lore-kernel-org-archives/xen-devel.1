Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6021C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 11:10:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE382083E
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 11:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EE382083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEXaT-0007gt-Mq; Thu, 11 Apr 2019 11:09:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i8R2=SN=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEXaS-0007go-EB
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 11:09:44 +0000
X-Inumbo-ID: 4ea7692f-5c4a-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4ea7692f-5c4a-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 11:09:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8CB73301EA8E;
 Thu, 11 Apr 2019 11:09:42 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-225.rdu2.redhat.com
 [10.10.120.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B56F760BF7;
 Thu, 11 Apr 2019 11:09:40 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-8-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ad3a3d9c-4f6d-942b-c3c2-3aa565bbdaf2@redhat.com>
Date: Thu, 11 Apr 2019 13:09:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-8-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 11 Apr 2019 11:09:42 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 07/31]
 OvmfPkg/XenResetVector: Saving start of day pointer for PVH guests
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
Message-ID: <20190411110939.jmofOosiPoWsk4QAc9xCcJMOsTxBh0mqzchhyViqn4M@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEFzIGRlc2NyaWJlZCBp
biB0aGUgWGVuIFBWSCBkb2N1bWVudGF0aW9uIFsxXSwgImVieDogY29udGFpbnMgdGhlCj4gcGh5
c2ljYWwgbWVtb3J5IGFkZHJlc3Mgd2hlcmUgdGhlIGxvYWRlciBoYXMgcGxhY2VkIHRoZSBib290
IHN0YXJ0IGluZm8KPiBzdHJ1Y3R1cmUiLiBUbyBoYXZlIHRoaXMgcG9pbnRlciBzYXZlZCB0byBi
ZSBhYmxlIHRvIHVzZSBpdCBsYXRlciBpbiB0aGUKPiBQRUkgcGhhc2UsIHdlIGFsbG9jYXRlIHNv
bWUgc3BhY2UgaW4gdGhlIE1FTUZEIGZvciBpdC4gV2UgdXNlICdYUFZIJyBhcwo+IGEgc2lnbmF0
dXJlIChmb3IgIlhlbiBQVkgiKS4KPiAKPiBbMV0gaHR0cHM6Ly94ZW5iaXRzLnhlbnByb2plY3Qu
b3JnL2RvY3MvdW5zdGFibGUvbWlzYy9wdmguaHRtbAo+IAo+IENvbnRyaWJ1dGVkLXVuZGVyOiBU
aWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPiBTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgT3ZtZlBrZy9P
dm1mUGtnLmRlYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKysrKwo+ICBPdm1mUGtnL1hl
bk92bWYuZmRmICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKysrCj4gIE92bWZQa2cvWGVu
UmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IuaW5mICAgfCAzICsrKwo+ICBPdm1mUGtnL1hlblJl
c2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20gIHwgNCArKysrCj4gIE92bWZQa2cvWGVuUmVz
ZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IubmFzbWIgfCAyICsrCj4gIDUgZmlsZXMgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL092bWZQa2cuZGVjIGIv
T3ZtZlBrZy9Pdm1mUGtnLmRlYwo+IGluZGV4IGU1MGM2MTc5YTIuLjFjYmJjNDlhNmIgMTAwNjQ0
Cj4gLS0tIGEvT3ZtZlBrZy9Pdm1mUGtnLmRlYwo+ICsrKyBiL092bWZQa2cvT3ZtZlBrZy5kZWMK
PiBAQCAtMTI3LDYgKzEyNywxMCBAQCBbUGNkc0ZpeGVkQXRCdWlsZF0KPiAgICBnVWVmaU92bWZQ
a2dUb2tlblNwYWNlR3VpZC5QY2RHdWlkZWRFeHRyYWN0SGFuZGxlclRhYmxlU2l6ZXwweDB8VUlO
VDMyfDB4MWEKPiAgICBnVWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RPdm1mRGVjb21wcmVz
c2lvblNjcmF0Y2hFbmR8MHgwfFVJTlQzMnwweDFmCj4gIAo+ICsgICMgVXNlZCBieSBYZW5Pdm1m
CgooMSkgSSBzdWdnZXN0IGRyb3BwaW5nIHRoaXMgY29tbWVudCAoaXQnZCBoYXZlIHRvIGJlIHVw
ZGF0ZWQgdG8gT3ZtZlhlbgphbnl3YXkpLCBhbmQuLi4KCj4gKyAgZ1VlZmlPdm1mUGtnVG9rZW5T
cGFjZUd1aWQuUGNkWGVuU3RhcnRPZkRheVN0cnVjdFB0cnwweDB8VUlOVDMyfDB4MzAKPiArICBn
VWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RYZW5TdGFydE9mRGF5U3RydWN0UHRyU2l6ZXww
eDB8VUlOVDMyfDB4MzEKPiArCgooMikgY2FsbGluZyB0aGVzZSBQY2RYZW5QdmgqIHJhdGhlciB0
aGFuIGp1c3QgUGNkWGVuKgoKKG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGV5IGFyZSBzcGVj
aWZpYyB0byBQVkgpCgooMykgUGxlYXNlIHVzZSB0b2tlbiB2YWx1ZXMgMHgxNyBhbmQgMHgyOC4g
VGhhdCBzaG91bGQgZGVjcmVhc2UgdGhlCnRva2VuIHNwYWNlIGZyYWdtZW50YXRpb24uCgpXaXRo
IHRob3NlIGFkZHJlc3NlZDoKCkFja2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQu
Y29tPgoKVGhhbmtzCkxhc3psbwoKPiAgW1BjZHNEeW5hbWljLCBQY2RzRHluYW1pY0V4XQo+ICAg
IGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZEVtdVZhcmlhYmxlRXZlbnR8MHxVSU5UNjR8
Mgo+ICAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZE92bWZGbGFzaFZhcmlhYmxlc0Vu
YWJsZXxGQUxTRXxCT09MRUFOfDB4MTAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5Pdm1mLmZk
ZiBiL092bWZQa2cvWGVuT3ZtZi5mZGYKPiBpbmRleCAyMGViYWNkNjczLi5mOWU1OGJlZmQ2IDEw
MDY0NAo+IC0tLSBhL092bWZQa2cvWGVuT3ZtZi5mZGYKPiArKysgYi9Pdm1mUGtnL1hlbk92bWYu
ZmRmCj4gQEAgLTE1OSw2ICsxNTksMTAgQEAgW0ZELk1FTUZEXQo+ICAweDAwNzAwMHwweDAwMTAw
MAo+ICBnRWZpTWRlUGtnVG9rZW5TcGFjZUd1aWQuUGNkR3VpZGVkRXh0cmFjdEhhbmRsZXJUYWJs
ZUFkZHJlc3N8Z1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkR3VpZGVkRXh0cmFjdEhhbmRs
ZXJUYWJsZVNpemUKPiAgCj4gKzB4MDA4MDAwfDB4MDAxMDAwCj4gKyMgVXNlZCBieSBYZW5SZXNl
dFZlY3RvciB0byBjb21tdW5pY2F0ZSB3aXRoIFhlblBsYXRmb3JtUGVpCj4gK2dVZWZpT3ZtZlBr
Z1Rva2VuU3BhY2VHdWlkLlBjZFhlblN0YXJ0T2ZEYXlTdHJ1Y3RQdHJ8Z1VlZmlPdm1mUGtnVG9r
ZW5TcGFjZUd1aWQuUGNkWGVuU3RhcnRPZkRheVN0cnVjdFB0clNpemUKPiArCj4gIDB4MDEwMDAw
fDB4MDEwMDAwCj4gIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZE92bWZTZWNQZWlUZW1w
UmFtQmFzZXxnVWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RPdm1mU2VjUGVpVGVtcFJhbVNp
emUKPiAgCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0
b3IuaW5mIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9YZW5SZXNldFZlY3Rvci5pbmYKPiBpbmRl
eCA1YzA1ZjAyMjg1Li5lYzk4YzE3ODc2IDEwMDY0NAo+IC0tLSBhL092bWZQa2cvWGVuUmVzZXRW
ZWN0b3IvWGVuUmVzZXRWZWN0b3IuaW5mCj4gKysrIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9Y
ZW5SZXNldFZlY3Rvci5pbmYKPiBAQCAtNDEsMyArNDEsNiBAQCBbQnVpbGRPcHRpb25zXQo+ICBb
UGNkXQo+ICAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZE92bWZTZWNQYWdlVGFibGVz
QmFzZQo+ICAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZE92bWZTZWNQYWdlVGFibGVz
U2l6ZQo+ICsKPiArICBnVWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RYZW5TdGFydE9mRGF5
U3RydWN0UHRyCj4gKyAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkWGVuU3RhcnRPZkRh
eVN0cnVjdFB0clNpemUKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMy
L1hlblBWSE1haW4uYXNtIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4u
YXNtCj4gaW5kZXggYzQ4MDJiZjRkMS4uNGU1NWIwYWMxZiAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtn
L1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20KPiArKysgYi9Pdm1mUGtnL1hlblJl
c2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20KPiBAQCAtMjIsNiArMjIsMTAgQEAgeGVuUFZI
TWFpbjoKPiAgICAgIDsgRVNQIC0gIEluaXRpYWwgdmFsdWUgb2YgdGhlIEVBWCByZWdpc3RlciAo
QklTVDogQnVpbHQtaW4gU2VsZiBUZXN0KQo+ICAgICAgbW92ICAgICBlc3AsIGVheAo+ICAKPiAr
ICAgIDs7IFN0b3JlICJTdGFydCBvZiBkYXkiIHN0cnVjdCBwb2ludGVyIGZvciBsYXRlciB1c2UK
PiArICAgIG1vdiAgICAgZHdvcmRbUFZIX1NQQUNFICgwKV0sIGVieAo+ICsgICAgbW92ICAgICBk
d29yZFtQVkhfU1BBQ0UgKDQpXSwgJ1hQVkgnCj4gKwo+ICAgICAgY2xpCj4gIAo+ICAgICAgbW92
ICAgICBlYngsIEFERFJfT0YoZ2R0cikKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5SZXNldFZl
Y3Rvci9YZW5SZXNldFZlY3Rvci5uYXNtYiBiL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvWGVuUmVz
ZXRWZWN0b3IubmFzbWIKPiBpbmRleCBkNWE3OTFjMTM5Li41MGNiODFmY2QxIDEwMDY0NAo+IC0t
LSBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IubmFzbWIKPiArKysgYi9P
dm1mUGtnL1hlblJlc2V0VmVjdG9yL1hlblJlc2V0VmVjdG9yLm5hc21iCj4gQEAgLTQxLDYgKzQx
LDggQEAKPiAgCj4gICVpbmNsdWRlICJDb21tb25NYWNyb3MuaW5jIgo+ICAKPiArJWRlZmluZSBQ
VkhfU1BBQ0UoT2Zmc2V0KSAoRml4ZWRQY2RHZXQzMiAoUGNkWGVuU3RhcnRPZkRheVN0cnVjdFB0
cikgKyAoT2Zmc2V0KSkKPiArCj4gICVpbmNsdWRlICJQb3N0Q29kZXMuaW5jIgo+ICAKPiAgJWlm
ZGVmIERFQlVHX1BPUlQ4MAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
