Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2361C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 16:24:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAFB72082E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 16:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XoWiOkCn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAFB72082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEG11-0008Qg-QT; Wed, 10 Apr 2019 16:23:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7gEf=SM=linaro.org=ard.biesheuvel@srs-us1.protection.inumbo.net>)
 id 1hEG10-0008Q9-6C
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 16:23:58 +0000
X-Inumbo-ID: 09d502fd-5bad-11e9-92d7-bc764e045a96
Received: from mail-it1-x141.google.com (unknown [2607:f8b0:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 09d502fd-5bad-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 16:23:56 +0000 (UTC)
Received: by mail-it1-x141.google.com with SMTP id q14so4464601itk.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2019 09:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6aKDAebWE+f/lnzkJYvzNl9pEUt0AFH8/qZpPrqDDs=;
 b=XoWiOkCn33U9aT/IYQMkfuyUBCnJYQL1i0bSd7H15xyE9/Np1sZ7dxPEOEGsi2NgwU
 lQKbVOfseQRXHi7viN2BrmpxJLWQj4LaZCucP2aK346j4pzJikBAkNLwoeSHJ3REgT/8
 9NcFAXIRYK9W61+PiiTvIamWCkmRff1aEdP3qjTVWqMDQBaW73hpa9QjiOy8+0DaGqRn
 dIIld7ta5nZfriodEIWAfeDEdywuWuWCzrGuOS4NMXFVRXqEnRM0DOXIPvNU+IVLA3/X
 cPXygItL1o/eD97uI5HYtHYQsUMfgVxLQb5Es5cID6GIFaGmVfLaNISyJ0Wq32pMVYAS
 W61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6aKDAebWE+f/lnzkJYvzNl9pEUt0AFH8/qZpPrqDDs=;
 b=gXe9bGE2jfv9pg/FbeSoL6kbOooJGXVMmXeQ8UH9075oAvbL2uQ+pOAIavMIkJfwTE
 iWZEx3NG/wa/yTw8Ktz6Vrf+tRvkBQAQdSFeCsHo7J7hSPklel/p+CAjwhglLhIcHJev
 5RWvxo0mYUPihY3sXZWh/QUvftvWZWmFgZihxwUeP6d5bL0r+Rc+bFlB9q86hg+npA7q
 m+Vr+WRpCiOaAdx4ZJ18M4qV04EmT0yM0X29ndDN9JlBdUigMUD4Fe/+aR2AlTrKkwKo
 Dm9OXgkfyHmGhBLUQAGNkygBpQOhYlNA6jKxPNpqBtj8OCwz/xLgZiQLyJbWIsjbIuym
 m1/g==
X-Gm-Message-State: APjAAAXmUuTcOiaWkkl6o5z1RiN1XP0aoMKG3DSQoTWldtZVHQD3+psB
 nDBWXPH69YlKEa0jRVGl8RlL6NHLFzR/Lqlkpbm+DA==
X-Google-Smtp-Source: APXvYqx2s5BtCJaQ914Gr4Wg8iFD1VKtSx/ChNckAUNzbsBmhuQJP+bEP49cnkBNg5jTcw7Sx9nmYCA3uNkrE+D/Vd4=
X-Received: by 2002:a05:660c:2c5:: with SMTP id
 j5mr3925115itd.154.1554913435980; 
 Wed, 10 Apr 2019 09:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190410125809.21985-1-lersek@redhat.com>
In-Reply-To: <20190410125809.21985-1-lersek@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 10 Apr 2019 09:23:46 -0700
Message-ID:
 <CAKv+Gu-=_xdCbQ3kdXmbuQQt2sw03m-ikDBCxUgCFfQ=E94y4w@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [Xen-devel] [PATCH 0/4] OvmfPkg: replace MIT license blocks
 with SPDX IDs
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
 Jordan Justen <jordan.l.justen@intel.com>,
 edk2-devel-groups-io <devel@edk2.groups.io>,
 Julien Grall <julien.grall@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410162346.6UJno5m5JxWPbky1Dk5u-hK4Rk2PmOU54FDp_rcvgXI@z>

T24gV2VkLCAxMCBBcHIgMjAxOSBhdCAwNTo1OCwgTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPiBSZXBvOiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9sZXJzZWsvZWRrMi5n
aXQKPiBCcmFuY2g6IG92bWZfc3BkeF9taXQKPgo+IEZvciA8aHR0cHM6Ly9idWd6aWxsYS50aWFu
b2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xMzczPiwgd2UgcmVwbGFjZWQKPiBvcGVuLWNvZGVk
IGxpY2Vuc2UgdGV4dCBibG9ja3Mgd2l0aCAiU1BEWC1MaWNlbnNlLUlkZW50aWZpZXIicywgYWxt
b3N0Cj4gYWxsIG92ZXIgdGhlIGVkazIgdHJlZS4KPgo+IFRoYXQgY2hhbmdlIGhvd2V2ZXIgd2Fz
IHRpZWQgdG8gYSBsaWNlbnNlIHVwZGF0ZSAvIENMQSB1cGRhdGUgdG9vCj4gKHBsZWFzZSBzZWUg
ZGV0YWlscyBpbiBUaWFub0NvcmUjMTM3MywgcmVmZXJlbmNlZCBhYm92ZSksIGFuZCB0aGVyZWZv
cmUKPiB0aGUgTUlULWNvdmVyZWQgZmlsZXMgdW5kZXIgT3ZtZlBrZyB3ZXJlIG91dCBvZiBzY29w
ZS4gV2UgZmlsZWQgYQo+IHJlbWluZGVyIGF0IDxodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5v
cmcvc2hvd19idWcuY2dpP2lkPTE2NTQ+LCBhbmQKPiB0aGlzIHNlcmllcyBpbnRlbmRzIHRvIGFk
ZHJlc3MgdGhhdCAtLSBpLmUuLCB0byByZXBsYWNlIHRoZSBNSVQgbGljZW5zZQo+IGJsb2NrcyB3
aXRoIHRoZSBjb3JyZXNwb25kaW5nIFNQRFggTGljZW5zZSBJRHMuCj4KPiBDYzogQW50aG9ueSBQ
ZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gQ2M6IEFyZCBCaWVzaGV1dmVsIDxh
cmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgo+IENjOiBKb3JkYW4gSnVzdGVuIDxqb3JkYW4ubC5q
dXN0ZW5AaW50ZWwuY29tPgo+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
Pgo+IENjOiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+Cj4gVGhhbmtzLAo+IExhc3psbwo+Cj4gTGFzemxvIEVy
c2VrICg0KToKPiAgIE92bWZQa2cvTGljZW5zZS50eHQ6IHJlbW92ZSBYZW5QdkJsa0R4ZSBmcm9t
IHRoZSBNSVQgbGljZW5zZWQgZGlyIGxpc3QKPiAgIE92bWZQa2cvTGljZW5zZS50eHQ6IHJlZnJl
c2ggdGhlIE1JVCBsaWNlbnNlIHRleHQgYW5kIGluY2x1ZGUgdGhlIFNQRFgKPiAgICAgSUQKPiAg
IE92bWZQa2cvSW5kdXN0cnlTdGFuZGFyZC9YZW46IHJlcGxhY2UgTUlUIGxpY2Vuc2UgdGV4dCB3
aXRoIFNQRFggSUQKPiAgIE92bWZQa2cvWGVuQnVzRHhlOiByZXBsYWNlIE1JVCBsaWNlbnNlIHRl
eHQgd2l0aCBTUERYIElECj4KCkZvciB0aGUgc2VyaWVzCgpSZXZpZXdlZC1ieTogQXJkIEJpZXNo
ZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+Cgo+ICBPdm1mUGtnL0luY2x1ZGUvSW5k
dXN0cnlTdGFuZGFyZC9YZW4vYXJjaC1hcm0veGVuLmggICAgICAgIHwgMTggKy0tLS0tLS0tLS0t
LS0tLS0tCj4gIE92bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9hcmNoLXg4Ni94
ZW4teDg2XzMyLmggfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KPiAgT3ZtZlBrZy9JbmNsdWRlL0lu
ZHVzdHJ5U3RhbmRhcmQvWGVuL2FyY2gteDg2L3hlbi14ODZfNjQuaCB8IDE4ICstLS0tLS0tLS0t
LS0tLS0tLQo+ICBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vYXJjaC14ODYv
eGVuLmggICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCj4gIE92bWZQa2cvSW5jbHVkZS9J
bmR1c3RyeVN0YW5kYXJkL1hlbi9ldmVudF9jaGFubmVsLmggICAgICAgfCAxOCArLS0tLS0tLS0t
LS0tLS0tLS0KPiAgT3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL2dyYW50X3Rh
YmxlLmggICAgICAgICB8IDE4ICstLS0tLS0tLS0tLS0tLS0tLQo+ICBPdm1mUGtnL0luY2x1ZGUv
SW5kdXN0cnlTdGFuZGFyZC9YZW4vaHZtL2h2bV9vcC5oICAgICAgICAgIHwgMTggKy0tLS0tLS0t
LS0tLS0tLS0tCj4gIE92bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9odm0vcGFy
YW1zLmggICAgICAgICAgfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KPiAgT3ZtZlBrZy9JbmNsdWRl
L0luZHVzdHJ5U3RhbmRhcmQvWGVuL2lvL2Jsa2lmLmggICAgICAgICAgICB8IDE4ICstLS0tLS0t
LS0tLS0tLS0tLQo+ICBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vaW8vY29u
c29sZS5oICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCj4gIE92bWZQa2cvSW5jbHVk
ZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9pby9wcm90b2NvbHMuaCAgICAgICAgfCAxOCArLS0tLS0t
LS0tLS0tLS0tLS0KPiAgT3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL2lvL3Jp
bmcuaCAgICAgICAgICAgICB8IDE4ICstLS0tLS0tLS0tLS0tLS0tLQo+ICBPdm1mUGtnL0luY2x1
ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vaW8veGVuYnVzLmggICAgICAgICAgIHwgMTggKy0tLS0t
LS0tLS0tLS0tLS0tCj4gIE92bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9pby94
c193aXJlLmggICAgICAgICAgfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KPiAgT3ZtZlBrZy9JbmNs
dWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL21lbW9yeS5oICAgICAgICAgICAgICB8IDE4ICstLS0t
LS0tLS0tLS0tLS0tLQo+ICBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4veGVu
LWNvbXBhdC5oICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCj4gIE92bWZQa2cvSW5j
bHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi94ZW4uaCAgICAgICAgICAgICAgICAgfCAxOCArLS0t
LS0tLS0tLS0tLS0tLS0KPiAgT3ZtZlBrZy9MaWNlbnNlLnR4dCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIE92bWZQa2cvWGVuQnVzRHhlL1hl
bkJ1cy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxOCArLS0tLS0tLS0tLS0t
LS0tLS0KPiAgT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDE4ICstLS0tLS0tLS0tLS0tLS0tLQo+ICBPdm1mUGtnL1hlbkJ1c0R4ZS9Y
ZW5TdG9yZS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0t
LS0tLS0tCj4gIDIxIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDM0MyBkZWxldGlv
bnMoLSkKPgo+IC0tCj4gMi4xOS4xLjMuZzMwMjQ3YWE1ZDIwMQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
