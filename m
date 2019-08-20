Return-Path: <SRS0=Pr8P=WQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450EEC3A589
	for <xen-devel@archiver.kernel.org>; Tue, 20 Aug 2019 15:28:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2877206BB
	for <xen-devel@archiver.kernel.org>; Tue, 20 Aug 2019 15:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQY0jQrg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2877206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i063O-0007ML-68; Tue, 20 Aug 2019 15:28:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3t4G=WQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i063M-0007MG-CY
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 15:28:08 +0000
X-Inumbo-ID: 1bc7a104-c35f-11e9-98ec-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bc7a104-c35f-11e9-98ec-bc764e2007e4;
 Tue, 20 Aug 2019 15:28:07 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id x3so4466438lfc.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2019 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1ube4zZAKmPHiNv6iHyoquI/I9AF+l22MF8LTCL51ok=;
 b=CQY0jQrgxKQNXU00aW2nCNX/P2Fhv/OBqQzdek6MllZPuqFfA4FSbSgzJtCVrT596O
 mSdVYe96eC15oefaLUyLfk6zFr+G6sMv3MnJX0Nv+Sx5A+f3NDWKP6dMQWdY5LDnAHf6
 LNrDyKO8iSVLACy+xJG9dreYkiJSvEbfAgKdplxeZGpb9YM65M206H/pSrGezqH1+pjC
 egS8hgDwarRaGgwpabQwif3zaCZV7dwkff+YkhO9NW83sBdna8iy1h9yt70VQauAN7zB
 GvAEWI7EsBV1nJCDbNeazkVCFHMi4U4tcHc+K1E4U+Ows4rqenQ6kvGGx6odEMjsI+Gv
 GRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1ube4zZAKmPHiNv6iHyoquI/I9AF+l22MF8LTCL51ok=;
 b=nNdI154vQNgiT2XYMfCJ52Nr+km6g75JqycbLjV823r8IJQDMpGkpO9KqE233qpKRe
 RcSmVvaaP/zNQrI7LhJ/h10us5pmstyYFqC6yeS9Hd8+kdzNq5pxK2VwGcoZu2odWl8p
 iCvzE0hy+q4aD8kA53vsccyL/ZZNz13/mLuUVR4PdgNACkKs7/L60+wx6YQ7HebRokif
 dVwjcIBnSqSy5AvQ/6fXPZTZAm4PMjR4N/Ny5+tp6x+O4pMHFHWwh8RW7z3TlUeuHrds
 uG644aozzUj6sIU7qmaHOxq9kwVye6u/6to6i1Ukf1uGZT4tJI5xRAAtPeoZRhBO8J3W
 qhLg==
X-Gm-Message-State: APjAAAU9KiwR/s7FbZtA6DEdhJ68NX/3qH3+DfnvJePZNGy/JXX2tgRo
 xcMtktQpqF1HfvPe/K6BNVg=
X-Google-Smtp-Source: APXvYqzvYNEsjWHRQAl0IHonvJF9N+ZNqV0S6OqkDM+h7AdKQf+WSPEPXHOIrAYheOUUrWW3v4o/Hg==
X-Received: by 2002:ac2:46ea:: with SMTP id q10mr15382516lfo.118.1566314886251; 
 Tue, 20 Aug 2019 08:28:06 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id t16sm2989709ljj.54.2019.08.20.08.28.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 08:28:05 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
 <20190819174338.10466-8-sstabellini@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4be7e616-e36f-c14f-6ec3-7ef148cb98ca@gmail.com>
Date: Tue, 20 Aug 2019 18:28:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819174338.10466-8-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 8/8] xen/arm: add reserved-memory regions
 to the dom0 memory node
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE5LjA4LjE5IDIwOjQzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6CgpIaSBTdGVmYW5v
Cgo+IFJlc2VydmVkIG1lbW9yeSByZWdpb25zIGFyZSBhdXRvbWF0aWNhbGx5IHJlbWFwcGVkIHRv
IGRvbTAuIFRoZWlyIGRldmljZQo+IHRyZWUgbm9kZXMgYXJlIGFsc28gYWRkZWQgdG8gZG9tMCBk
ZXZpY2UgdHJlZS4gSG93ZXZlciwgdGhlIGRvbTAgbWVtb3J5Cj4gbm9kZSBpcyBub3QgY3VycmVu
dGx5IGV4dGVuZGVkIHRvIGNvdmVyIHRoZSByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucwo+IHJhbmdl
cyBhcyByZXF1aXJlZCBieSB0aGUgc3BlYy4gIFRoaXMgY29tbWl0IGZpeGVzIGl0Lgo+Cj4gQ2hh
bmdlIG1ha2VfbWVtb3J5X25vZGUgdG8gdGFrZSBhICBzdHJ1Y3QgbWVtaW5mbyAqIGluc3RlYWQg
b2YgYQo+IGtlcm5lbF9pbmZvLiBDYWxsIGl0IHR3aWNlIGZvciBkb20wLCBvbmNlIHRvIGNyZWF0
ZSB0aGUgZmlyc3QgcmVndWxhcgo+IG1lbW9yeSBub2RlLCBhbmQgdGhlIHNlY29uZCB0aW1lIHRv
IGNyZWF0ZSBhIHNlY29uZCBtZW1vcnkgbm9kZSB3aXRoIHRoZQo+IHJhbmdlcyBjb3ZlcmluZyBy
ZXNlcnZlZC1tZW1vcnkgcmVnaW9ucy4KPgo+IEFsc28sIG1ha2UgYSBzbWFsbCBjb2RlIHN0eWxl
IGZpeCBpbiBtYWtlX21lbW9yeV9ub2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjU6Cj4gLSBhZGQgYWNrZWQt
YnkKPgo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBwYXNzIHN0cnVjdCBtZW1pbmZvICogdG8gbWFrZV9t
ZW1vcnlfbm9kZQo+IC0gY2FsbCBtYWtlX21lbW9yeV9ub2RlIHR3aWNlIGZvciBkb20wLCBvbmNl
IGZvciBub3JtYWwgbWVtb3J5LCBvbmNlIGZvcgo+ICAgIHJlc2VydmVkLW1lbW9yeSByZWdpb25z
Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyMiArKysrKysrKysrKysr
KystLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCBiNDI2MGYxZmMyLi4zMDYxODBkOGNiIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC02MzksMTEgKzYzOSwxMSBAQCBzdGF0aWMgaW50IF9f
aW5pdCBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyh2b2lkICpmZHQsIGdpY19pbnRlcnJ1cHRfdCAq
aW50ciwKPiAgIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfbWVtb3J5X25vZGUoY29uc3Qgc3RydWN0
IGRvbWFpbiAqZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAq
ZmR0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgYWRkcmNlbGxz
LCBpbnQgc2l6ZWNlbGxzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IG1lbWluZm8gKm1lbSkKPiAgIHsKPiAgICAgICBpbnQgcmVzLCBp
Owo+ICAgICAgIGludCByZWdfc2l6ZSA9IGFkZHJjZWxscyArIHNpemVjZWxsczsKPiAtICAgIGlu
dCBucl9jZWxscyA9IHJlZ19zaXplKmtpbmZvLT5tZW0ubnJfYmFua3M7Cj4gKyAgICBpbnQgbnJf
Y2VsbHMgPSByZWdfc2l6ZSAqIG1lbS0+bnJfYmFua3M7Cj4gICAgICAgX19iZTMyIHJlZ1tOUl9N
RU1fQkFOS1MgKiA0IC8qIFdvcnN0IGNhc2UgYWRkcmNlbGxzICsgc2l6ZWNlbGxzICovXTsKPiAg
ICAgICBfX2JlMzIgKmNlbGxzOwo+ICAgCj4gQEAgLTY2MiwxMCArNjYyLDEwIEBAIHN0YXRpYyBp
bnQgX19pbml0IG1ha2VfbWVtb3J5X25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwKPiAgICAg
ICAgICAgcmV0dXJuIHJlczsKPiAgIAo+ICAgICAgIGNlbGxzID0gJnJlZ1swXTsKPiAtICAgIGZv
ciAoIGkgPSAwIDsgaSA8IGtpbmZvLT5tZW0ubnJfYmFua3M7IGkrKyApCj4gKyAgICBmb3IgKCBp
ID0gMCA7IGkgPCBtZW0tPm5yX2JhbmtzOyBpKysgKQo+ICAgICAgIHsKPiAtICAgICAgICB1NjQg
c3RhcnQgPSBraW5mby0+bWVtLmJhbmtbaV0uc3RhcnQ7Cj4gLSAgICAgICAgdTY0IHNpemUgPSBr
aW5mby0+bWVtLmJhbmtbaV0uc2l6ZTsKPiArICAgICAgICB1NjQgc3RhcnQgPSBtZW0tPmJhbmtb
aV0uc3RhcnQ7Cj4gKyAgICAgICAgdTY0IHNpemUgPSBtZW0tPmJhbmtbaV0uc2l6ZTsKPiAgIAo+
ICAgICAgICAgICBkdF9kcHJpbnRrKCIgIEJhbmsgJWQ6ICUjIlBSSXg2NCItPiUjIlBSSXg2NCJc
biIsCj4gICAgICAgICAgICAgICAgICAgICAgaSwgc3RhcnQsIHN0YXJ0ICsgc2l6ZSk7Cj4gQEAg
LTE0ODYsMTAgKzE0ODYsMTggQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX25vZGUoc3RydWN0
IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKPiAgICAgICAgICAgaWYgKCBy
ZXMgKQo+ICAgICAgICAgICAgICAgcmV0dXJuIHJlczsKPiAgIAo+IC0gICAgICAgIHJlcyA9IG1h
a2VfbWVtb3J5X25vZGUoZCwga2luZm8tPmZkdCwgYWRkcmNlbGxzLCBzaXplY2VsbHMsIGtpbmZv
KTsKPiArICAgICAgICByZXMgPSBtYWtlX21lbW9yeV9ub2RlKGQsIGtpbmZvLT5mZHQsIGFkZHJj
ZWxscywgc2l6ZWNlbGxzLCAma2luZm8tPm1lbSk7Cj4gICAgICAgICAgIGlmICggcmVzICkKPiAg
ICAgICAgICAgICAgIHJldHVybiByZXM7Cj4gICAKPiArICAgICAgICAvKgo+ICsgICAgICAgICAq
IENyZWF0ZSBhIHNlY29uZCBtZW1vcnkgbm9kZSB0byBzdG9yZSB0aGUgcmFuZ2VzIGNvdmVyaW5n
Cj4gKyAgICAgICAgICogcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMuCj4gKyAgICAgICAgICovCj4g
KyAgICAgICAgcmVzID0gbWFrZV9tZW1vcnlfbm9kZShkLCBraW5mby0+ZmR0LCBhZGRyY2VsbHMs
IHNpemVjZWxscywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZib290aW5mby5y
ZXNlcnZlZF9tZW0pOwo+ICsgICAgICAgIGlmICggcmVzICkKPiArICAgICAgICAgICAgcmV0dXJu
IHJlczsKPiAgICAgICB9Cj4gICAKPiAgICAgICByZXMgPSBmZHRfZW5kX25vZGUoa2luZm8tPmZk
dCk7Cj4gQEAgLTE3NDUsNyArMTc1Myw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHByZXBhcmVfZHRi
X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykKPiAgICAg
ICBpZiAoIHJldCApCj4gICAgICAgICAgIGdvdG8gZXJyOwo+ICAgCj4gLSAgICByZXQgPSBtYWtl
X21lbW9yeV9ub2RlKGQsIGtpbmZvLT5mZHQsIGFkZHJjZWxscywgc2l6ZWNlbGxzLCBraW5mbyk7
Cj4gKyAgICByZXQgPSBtYWtlX21lbW9yeV9ub2RlKGQsIGtpbmZvLT5mZHQsIGFkZHJjZWxscywg
c2l6ZWNlbGxzLCAma2luZm8tPm1lbSk7Cj4gICAgICAgaWYgKCByZXQgKQo+ICAgICAgICAgICBn
b3RvIGVycjsKCkkgZG9uJ3QgcmVhbGx5IGtub3cgd2hldGhlciBpdCBpcyBhbiBpc3N1ZSB3ZSBz
aG91bGQgd29ycnkgYWJvdXQsIGJ1dCBJIApub3RpY2VkIHRoYXQgZG9tMCAoTGludXggNC4xNCkg
cmVwb3J0ZWQgdGhlIGZvbGxvd2luZzoKCk9GOiBEdXBsaWNhdGUgbmFtZSBpbiBiYXNlLCByZW5h
bWVkIHRvICJtZW1vcnkjMSIKCi0tLS0tLS0tLS0KCldoZW4gSSB3YXMgdHJ5aW5nIHRvIHJldHJp
ZXZlIHJlc3VsdGluZyBkb20wIGRldmljZSB0cmVlIG9uIGEgdGFyZ2V0IEkgCmdvdCBhbiBlcnJv
cjoKCmR0YyAtSSBmcyAtTyBkdHMgLW8gZG9tMC5kdHMgL3N5cy9maXJtd2FyZS9kZXZpY2V0cmVl
L2Jhc2UKZG9tMC5kdHM6IEVSUk9SIChuYW1lX3Byb3BlcnRpZXMpOiAibmFtZSIgcHJvcGVydHkg
aW4gL21lbW9yeSMxIGlzIAppbmNvcnJlY3QgKCJtZW1vcnkiIGluc3RlYWQgb2YgYmFzZSBub2Rl
IG5hbWUpCkVSUk9SOiBJbnB1dCB0cmVlIGhhcyBlcnJvcnMsIGFib3J0aW5nICh1c2UgLWYgdG8g
Zm9yY2Ugb3V0cHV0KQoKCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
