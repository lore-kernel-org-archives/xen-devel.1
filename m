Return-Path: <SRS0=zaG5=XF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CCEC3A5A2
	for <xen-devel@archiver.kernel.org>; Tue, 10 Sep 2019 12:18:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC3D20872
	for <xen-devel@archiver.kernel.org>; Tue, 10 Sep 2019 12:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBC3D20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7f67-000156-Ru; Tue, 10 Sep 2019 12:18:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7f66-00014p-Fh
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:18:14 +0000
X-Inumbo-ID: 0f8d0a66-d3c5-11e9-ac1d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f8d0a66-d3c5-11e9-ac1d-12813bfff9fa;
 Tue, 10 Sep 2019 12:18:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2AC66AFCD;
 Tue, 10 Sep 2019 12:18:13 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
 <20190910120207.10358-13-ian.jackson@eu.citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <704a1a5b-c230-2832-38e0-6e96c09ddf71@suse.com>
Date: Tue, 10 Sep 2019 14:18:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190910120207.10358-13-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 12/12] tools/ocaml: abi: Use formal
 conversion and check in more places
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDkuMjAxOSAxNDowMiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gRnJvbTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKU2FtZSBhcyBmb3IgdGhlIHN5
c2N0bCBvbmUgLSBpZiB5b3Ugd2FudCBpdCwgaGVyZSB5b3UgYXJlOgpBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
