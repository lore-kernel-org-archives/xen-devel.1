Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDD2C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:36:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 364D62084D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 364D62084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEX3f-0004Lx-1k; Thu, 11 Apr 2019 10:35:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mz0W=SN=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1hEX3e-0004Lr-8a
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:35:50 +0000
X-Inumbo-ID: 91d710de-5c45-11e9-92d7-bc764e045a96
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 91d710de-5c45-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 10:35:48 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q16so6050626wmj.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2019 03:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4eYjDQaHRkjz9QPcrrE16X86PBJJ2UeR0jXrwkclxxU=;
 b=YZjA4BqrSzW3ce/90D1bx3bcA12cJl7QYpQRnz94gIq9mQMKQGydlCr0LjSJHgyW9V
 8tcRRNmSEgubx9VASHJnwtL49hxRh70tirJdBpOVFh7gvGMv9EmthpzU4jYjuUO2SHVg
 jYP/iVhEPln5xi23EFSof2WyxIsOvBOmy7tCupSusUvIuVenRiuhQWI6I6DN+mywmfZG
 BfNBPlkZMvMKpLEd10ztlofzoApXi5B1N6AjtBJ+JHAgHt0XU6bf3fqJRM1RpaaUeZ1A
 S9hrFcFumOwi7cHgwT1h22Bva9fEhlAgYPL3k5huVzfWw5ZmXz1iHNn+p6K6tDGH3w9+
 Hwlg==
X-Gm-Message-State: APjAAAXJfNotOrDKsaQzSubZDICAAlgur5qpPJgqGlele6BcOKCd6X3x
 LBxkvdze22Mt4qRGGv9WYJBmfSGyPcc=
X-Google-Smtp-Source: APXvYqw26YCR+VL6myb6VjFXLpOc7UWq/fJuNXMwUT21qZ+J+uhmqCBjXB0izIvAGg4aXy/fYTaZGg==
X-Received: by 2002:a1c:14:: with SMTP id 20mr5987059wma.66.1554978887516;
 Thu, 11 Apr 2019 03:34:47 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.193])
 by smtp.gmail.com with ESMTPSA id x18sm54292231wrw.14.2019.04.11.03.34.46
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 03:34:46 -0700 (PDT)
To: devel@edk2.groups.io, lersek@redhat.com
References: <20190410125809.21985-1-lersek@redhat.com>
 <20190410125809.21985-3-lersek@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <707d30e3-b9a2-7a3b-0e02-108b4a04b967@redhat.com>
Date: Thu, 11 Apr 2019 12:34:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190410125809.21985-3-lersek@redhat.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 2/4] OvmfPkg/License.txt:
 refresh the MIT license text and include the SPDX ID
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411103445.oeGwXJBx0y4RhPqNJsjJZyPROgUxfaWWIiKifuGSXmk@z>

T24gNC8xMC8xOSAyOjU4IFBNLCBMYXN6bG8gRXJzZWsgd3JvdGU6Cj4gUmVmcmVzaCB0aGUgTUlU
IGxpY2Vuc2UgdGV4dCBmcm9tIDxodHRwczovL3NwZHgub3JnL2xpY2Vuc2VzL01JVC5odG1sPiwK
PiBhbmQgYWRkICJTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUIiBmb3IgZWFzaWVyIHBhcnNp
bmcgYnkgbWFjaGluZXMuCj4gCj4gVGhpcyBmb2xsb3dzIHRoZSB0cmVlLXdpZGUgYWRvcHRpb24g
b2YgIlNQRFgtTGljZW5zZS1JZGVudGlmaWVyInMsIG1hZGUKPiBmb3IgPGh0dHBzOi8vYnVnemls
bGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTM3Mz47IGluIHBhcnRpY3VsYXI6Cj4g
Cj4gLSBjb21taXQgMzA0YmZmNzIyM2E4ICgiZWRrMjogQ2hhbmdlIExpY2Vuc2UudHh0IGZyb20g
Mi1DbGF1c2UgQlNEIHRvCj4gICBCU0QrUGF0ZW50IiwgMjAxOS0wNC0wOSksCj4gCj4gLSBjb21t
aXQgNzVmYWU1MDViNzM1ICgiT3ZtZlBrZzogQ2hhbmdlIExpY2Vuc2UudHh0IGZyb20gMi1DbGF1
c2UgQlNEIHRvCj4gICBCU0QrUGF0ZW50IiwgMjAxOS0wNC0wOSkuCj4gCj4gQ2M6IEFudGhvbnkg
UGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IENjOiBBcmQgQmllc2hldXZlbCA8
YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KPiBDYzogSm9yZGFuIEp1c3RlbiA8am9yZGFuLmwu
anVzdGVuQGludGVsLmNvbT4KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KPiBDYzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBCdWd6aWxsYTogaHR0cHM6Ly9idWd6aWxsYS50aWFu
b2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjU0Cj4gU2lnbmVkLW9mZi1ieTogTGFzemxvIEVy
c2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KPiAtLS0KPiAgT3ZtZlBrZy9MaWNlbnNlLnR4dCB8IDcg
KysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpY2Vuc2UudHh0IGIvT3ZtZlBrZy9MaWNlbnNl
LnR4dAo+IGluZGV4IGEyZTAyYTE3OTZhYS4uNmVjOTUwY2Q5ZTEzIDEwMDY0NAo+IC0tLSBhL092
bWZQa2cvTGljZW5zZS50eHQKPiArKysgYi9Pdm1mUGtnL0xpY2Vuc2UudHh0Cj4gQEAgLTU1LDE5
ICs1NSwyMiBAQCBQT1NTSUJJTElUWSBPRiBTVUNIIERBTUFHRS4KPiAgU29tZSBmaWxlcyBhcmUg
c3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGxpY2Vuc2UsIHRoZSBNSVQgbGljZW5zZS4gVGhvc2Ug
ZmlsZXMKPiAgYXJlIGxvY2F0ZWQgaW46Cj4gIC0gT3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3Rh
bmRhcmQvWGVuLwo+ICAtIE92bWZQa2cvWGVuQnVzRHhlLwo+ICAKPiArU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IE1JVAo+ICsKPiAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBv
ZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQo+ICBvZiB0aGlzIHNvZnR3
YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwg
dG8gZGVhbAo+ICBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5n
IHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzCj4gIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBt
ZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwKPiAgY29w
aWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNv
ZnR3YXJlIGlzCj4gIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5n
IGNvbmRpdGlvbnM6Cj4gIAo+IC1UaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBw
ZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgo+IC1hbGwgY29waWVzIG9yIHN1
YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KPiArVGhlIGFib3ZlIGNvcHlyaWdo
dCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2UgKGluY2x1ZGluZyB0aGUgbmV4dAo+
ICtwYXJhZ3JhcGgpIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRp
YWwgcG9ydGlvbnMgb2YgdGhlCj4gK1NvZnR3YXJlLgo+ICAKPiAgVEhFIFNPRlRXQVJFIElTIFBS
T1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IK
PiAgSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBP
RiBNRVJDSEFOVEFCSUxJVFksCj4gIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFO
RCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRQo+ICBBVVRIT1JTIE9SIENP
UFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVS
Cj4gCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkZSA8cGhpbG1kQHJlZGhhdC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
