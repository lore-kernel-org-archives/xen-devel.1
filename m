Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194DBC43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 23:00:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35FF3206BF
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 23:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LD2X61Z2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35FF3206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJnLJ-00058D-38; Thu, 25 Apr 2019 22:59:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gqxz=S3=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hJnLH-000588-Vq
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 22:59:48 +0000
X-Inumbo-ID: d1ec9423-67ad-11e9-843c-bc764e045a96
Received: from mail-it1-x12e.google.com (unknown [2607:f8b0:4864:20::12e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d1ec9423-67ad-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 22:59:46 +0000 (UTC)
Received: by mail-it1-x12e.google.com with SMTP id v8so3149245itf.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 15:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hWE7xEmSzMda6d9Cx2MzrM+UetvTo3D/Xg0dqZvsNfc=;
 b=LD2X61Z2tID57IarMVaYuh5VXsApORZrt22AB3udDCgEv4yIZ27fABsNJYPnSk/eBx
 IJcJNeI9By6bPCqmpZIHmIv0e4hUDrsJ0g178S9jGKOn04S+RkYHXUy69rCbESrnxLXL
 xsFioIwaM3LRKCYttGD/LuD5EpMOez/WvPSdw8ssV9R8XeGPdUcBLG9eF95Zasf8ZR8y
 ducrjSI9CDqFMMKAIkKJWIb4kP3AgjGTD3fjm2KN53s38RDm3+4own8+Q5GqjeQc0fuO
 26wyKAMn00045Rg93s1oZw63IvQVQP/O5Lbpv2VCpUFOi7FAo8xjSRU+mo7SBuJv6a1A
 8r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hWE7xEmSzMda6d9Cx2MzrM+UetvTo3D/Xg0dqZvsNfc=;
 b=H8AaZRBJr/g6uR90rLSeFJFTxGhiHHUaPhFFj3eug0cn8mqi8MFslESvnN0lWkTmvc
 PO1eV1661xM5b1HoN4LW0V/DThpD8aXAxFfcZjs3F32EJaWDDmpBWBwJMGfj96X8l89a
 Mgb/jnpA+3bbVUwhBoR3+3vwB9Yt5HDkc5jdd8E4Fh7aejWIAlTGwJ9HDFxUzlLSjSDO
 oPzSSjFohMWavK0n1TZHJTtqMJQpiVpH26clBxMe5f+G4ceKXkxvTfaOmP7Zts3ypCdc
 S9ve3n85uCk/hS7Kl/VWmODrd+Nhl1jAqhQprezwimO7Z1ji8wiRI51zaecHaonhZGwT
 73vQ==
X-Gm-Message-State: APjAAAUAKfYu5IZsVkv0iN1d7EkJ2tgBcOt3aAPrzdK5UF4sB1o7z+JD
 yMtnZlnLu6VGbZH5z+cJsu0=
X-Google-Smtp-Source: APXvYqy3Lw4w9tAuNZIKtzOGOVjCX04eqzBrEy6jglDR+7o0Fgw/2AXn0ud/x8x1lfVB4ZDN69ur8A==
X-Received: by 2002:a02:ba94:: with SMTP id g20mr21904726jao.51.1556233185768; 
 Thu, 25 Apr 2019 15:59:45 -0700 (PDT)
Received: from [100.64.72.44] ([173.245.215.245])
 by smtp.gmail.com with ESMTPSA id f5sm5138449iob.58.2019.04.25.15.59.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2019 15:59:44 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16E227)
In-Reply-To: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com>
Date: Thu, 25 Apr 2019 18:59:44 -0400
Message-Id: <DB7FD117-5AFE-4D4E-8BA6-A08475E48923@gmail.com>
References: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Xen-devel] [VOTE] tagging for operational messages sent to
 xen-devel@ (was Re: Xen 4.13 Development Update)
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Luwei Kang <luwei.kang@intel.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Pu Wen <puwen@hygon.cn>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425225944.IDfJPRPbWsGo5wqi-T0CVjKF3TiwQWX92iB2YHQAJy8@z>

PiBPbiBBcHIgMjUsIDIwMTksIGF0IDEyOjM2LCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJp
eC5jb20+IHdyb3RlOgo+IAo+IEFscmlnaHQsCj4gCj4gdGhlcmUgd2FzIGEgbGVuZ3RoeSBkaXNj
dXNzaW9uIG9uIHRoaXMgdG9waWMgb24gSVJDIC0gbG9nIGF0dGFjaGVkLiBUaGUgY29uc2Vuc3Vz
IGFwcGVhcnMgdG8gYmUgdG8gdXNlIENhbm9uaWNhbCBtZXNzYWdlcyB3aXRoIGEgQ0FQSVRBTElT
RUQgdGFnLiBFLmcuICJbVEFHXSBYZW4gNC4xMyBEZXZlbG9wbWVudCBVcGRhdGUiLgo+IAo+IFRo
ZSBvcHRpb25zIHdoaWNoIHNlZW1lZCB0byBoYXZlIGxlYXN0IG9iamVjdGlvbnMgYXJlCj4gMTog
W0FOTk9VTkNFXQo+IDI6IFtPUEVSQVRJT05TXSAKPiAzOiBbUFJPQ0VTU10KPiAKPiBBbmQgdGhh
dCB3ZSBzaG91bGQgdXNlIHRoZXNlIGZvciBvdGhlciBtZXNzYWdlcy9hbm5vdW5jZW1lbnRzIHJl
bGF0ZWQgdG8gdGhlIG9wZXJhdGlvbiBvZiBYZW4gUHJvamVjdCBEZXZlbG9wbWVudC4KCk9uIG1v
YmlsZSBkZXZpY2VzLCBzaG9ydGVyIHN1YmplY3RzIGFyZSBiZXR0ZXIuICBBIFt4ZW4tZGV2ZWxd
IGVtYWlsIGFscmVhZHkgaGFzIG9uZSAxMS1jaGFyYWN0ZXIgdGFnLiBTaW5jZSB0YWdzIGFyZSBp
biBDQVBJVEFMUywgYWJicmV2aWF0ZWQgdGFncyA9IGxlc3MgU0hPdXRpbmcuCgo+IFtEaXppZXRd
IE9ubHkgYmVjYXVzZSB3ZSBjb3B5IGV2ZXJ5dGhpbmcgZnJvbSAtYW5ub3VuY2UgdG8gLWRldmVs
LgoKU29tZSBtYWlsaW5nIGxpc3RzIHVzZSBbQU5OXSBmb3IgYW5ub3VuY2VtZW50cy4gIEVtYWls
IG1pcnJvcmVkIHRvIHhlbi1kZXZlbCBmcm9tIC1hbm5vdW5jZSBjb3VsZCBwcmVmaXggdGhlIFtB
Tk5dIHRhZywgd2hpY2ggd291bGQgbm90IGJlIHVzZWQgZm9yIG5vbi1taXJyb3JlZCBlbWFpbCwg
c2luY2UgYWxsIGFubm91bmNlbWVudHMgd291bGQgYmUgZGlyZWN0ZWQgdG8gLWFubm91bmNlLgoK
PiBbZ3dkXSBCdXQgaW4gbXkgbWluZCwgdGhpbmdzIGxpa2UgUk0gdXBkYXRlcyAod2hpY2ggaGFw
cGVuIHByZXR0eSByZWd1bGFybHkpIGFuZCBzYXksIERldmVsb3BlciBTdW1taXQgYW5ub3VuY2Vt
ZW50cywgYXJlIGRpZmZlcmVudCB0aGluZ3MuCgpUaGUgbWVzc2FnZXMgd2hpY2ggcHJvbXB0ZWQg
dGhpcyBkaXNjdXNzaW9uIHdlcmUgcmVsYXRlZCB0byByZWxlYXNlIG1hbmFnZW1lbnQuICBUaGVz
ZSB3ZXJlIGNhbGxlZCBSTSBpbiB0aGUgSVJDIGRpc2N1c3Npb24sIHdoaWNoIHN1Z2dlc3RzIFtS
TV0gYXMgYSBwb3NzaWJsZSB0YWcuICBJdCdzIHF1aWNrIHRvIHR5cGUgYW5kIG5vbi1kaXN0cmFj
dGluZyB0byByZWFkLiAgVGhpcyB3b3VsZCBub3QgcHJlY2x1ZGUgb3RoZXIgdGFncyBmb3Igbm9u
IFtSTV0gbWVzc2FnZXMuCgpSaWNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
