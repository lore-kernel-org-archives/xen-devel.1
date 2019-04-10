Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51799C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 09:48:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DF6E20830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 09:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DF6E20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hE9qL-0005L8-7z; Wed, 10 Apr 2019 09:48:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sbnS=SM=intel.com=jordan.l.justen@srs-us1.protection.inumbo.net>)
 id 1hE9qK-0005L0-43
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 09:48:32 +0000
X-Inumbo-ID: cbc3f1ed-5b75-11e9-92d7-bc764e045a96
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cbc3f1ed-5b75-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 09:48:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Apr 2019 02:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,332,1549958400"; d="scan'208";a="148021016"
Received: from askirtik-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.254.188.249])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Apr 2019 02:48:29 -0700
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-3-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-3-anthony.perard@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
From: Jordan Justen <jordan.l.justen@intel.com>
Message-ID: <155488970861.20447.12525571872411959890@jljusten-skl>
User-Agent: alot/0.8
Date: Wed, 10 Apr 2019 02:48:28 -0700
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 02/31] OvmfPkg: Create
 platform XenOvmf
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien.grall@arm.com>, Laszlo Ersek <lersek@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410094828.dtii28pIQ9MUTRP1SoAeJiZ5g7uSHVPS0mZMjHPcls8@z>

T24gMjAxOS0wNC0wOSAwNDowODoxNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhpcyBpcyBh
IGNvcHkgb2YgT3ZtZlg2NCwgcmVtb3ZpbmcgVmlydElPIGFuZCBzb21lIFNNTS4KPiAKPiBUaGlz
IG5ldyBwbGF0Zm9ybSB3aWxsIGJlIGNoYW5nZWQgdG8gbWFrZSBpdCB3b3JrcyBvbiB0d28gdHlw
ZXMgb2YgWGVuCj4gZ3Vlc3Q6IEhWTSBhbmQgUFZILgo+IAo+IENvbXBhcmUgdG8gT3ZtZlg2NCwg
dGhpcyBwYXRjaDoKPiAKPiAtIGNoYW5nZWQ6IFBMQVRGT1JNX0dVSUQsIE9VVFBVVF9ESVJFQ1RP
UlksIEZMQVNIX0RFRklOSVRJT04KPiAtIHJlbW92ZWQ6IFZpcnRpb0xpYiBjbGFzcyByZXNvbHV0
aW9uCj4gLSByZW1vdmVkOiBhbGwgVUVGSV9EUklWRVIgbW9kdWxlcyBmb3IgdmlydGlvIGRldmlj
ZXMKPiAtIHJlbW92ZWQ6IERYRV9TTU1fRFJJVkVSIGFuZCBTTU1fQ09SRSBsaWIgY2xhc3MgcmVz
b2x1dGlvbnMKPiAtIHJlbW92ZWQ6IERYRV9TTU1fRFJJVkVSIGFuZCBTTU1fQ09SRSBGREYgcnVs
ZXMKPiAtIHJlbW92ZWQ6IEV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBTTU1fUkVRVUlSRT09dHJ1ZQo+
IC0gcmVtb3ZlZDogRXZlcnl0aGluZyByZWxhdGVkIHRvIFNFQ1VSRV9CT09UX0VOQUJMRT09dHJ1
ZQo+IC0gcmVtb3ZlZDogRXZlcnl0aGluZyByZWxhdGVkIHRvIFRQTTJfRU5BQkxFPT10cnVlCj4g
LSBjaGFuZ2VkOiBQY2RQY2lEaXNhYmxlQnVzRW51bWVyYXRpb24gZHluYW1pYyBkZWZhdWx0IGZs
aXBwZWQgdG8gVFJVRQo+IC0gY2hhbmdlZDogZGVmYXVsdCBGRF9TSVpFX0lOX0tCIHRvIDJNLgo+
IAo+IENvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAx
LjEKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KPiAtLS0KPiAgT3ZtZlBrZy97T3ZtZlBrZ1g2NC5kc2MgPT4gWGVuT3ZtZi5kc2N9ICAg
ICB8IDIwMiArLS0tLS0tLS0tLS0tLS0tLS0tLQoKSSBndWVzcyB3ZSBhbGwgd2FudCBvdXIgbmFt
ZSB0byBiZSBmaXJzdCA6KSwgYnV0IE92bWZYZW4gc2VlbXMgbW9yZQpsaWtlIHRoZSBwYXR0ZXJu
IHRoYXQgZWRrMiB1c2VzIHdoZW4gbWFraW5nIHN1Yi1wbGF0Zm9ybXMuCgpBbHNvLCBpbiBzb21l
IGNhc2VzIHdlJ3ZlIHVzZWQgIWlmZGVmIHR5cGUgdGhpbmdzIHRvIGtlZXAgZHNjIGFuZCBmZGYK
ZmlsZXMgY29tbW9uLiBXb3VsZCB0aGF0IG5vdCBiZSB3b3JrYWJsZSBoZXJlPyBNYXliZSBpdCB3
b3VsZCBnZXQgdG9vCnVnbHkuIDpcCgpJdCBjb3VsZCBoZWxwIHRvIHByZXZlbnQgaGF2aW5nIHRv
IHN5bmMgZHNjIGNoYW5nZXMgYWNyb3NzLCBhbmQKcHJldmVudCBjaGFuZ2VzIGZyb20gYmVpbmcg
b21pdHRlZCBmb3IgWGVuIG9uIGFjY2lkZW50LgoKLUpvcmRhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
