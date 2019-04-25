Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E7CC10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:04:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6B09206BA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6B09206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJbFC-0005Vq-Uo; Thu, 25 Apr 2019 10:04:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJbFB-0005Ve-Ln
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 10:04:41 +0000
X-Inumbo-ID: 89aa21f3-6741-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 89aa21f3-6741-11e9-92d7-bc764e045a96;
 Thu, 25 Apr 2019 10:04:39 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 04:04:38 -0600
Message-Id: <5CC186320200007800228F32@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 04:04:34 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Razvan Cojocaru" <rcojocaru@bitdefender.com>
References: <CAFLDOk8Egs_gJmx1Yg386eEkmq4gNcbBxVGkjC7Wofhz8zCe1w@mail.gmail.com>
 <1f659428-0dd1-5537-5007-e97ff16a7506@bitdefender.com>
 <CAFLDOk9j1FgXDG2N6rzi0ObO3eip2pxM59_aaTcBjg_F_63A0g@mail.gmail.com>
 <a08d4a56-1da6-b373-f847-3a37197ffb53@bitdefender.com>
In-Reply-To: <a08d4a56-1da6-b373-f847-3a37197ffb53@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Xen 4.11.1: guest uses altp2m to crash host
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425100434.IWy05rhGegpgg5tQCC0BgNKkUnEr7fvmm0jTxD5dgok@z>

Pj4+IE9uIDE1LjA0LjE5IGF0IDE2OjEwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gNC8xNS8xOSA1OjA0IFBNLCBNYXR0IExlaW5ob3Mgd3JvdGU6Cj4+IFlvdSBhcmUg
Y29ycmVjdCAtLSBjaGVycnkgcGlja2luZyB0aGF0IGNvbW1pdCBpbnRvIFJFTEVBU0UtNC4xMS4x
IAo+PiBhZGRyZXNzZXMgdGhlIGNyYXNoLiBUaGUgcHJvYmxlbSBjYW5ub3QgYmUgcmVwcm9kdWNl
ZCBvbiA0LjEyLgo+PiAKPj4gSSBob3BlIHRoaXMgaGVscHMuCj4gCj4gVGhhbmsgeW91IGZvciBj
b25maXJtaW5nIHRoZSBmaXghCj4gCj4gVG8gdGhlIGRlY2lkZXJzOiB3b3VsZCBpdCBiZSByZWFz
b25hYmxlIHRvIGFzayBwYXRjaGVzIGxpa2UgdGhpcyB0byBiZSAKPiBiYWNrcG9ydGVkIHRvIHRo
ZSBmdXR1cmUgNC4xMSByZWxlYXNlPwoKV2VsbCwgZmlyc3Qgb2YgYWxsIHlvdSBjYW4gYWx3YXlz
IHNlbmQgYSByZXF1ZXN0LiBBbmQgeWVzLCBpbiBnZW5lcmFsCkknZCBjb25zaWRlciB0aGlzIHJl
YXNvbmFibGUsIGJ1dCBJIHNheSBzbyB3aXRob3V0IGhhdmluZyBsb29rZWQgYXQKdGhlIGFjdHVh
bCBjb21taXQocykgaW4gcXVlc3Rpb24uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
