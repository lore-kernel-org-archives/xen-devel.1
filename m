Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A73C10F13
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:16:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 860C621850
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:16:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vJfRGQ53"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 860C621850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCPe2-0006L4-Uh; Fri, 05 Apr 2019 14:16:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=awEa=SH=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hCPe1-0006KX-K2
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:16:37 +0000
X-Inumbo-ID: 6b1c936d-57ad-11e9-92d7-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6b1c936d-57ad-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 14:16:35 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v22so5397777lje.9
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2019 07:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9r79PuXtr/lt4WDOQk/opy7FV4+oiDaFmJQNxj7dXac=;
 b=vJfRGQ53IKnJs9eMeHieG2cc/sbraEIKaJtQWX00/bLSOCazr9MOdIDtrFkVMhzHTl
 YhV6fnEpe7PrTonffuUTKnXKngo0tR7QGZA734toXRvQMN0jAkK2IhLbWtlfI0JEiK3Q
 4G3PfOuXFsY0If7eu8Wp/XaoyklVkqeYhxhI8myrkHe3XnOS6XReN6bzfkoaSVbk49vs
 EByE39xjjEmiANhE+/CSMmc4+jbzx6fvnpzOCCB0vRFlGvfRCD+aTGPlVbTyp3imcx6Y
 Pw5oxMTTmmfPzHfRNkNLPohUKlK4wA4uCd6s0MFqNyF6fpguxmhgyBLOiWjUG5oiKkcT
 pd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9r79PuXtr/lt4WDOQk/opy7FV4+oiDaFmJQNxj7dXac=;
 b=EQQZcDtviMcMhlWGLf3mOXKprD3iyGsWFiRAj16LeAquGhZRRefFCxsv/rfNPf0lpp
 sxNlSWofDm40kSPPlOtGAfiKYc116QODRKbMzLSE4EPlRuPEG5r2Oz6t74ZCxU738h1Q
 /G0ci+PPVdsComGdVI9o6kmTS5gf/i+RUibM+vqqDpDjFmHeH8+/49NfdjLTtjCHJzdw
 J35FajNy0AnJ9xRjFBYZ8qOjz1vS+xLLxA3qsY+0pVf9Gb4B+/Z8mmttGxJ17EPeaUhj
 2LEeN6siPb09zWSrfpGCDuITajq3x8Cwdv8zuFdTxTPsxeWB/lvX1qThkYaV/lw8OFJb
 Ta2g==
X-Gm-Message-State: APjAAAUqoKDtXUlSaCqxQCA4FssR9aoShaYi0+ViyffiYnqJh20vjnQK
 UZDCd++QQXn1meTB+hjxWZ0=
X-Google-Smtp-Source: APXvYqzG8AZq/lRUBI7DT2qMOrpIFB0hSc4VB5eDHEC1eM2ya6BBOyhxpMYiz/J11YW0nNtUd6d6YQ==
X-Received: by 2002:a2e:7206:: with SMTP id n6mr7229718ljc.112.1554473794281; 
 Fri, 05 Apr 2019 07:16:34 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 u18sm4729722ljd.77.2019.04.05.07.16.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Apr 2019 07:16:32 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190128155909.14289-1-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <f916ec14-a1bd-c4bd-0287-655cfb831d89@gmail.com>
Date: Fri, 5 Apr 2019 17:16:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190128155909.14289-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next] xen/arm: irq: Don't use
 _IRQ_PENDING when handling host interrupt
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405141631.raNyCpdJMxB8yOuwfeOnCdwr6pKMVzdZzionwcB9l74@z>

CgpPbiAyOC4wMS4xOSAxNzo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdoaWxlIFNQSXMgYXJl
IHNoYXJlZCBiZXR3ZWVuIENQVSwgaXQgaXMgbm90IHBvc3NpYmxlIHRvIHJlY2VpdmUgdGhlCj4g
c2FtZSBpbnRlcnJ1cHRzIG9uIGEgZGlmZmVyZW50IENQVSB3aGlsZSB0aGUgaW50ZXJydXB0IGlz
IGluIGFjdGl2ZQo+IHN0YXRlLiBUaGUgZGVhY3RpdmF0aW9uIG9mIHRoZSBpbnRlcnJ1cHQgaXMg
ZG9uZSBhdCB0aGUgZW5kIG9mIHRoZQo+IGhhbmRsaW5nLgo+IAo+IFRoaXMgbWVhbnMgdGhlIF9J
UlFfUEVORElORyBsb2dpYyBpcyB1bmVjZXNzYXJ5IG9uIEFybSBhcyBhIHNhbWUKPiBpbnRlcnJ1
cHQgY2FuIG5ldmVyIGNvbWUgdXAgd2hpbGUgaW4gdGhlIGxvb3AuIFNvIHJlbW92ZSBpdCB0bwo+
IHNpbXBsaWZ5IHRoZSBpbnRlcnJ1cHQgaGFuZGxlIGNvZGUuCgpXaGF0IGFib3V0IF9JUlFfUEVO
RElORyBtYWNybyBpdHNlbGY/CkFueSByZWFzb25zIHRvIG5vdCBlbGltaW5hdGUgaXQ/Cgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0t
Cj4gICB4ZW4vYXJjaC9hcm0vaXJxLmMgfCAzMiArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJx
LmMKPiBpbmRleCBjNTFjZjMzM2NlLi4zODc3NjU3YTUyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L2FybS9pcnEuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9pcnEuYwo+IEBAIC0xOTksNiArMTk5LDcg
QEAgaW50IHJlcXVlc3RfaXJxKHVuc2lnbmVkIGludCBpcnEsIHVuc2lnbmVkIGludCBpcnFmbGFn
cywKPiAgIHZvaWQgZG9fSVJRKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1bnNpZ25lZCBp
bnQgaXJxLCBpbnQgaXNfZmlxKQo+ICAgewo+ICAgICAgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYyA9
IGlycV90b19kZXNjKGlycSk7Cj4gKyAgICBzdHJ1Y3QgaXJxYWN0aW9uICphY3Rpb247Cj4gICAK
PiAgICAgICBwZXJmY19pbmNyKGlycXMpOwo+ICAgCj4gQEAgLTI0MiwzNSArMjQzLDIyIEBAIHZv
aWQgZG9fSVJRKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1bnNpZ25lZCBpbnQgaXJxLCBp
bnQgaXNfZmlxKQo+ICAgICAgICAgICBnb3RvIG91dF9ub19lbmQ7Cj4gICAgICAgfQo+ICAgCj4g
LSAgICBzZXRfYml0KF9JUlFfUEVORElORywgJmRlc2MtPnN0YXR1cyk7Cj4gLQo+IC0gICAgLyoK
PiAtICAgICAqIFNpbmNlIHdlIHNldCBQRU5ESU5HLCBpZiBhbm90aGVyIHByb2Nlc3NvciBpcyBo
YW5kbGluZyBhIGRpZmZlcmVudAo+IC0gICAgICogaW5zdGFuY2Ugb2YgdGhpcyBzYW1lIGlycSwg
dGhlIG90aGVyIHByb2Nlc3NvciB3aWxsIHRha2UgY2FyZSBvZiBpdC4KPiAtICAgICAqLwo+IC0g
ICAgaWYgKCB0ZXN0X2JpdChfSVJRX0RJU0FCTEVELCAmZGVzYy0+c3RhdHVzKSB8fAo+IC0gICAg
ICAgICB0ZXN0X2JpdChfSVJRX0lOUFJPR1JFU1MsICZkZXNjLT5zdGF0dXMpICkKPiArICAgIGlm
ICggdGVzdF9iaXQoX0lSUV9ESVNBQkxFRCwgJmRlc2MtPnN0YXR1cykgKQo+ICAgICAgICAgICBn
b3RvIG91dDsKPiAgIAo+ICAgICAgIHNldF9iaXQoX0lSUV9JTlBST0dSRVNTLCAmZGVzYy0+c3Rh
dHVzKTsKPiAgIAo+IC0gICAgd2hpbGUgKCB0ZXN0X2JpdChfSVJRX1BFTkRJTkcsICZkZXNjLT5z
dGF0dXMpICkKPiAtICAgIHsKPiAtICAgICAgICBzdHJ1Y3QgaXJxYWN0aW9uICphY3Rpb247Cj4g
KyAgICBhY3Rpb24gPSBkZXNjLT5hY3Rpb247Cj4gICAKPiAtICAgICAgICBjbGVhcl9iaXQoX0lS
UV9QRU5ESU5HLCAmZGVzYy0+c3RhdHVzKTsKPiAtICAgICAgICBhY3Rpb24gPSBkZXNjLT5hY3Rp
b247Cj4gKyAgICBzcGluX3VubG9ja19pcnEoJmRlc2MtPmxvY2spOwo+ICAgCj4gLSAgICAgICAg
c3Bpbl91bmxvY2tfaXJxKCZkZXNjLT5sb2NrKTsKPiAtCj4gLSAgICAgICAgZG8KPiAtICAgICAg
ICB7Cj4gLSAgICAgICAgICAgIGFjdGlvbi0+aGFuZGxlcihpcnEsIGFjdGlvbi0+ZGV2X2lkLCBy
ZWdzKTsKPiAtICAgICAgICAgICAgYWN0aW9uID0gYWN0aW9uLT5uZXh0Owo+IC0gICAgICAgIH0g
d2hpbGUgKCBhY3Rpb24gKTsKPiArICAgIGRvCj4gKyAgICB7Cj4gKyAgICAgICAgYWN0aW9uLT5o
YW5kbGVyKGlycSwgYWN0aW9uLT5kZXZfaWQsIHJlZ3MpOwo+ICsgICAgICAgIGFjdGlvbiA9IGFj
dGlvbi0+bmV4dDsKPiArICAgIH0gd2hpbGUgKCBhY3Rpb24gKTsKPiAgIAo+IC0gICAgICAgIHNw
aW5fbG9ja19pcnEoJmRlc2MtPmxvY2spOwo+IC0gICAgfQo+ICsgICAgc3Bpbl9sb2NrX2lycSgm
ZGVzYy0+bG9jayk7Cj4gICAKPiAgICAgICBjbGVhcl9iaXQoX0lSUV9JTlBST0dSRVNTLCAmZGVz
Yy0+c3RhdHVzKTsKPiAgIAo+IAoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
