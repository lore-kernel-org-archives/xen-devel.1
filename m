Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7403DC282DD
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:14:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42502206A3
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfN5ulUY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42502206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIrUu-0006vN-Pf; Tue, 23 Apr 2019 09:13:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dq19=SZ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hIrUt-0006vD-Hb
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:13:51 +0000
X-Inumbo-ID: 1ad26d7e-65a8-11e9-92d7-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1ad26d7e-65a8-11e9-92d7-bc764e045a96;
 Tue, 23 Apr 2019 09:13:49 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u17so11156066lfi.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2019 02:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TWIXKU9kG4Z26IecblXvsYyLoBTCAcqqZGntDQ66oxs=;
 b=mfN5ulUYm8D7fRDy88uxYlX/FcdhLbGHvJ6aBxyHYI1y+F/QO/LxX0LPGo4ZJpHWAy
 dA3bN96Az191VFgr7HGqOay3j6k/BeX17SFkCjglzkDOq4KMMWuEJW/ESpLZLhRH/70R
 p6VGHDbU/lpwrfbKOOnOaE2mn4wv5ErolOa7NNtmzOTkoboIe4L0uoF1o6naZ3GCdiey
 NmKaRZY7Idgp9Zuoq48Tl4pvAgKBOKoKqGyvfqPROQg5idUvnPxOuy2NzDvBX+X8Nz2U
 y7umw4buZcgpYYOZOPVV10JlU5rlxQEjIDtqmq/t8vIscbzI3BvMqlY6q3PhVZyP0RKR
 4GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TWIXKU9kG4Z26IecblXvsYyLoBTCAcqqZGntDQ66oxs=;
 b=C0VPKoYeGlWNPkkAsGiTU74TYdSgi/cqufPfYaLtJezRjeCSYMnIZUVxrb+w0GCdgE
 B4aDVN2yd/VDZWPhy1tP/ullNXro8d0oASPtEqmwtmrSeqbSnTubIxUBsEO5MERyyumm
 ikj6mASfcaaT9Pfc9PmJB+G++panIOLQVj6UWBHLf6D6mLr5bCZxVmTxJbmXR9kziS4W
 ALUFhOoYECSIeARkC5I1IuabZNUBi8oaAZCW1muMEa+2sH5Zw41d1mBiHEqm8igkn9xR
 sAGc7VS6U6NeMKnucGtzweDJsyqqlLGw4Xw+uVcbkSwrLG8rvRSOk8SoakU0hrSYuxPx
 4Oag==
X-Gm-Message-State: APjAAAW5OGz4Cb/8bYQam2449G/1xkUGGD9HXz5HnGu7lG/unbANgz6b
 GXvwvcFCvOcBzkOpsdZjbdE=
X-Google-Smtp-Source: APXvYqzv5uvSVL0nIiTucfBzzbveZT2mmrFgq9zl+8mzEouqwXcCUEXdf1VV9QNXy4jY7mQpSH5yxw==
X-Received: by 2002:a19:f81a:: with SMTP id a26mr13264153lff.63.1556010828439; 
 Tue, 23 Apr 2019 02:13:48 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 g10sm3532704lfb.85.2019.04.23.02.13.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Apr 2019 02:13:47 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
Date: Tue, 23 Apr 2019 12:13:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155577388740.25746.3780283868034526234.stgit@wayrath>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423091345.WclEl37s-VX3CpR0szWi0WS501sHcsbmDY_nu8m20nY@z>

SGVsbG8gRGFyaW8sCgpPbiAyMC4wNC4xOSAxODoyNCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4g
SW4gc2NoZWR1bGUoKSwgaWYgd2UgcGljaywgYXMgdGhlIG5leHQgdmNwdSB0byBydW4gKG5leHQp
IHRoZSBzYW1lIG9uZQo+IHRoYXQgaXMgcnVubmluZyBhbHJlYWR5IChwcmV2KSwgd2UgbmV2ZXIg
Z2V0IHRvIGNhbGwgY29udGV4dF9zd2l0Y2goKS4KCkFuZCB3aGF0IGFib3V0IGBpZiAoIHByZXYg
IT0gY3VycmVudCApYCBpbiBhcm0vZG9tYWluLmM6c2NoZWR1bGVfdGFpbCgpID8KCj4gCj4gV2Ug
Y2FuLCB0aGVyZWZvcmUsIGdldCByaWQgb2YgYWxsIHRoZSBgaWZgLXMgdGVzdGluZyBwcmV2IGFu
ZCBuZXh0IGJlaW5nCj4gZGlmZmVyZW50LCB0cmFkaW5nIHRoZW0gd2l0aCBhbiBBU1NFUlQoKSAo
b24gQVJNLCB0aGUgQVNTRVJUKCkgd2FzIGV2ZW4KPiBhbHJlYWR5IHRoZXJlISk+IAo+IFNpZ25l
ZC1vZmYtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gU3VnZ2VzdGVk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpGb3IgYWxsIGJlbG93OgoKUmV2
aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgoKPiAtLS0K
PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ2M6ICJSb2dlciBQ
YXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbi5jIHwgICAgMyArLS0KPiAgIHhlbi9h
cmNoL3g4Ni9kb21haW4uYyB8ICAgMjIgKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKPiBpbmRl
eCA2ZGM2MzNlZDUwLi45MTVhZTBiNGM2IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21h
aW4uYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW4uYwo+IEBAIC0zNDMsOCArMzQzLDcgQEAg
dm9pZCBjb250ZXh0X3N3aXRjaChzdHJ1Y3QgdmNwdSAqcHJldiwgc3RydWN0IHZjcHUgKm5leHQp
Cj4gICAgICAgQVNTRVJUKHByZXYgIT0gbmV4dCk7Cj4gICAgICAgQVNTRVJUKCF2Y3B1X2NwdV9k
aXJ0eShuZXh0KSk7Cj4gICAKPiAtICAgIGlmICggcHJldiAhPSBuZXh0ICkKPiAtICAgICAgICB1
cGRhdGVfcnVuc3RhdGVfYXJlYShwcmV2KTsKPiArICAgIHVwZGF0ZV9ydW5zdGF0ZV9hcmVhKHBy
ZXYpOwo+ICAgCj4gICAgICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsKPiAgIAo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiBpbmRleCA5
ZWFhOTc4Y2U1Li5kMmQ5ZjJmYzNjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4u
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+IEBAIC0xNzIxLDYgKzE3MjEsNyBAQCB2
b2lkIGNvbnRleHRfc3dpdGNoKHN0cnVjdCB2Y3B1ICpwcmV2LCBzdHJ1Y3QgdmNwdSAqbmV4dCkK
PiAgICAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpwcmV2ZCA9IHByZXYtPmRvbWFpbiwgKm5leHRk
ID0gbmV4dC0+ZG9tYWluOwo+ICAgICAgIHVuc2lnbmVkIGludCBkaXJ0eV9jcHUgPSBuZXh0LT5k
aXJ0eV9jcHU7Cj4gICAKPiArICAgIEFTU0VSVChwcmV2ICE9IG5leHQpOwo+ICAgICAgIEFTU0VS
VChsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKPiAgIAo+ICAgICAgIGdldF9jcHVfaW5mbygpLT51
c2VfcHZfY3IzID0gZmFsc2U7Cj4gQEAgLTE3MzIsMTIgKzE3MzMsOSBAQCB2b2lkIGNvbnRleHRf
c3dpdGNoKHN0cnVjdCB2Y3B1ICpwcmV2LCBzdHJ1Y3QgdmNwdSAqbmV4dCkKPiAgICAgICAgICAg
Zmx1c2hfbWFzayhjcHVtYXNrX29mKGRpcnR5X2NwdSksIEZMVVNIX1ZDUFVfU1RBVEUpOwo+ICAg
ICAgIH0KPiAgIAo+IC0gICAgaWYgKCBwcmV2ICE9IG5leHQgKQo+IC0gICAgewo+IC0gICAgICAg
IF91cGRhdGVfcnVuc3RhdGVfYXJlYShwcmV2KTsKPiAtICAgICAgICB2cG11X3N3aXRjaF9mcm9t
KHByZXYpOwo+IC0gICAgICAgIG5wMm1fc2NoZWR1bGUoTlAyTV9TQ0hFRExFX09VVCk7Cj4gLSAg
ICB9Cj4gKyAgICBfdXBkYXRlX3J1bnN0YXRlX2FyZWEocHJldik7Cj4gKyAgICB2cG11X3N3aXRj
aF9mcm9tKHByZXYpOwo+ICsgICAgbnAybV9zY2hlZHVsZShOUDJNX1NDSEVETEVfT1VUKTsKPiAg
IAo+ICAgICAgIGlmICggaXNfaHZtX2RvbWFpbihwcmV2ZCkgJiYgIWxpc3RfZW1wdHkoJnByZXYt
PmFyY2guaHZtLnRtX2xpc3QpICkKPiAgICAgICAgICAgcHRfc2F2ZV90aW1lcihwcmV2KTsKPiBA
QCAtMTc5NCwxNCArMTc5MiwxMCBAQCB2b2lkIGNvbnRleHRfc3dpdGNoKHN0cnVjdCB2Y3B1ICpw
cmV2LCBzdHJ1Y3QgdmNwdSAqbmV4dCkKPiAgIAo+ICAgICAgIGNvbnRleHRfc2F2ZWQocHJldik7
Cj4gICAKPiAtICAgIGlmICggcHJldiAhPSBuZXh0ICkKPiAtICAgIHsKPiAtICAgICAgICBfdXBk
YXRlX3J1bnN0YXRlX2FyZWEobmV4dCk7Cj4gLQo+IC0gICAgICAgIC8qIE11c3QgYmUgZG9uZSB3
aXRoIGludGVycnVwdHMgZW5hYmxlZCAqLwo+IC0gICAgICAgIHZwbXVfc3dpdGNoX3RvKG5leHQp
Owo+IC0gICAgICAgIG5wMm1fc2NoZWR1bGUoTlAyTV9TQ0hFRExFX0lOKTsKPiAtICAgIH0KPiAr
ICAgIF91cGRhdGVfcnVuc3RhdGVfYXJlYShuZXh0KTsKPiArICAgIC8qIE11c3QgYmUgZG9uZSB3
aXRoIGludGVycnVwdHMgZW5hYmxlZCAqLwo+ICsgICAgdnBtdV9zd2l0Y2hfdG8obmV4dCk7Cj4g
KyAgICBucDJtX3NjaGVkdWxlKE5QMk1fU0NIRURMRV9JTik7Cj4gICAKPiAgICAgICAvKiBFbnN1
cmUgdGhhdCB0aGUgdmNwdSBoYXMgYW4gdXAtdG8tZGF0ZSB0aW1lIGJhc2UuICovCj4gICAgICAg
dXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUobmV4dCk7Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAo+IAoKLS0gClNpbmNlcmVseSwKQW5kcmlp
IEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
