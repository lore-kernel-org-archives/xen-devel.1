Return-Path: <SRS0=Qyg3=43=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD85C18E5B
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2020 15:16:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0B6320727
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2020 15:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpJllNNI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0B6320727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBgcX-00075R-O6; Tue, 10 Mar 2020 15:16:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBgcW-00075K-Jl
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:16:36 +0000
X-Inumbo-ID: 21ae86c8-62e2-11ea-92cf-bc764e2007e4
Received: from mail-ed1-x52f.google.com (unknown [2a00:1450:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21ae86c8-62e2-11ea-92cf-bc764e2007e4;
 Tue, 10 Mar 2020 15:16:36 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id ca19so7785981edb.13
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=VeUAJs6enyWPQ+pPkNAK6n5DlBFms5qgdH0PFcGM6fM=;
 b=YpJllNNICISR0LaMD1FwEz3ubCcXMmkkfgimEQWFg9f0YWzlOap9eUfzOLk7Rgslwi
 +f/RVHRkDMVDB/FzLG++lGEZFYRWVG8/oJsnQnFAhp5UJSDpkdh9pz09q+XsH4iYA3Po
 paZUO5edPC+HcSRLoTT9dEP78h8duY7W0413KnuWibTpQraXCtNpTP+CG3wNqh4sqlZS
 QC6/2ijdqq4QEXTxmJxCOD/pnxcU7lU0XgyGoMRmk3hHm0RwZCM3ax5DUk/FwXTHm6SB
 qr/BFRAkRkIHXMMMvUv6OvNxXVxzsgcurlSt3f3RlwWNz/qC/cChY4ClNmuwDnlfKyL2
 9RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=VeUAJs6enyWPQ+pPkNAK6n5DlBFms5qgdH0PFcGM6fM=;
 b=DFtmnC1/aDoxRb/BbiqS0o0XWrxbW+WVlI178vWwSoJVRPrfhlU+kvBOysdf5rgzq+
 8lSG1bbPg4MJsg6syRhP2lklAtSYoL+tjYXsQzMntMyT2DrpuasomE2dYTP38TdDum2p
 jaQmd3wZ+zxIwXsfCm+EZ+gZMWYNxRtZ3/xZNfpzZgoStPIVsINjiPr8a1el5Rbw3PKP
 wsb+XyWH78PvjXnKhUFjs8aRHBOI4H1jbriyBvq2bKd2gUK6M9l1/3LTZtq1f+H3z9+u
 9kfZA1GV+EY42AOH5uJ5hY2t1LwTPmoKRG3a6zdBNpxGBERkdvB2Uje/QqcBcOPMC1TZ
 J9JQ==
X-Gm-Message-State: ANhLgQ3s3nvvqX4eBERWbaZPwcmXVmVJ47lII5ez2u0Z3t864MhxNfqt
 8Ah3xgdlLNSCEvLL9FXgt6E=
X-Google-Smtp-Source: ADFU+vt0Gfg5eO4QRRgk3PQkwanJhnr8Gjeo7szC6kZdqj//htGCtZKP6f4FF4+Qd9gTy7/A3/PemA==
X-Received: by 2002:a50:8fe4:: with SMTP id y91mr22771778edy.159.1583853395284; 
 Tue, 10 Mar 2020 08:16:35 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id a22sm3293769edx.25.2020.03.10.08.16.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 08:16:34 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-4-paul@xen.org>
 <ae9cc4a6-0378-571c-9d46-0561e536884f@suse.com>
 <001301d5f6e0$61aa5e00$24ff1a00$@xen.org>
 <bbb910df-2f61-2a67-b360-82b5988810d7@suse.com>
 <002d01d5f6ed$4b0b2000$e1216000$@xen.org>
 <1b2299fa-c19c-19fc-820a-783642ea85d5@suse.com>
In-Reply-To: <1b2299fa-c19c-19fc-820a-783642ea85d5@suse.com>
Date: Tue, 10 Mar 2020 15:16:33 -0000
Message-ID: <002f01d5f6ee$e2edc3e0$a8c94ba0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8MQiuRQX2aixYfaKKXR3nYohrUgMqvTqhAWAuss4C0MCOMwISxzrQATzy1GYB0OkvGaeRmHWg
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v5 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMCBNYXJjaCAyMDIwIDE1OjEzCj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7ICdQYXVsIER1cnJhbnQnIDxw
ZHVycmFudEBhbWF6b24uY29tPjsgJ0FuZHJldyBDb29wZXInCj4gPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+OyAnV2VpIExpdScgPHdsQHhlbi5vcmc+OyAnUm9nZXIgUGF1IE1vbm7DqScgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMy82XSB4ODYgLyBw
djogZG8gbm90IHRyZWF0IFBHQ19leHRyYSBwYWdlcyBhcyBSQU0KPiAKPiBPbiAxMC4wMy4yMDIw
IDE2OjA1LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4gU2VudDog
MTAgTWFyY2ggMjAyMCAxNDo1OQo+ID4+Cj4gPj4gSW4gcmVwbHkgdG8gcGF0Y2ggNiBJIGRpZCBz
dWdnZXN0IHRvCj4gPj4gaGF2ZSBhIHNlcGFyYXRlIGxpc3QsIGJ1dCB3aXRob3V0IHRha2luZyB0
aGVzZSBwYWdlcyBvZmYKPiA+PiBkLT5wYWdlX2xpc3QsCj4gPgo+ID4gSG93IHdvdWxkIHRoYXQg
d29yayB3aXRob3V0IGFkZGluZyBhbiBleHRyYSBwYWdlX2xpc3RfZW50cnkgaW50byBzdHJ1Y3Qg
cGFnZV9pbmZvPwo+IAo+IEFzIHNhaWQgdGhlcmUsIGl0J2QgYmUgYSBzaW5nbHkgbGlua2VkIGxp
c3QgdXNpbmcgYSBfX3BkeF90Cj4gZmllbGQganVzdCBsaWtlIHRoZXJlIGFscmVhZHkgaXMgd2l0
aCAibmV4dF9zaGFkb3ciLCBpLmUuCj4geW91J2QgYWRkIGFub3RoZXIgdW5pb24gbWVtYmVyICJu
ZXh0X2V4dHJhIiBvciBzb21lIHN1Y2guIE9mCj4gY291cnNlIHRoZSBsaXN0IHNob3VsZG4ndCBn
cm93IHRvbyBsb25nLCBvciBlbHNlIGluc2VydGlvbgo+IGFuZCByZW1vdmFsIG1heSBiZWNvbWUg
YSBib3R0bGVuZWNrLiBOb3Qgc3VyZSBob3cgd2VsbCB0aGlzCj4gd291bGQgZml0IEFybSwgdGhv
dWdoOyBtYXliZSB0aGV5IHdvdWxkbid0IG5lZWQgdGhpcywgYnV0Cj4gdGhhdCBkZXBlbmRzIG9u
IHdoZXRoZXIgdGhlIGxpc3Qgd291bGQgYmUgdXNlZCBmb3IgcHVycG9zZXMKPiBiZXlvbmQgZHVt
cGluZy4KPiAKClRoYXQgc2VlbXMgbW9yZSBvYnNjdXJlIGFuZCBidWctcHJvbmUgdGhhbiBhbiBl
eHRyYSBsaXN0IGhlYWQgaW4gc3RydWN0IGRvbWFpbi4gSSdkIHJlYWxseSBwcmVmZXIgdG8gc3Rp
Y2sgd2l0aCB0aGF0IGV2ZW4gaWYgaXQgZG9lcyBtYWtlIHRoaW5ncyBhIGxpdHRsZSBtb3JlIHVn
bHkgdW50aWwgeGVucGFnZV9saXN0IGdvZXMgYXdheS4KCiAgUGF1bAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
