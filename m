Return-Path: <SRS0=xTCj=5L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5F3C43331
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2020 14:41:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E76320737
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2020 14:41:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="VV//STkb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E76320737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHThO-0002PV-Vs; Thu, 26 Mar 2020 14:41:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHThO-0002PP-0P
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:41:34 +0000
X-Inumbo-ID: e2ca468c-6f6f-11ea-8800-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2ca468c-6f6f-11ea-8800-12813bfff9fa;
 Thu, 26 Mar 2020 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585233692;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Vt0giUhEdtl4fVdwTQLNKX3ZRi/g6T5OKSLHTGuMOu0=;
 b=VV//STkbvcFVLtX1pJYQcJW6KlY2omW1NHw3FcGF9r88vvPTSp9sdWrh
 7bb1716llPW7UuL84rl6wvvLSKShCC5NIkPnR/vUFwYkYxmhlQ7mHDlX1
 y9wVRmbkbX7kLHhC2NZf3iYc/dfgyCRI0cBWdMt3UcXgFQbxqSXOYwfUo k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aFFSIL/ZV3a/MyAQC9Oc+Eh/v0KjiPlHo64AQrL5M+EjDiI6LzgXOluhvhE1rM9ltKCk+qamKg
 bfWRxX22eM2naUUJFTc/8m1MH/bhrErmYmsr9MkBfzoxauaY2Cpv2QgJ+5qCQ+O86dlbiQvmje
 JoghcdUBop57O3lskbtb6qJABjUdTJQRley6Vanutv+Ean3718pmfNyfvVjAOJl+JoUHCxouJG
 l9qcFOtgdKkaAJydVHjb12ILk7LwDvUJNFSDSEwPmMA/RaugRjyVuaQHPg0sUew3MZL48qx3oM
 S7M=
X-SBRS: 2.7
X-MesageID: 15020332
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="15020332"
To: Jan Beulich <jbeulich@suse.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-7-andrew.cooper3@citrix.com>
 <d6c9685b-e3a1-2837-3123-8fded5418856@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <00cf5ab3-6ea4-5b89-73cd-ca51fe355737@citrix.com>
Date: Thu, 26 Mar 2020 14:41:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d6c9685b-e3a1-2837-3123-8fded5418856@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 6/7] x86/ucode/intel: Clean up
 microcode_sanity_check()
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/03/2020 14:07, Jan Beulich wrote:
>> Introduce a check missing from the old code, that total_size is a multiple of
>> 1024 bytes,
> Where is this documented? The rather brief section in SDM vol 3 doesn't
> mention anything like this.

It is in the middle of the final paragraph of 9.11.1 Microcode Update,
immediately preceding Table 9-7

"The total size field of the microcode update header specifies the
encrypted data size plus the header size; its value must be in multiples
of 1024 bytes (1 KBytes)."

~Andrew

(I've lost count of how many times I've read this chapter over the
course of developing this series...)

