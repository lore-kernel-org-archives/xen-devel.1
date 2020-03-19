Return-Path: <SRS0=5+kv=5E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6BAC4332D
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2020 09:23:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4524120722
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2020 09:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4524120722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jErO4-0005Hz-Mm; Thu, 19 Mar 2020 09:22:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jErO3-0005Hm-J8
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 09:22:47 +0000
X-Inumbo-ID: 31fe6786-69c3-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31fe6786-69c3-11ea-a6c1-bc764e2007e4;
 Thu, 19 Mar 2020 09:22:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 65E48ADBE;
 Thu, 19 Mar 2020 09:22:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200318210540.5602-1-andrew.cooper3@citrix.com>
 <20200318213057.19214-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33d4211d-aa87-dbd9-32f6-09845079f545@suse.com>
Date: Thu, 19 Mar 2020 10:22:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318213057.19214-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/n] x86/microcode: Move interface from
 processor.h to microcode.h
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAyMjozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIHJlZHVjZXMg
dGhlIGNvbXBsZXhpdHkgb2YgcHJvY2Vzc29yLmgsIHBhcnRpY3VsYXJseSB0aGUgbmVlZCB0byBp
bmNsdWRlCj4gcHVibGljL3hlbi5oLiAgU3Vic3RpdHV0ZSBwcm9jZXNzb3IuaCBpbmNsdWRlcyBm
b3IgbWljcm9jb2RlLmggaW4gc29tZQo+IHNvdXJjZXMsIGFuZCBhZGQgbWljcm9jb2RlLmggaW5j
bHVkZXMgaW4gb3RoZXJzLgo+IAo+IE9ubHkgNCBvZiB0aGUgNyBmdW5jdGlvbiBkZWNsYXJhdGlv
bnMgYXJlIGFjdHVhbGx5IGNhbGxlZCBleHRlcm5hbGx5Lgo+IGVhcmx5X21pY3JvY29kZV91cGRh
dGVfY3B1KCkgaGFzIG5vIGNhbGxlcnMgc28gbWFrZSBpdCBzdGF0aWMsIGFuZCBtb3ZlIHRoZQo+
IHZlbmRvciBpbml0IGRlY2xhcmF0aW9ucyB0byBwcml2YXRlLmgKPiAKPiBObyBmdW5jdGlvbmFs
IGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
