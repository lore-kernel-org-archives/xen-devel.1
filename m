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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B2AC10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:48:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97D5D20843
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:48:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH1kQJ01"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97D5D20843
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIs2N-0001ac-PD; Tue, 23 Apr 2019 09:48:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dq19=SZ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hIs2M-0001aW-9X
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:48:26 +0000
X-Inumbo-ID: efe456a5-65ac-11e9-92d7-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id efe456a5-65ac-11e9-92d7-bc764e045a96;
 Tue, 23 Apr 2019 09:48:25 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w23so11213286lfc.9
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2019 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DKdpoyshBkEBlJnVmP1JeiVwol84VM4NBFYM2t/Qdok=;
 b=nH1kQJ01v41DEepPCEvt47dnll4rpR3hiUbm8/zbqH4GfhfUyCs+AZcmBc3frYLcto
 112ZkJHljhlCsX/pmxYuv/nbW+PwWqMMSGl0eTMJu8hiMRdRwNJIltcQpdm/n5Cx0tpN
 uNqCaIa3Pdq/rOb3lBFIYuX9jQtmSSfTfXprDW7cyVgxH5i7MHH24ZRmMUe1DgSC+hQ7
 giquc2XjNAvrRHX3UMEzBFTC6/I6G/5pxBgk24/AwFRMAcu1ChSTfVgTqw95mPghig34
 8vhwX6LtZ2jPz8N/BN6snmeLvqtczM48NKZjkM+pvsNewqFPP9WCnjJglsznOXKex9MT
 Vz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DKdpoyshBkEBlJnVmP1JeiVwol84VM4NBFYM2t/Qdok=;
 b=fKpaqIX34+a9+9M7ploPD7D6jU67GjkWZ7nsoF7rqD7s7ynV8w1P4IgLSaS3yI8pYw
 nhr6CdpGQ69+lNOBBdVFRQOW9Tt4lUOG7qMcgM4wcDiGuj2IsjK8JQk3TyMWzx4tBZvr
 aTRdFAZMOFiYUaaFOXEjnTt9AUDpKxMzvxtF1hT3M4jqI1h6QUTBdCtDFkxDMSwhmkyZ
 fwasv2VW8m3ig3m80M9kOuHA2m4vipS+/3GHKPfB0/hswhXkMPoG9zrirVqE1EMvlMIn
 NxgmsFS4Dq/CtFNr+pyQKBuxmthAYInts0GT8XKqhEV3K45oJul1rCco24xNqR4yj6EN
 EDVA==
X-Gm-Message-State: APjAAAXeN+wvqHxTCZD4G+Cutp0CcFsNmjHEfxg7FOjTlt8yCTZQS0gC
 uEHdf6mxxCLnlp9LDzIVTRE=
X-Google-Smtp-Source: APXvYqzSJAJCYc9pHC4PoNVrIzTJ1JcQEp7vtSt8SJaZCyQumCLbIWDdUfX5Iv6b530ljzYEfEgx4w==
X-Received: by 2002:ac2:5609:: with SMTP id v9mr12781619lfd.159.1556012903929; 
 Tue, 23 Apr 2019 02:48:23 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 1sm3232101ljw.56.2019.04.23.02.48.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Apr 2019 02:48:22 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388014.25746.13361382203794112287.stgit@wayrath>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <1c6052e6-bf76-e4c9-e7b7-779ee218818e@gmail.com>
Date: Tue, 23 Apr 2019 12:48:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155577388014.25746.13361382203794112287.stgit@wayrath>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen: credit2: avoid using
 cpumask_weight() in hot-paths
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423094821.zMJn2-Vf9iwezyQoKjdEIkszD0_0qpxaCjEjsqqIq1U@z>

SGVsbG8gRGFyaW8sCgpPbiAyMC4wNC4xOSAxODoyNCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4g
Y3B1bWFza193ZWlnaHQoKSBpcyBrbm93biB0byBiZSBleHBlbnNpdmUuIEluIENyZWRpdDIsIHdl
IHVzZSBpdCBpbgo+IGxvYWQtYmFsYW5jaW5nLCBidXQgb25seSBmb3Iga25vd2luZyBob3cgbWFu
eSBDUFVzIGFyZSBhY3RpdmUgaW4gYQo+IHJ1bnF1ZXVlLgo+IAo+IEtlZXBpbmcgc3VjaCBjb3Vu
dCBpbiBhbiBpbnRlZ2VyIGZpZWxkIG9mIHRoZSBwZXItcnVucXVldWUgZGF0YQo+IHN0cnVjdHVy
ZSB3ZSBoYXZlLCBjb21wbGV0ZWx5IGF2b2lkcyB0aGUgbmVlZCBmb3IgY3B1bWFza193ZWlnaHQo
KS4KPiAKPiBXaGlsZSB0aGVyZSwgcmVtb3ZlIGFzIG11Y2ggb3RoZXIgdXNlcyBvZiBpdCBhcyB3
ZSBjYW4sIGV2ZW4gaWYgbm90IGluCj4gaG90LXBhdGhzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERh
cmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gLS0tCj4gQ2M6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KPiAtLS0KPiAgIHhlbi9jb21tb24vc2No
ZWRfY3JlZGl0Mi5jIHwgICAyMSArKysrKysrKysrKysrKysrLS0tLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jCj4g
aW5kZXggNjk1OGIyNjVmYy4uNzAzNDMyNTI0MyAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3Nj
aGVkX2NyZWRpdDIuYwo+ICsrKyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jCj4gQEAgLTQ2
Niw2ICs0NjYsNyBAQCBzdHJ1Y3QgY3NjaGVkMl9ydW5xdWV1ZV9kYXRhIHsKPiAgICAgICBzcGlu
bG9ja190IGxvY2s7ICAgICAgICAgICAvKiBMb2NrIGZvciB0aGlzIHJ1bnF1ZXVlICAgICAgICAg
ICAgICAgICAgICAgKi8KPiAgIAo+ICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgcnVucTsgICAgIC8q
IE9yZGVyZWQgbGlzdCBvZiBydW5uYWJsZSB2bXMgICAgICAgICAgICAgICAqLwo+ICsgICAgaW50
IG5yX2NwdXM7ICAgICAgICAgICAgICAgLyogSG93IG1hbnkgQ1BVcyBhcmUgc2hhcmluZyB0aGlz
IHJ1bnF1ZXVlICAgICovCj4gICAgICAgaW50IGlkOyAgICAgICAgICAgICAgICAgICAgLyogSUQg
b2YgdGhpcyBydW5xdWV1ZSAoLTEgaWYgaW52YWxpZCkgICAgICAgICovCj4gICAKPiAgICAgICBp
bnQgbG9hZDsgICAgICAgICAgICAgICAgICAvKiBJbnN0YW50YW5lb3VzIGxvYWQgKG51bSBvZiBu
b24taWRsZSB2Y3B1cykgKi8KPiBAQCAtMjYxMyw4ICsyNjE0LDggQEAgcmV0cnk6Cj4gICAgICAg
ICAgIGlmICggc3Qub3JxZC0+Yl9hdmdsb2FkID4gbG9hZF9tYXggKQo+ICAgICAgICAgICAgICAg
bG9hZF9tYXggPSBzdC5vcnFkLT5iX2F2Z2xvYWQ7Cj4gICAKPiAtICAgICAgICBjcHVzX21heCA9
IGNwdW1hc2tfd2VpZ2h0KCZzdC5scnFkLT5hY3RpdmUpOwo+IC0gICAgICAgIGkgPSBjcHVtYXNr
X3dlaWdodCgmc3Qub3JxZC0+YWN0aXZlKTsKPiArICAgICAgICBjcHVzX21heCA9IHN0LmxycWQt
Pm5yX2NwdXM7Cj4gKyAgICAgICAgaSA9IHN0Lm9ycWQtPm5yX2NwdXM7Cj4gICAgICAgICAgIGlm
ICggaSA+IGNwdXNfbWF4ICkKPiAgICAgICAgICAgICAgIGNwdXNfbWF4ID0gaTsKPiAgIAo+IEBA
IC0zNjk3LDcgKzM2OTgsNyBAQCBjc2NoZWQyX2R1bXAoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAq
b3BzKQo+ICAgICAgICAgICAgICAgICAgIlx0aW5zdGxvYWQgICAgICAgICAgID0gJWRcbiIKPiAg
ICAgICAgICAgICAgICAgICJcdGF2ZWxvYWQgICAgICAgICAgICA9ICUiUFJJX3N0aW1lIiAofiUi
UFJJX3N0aW1lIiUlKVxuIiwKPiAgICAgICAgICAgICAgICAgIGksCj4gLSAgICAgICAgICAgICAg
IGNwdW1hc2tfd2VpZ2h0KCZwcnYtPnJxZFtpXS5hY3RpdmUpLAo+ICsgICAgICAgICAgICAgICBw
cnYtPnJxZFtpXS5ucl9jcHVzLAo+ICAgICAgICAgICAgICAgICAgbnJfY3B1X2lkcywgY3B1bWFz
a19iaXRzKCZwcnYtPnJxZFtpXS5hY3RpdmUpLAo+ICAgICAgICAgICAgICAgICAgcHJ2LT5ycWRb
aV0ubWF4X3dlaWdodCwKPiAgICAgICAgICAgICAgICAgIHBydi0+cnFkW2ldLnBpY2tfYmlhcywK
PiBAQCAtMzgxOCw2ICszODE5LDkgQEAgaW5pdF9wZGF0YShzdHJ1Y3QgY3NjaGVkMl9wcml2YXRl
ICpwcnYsIHN0cnVjdCBjc2NoZWQyX3BjcHUgKnNwYywKPiAgICAgICBfX2NwdW1hc2tfc2V0X2Nw
dShjcHUsICZwcnYtPmluaXRpYWxpemVkKTsKPiAgICAgICBfX2NwdW1hc2tfc2V0X2NwdShjcHUs
ICZycWQtPnNtdF9pZGxlKTsKPiAgIAo+ICsgICAgcnFkLT5ucl9jcHVzKys7Cj4gKyAgICBBU1NF
UlQoY3B1bWFza193ZWlnaHQoJnJxZC0+YWN0aXZlKSA9PSBycWQtPm5yX2NwdXMpOwo+ICsKPiAg
ICAgICAvKiBPbiB0aGUgYm9vdCBjcHUgd2UgYXJlIGNhbGxlZCBiZWZvcmUgY3B1X3NpYmxpbmdf
bWFzayBoYXMgYmVlbiBzZXQgdXAuICovCj4gICAgICAgaWYgKCBjcHUgPT0gMCAmJiBzeXN0ZW1f
c3RhdGUgPCBTWVNfU1RBVEVfYWN0aXZlICkKPiAgICAgICAgICAgX19jcHVtYXNrX3NldF9jcHUo
Y3B1LCAmY3NjaGVkMl9wY3B1KGNwdSktPnNpYmxpbmdfbWFzayk7Cj4gQEAgLTM4MjksOCArMzgz
MywxMSBAQCBpbml0X3BkYXRhKHN0cnVjdCBjc2NoZWQyX3ByaXZhdGUgKnBydiwgc3RydWN0IGNz
Y2hlZDJfcGNwdSAqc3BjLAo+ICAgICAgICAgICAgICAgICAgIF9fY3B1bWFza19zZXRfY3B1KHJj
cHUsICZjc2NoZWQyX3BjcHUoY3B1KS0+c2libGluZ19tYXNrKTsKPiAgICAgICAgICAgICAgIH0K
PiAgIAo+IC0gICAgaWYgKCBjcHVtYXNrX3dlaWdodCgmcnFkLT5hY3RpdmUpID09IDEgKQo+ICsg
ICAgaWYgKCBycWQtPm5yX2NwdXMgPT0gMSApCj4gKyAgICB7Cj4gKwlBU1NFUlQoY3B1bWFza193
ZWlnaHQoJnJxZC0+YWN0aXZlKSA9PSAxKTsKClBsZWFzZSBkbyBub3QgdXNlIGhhcmQgdGFicy4K
Cj4gICAgICAgICAgIHJxZC0+cGlja19iaWFzID0gY3B1Owo+ICsgICAgfQo+ICAgCj4gICAgICAg
cmV0dXJuIHNwYy0+cnVucV9pZDsKPiAgIH0KPiBAQCAtMzk0NCw4ICszOTUxLDEyIEBAIGNzY2hl
ZDJfZGVpbml0X3BkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgdm9pZCAqcGNwdSwg
aW50IGNwdSkKPiAgICAgICBfX2NwdW1hc2tfY2xlYXJfY3B1KGNwdSwgJnJxZC0+c210X2lkbGUp
Owo+ICAgICAgIF9fY3B1bWFza19jbGVhcl9jcHUoY3B1LCAmcnFkLT5hY3RpdmUpOwo+ICAgCj4g
LSAgICBpZiAoIGNwdW1hc2tfZW1wdHkoJnJxZC0+YWN0aXZlKSApCj4gKyAgICBycWQtPm5yX2Nw
dXMtLTsKPiArICAgIEFTU0VSVChjcHVtYXNrX3dlaWdodCgmcnFkLT5hY3RpdmUpID09IHJxZC0+
bnJfY3B1cyk7Cj4gKwo+ICsgICAgaWYgKCBycWQtPm5yX2NwdXMgPT0gMCApCj4gICAgICAgewo+
ICsJQVNTRVJUKGNwdW1hc2tfZW1wdHkoJnJxZC0+YWN0aXZlKSk7CgpEaXR0by4KCj4gICAgICAg
ICAgIHByaW50ayhYRU5MT0dfSU5GTyAiIE5vIGNwdXMgbGVmdCBvbiBydW5xdWV1ZSwgZGlzYWJs
aW5nXG4iKTsKPiAgICAgICAgICAgZGVhY3RpdmF0ZV9ydW5xdWV1ZShwcnYsIHNwYy0+cnVucV9p
ZCk7Cj4gICAgICAgfQo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWwKPiAKCldpdGggbml0cyBmaXhlZDoKClJldmlld2VkLWJ5OiBBbmRyaWkg
QW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFu
aXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
