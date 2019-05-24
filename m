Return-Path: <SRS0=fmWs=TY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072F3C282E3
	for <xen-devel@archiver.kernel.org>; Fri, 24 May 2019 12:37:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCBE220675
	for <xen-devel@archiver.kernel.org>; Fri, 24 May 2019 12:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCBE220675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU9Rz-0003Fr-BI; Fri, 24 May 2019 12:37:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hU9Rx-0003Fi-Pk
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 12:37:29 +0000
X-Inumbo-ID: b06a0166-7e20-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b06a0166-7e20-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 12:37:27 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 06:37:27 -0600
Message-Id: <5CE7E5830200007800232051@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 06:37:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] vsprintf: constify "end" parameters
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190524123723.UbhlFD6ijmS9s7UVjO4aVw7EMG_2Qy6v-8vRB7jL0Nc@z>

RXhjZXB0IGluIHRoZSB0b3AgbGV2ZWwgZnVuY3Rpb24gd2UgZG9uJ3QgbWVhbiB0byBldmVyIHdy
aXRlIHRocm91Z2gKImVuZCIuIFRoZSB2YXJpYWJsZSBpcyB1c2VkIHNvbGVseSBmb3IgcG9pbnRl
ciBjb21wYXJpc29uIHB1cnBvc2VzCnRoZXJlLiBBZGQgY29uc3QgZXZlcnl3aGVyZS4KCkFsc28g
bWFrZSBmdW5jdGlvbiBoZWFkaW5nIHdyYXBwaW5nIHN0eWxlIHVuaWZvcm0gYWdhaW4gZm9yIGFs
bCBvZiB0aGUKaW52b2x2ZWQgZnVuY3Rpb25zLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2NvbW1vbi92c3ByaW50Zi5jCisrKyBiL3hl
bi9jb21tb24vdnNwcmludGYuYwpAQCAtMTQ0LDcgKzE0NCw3IEBAIHN0YXRpYyBpbnQgc2tpcF9h
dG9pKGNvbnN0IGNoYXIgKipzKQogI2RlZmluZSBMQVJHRSAgIDY0ICAgICAgICAgICAgICAvKiB1
c2UgJ0FCQ0RFRicgaW5zdGVhZCBvZiAnYWJjZGVmJyAqLwogCiBzdGF0aWMgY2hhciAqbnVtYmVy
KAotICAgIGNoYXIgKmJ1ZiwgY2hhciAqZW5kLCB1bnNpZ25lZCBsb25nIGxvbmcgbnVtLAorICAg
IGNoYXIgKmJ1ZiwgY29uc3QgY2hhciAqZW5kLCB1bnNpZ25lZCBsb25nIGxvbmcgbnVtLAogICAg
IGludCBiYXNlLCBpbnQgc2l6ZSwgaW50IHByZWNpc2lvbiwgaW50IHR5cGUpCiB7CiAgICAgY2hh
ciBjLHNpZ24sdG1wWzY2XTsKQEAgLTIzOCw3ICsyMzgsNyBAQCBzdGF0aWMgY2hhciAqbnVtYmVy
KAogICAgIHJldHVybiBidWY7CiB9CiAKLXN0YXRpYyBjaGFyICpzdHJpbmcoY2hhciAqc3RyLCBj
aGFyICplbmQsIGNvbnN0IGNoYXIgKnMsCitzdGF0aWMgY2hhciAqc3RyaW5nKGNoYXIgKnN0ciwg
Y29uc3QgY2hhciAqZW5kLCBjb25zdCBjaGFyICpzLAogICAgICAgICAgICAgICAgICAgICBpbnQg
ZmllbGRfd2lkdGgsIGludCBwcmVjaXNpb24sIGludCBmbGFncykKIHsKICAgICBpbnQgaSwgbGVu
ID0gKHByZWNpc2lvbiA8IDApID8gc3RybGVuKHMpIDogc3RybmxlbihzLCBwcmVjaXNpb24pOwpA
QCAtMjY1LDggKzI2NSw5IEBAIHN0YXRpYyBjaGFyICpzdHJpbmcoY2hhciAqc3RyLCBjaGFyICpl
bmQKIH0KIAogLyogUHJpbnQgYSBiaXRtYXAgYXMgJzAtMyw2LTE1JyAqLwotc3RhdGljIGNoYXIg
KnByaW50X2JpdG1hcF9saXN0KAotICAgIGNoYXIgKnN0ciwgY2hhciAqZW5kLCBjb25zdCB1bnNp
Z25lZCBsb25nICpiaXRtYXAsIHVuc2lnbmVkIGludCBucl9iaXRzKQorc3RhdGljIGNoYXIgKnBy
aW50X2JpdG1hcF9saXN0KGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZW5kLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmJpdG1hcCwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbnJfYml0cykKIHsKICAgICAvKiBj
dXJyZW50IGJpdCBpcyAnY3VyJywgbW9zdCByZWNlbnRseSBzZWVuIHJhbmdlIGlzIFtyYm90LCBy
dG9wXSAqLwogICAgIHVuc2lnbmVkIGludCBjdXIsIHJib3QsIHJ0b3A7CkBAIC0zMDYsOCArMzA3
LDkgQEAgc3RhdGljIGNoYXIgKnByaW50X2JpdG1hcF9saXN0KAogfQogCiAvKiBQcmludCBhIGJp
dG1hcCBhcyBhIGNvbW1hIHNlcGFyYXRlZCBoZXggc3RyaW5nLiAqLwotc3RhdGljIGNoYXIgKnBy
aW50X2JpdG1hcF9zdHJpbmcoCi0gICAgY2hhciAqc3RyLCBjaGFyICplbmQsIGNvbnN0IHVuc2ln
bmVkIGxvbmcgKmJpdG1hcCwgdW5zaWduZWQgaW50IG5yX2JpdHMpCitzdGF0aWMgY2hhciAqcHJp
bnRfYml0bWFwX3N0cmluZyhjaGFyICpzdHIsIGNvbnN0IGNoYXIgKmVuZCwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmJpdG1hcCwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBucl9iaXRzKQogewogICAg
IGNvbnN0IHVuc2lnbmVkIGludCBDSFVOS1NaID0gMzI7CiAgICAgdW5zaWduZWQgaW50IGNodW5r
c3o7CkBAIC0zNDcsNyArMzQ5LDcgQEAgc3RhdGljIGNoYXIgKnByaW50X2JpdG1hcF9zdHJpbmco
CiB9CiAKIC8qIFByaW50IGEgZG9tYWluIGlkLCB1c2luZyBuYW1lcyBmb3Igc3lzdGVtIGRvbWFp
bnMuICAoZS5nLiBkMCBvciBkW0lETEVdKSAqLwotc3RhdGljIGNoYXIgKnByaW50X2RvbWFpbihj
aGFyICpzdHIsIGNoYXIgKmVuZCwgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKK3N0YXRpYyBjaGFy
ICpwcmludF9kb21haW4oY2hhciAqc3RyLCBjb25zdCBjaGFyICplbmQsIGNvbnN0IHN0cnVjdCBk
b21haW4gKmQpCiB7CiAgICAgY29uc3QgY2hhciAqbmFtZSA9IE5VTEw7CiAKQEAgLTM3OCw3ICsz
ODAsNyBAQCBzdGF0aWMgY2hhciAqcHJpbnRfZG9tYWluKGNoYXIgKnN0ciwgY2hhCiB9CiAKIC8q
IFByaW50IGEgdmNwdSBpZC4gIChlLmcuIGQwdjEgb3IgZFtJRExFXXYwKSAqLwotc3RhdGljIGNo
YXIgKnByaW50X3ZjcHUoY2hhciAqc3RyLCBjaGFyICplbmQsIGNvbnN0IHN0cnVjdCB2Y3B1ICp2
KQorc3RhdGljIGNoYXIgKnByaW50X3ZjcHUoY2hhciAqc3RyLCBjb25zdCBjaGFyICplbmQsIGNv
bnN0IHN0cnVjdCB2Y3B1ICp2KQogewogICAgIC8qIFNvbWUgZGVidWdnaW5nIG1heSBoYXZlIGFu
IG9wdGlvbmFsbHktTlVMTCBwb2ludGVyLiAqLwogICAgIGlmICggdW5saWtlbHkoIXYpICkKQEAg
LTM5Miw3ICszOTQsNyBAQCBzdGF0aWMgY2hhciAqcHJpbnRfdmNwdShjaGFyICpzdHIsIGNoYXIK
ICAgICByZXR1cm4gbnVtYmVyKHN0ciArIDEsIGVuZCwgdi0+dmNwdV9pZCwgMTAsIC0xLCAtMSwg
MCk7CiB9CiAKLXN0YXRpYyBjaGFyICpwb2ludGVyKGNoYXIgKnN0ciwgY2hhciAqZW5kLCBjb25z
dCBjaGFyICoqZm10X3B0ciwKK3N0YXRpYyBjaGFyICpwb2ludGVyKGNoYXIgKnN0ciwgY29uc3Qg
Y2hhciAqZW5kLCBjb25zdCBjaGFyICoqZm10X3B0ciwKICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHZvaWQgKmFyZywgaW50IGZpZWxkX3dpZHRoLCBpbnQgcHJlY2lzaW9uLAogICAgICAgICAg
ICAgICAgICAgICAgaW50IGZsYWdzKQogewoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
