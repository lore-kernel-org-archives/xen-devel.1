From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 03/10] xen/arm: optee: add OP-TEE
 mediator skeleton
Date: Fri, 15 Mar 2019 15:47:51 +0000
Message-ID: <87daf47a-21e4-0c19-4265-707fd72b1b2c@arm.com>
References: <20190307210404.12346-1-volodymyr_babchuk@epam.com>
 <20190307210404.12346-4-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g1VR=RS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h4p3r-0003d5-TG
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 15:47:55 +0000
In-Reply-To: <20190307210404.12346-4-volodymyr_babchuk@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>
Cc: Volodymyr Babchuk <vlad.babchuk@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgVm9sb2R5bXlyLAoKT24gMDcvMDMvMjAxOSAyMTowNCwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gK3N0YXRpYyB2b2lkIGZvcndhcmRfY2FsbChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cykKPiArewo+ICsgICAgc3RydWN0IGFybV9zbWNjY19yZXMgcmVzcDsKPiArCj4gKyAgICBhcm1f
c21jY2Nfc21jKGdldF91c2VyX3JlZyhyZWdzLCAwKSwKPiArICAgICAgICAgICAgICAgICAgZ2V0
X3VzZXJfcmVnKHJlZ3MsIDEpLAo+ICsgICAgICAgICAgICAgICAgICBnZXRfdXNlcl9yZWcocmVn
cywgMiksCj4gKyAgICAgICAgICAgICAgICAgIGdldF91c2VyX3JlZyhyZWdzLCAzKSwKPiArICAg
ICAgICAgICAgICAgICAgZ2V0X3VzZXJfcmVnKHJlZ3MsIDQpLAo+ICsgICAgICAgICAgICAgICAg
ICBnZXRfdXNlcl9yZWcocmVncywgNSksCj4gKyAgICAgICAgICAgICAgICAgIGdldF91c2VyX3Jl
ZyhyZWdzLCA2KSwKPiArICAgICAgICAgICAgICAgICAgT1BURUVfQ0xJRU5UX0lEKGN1cnJlbnQt
PmRvbWFpbiksCj4gKyAgICAgICAgICAgICAgICAgICZyZXNwKTsKPiArCj4gKyAgICBzZXRfdXNl
cl9yZWcocmVncywgMCwgcmVzcC5hMCk7Cj4gKyAgICBzZXRfdXNlcl9yZWcocmVncywgMSwgcmVz
cC5hMSk7Cj4gKyAgICBzZXRfdXNlcl9yZWcocmVncywgMiwgcmVzcC5hMik7Cj4gKyAgICBzZXRf
dXNlcl9yZWcocmVncywgMywgcmVzcC5hMyk7Cj4gKyAgICBzZXRfdXNlcl9yZWcocmVncywgNCwg
MCk7Cj4gKyAgICBzZXRfdXNlcl9yZWcocmVncywgNSwgMCk7Cj4gKyAgICBzZXRfdXNlcl9yZWco
cmVncywgNiwgMCk7Cj4gKyAgICBzZXRfdXNlcl9yZWcocmVncywgNywgMCk7CgpSZWxhdGVkIHRv
IHdoYXQgSSBwb2ludGVkIG9uIHBhdGNoICM0LCB0aGlzIGRvZXMgbm90IGxvb2sgcmlnaHQgdG8g
bWUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
