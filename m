Return-Path: <SRS0=/O7i=SW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05CEC282DD
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 14:57:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C4D720833
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 14:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXWbwsss"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C4D720833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHrQB-0001mu-8B; Sat, 20 Apr 2019 14:56:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZYdr=SW=gmail.com=pgnet.dev@srs-us1.protection.inumbo.net>)
 id 1hHrQA-0001mp-Dn
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 14:56:50 +0000
X-Inumbo-ID: 8606d5c3-637c-11e9-92d7-bc764e045a96
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8606d5c3-637c-11e9-92d7-bc764e045a96;
 Sat, 20 Apr 2019 14:56:49 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id d31so3899535pgl.7
 for <xen-devel@lists.xenproject.org>; Sat, 20 Apr 2019 07:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X6O+DD5IHzyATV7lHu7BmwcF1VP97bQFpixXjpRxni8=;
 b=TXWbwsssfUgMTXDhnhzqifvgSU+zgHYCCPi5JquAnigA5IJducAHeINIaZkVQ/bqRX
 n+oLp7lXOqZVCkqNmbsxmEmXUEtxytlyTQ+geuRm4Y64Mg+ITl5+6kaM+IkoIvzELDow
 l6ubun5j0Yl3XrGAOkT1XwJAGJoXfaHAQjSbQRNnyCCoozwRrbcx1Z/8VL73QNjHuwzE
 wHNUEeQbB3eNs7SOy89lB+5fEEGgpLSj/Ihu4ZAfbzSvSnI+fePKrPaa201C5qbRbi91
 As8z1pi2sAL8ocj1jiVtXWDX6BSqqMwk0x0H6fc4P1XvRBWzNN/x7QgtGdlR3reYFk8K
 AXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=X6O+DD5IHzyATV7lHu7BmwcF1VP97bQFpixXjpRxni8=;
 b=sfYH/4mvm5xjPcuYE66X9WKrw/wg/ufUmGbT+4LG5RtSD8LcvL0Cjf1s0tg8cf0E8M
 jQVUCIrR4z4VfQrZ0fegkomeyfeTu1ffxo7poRXvySVQEfOcitI6zE2MGlOWkBmDT8sK
 YzD4qwmE9R/2IOpdgJKFUg7qDuprqVw2SassUDgYuf09QY6VyNXpUv0gFSSSPCSKfatf
 qe6ybQQAIljl3vFLEe+ksJsYLwy22uOVaDvr0FcJGCy5h2kzCPy/6anC2JOLXnuY6HlZ
 WzyeAAdC31syL3Vpfk8Qi6qSkvdyAHRNXIS8qsR9//h70fqz1Nub1h169acA0n7j+sA5
 LMkA==
X-Gm-Message-State: APjAAAU3biWWZJHq6atVCGN0XotSHcgseo2WX/lx6QL6jyE20qugTtr3
 9PjQDrK3DDxrQhvykXg7Ffo=
X-Google-Smtp-Source: APXvYqwEbq1BGEvHYYdZNsMRnRh+Q7XIZVxtMI/vm7HH+qsy5wXZwbHMvJB3H4jileFQ19Dw56JOMw==
X-Received: by 2002:aa7:82cb:: with SMTP id f11mr10530562pfn.0.1555772208351; 
 Sat, 20 Apr 2019 07:56:48 -0700 (PDT)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net.
 [99.7.172.215])
 by smtp.gmail.com with ESMTPSA id 8sm12439219pfs.50.2019.04.20.07.56.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Apr 2019 07:56:47 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@FreeBSD.org>
References: <21708669-ac14-d8f8-d513-a7e745c65861@gmail.com>
 <20190416105043.nbvx522kqy3p3svx@Air-de-Roger.citrite.net>
 <20190417120518.63ulfqksrx37ver5@Air-de-Roger.citrite.net>
 <c000684c-d930-6557-a35f-d76b94b296b7@gmail.com>
 <ab29f7ca-9653-ae48-4de7-86a73e0bc7c2@gmail.com>
 <20190418125228.yjjgj7qzzxqbhf3k@Air-de-Roger.citrite.net>
From: PGNet Dev <pgnet.dev@gmail.com>
Message-ID: <c41ced7d-f1c4-a4a9-e2bf-aa5b0caeced6@gmail.com>
Date: Sat, 20 Apr 2019 07:56:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418125228.yjjgj7qzzxqbhf3k@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.12.0 Dom0=pvh mode EFI variables 'not
 supported' after boot
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
Reply-To: pgnet.dev@gmail.com
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190420145646.EQIbMkKau2si-aoiOFedLAKUnmMGoKhanfRCcqpKdkE@z>

T24gNC8xOC8xOSA1OjUyIEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+PiBHaXZlbiBzb21l
IG9mIHRoZSBidWlsZCAnZnVuJyBJJ3ZlIGJlZW4gaGF2aW5nIHRvZGF5LCBJJ2xsIHRha2UgYSBj
bG9zZXIgbG9vayBhdCB0aGUgcGF0Y2hlZCBrZXJuZWwgYnVpbGQgaW4gdGhlIG1vcm5pbmcgLS0g
dG8gbWFrZSBkb3VibHkgc3VyZSBJIGFjdHVhbGx5IGJ1aWx0IGNvcnJlY3RseS4KCmZpbmFsbHkh
IGdvdCB0aGF0IGNsZWFuZWQgdXAuCgo+IE9LLCB0aGF0IHBhdGNoIHNlZW1lZCB0byBmaXggdGhl
IGlzc3VlIGZvciBtZSwgYW5kIEkgbWFuYWdlZCB0byBnZXQKPiBlZmlib290bWdyIHRvIGRpc3Bs
YXkgdGhlIGZpcm13YXJlIGRhdGEgZnJvbSBhIFBWSCBkb20wLgo+IAo+IENhbiB5b3UgcHJvdmlk
ZSB0aGUgZnVsbCBzZXJpYWwgb3V0cHV0IG9mIFhlbiBwbHVzIExpbnV4IGJvb3Rpbmcgd2l0aAo+
IGRvbTA9cHZoIGFuZCB0aGUgcGF0Y2ggYmVsb3cgYXBwbGllZD8KPiAKPiBOb3RlIHRoYXQgdGhp
cyBpcyB0aGUgcHJldmlvdXNseSBwcm92aWRlZCBwYXRjaCB3aXRoIGFkZGVkIGRlYnVnCj4gbWVz
c2FnZXMuCgoKd2l0aCB5b3VyIGxhdGVzdCBwYXRjaCBhcHBsaWVkLCBwYWNrYWdlcyBhdmFpbGFi
bGUgZnJvbQoKCWh0dHBzOi8vYnVpbGQub3BlbnN1c2Uub3JnL3BhY2thZ2Uvc2hvdy9ob21lOnBn
bmQ6S2VybmVsOnN0YWJsZS9rZXJuZWwtc291cmNlP2V4cGFuZD0wCgoKaXQgYXBwZWFycyB0byBi
b290IE9LIC0tIHdpdGggRUZJIHRvb2xzIGNvcnJlY3RseSBmdW5jdGlvbmluZy4KCnNlcmlhbCBv
dXRwdXQgaW5jbHVkZXMsCgoJLi4uCgkoWEVOKSBbMDAwMDAwMjdiNWZhYTM2ZF0gQm9vdGxvYWRl
cjogRUZJCgkoWEVOKSBbMDAwMDAwMjdiNmFmZGE3NF0gQ29tbWFuZCBsaW5lOiBkb20wPXB2aCBk
b20wLWlvbW11PW1hcC1yZXNlcnZlZCBkb20wX21lbT00MDE2TSxtYXg6NDA5Nk0gYm9vdHNjcnVi
PWZhbHNlIGRvbTBfbWF4X3ZjcAoJLi4uCglbICAgIDAuMDAwMDAwXSBlZmk6IEVGSSB2Mi4zMSBi
eSBBbWVyaWNhbiBNZWdhdHJlbmRzCglbICAgIDAuMDAwMDAwXSBlZmk6ICBFU1JUPTB4OWVmOGQ5
OTggIEFDUEkgMi4wPTB4OWU4MTkwMDAgIEFDUEk9MHg5ZTgxOTAwMCAgU01CSU9TPTB4ZjA0YzAg
IE1QUz0weGZkNDkwIAoJLi4uCglbICAgIDMuNzgwNjM0XSBSZWdpc3RlcmVkIGVmaXZhcnMgb3Bl
cmF0aW9ucwoJLi4uCglbICAgIDYuOTAzNzQ2XSBFRkkgVmFyaWFibGVzIEZhY2lsaXR5IHYwLjA4
IDIwMDQtTWF5LTE3CgkuLi4KCVsgICAgNi45OTIwMzRdIENvdWxkbid0IGdldCBzaXplOiAweDgw
MDAwMDAwMDAwMDAwMGUKCVsgICAgNi45OTcxMzJdIE1PRFNJR046IENvdWxkbid0IGdldCBVRUZJ
IGRiIGxpc3QKCVsgICAgNy4wMDIwNTJdIENvdWxkbid0IGdldCBzaXplOiAweDgwMDAwMDAwMDAw
MDAwMGUKCVsgICAgNy4wMDcxNDhdIENvdWxkbid0IGdldCBVRUZJIE1va0xpc3RSVAoJWyAgICA3
LjAxMTM3OV0gQ291bGRuJ3QgZ2V0IHNpemU6IDB4ODAwMDAwMDAwMDAwMDAwZQoJWyAgICA3LjAx
NjQzOF0gQ291bGRuJ3QgZ2V0IFVFRkkgZGJ4IGxpc3QKCS4uLgoKeGVuJ3MgdXAsCgoJdW5hbWUg
LXJtCgkJNS4wLjgtMjEuZzQ4MzVlYzAtZGVmYXVsdCB4ODZfNjQKCgl4bCBsaXN0CgkJTmFtZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJRCAgIE1lbSBWQ1BVcyAgICAg
IFN0YXRlICAgVGltZShzKQoJCURvbWFpbi0wICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDAgIDQwMTUgICAgIDQgICAgIHItLS0tLSAgICAgMTE3LjEKCQlYZW5zdG9yZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxICAgIDMxICAgICAxICAgICAtYi0tLS0g
ICAgICAgMC4wCgphcyBhcmUgZWZpIHRvb2xzCgoJZWZpYm9vdG1nciAtVgoJCXZlcnNpb24gMTcK
CgllZmlib290bWdyIC12CgkJQm9vdEN1cnJlbnQ6IDAwMDAKCQlUaW1lb3V0OiAxIHNlY29uZHMK
CQlCb290T3JkZXI6IDAwMDAsMDAwMiwwMDAzCgkJQm9vdDAwMDAqIG9wZW5TVVNFLVhTVlIgSEQo
MixHUFQsOTgxLi4uKS9GaWxlKFxFRklcT1BFTlNVU0VcR1JVQlg2NC5FRkkpCgkJQm9vdDAwMDIq
IFVFRkkgT1MgICAgICAgSEQoMixHUFQsOTgxLi4uKS9GaWxlKFxFRklcQk9PVFxCT09UWDY0LkVG
SSkuLkJPCgkJQm9vdDAwMDMqIFVFRkk6IEJ1aWx0LWluIEVGSSBTaGVsbCAgICAgIFZlbk1lZGlh
KDUwMi4uLikuLkJPCgoKYXNzdW1pbmcgbm90aGluZydzIGNoYW5nZWQsIG90aGVyIHRoYW4gbG9n
Z2luZywgaW4geW91ciByZWNlbnQgcGF0Y2gsIHRoZSBwcm9ibGVtIGluIG15IGxhc3QgYXR0ZW1w
dCB3YXMgZHVlIHRvIHRoZSBrZXJuZWwgYnVpbGQgbWVzcyBvbiBteSBlbmQ7IGxpa2VseSBlcXVh
bCBwb3J0aW9ucyBvZiBidWlsZHN5c3RlbSBjaGFsbGVuZ2VzIGFuZCBwZWJrYWMuCgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
