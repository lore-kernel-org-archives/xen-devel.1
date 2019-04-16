Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5233CC10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 18:28:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B9052075B
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 18:28:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCO7wBaf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B9052075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGSnz-00070s-0P; Tue, 16 Apr 2019 18:27:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2PTH=SS=gmail.com=pryorm09@srs-us1.protection.inumbo.net>)
 id 1hGSnx-00070n-QY
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 18:27:37 +0000
X-Inumbo-ID: 4eca209f-6075-11e9-92d7-bc764e045a96
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4eca209f-6075-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 18:27:36 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id v4so18480547ioj.5
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2019 11:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pFI5fvuP18R7bQr73F1nkTbAP+fRU4Xzcjnu9RbNE8k=;
 b=RCO7wBafKO3RZnFh0avQGwCGq1hv6Psd8ItzbZenQM63rFLE0p5RIUba++vHySx0uS
 XBNxHi/XkvdD/xZ3ZGfJU7MVOzsDzJD53WMjczrZvnDG1AatuoKqvi3tVtb8gvvDfump
 VBUM6Kp5vOKVNkUep1XXE0dCLM8peKbnbqGcXSSrgIywY+CMQUb5JzBvHFYcm9aRZvAx
 Nuc9Q/pyBm/c9cmBQ7yfVgI1Sk+3r8FhhoUAuuhOgSji7g2tZe2TIWltpht4g/Ij6ZHc
 gEnWvr5PmOuNP/CtWpbPJTDidiZKnBDgah0FrF6eqRZvFQ5SWVTbcbyp8IhHFol7vFtY
 5ATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pFI5fvuP18R7bQr73F1nkTbAP+fRU4Xzcjnu9RbNE8k=;
 b=Eblwt+6NW76i24N/m6rizB9idJSPlsbiELPMPod2Ay0ScjVaAIqcHjJLmY4OVlC9yo
 nI674vBy9HuHF0/t7/Eb1tLZzknYPw1j0t+8cc8+icFEHNf2WXrsxmLRaX5dX4ai23lr
 ZtzAUCDIUPtaAW4TjgPJDVTZ4GLAaZ/X+4AsPlk7ezoLVupgi1fIu8kXX3vlXjxs1BgO
 Nr9MkO8/KJ9PbvIiFTmzL/O50H+UCWQExZgytU+oaCRJxhzNL8tePUO/DA7GLoLrxHmy
 CeyaHsgQTbjLLznu1g+2Y4z6ALsapPuhYWNIMY+E01HBli/mWL1pxg34d44MZ7lelEnW
 MUjg==
X-Gm-Message-State: APjAAAVG9jB2KZA3zeEqaiBQKIbJImCbO/lQMveu6C9h1zQz4+ZXoqZN
 fIi3HY50bn2mFziE5x3HijeOiso4eIQMT/E6Ulg=
X-Google-Smtp-Source: APXvYqyWpp8VozDk6OXJVWMVagxNi2LP0L8vVMyRI7THuMAl7u0dGCrDznnVCIRuqxLG/kBsS04tDWv+hkPbxBcINlg=
X-Received: by 2002:a5d:9914:: with SMTP id x20mr17501739iol.257.1555439255824; 
 Tue, 16 Apr 2019 11:27:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:19c:0:0:0:0 with HTTP; Tue, 16 Apr 2019 11:27:35
 -0700 (PDT)
In-Reply-To: <20190416091027.bq4zybyyqgi5e2tn@Air-de-Roger.citrite.net>
References: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
 <20190416091027.bq4zybyyqgi5e2tn@Air-de-Roger.citrite.net>
From: Pry Mar <pryorm09@gmail.com>
Date: Tue, 16 Apr 2019 11:27:35 -0700
Message-ID:
 <CAHnBbQ_3MdtqHYsLgcQWCaFM3FjROtYgPuJ=z+DHSSmHW_y+-A@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] booting domU guest as pvh works in xen-4.11.1 but
 fails in 4.12
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416182735.dZh6mc0edH4rJTniKBeGrDxVLtn1eHwDLYkU6jxq6hw@z>

T24gNC8xNi8xOSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IE9uIE1vbiwgQXByIDE1LCAyMDE5IGF0IDA0OjE4OjU3UE0gLTA3MDAsIFByeSBNYXIgd3Jv
dGU6Cj4+IEhlbGxvLAo+Pgo+PiBodHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTA3NzcxOC8KPj4K
Pj4gSSBnZXQgYSBrZXJuZWwgcGFuaWMgYXMgc2hvd24gaW4gdGhlIHBhc3RlIGFib3ZlIG5vIG1h
dHRlciBob3cgSQo+PiBsYXVuY2ggcHZoLCB3aXRoIGJvb3Rsb2FkZXIgKHB5Z3J1YiksIGtlcm5l
bCBkaXJlY3QgKDQuMTgrKSwgb3IKPj4gcHZncnViMiAoaTM4Ni14ZW5fcHZoIHN1cHBvcnQpLgo+
Pgo+PiBUaGUgZG9tMCBoZXJlIGlzIHViMTgwNCwga2VybmVsLTQuMTgsIGFuZCB4ZW4tNC4xMiB3
aXRoIGRlYmlhbgo+PiBwYWNrYWdlcyAoc2VsZiBidWlsdCkuCj4+IH4kIHN1ZG8gZHBrZyAtbCB8
IGdyZXAgLVAgJ3hlbnxxZW11JyB8IGdyZXAgJ15paScKPj4gaWkgIGxpYnhlbi00LjEyOmFtZDY0
ICAgICAgNC4xMi4wLTErdWIxOHUwNC4xICAgICAgICAgICAgICAgIGFtZDY0Cj4+ICAgIFB1Ymxp
YyBsaWJzIGZvciBYZW4KPj4gaWkgIGxpYnhlbnN0b3JlMy4wOmFtZDY0ICA0LjEyLjAtMSt1YjE4
dTA0LjEgICAgICAgICAgICAgICAgYW1kNjQKPj4gICBYZW5zdG9yZSBjb21tdW5pY2F0aW9ucyBs
aWJyYXJ5IGZvciBYZW4KPj4gaWkgIGxpYnhlbnRvb2xjb3JlMTphbWQ2NCAgNC4xMi4wLTErdWIx
OHUwNC4xICAgICAgICAgICAgICAgIGFtZDY0Cj4+ICAgIGhlbHBlciBmb3IgcWVtdSAmIGxpYnhl
bnN0b3JlCj4+IGlpICBxZW11dSAgICAgMy4xLjAtMSt1YjE4dTA0LjEgICAgICAgICAgICAgICAg
IGFtZDY0Cj4+IHFlbXUtc3lzdGVtLWkzODYgKDMuMS4wL3hlbi00LjEyKSB3aXRoIDlwZnMgc3Vw
cG9ydAo+PiBpaSAgeGVuLWh5cGVydmlzb3ItNC4xMi1hbWQ2NCAgICAgICAgICAgICA0LjEyLjAt
MSt1YjE4dTA0LjEKPj4gICAgICBhbWQ2NCAgICAgICAgWGVuIEh5cGVydmlzb3Igb24gQU1ENjQK
Pj4gaWkgIHhlbi11dGlscy00LjEyICAgICAgICAgICAgICAgICAgICAgICAgNC4xMi4wLTErdWIx
OHUwNC4xCj4+ICAgICAgYW1kNjQgICAgICAgIFhFTiBhZG1pbmlzdHJhdGl2ZSB0b29scwo+PiBp
aSAgeGVuLXV0aWxzLWNvbW1vbiAgICAgICAgICAgICAgICAgICAgICA0LjEyLjAtMSt1YjE4dTA0
LjEKPj4gICAgICBhbGwgICAgICAgICAgWGVuIGFkbWluaXN0cmF0aXZlIHRvb2xzIC0gY29tbW9u
IGZpbGVzCj4+IGlpICB4ZW4tdmlyYnIwICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAuMS0y
Cj4+ICAgICAgYWxsICAgICAgICAgIFNldHVwIGEgdmlyYnIwIGJyaWRnZSBhbmQgZG5zbWFzcSBv
biBhCj4+IGlpICB4ZW5zdG9yZS11dGlscyAgICAgICAgICAgICAgICAgICAgICAgIDQuMTIuMC0x
K3ViMTh1MDQuMQo+PiAgICAgIGFtZDY0ICAgICAgICBYZW5zdG9yZSBjb21tYW5kIGxpbmUgdXRp
bGl0aWVzIGZvciBYZW4KPj4KPj4gVGhlIHNhbWUgeGwgY29uZmlnIGFuZCBncnViIGNvbmZpZyB3
b3JrcyBpbiB4ZW4tNC4xMS4xLiBJJ3ZlIHNlYXJjaGVkCj4+IGZvciBhbnkgbmV3IG9wdGlvbnMg
aW4geGwuY2ZnIHRoYXQgY291bGQgaW5mbHVlbmNlIHRoaXMsIGJ1dCBub3RoaW5nCj4+IGNhdGNo
ZXMgbXkgZXllLgo+Cj4gRG8gc2FtZSBrZXJuZWwgYW5kIGluaXRyZCB3b3JrIGZpbmUgd2hlbiBi
b290ZWQgYXMgUFYgb3IgSFZNPwo+Cj4gVGhhbmtzLCBSb2dlci4KPgp5ZXMsIEkgdHJpZWQgUFYs
IGJ1dCBub3QgSFZNLiBOb25lIG9mIHRoZSBsZCouc28gZXJyb3JzIGFwcGVhcgp0cmFwczogbW9k
cHJvYmVbNDhdIHRyYXAgaW52YWxpZCBvcGNvZGUgaXA6N2Y3OTdkYzdiYjk1CnNwOjdmZmUzMDk5
Y2RiOCBlcnJvcjowIGluIGxkLTIuMjkuc29bN2Y3OTdkYzYxMDAwKzIxMDAwXQoKdGhlIGxvZyBp
cyBzaW1pbGFyIGFzIGJvb3RpbmcgcHZoIGluIDQuMTEuMSBmb3IgcHYuCgpodGgsClByeU1hcjU2
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
