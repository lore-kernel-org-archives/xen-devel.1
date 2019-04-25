Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D4EC43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:01:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A61F206BF
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:01:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKvA5PUO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A61F206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJig6-00066d-Ut; Thu, 25 Apr 2019 18:00:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+mKo=S3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hJig5-00066X-0i
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:00:57 +0000
X-Inumbo-ID: 11d3c34d-6784-11e9-843c-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 11d3c34d-6784-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 18:00:55 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id p14so465111ljg.5
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 11:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/f49Jn/FrS/nPfRw1hSUhe3m7upCmrNZJmMF5O6AuVw=;
 b=iKvA5PUOP+aDikyYYsFidnifBUncxNJOSSUBe91S7iroGcJ1ZzTXGwajpKnNzdaKvo
 00ssnSwg5HRLFBZRWb6Rl6ntD036Z6FfY3Rg9T6RgC9X82Yb5ajRUjkfTcp85QlNiwuk
 PbH+XqiSYmBxJaytHtn8DGsnuC6BLzWLB4xvOzcZbIlYbQcLrlU4mK4DGD5D0IbmG7tw
 bReHAm9lV0GK32k5fwBRNxm1+rLiTAULMNR+7sL6lnRVlB6jAnephnat2A70sm6mtKeW
 pxKWfKo9mz9ikJvNLw5s8wn7U36alo25+BM+uHA3cNBdCG8DReE0wtihGlKZL8o9DEvz
 Fs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/f49Jn/FrS/nPfRw1hSUhe3m7upCmrNZJmMF5O6AuVw=;
 b=HOosKI2Bulyimk1WxjzlXQoOC43zN7tUT0pHhG7Xhb1dJw3jpW2f2AAsIWqjL1GHUQ
 Na2W0TDDU7ILSD/5HtOCtv6/qD+fQas56Iv8e3h4/NDCqT44GiQe/+GAFWL8Kl1kY7es
 InWyQs/bRw0mNcBiq9LRbXQTRIf7oZ/ArMZ5AHhKYMXkdKt+JnZW2z1GVFFXk3P5WwE7
 zj8rUg9qKEh1VvjwtgFa6l0Q4T+/cX4YdFdiAijpnc85NNUfZmJ/6AG9fQdJxat/PvZy
 bU+LhDVwdeSeFKKioG6uDYo54/vNHHmEkqdOKfDRdZ+uNUWXJnZJhRWwsNgvji5SbHNu
 n4NA==
X-Gm-Message-State: APjAAAX3PlqG0XIP5m8gDopgAHK9rIv3ZKLX1V+z8G+hp4cxR4g6ugSG
 JmMJW4DJMKpaugeyJjL7y44=
X-Google-Smtp-Source: APXvYqw1W/LHGvIEY63BMSCawF9ehR8+RQdGFNvLkHATLPD8vEwY86pzqTzK08Y19BvIYEWzATec3g==
X-Received: by 2002:a2e:9a91:: with SMTP id p17mr20485824lji.127.1556215253738; 
 Thu, 25 Apr 2019 11:00:53 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 x76sm4798273ljb.17.2019.04.25.11.00.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2019 11:00:52 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-2-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <52b107e1-fa03-54aa-3b64-3bba7104661b@gmail.com>
Date: Thu, 25 Apr 2019 21:00:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417175815.16905-2-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/7] xen/arm: mm: Consolidate setting
 SCTLR_EL2.WXN in a single place
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425180051.k3AwApbgQirKrWO0BOwodonQM9dgUfoQq3HXNptE1BY@z>

CgpPbiAxNy4wNC4xOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBsb2dpYyB0byBz
ZXQgU0NUTFJfRUwyLldYTiBpcyB0aGUgc2FtZSBmb3IgdGhlIGJvb3QgQ1BVIGFuZAo+IG5vbi1i
b290IENQVS4gU28gaW50cm9kdWNlIGEgZnVuY3Rpb24gdG8gc2V0IHRoZSBiaXQgYW5kIGNsZWFy
IFRCTHMuCnMvVEJML1RMQi8KCj4gCj4gVGhpcyBuZXcgZnVuY3Rpb24gd2lsbCBoZWxwIHVzIHRv
IGRvY3VtZW50IGFuZCB1cGRhdGUgdGhlIGxvZ2ljIGluIGEKPiBzaW5nbGUgcGxhY2UuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCj4gLS0t
Cj4gICB4ZW4vYXJjaC9hcm0vbW0uYyB8IDIyICsrKysrKysrKysrKysrKy0tLS0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gaW5kZXggMDFh
ZTJjY2NjMC4uOTNhZDExODE4MyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0uYwo+ICsr
KyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gQEAgLTYwMSw2ICs2MDEsMTkgQEAgdm9pZCBfX2luaXQg
cmVtb3ZlX2Vhcmx5X21hcHBpbmdzKHZvaWQpCj4gICAgICAgZmx1c2hfeGVuX2RhdGFfdGxiX3Jh
bmdlX3ZhKEJPT1RfRkRUX1ZJUlRfU1RBUlQsIEJPT1RfRkRUX1NMT1RfU0laRSk7Cj4gICB9Cj4g
ICAKPiArLyoKPiArICogQWZ0ZXIgYm9vdCwgWGVuIHBhZ2UtdGFibGVzIHNob3VsZCBub3QgY29u
dGFpbiBtYXBwaW5nIHRoYXQgYXJlIGJvdGgKPiArICogV3JpdGFibGUgYW5kIGVYZWN1dGFibGVz
Lgo+ICsgKgo+ICsgKiBUaGlzIHNob3VsZCBiZSBjYWxsZWQgb24gZWFjaCBDUFUgdG8gZW5mb3Jj
ZSB0aGUgcG9saWN5Lgo+ICsgKi8KPiArc3RhdGljIHZvaWQgeGVuX3B0X2VuZm9yY2Vfd254KHZv
aWQpCkNvdWxkIGl0IGJlIGlubGluZT8KCj4gK3sKPiArICAgIFdSSVRFX1NZU1JFRzMyKFJFQURf
U1lTUkVHMzIoU0NUTFJfRUwyKSB8IFNDVExSX1dYTiwgU0NUTFJfRUwyKTsKPiArICAgIC8qIEZs
dXNoIGV2ZXJ5dGhpbmcgYWZ0ZXIgc2V0dGluZyBXWE4gYml0LiAqLwo+ICsgICAgZmx1c2hfeGVu
X3RleHRfdGxiX2xvY2FsKCk7Cj4gK30KPiArCj4gICBleHRlcm4gdm9pZCBzd2l0Y2hfdHRicih1
aW50NjRfdCB0dGJyKTsKPiAgIAo+ICAgLyogQ2xlYXIgYSB0cmFuc2xhdGlvbiB0YWJsZSBhbmQg
Y2xlYW4gJiBpbnZhbGlkYXRlIHRoZSBjYWNoZSAqLwo+IEBAIC03MDIsMTAgKzcxNSw3IEBAIHZv
aWQgX19pbml0IHNldHVwX3BhZ2V0YWJsZXModW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0
KQo+ICAgICAgIGNsZWFyX3RhYmxlKGJvb3Rfc2Vjb25kKTsKPiAgICAgICBjbGVhcl90YWJsZShi
b290X3RoaXJkKTsKPiAgIAo+IC0gICAgLyogRnJvbSBub3cgb24sIG5vIG1hcHBpbmcgbWF5IGJl
IGJvdGggd3JpdGFibGUgYW5kIGV4ZWN1dGFibGUuICovCj4gLSAgICBXUklURV9TWVNSRUczMihS
RUFEX1NZU1JFRzMyKFNDVExSX0VMMikgfCBTQ1RMUl9XWE4sIFNDVExSX0VMMik7Cj4gLSAgICAv
KiBGbHVzaCBldmVyeXRoaW5nIGFmdGVyIHNldHRpbmcgV1hOIGJpdC4gKi8KPiAtICAgIGZsdXNo
X3hlbl90ZXh0X3RsYl9sb2NhbCgpOwo+ICsgICAgeGVuX3B0X2VuZm9yY2Vfd254KCk7Cj4gICAK
PiAgICNpZmRlZiBDT05GSUdfQVJNXzMyCj4gICAgICAgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgMCkg
PSBjcHUwX3BndGFibGU7Cj4gQEAgLTc3Nyw5ICs3ODcsNyBAQCBpbnQgaW5pdF9zZWNvbmRhcnlf
cGFnZXRhYmxlcyhpbnQgY3B1KQo+ICAgLyogTU1VIHNldHVwIGZvciBzZWNvbmRhcnkgQ1BVUyAo
d2hpY2ggYWxyZWFkeSBoYXZlIHBhZ2luZyBlbmFibGVkKSAqLwo+ICAgdm9pZCBtbXVfaW5pdF9z
ZWNvbmRhcnlfY3B1KHZvaWQpCj4gICB7Cj4gLSAgICAvKiBGcm9tIG5vdyBvbiwgbm8gbWFwcGlu
ZyBtYXkgYmUgYm90aCB3cml0YWJsZSBhbmQgZXhlY3V0YWJsZS4gKi8KPiAtICAgIFdSSVRFX1NZ
U1JFRzMyKFJFQURfU1lTUkVHMzIoU0NUTFJfRUwyKSB8IFNDVExSX1dYTiwgU0NUTFJfRUwyKTsK
PiAtICAgIGZsdXNoX3hlbl90ZXh0X3RsYl9sb2NhbCgpOwo+ICsgICAgeGVuX3B0X2VuZm9yY2Vf
d254KCk7Cj4gICB9Cj4gICAKPiAgICNpZmRlZiBDT05GSUdfQVJNXzMyCj4gCgpXaXRoIG1pbm9y
IG5vdGVzLAoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5j
b20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
