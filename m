Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F248C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 17:20:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2857C2077C
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 17:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="v1Ib7xH+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2857C2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEzqT-0001cs-KP; Fri, 12 Apr 2019 17:20:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flRE=SO=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEzqS-0001cn-UP
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 17:20:08 +0000
X-Inumbo-ID: 383200e5-5d47-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 383200e5-5d47-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 17:20:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1555089607; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=aBJAVtaiqpeznpsbXxox1bMy5LK8iae9cWZzGN0SBV0=;
 b=v1Ib7xH+FoTfSBWTU6ZtRPgjFIpRsD36fbei1HDHHcXfR/pUGULVuaLkzVWXOjk5HB8qoi4+
 tKfYX+Soj+R815uptTktfCXLKF/MwFh7XpTVuks3jCu1qgJEflbAmB20D8Wbd2MtMkMLXvJK
 J01Zw4PSSeyJLrOSfEahi1HehX4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mxa.mailgun.org with ESMTP id 5cb0c8a9.7fcd50f96670-smtp-out-n02;
 Fri, 12 Apr 2019 17:19:37 -0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id o25so12150160wmf.5
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2019 10:19:37 -0700 (PDT)
X-Gm-Message-State: APjAAAU0g34MfRzjVIJP4YOByf3mfE6XyqfEUmHU/Ktoh2F8ycIEtcBL
 EUk7WQZ4DseQNcpxpvf0Gqugsr91oSrF2h42jtI=
X-Google-Smtp-Source: APXvYqziwW5ormDIqGdoLFfBnlgW8n9qpUXYtqHQvyPAyBn1Twq5EylXnqSGP/UIldiSIlN9us8Pf779iU8eWpaejGg=
X-Received: by 2002:a1c:f909:: with SMTP id x9mr12622702wmh.18.1555089576276; 
 Fri, 12 Apr 2019 10:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190412163932.2087-1-tamas@tklengyel.com>
 <cf39f8c3-fd03-9be1-c5e8-94bde833f829@citrix.com>
In-Reply-To: <cf39f8c3-fd03-9be1-c5e8-94bde833f829@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 12 Apr 2019 11:18:59 -0600
X-Gmail-Original-Message-ID: <CABfawh=_FovNs5L7jVF3SEgvOAqg1K9sFkRCY_fYsLFayOKZnQ@mail.gmail.com>
Message-ID:
 <CABfawh=_FovNs5L7jVF3SEgvOAqg1K9sFkRCY_fYsLFayOKZnQ@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/altp2m: cleanup p2m_altp2m_lazy_copy
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412171859.zqBYA7JnEnFDmYGHOjh0r7JK_LBgPkuNgTx_lY33784@z>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMTA6NDggQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxMi8wNC8yMDE5IDE3OjM5LCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBUaGUgcDJtX2FsdHAybV9sYXp5X2NvcHkgaXMgcmVzcG9uc2li
bGUgZm9yIGxhemlseSBwb3B1bGF0aW5nIGFuIGFsdHAybSB2aWV3Cj4gPiB3aGVuIHRoZSBndWVz
dCB0cmFwcyBvdXQgZHVlIHRvIG5vIEVQVCBlbnRyeSBiZWluZyBwcmVzZW50IGluIHRoZSBhY3Rp
dmUgdmlldy4KPiA+IEN1cnJlbnRseSB0aGUgZnVuY3Rpb24gdG9vayBzZXZlcmFsIGlucHV0cyB0
aGF0IGl0IGRpZG4ndCB1c2UgYW5kIGFsc28KPiA+IGxvY2tlZC91bmxvY2tlZCBnZm5zIHdoZW4g
aXQgZGlkbid0IG5lZWQgdG8uCj4KPiBJJ3ZlIGdvdCBhIHNlcmllcywgIltQQVRDSCAwMC8xNF0g
WFNBLTI3NyBmb2xsb3d1cCIgd2hpY2ggaXMgc3RpbGwKPiB3YWl0aW5nIGZvciBtbSByZXZpZXcs
IHdoaWNoIGNsZWFucyBzb21lIG9mIHRoaXMgdXAsIGJ1dCBjYW1lIHRvIGEKPiBkaWZmZXJlbnQg
Y29uY2x1c2lvbiBhYm91dCB0aGUgbG9ja2luZyBzYWZldHkgb2YgdGhlIEdGTnMuCj4KPiBTcGVj
aWZpY2FsbHksCj4KPiBbUEFUQ0ggMDQvMTRdIHg4Ni9wMm06IEZpeCBsb2NraW5nIGluIHAybV9h
bHRwMm1fbGF6eV9jb3B5KCkKPgo+IChhbmQgc29tZSBvdGhlciBjbGVhbnVwIGNoYW5nZXMgaW4g
cGF0Y2ggNSBhbmQgNikgd2hpY2ggZXh0ZW5kcyB0aGUKPiBkdXJhdGlvbiBvZiB0aGUgZ2ZuIGxv
Y2tzLgoKVGhhbmtzLCBJIHJlbWVtYmVyIHNlZWluZyB0aGF0IGJ1dCBJIHRoaW5rIG15IGFwcHJv
YWNoIGhlcmUgaXMgbW9yZQpzdHJhaWdodCBmb3J3YXJkLiBUaGUgY2FsbGVyIG9mIHRoaXMgZnVu
Y3Rpb24gYWxyZWFkeSBoYXMgYWxsIHRoZSBpbmZvCmdhdGhlcmVkIGZyb20gdGhlIGhvc3RwMm0g
KGFuZCBob2xkcyB0aGUgbG9jaykgdGhpcyBmdW5jdGlvbiBuZWVkcywgc28Kbm8gbmVlZCB0byBk
dXBsaWNhdGUgdGhhdCB3aXRoaW4gdGhlIGZ1bmN0aW9uLiBBZGRpdGlvbmFsbHkgZ2V0dGluZwp0
aGUgcDJtX2xvY2sgZm9yIHRoZSBhbHRwMm0gd2hpbGUgYWxzbyBob2xkaW5nIGEgZ2ZuIGxvY2sg
ZnJvbSB0aGUKYWx0cDJtIHNlZW1zIHRvIG1lIGxpa2UgaXQncyBub3QgcmVhbGx5IGFjY29tcGxp
c2hpbmcgYW55dGhpbmcgc2luY2UKdGhlIGdmbl9sb2NrIGlzIHJlYWxseSBqdXN0IHAybV9sb2Nr
IGluIGRpc2d1aXNlLiBTbyBsZXQncyBqdXN0IGdldAp0aGUgcDJtX2xvY2sgb25jZSBhbmQgYmUg
ZG9uZSB3aXRoIGl0LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
