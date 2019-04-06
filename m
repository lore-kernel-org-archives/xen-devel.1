Return-Path: <SRS0=0ivi=SJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C562DC10F0E
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 05:24:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 850B6213F2
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 05:24:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="Mk1oPrJG";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="Mk1oPrJG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 850B6213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hD0HO-0004Fp-GE; Sun, 07 Apr 2019 05:23:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DgqQ=SI=codeaurora.org=mojha@srs-us1.protection.inumbo.net>)
 id 1hCqbM-0007H3-4v
 for xen-devel@lists.xenproject.org; Sat, 06 Apr 2019 19:03:40 +0000
X-Inumbo-ID: af40e5c2-589e-11e9-92d7-bc764e045a96
Received: from smtp.codeaurora.org (unknown [198.145.29.96])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id af40e5c2-589e-11e9-92d7-bc764e045a96;
 Sat, 06 Apr 2019 19:03:38 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id AFDC060A44; Sat,  6 Apr 2019 19:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1554577417;
 bh=fh1H5KKwnjiRs9RsITbGDwGcMNJWE9tSssA6iIdHjOs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Mk1oPrJGzlKyRtUwlyOeLMebVCh/K1jVCRDopH0wTYycoylqx1eHsXD0C2oiGeXrN
 jDRkIHaXV4JprkzHQCJ7KFor6pTQFVQuLa8UeAczQxygTgm0ywgMJ7G72MDmmINBg8
 f3ob1wGf4z/0PhLsGJx8kqlLCZG3SP8HOE7m2hSM=
Received: from [10.79.171.6]
 (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: mojha@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 829986053D;
 Sat,  6 Apr 2019 19:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1554577417;
 bh=fh1H5KKwnjiRs9RsITbGDwGcMNJWE9tSssA6iIdHjOs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Mk1oPrJGzlKyRtUwlyOeLMebVCh/K1jVCRDopH0wTYycoylqx1eHsXD0C2oiGeXrN
 jDRkIHaXV4JprkzHQCJ7KFor6pTQFVQuLa8UeAczQxygTgm0ywgMJ7G72MDmmINBg8
 f3ob1wGf4z/0PhLsGJx8kqlLCZG3SP8HOE7m2hSM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 829986053D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=mojha@codeaurora.org
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20190406122912.GA403@hari-Inspiron-1545>
From: Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <8d19e62d-11cd-91dc-6c54-d688d2d67d00@codeaurora.org>
Date: Sun, 7 Apr 2019 00:33:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190406122912.GA403@hari-Inspiron-1545>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 07 Apr 2019 05:23:41 +0000
Subject: Re: [Xen-devel] [PATCH] xen: xen-pciback: fix warning Using plain
 integer as NULL pointer
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDQvNi8yMDE5IDU6NTkgUE0sIEhhcmlwcmFzYWQgS2VsYW0gd3JvdGU6Cj4gQ2hhbmdlcyBw
YXNzaW5nIGZ1bmN0aW9uIGFyZ3VtZW50IDAgdG8gTlVMTCB0byBhdm9pZCBiZWxvdyBzcGFyc2UK
PiB3YXJuaW5nCj4KPiAgIENIRUNLICAgZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMK
PiBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYzo3MDA6NTE6IHdhcm5pbmc6IFVzaW5n
IHBsYWluIGludGVnZXIgYXMKPiBOVUxMIHBvaW50ZXIKPgo+IFNpZ25lZC1vZmYtYnk6IEhhcmlw
cmFzYWQgS2VsYW0gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgpSZXZpZXdlZC1ieTogTXVr
ZXNoIE9qaGEgPG1vamhhQGNvZGVhdXJvcmEub3JnPgoKQ2hlZXJzLAotTXVrZXNoCgo+IC0tLQo+
ICAgZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMgfCAyICstCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hl
bmJ1cy5jCj4gaW5kZXggMjNmN2Y2ZS4uODMzYjJkMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hl
bi94ZW4tcGNpYmFjay94ZW5idXMuYwo+ICsrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hl
bmJ1cy5jCj4gQEAgLTY5Nyw3ICs2OTcsNyBAQCBzdGF0aWMgaW50IHhlbl9wY2lia194ZW5idXNf
cHJvYmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKPiAgIAkvKiBXZSBuZWVkIHRvIGZvcmNl
IGEgY2FsbCB0byBvdXIgY2FsbGJhY2sgaGVyZSBpbiBjYXNlCj4gICAJICogeGVuZCBhbHJlYWR5
IGNvbmZpZ3VyZWQgdXMhCj4gICAJICovCj4gLQl4ZW5fcGNpYmtfYmVfd2F0Y2goJnBkZXYtPmJl
X3dhdGNoLCBOVUxMLCAwKTsKPiArCXhlbl9wY2lia19iZV93YXRjaCgmcGRldi0+YmVfd2F0Y2gs
IE5VTEwsIE5VTEwpOwo+ICAgCj4gICBvdXQ6Cj4gICAJcmV0dXJuIGVycjsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
