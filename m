Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657ACC10F0B
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 04:52:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2894F2183E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 04:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpQN8QU9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2894F2183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGz1d-0008Kd-RA; Thu, 18 Apr 2019 04:51:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y3tm=SU=gmail.com=pgnet.dev@srs-us1.protection.inumbo.net>)
 id 1hGz1c-0008KY-6v
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 04:51:52 +0000
X-Inumbo-ID: ad802540-6195-11e9-92d7-bc764e045a96
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ad802540-6195-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 04:51:50 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id f6so587760pgs.8
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 21:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N7PoK8zX5f4Vty1p2Q1csmfFVGtLiNxDDgR/HGzrIms=;
 b=XpQN8QU95xD5otguHzBerUohG/v2pIVyT5d3ymgE7gAZbzCKJ2S3EEBogSmy36uZHf
 U5+qAIR1SEDp0FnTQGk9XpvDrY/nenFo49URAiewlxvhwaiaQUDLn43pc593QzEhpzDz
 rlV1v0EYt1/1LugPTowpVBIGMAmqQxCdABxVGd6e7j+9TfLMJs9hwke6rVe4olRAd894
 ZXBmWhVnZoxFxpQuOgrZaq2+AduFmVFHZ54PBTEaSAZYniqx7w65F7jqANtT9edA/1i+
 YhQkFUtyE2sPyKCiayIuUvZZYIqyLEUu6+9tp6egff8tQfloowKtZo3zvOUSpsEMfoQU
 f5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:from:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=N7PoK8zX5f4Vty1p2Q1csmfFVGtLiNxDDgR/HGzrIms=;
 b=e4JIKyQIUkgBubJlp5ox4n3OV/E95ZDxrIBEcb1xxTG2EWaPOfLP3RRa784g3QfEWx
 qgj+OpVBsNFUPEl2WHM2u3qniUKvrQJ4z9bC1833SWW9DhfXcXbA4dW1Vl8B0bw+QACh
 af/X6JndfaCmUXq2eE0zaRtACyzghrg33q3J9yuN1/3BlgMujxydbwRxDxJqfxuhw/En
 IKAXUnQdS/LFBEBJ+ohklnoasepuPhF2Rde+c4PjihFzj7KEJxThflQgStz5hsY0/RI+
 WzCGhIKmlKNBauwXUfxR0BNXwZCXjAtD6JjOiLVLPHJ34iE1F2I/DTq9TrDsJRHwfO7R
 KDzg==
X-Gm-Message-State: APjAAAWzoB8R9kfjF+A2MdgbLMAOc/E2q4njuAra0KwnESKZcDE7vh3Y
 ZGtzc0p1lFC57oR1FAuR0KU=
X-Google-Smtp-Source: APXvYqzvN5sy8CgcXv5Kl3kbQo7d7W06zzGdp64kFVP5WKJNqjVF7zSeCcIRCNwjZKjZ6z5ju03fkg==
X-Received: by 2002:a63:ed4f:: with SMTP id m15mr84375094pgk.387.1555563109648; 
 Wed, 17 Apr 2019 21:51:49 -0700 (PDT)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net.
 [99.7.172.215])
 by smtp.gmail.com with ESMTPSA id c22sm1121000pfn.136.2019.04.17.21.51.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 21:51:48 -0700 (PDT)
From: PGNet Dev <pgnet.dev@gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@FreeBSD.org>
References: <21708669-ac14-d8f8-d513-a7e745c65861@gmail.com>
 <20190416105043.nbvx522kqy3p3svx@Air-de-Roger.citrite.net>
 <20190417120518.63ulfqksrx37ver5@Air-de-Roger.citrite.net>
 <c000684c-d930-6557-a35f-d76b94b296b7@gmail.com>
Message-ID: <ab29f7ca-9653-ae48-4de7-86a73e0bc7c2@gmail.com>
Date: Wed, 17 Apr 2019 21:51:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c000684c-d930-6557-a35f-d76b94b296b7@gmail.com>
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
Message-ID: <20190418045147.jKMLIMjM6oXqT4iJ0CCOLFFZdRdeB_LMWwygpadX_u8@z>

T24gNC8xNy8xOSA4OjMwIFBNLCBQR05ldCBEZXYgd3JvdGU6Cj4gVGh4Lgo+IAo+IG5vdCBpZ25v
cmluZyB5b3UgLS0gb3BlbnN1c2Uga2VybmVsIGJ1aWxkIHN5c3RlbSBpcyBoYXZpbmcgYSBoaXNz
eS1maXQgCj4gYXRtOyBidWlsZHMgYXJlIGZhaWxpbmcuIDotLwo+IAo+IGlmIEkgY2FuJ3QgZ2V0
IGl0IHRvIGJlaGF2ZSBhIGJ1aWxkIGEgbmljZSBwa2cgZm9yIG1lLCBJJ2xsIHdvcmsgb24gYSAK
PiBtYW51YWwgc3Bpbi4KCldpdGggYSBwa2cgaW5zdGFuY2Ugb2YgeW91ci1wYXRjaGVkIGtlcm5l
bCA1LjAuOCwKCglodHRwczovL2J1aWxkLm9wZW5zdXNlLm9yZy9idWlsZC9ob21lOnBnbmQ6S2Vy
bmVsOnN0YWJsZS9vcGVuU1VTRV9MZWFwXzE1LjAveDg2XzY0L2tlcm5lbC1zb3VyY2UvX2xvZyAK
CQkuLi4KCQlbICAgNzlzXSArIHBhdGNoIC1zIC1GMCAtRSAtcDEgLS1uby1iYWNrdXAtaWYtbWlz
bWF0Y2ggLWkgL2hvbWUvYWJ1aWxkL3JwbWJ1aWxkL0JVSUxEL2tlcm5lbC1zb3VyY2UtNS4wLjgv
cGF0Y2hlcy5zdXNlL3ZmaW8tdHlwZTEtbGltaXQtZG1hLW1hcHBpbmdzLXBlci1jb250YWluZXIK
Pj4+CQlbICAgNzlzXSArIHBhdGNoIC1zIC1GMCAtRSAtcDEgLS1uby1iYWNrdXAtaWYtbWlzbWF0
Y2ggLWkgL2hvbWUvYWJ1aWxkL3JwbWJ1aWxkL0JVSUxEL2tlcm5lbC1zb3VyY2UtNS4wLjgvcGF0
Y2hlcy5hZGRvbi94ZW4tcHZoLXVlZmkucGF0Y2gKCQlbICAgNzlzXSArKyBmaW5kIC4gLW5hbWUg
LmdpdGlnbm9yZQoJCS4uLgoKIGFuZCBEb209cHZoIGVuYWJsZWQsCgoJLi4uCglYZW4gNC4xMi4w
XzEwLWxwMTUwLjY0NyAoYy9zICkgRUZJIGxvYWRlcgoJVXNpbmcgY29uZmlndXJhdGlvbiBmaWxl
ICd4ZW4tNC4xMi4wXzEwLWxwMTUwLjY0Ny5jZmcnCgl2bWxpbnV6LTUuMC44LWxwMTUwLjIuZzhi
ODg1NTMtZGVmYXVsdDogMHgwMDAwMDAwMDhiODk5MDAwLTB4MDAwMDAwMDA4YzA2OGRiOAoJaW5p
dHJkLTUuMC44LWxwMTUwLjIuZzhiODg1NTMtZGVmYXVsdDogMHgwMDAwMDAwMDhhNzIwMDAwLTB4
MDAwMDAwMDA4Yjg5ODYxOAoJLi4uCgkoWEVOKSBbMDAwMDAwMjdjNjNjMTY3NF0gWGVuIHZlcnNp
b24gNC4xMi4wXzEwLWxwMTUwLjY0NwoJLi4uCgkoWEVOKSBbMDAwMDAwMjdjYWEzYWQ4MF0gQ29t
bWFuZCBsaW5lOiBkb20wPXB2aCBkb20wLWlvbW11PW1hcC1yZXNlcnZlZCAuLi4KCS4uLgoKaXQg
Ym9vdHMgT0ssCgoJeGwgbGlzdAoJCU5hbWUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgSUQgICBNZW0gVkNQVXMgICAgICBTdGF0ZSAgIFRpbWUocykKCQlEb21haW4tMCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwICA0MDE1ICAgICA0ICAgICByLS0t
LS0gICAgICA2Mi4xCgkJWGVuc3RvcmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMSAgICAzMSAgICAgMSAgICAgLWItLS0tICAgICAgIDAuMAoKYnV0IHN0aWxsCgoJZWZpYm9v
dG1nciAtdgoJCUVGSSB2YXJpYWJsZXMgYXJlIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBzeXN0ZW0u
CgkJZXJyb3IgdHJhY2U6CgpHaXZlbiBzb21lIG9mIHRoZSBidWlsZCAnZnVuJyBJJ3ZlIGJlZW4g
aGF2aW5nIHRvZGF5LCBJJ2xsIHRha2UgYSBjbG9zZXIgbG9vayBhdCB0aGUgcGF0Y2hlZCBrZXJu
ZWwgYnVpbGQgaW4gdGhlIG1vcm5pbmcgLS0gdG8gbWFrZSBkb3VibHkgc3VyZSBJIGFjdHVhbGx5
IGJ1aWx0IGNvcnJlY3RseS4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
