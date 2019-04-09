Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A486C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:02:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 438552084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 438552084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDqO5-00052L-Je; Tue, 09 Apr 2019 13:02:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDqO4-00052G-2L
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 13:02:04 +0000
X-Inumbo-ID: aab744f0-5ac7-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aab744f0-5ac7-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 13:02:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 07:02:01 -0600
Message-Id: <5CAC97C30200007800225DED@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 07:01:55 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] timers: limit heap size
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
Message-ID: <20190409130155.ZrbNGndFdvy9N2yRInfwYMMSWjSpfqcEgSa-wLsNjFU@z>

Rmlyc3QgYW5kIGZvcmVtb3N0IG1ha2UgdGltZXJfc29mdGlycV9hY3Rpb24oKSBhdm9pZCBncm93
aW5nIHRoZSBoZWFwCmlmIGl0cyBuZXcgc2l6ZSBjYW4ndCBiZSBzdG9yZWQgd2l0aG91dCB0cnVu
Y2F0aW9uLiA2NGsgZW50cmllcyBpcyBhCmxvdCwgYW5kIEkgZG9uJ3QgdGhpbmsgd2UncmUgYXQg
aGlnaCByaXNrIG9mIHJ1bm5pbmcgaW50byB0aGUgaXNzdWUsCmJ1dCBJIHRoaW5rIGl0J3MgYmV0
dGVyIHRvIG5vdCBhbGxvdyBmb3IgaGFyZCB0byBkZWJ1ZyBwcm9ibGVtcyB0bwpvY2N1ciBpbiB0
aGUgZmlyc3QgcGxhY2UuCgpGdXJ0aGVybW9yZSBhbHNvIGFkanVzdCB0aGUgY29kZSBzdWNoIHRo
ZSBzaXplL2xpbWl0IGZpZWxkcyBiZWNvbWluZwp1bnNpZ25lZCBpbnQgd291bGQgYXQgbGVhc3Qg
d29yayBmcm9tIGEgbWVyZSBzaXppbmcgcG9pbnQgb2Ygdmlldy4gRm9yCnRoaXMgYWxzbyBzd2l0
Y2ggdmFyaW91cyB1c2VzIG9mIHBsYWluIGludCB0byB1bnNpZ25lZCBpbnQuCgpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vY29tbW9uL3Rp
bWVyLmMKKysrIGIveGVuL2NvbW1vbi90aW1lci5jCkBAIC02Myw5ICs2Myw5IEBAIHN0YXRpYyBz
dHJ1Y3QgaGVhcF9tZXRhZGF0YSAqaGVhcF9tZXRhZGEKIH0KIAogLyogU2luayBkb3duIGVsZW1l
bnQgQHBvcyBvZiBAaGVhcC4gKi8KLXN0YXRpYyB2b2lkIGRvd25faGVhcChzdHJ1Y3QgdGltZXIg
KipoZWFwLCBpbnQgcG9zKQorc3RhdGljIHZvaWQgZG93bl9oZWFwKHN0cnVjdCB0aW1lciAqKmhl
YXAsIHVuc2lnbmVkIGludCBwb3MpCiB7Ci0gICAgaW50IHN6ID0gaGVhcF9tZXRhZGF0YShoZWFw
KS0+c2l6ZSwgbnh0OworICAgIHVuc2lnbmVkIGludCBzeiA9IGhlYXBfbWV0YWRhdGEoaGVhcCkt
PnNpemUsIG54dDsKICAgICBzdHJ1Y3QgdGltZXIgKnQgPSBoZWFwW3Bvc107CiAKICAgICB3aGls
ZSAoIChueHQgPSAocG9zIDw8IDEpKSA8PSBzeiApCkBAIC04NCw3ICs4NCw3IEBAIHN0YXRpYyB2
b2lkIGRvd25faGVhcChzdHJ1Y3QgdGltZXIgKipoZWEKIH0KIAogLyogRmxvYXQgZWxlbWVudCBA
cG9zIHVwIEBoZWFwLiAqLwotc3RhdGljIHZvaWQgdXBfaGVhcChzdHJ1Y3QgdGltZXIgKipoZWFw
LCBpbnQgcG9zKQorc3RhdGljIHZvaWQgdXBfaGVhcChzdHJ1Y3QgdGltZXIgKipoZWFwLCB1bnNp
Z25lZCBpbnQgcG9zKQogewogICAgIHN0cnVjdCB0aW1lciAqdCA9IGhlYXBbcG9zXTsKIApAQCAt
MTAzLDggKzEwMyw4IEBAIHN0YXRpYyB2b2lkIHVwX2hlYXAoc3RydWN0IHRpbWVyICoqaGVhcCwK
IC8qIERlbGV0ZSBAdCBmcm9tIEBoZWFwLiBSZXR1cm4gVFJVRSBpZiBuZXcgdG9wIG9mIGhlYXAu
ICovCiBzdGF0aWMgaW50IHJlbW92ZV9mcm9tX2hlYXAoc3RydWN0IHRpbWVyICoqaGVhcCwgc3Ry
dWN0IHRpbWVyICp0KQogewotICAgIGludCBzeiA9IGhlYXBfbWV0YWRhdGEoaGVhcCktPnNpemU7
Ci0gICAgaW50IHBvcyA9IHQtPmhlYXBfb2Zmc2V0OworICAgIHVuc2lnbmVkIGludCBzeiA9IGhl
YXBfbWV0YWRhdGEoaGVhcCktPnNpemU7CisgICAgdW5zaWduZWQgaW50IHBvcyA9IHQtPmhlYXBf
b2Zmc2V0OwogCiAgICAgaWYgKCB1bmxpa2VseShwb3MgPT0gc3opICkKICAgICB7CkBAIC0xMzAs
NyArMTMwLDcgQEAgc3RhdGljIGludCByZW1vdmVfZnJvbV9oZWFwKHN0cnVjdCB0aW1lcgogLyog
QWRkIG5ldyBlbnRyeSBAdCB0byBAaGVhcC4gUmV0dXJuIFRSVUUgaWYgbmV3IHRvcCBvZiBoZWFw
LiAqLwogc3RhdGljIGludCBhZGRfdG9faGVhcChzdHJ1Y3QgdGltZXIgKipoZWFwLCBzdHJ1Y3Qg
dGltZXIgKnQpCiB7Ci0gICAgaW50IHN6ID0gaGVhcF9tZXRhZGF0YShoZWFwKS0+c2l6ZTsKKyAg
ICB1bnNpZ25lZCBpbnQgc3ogPSBoZWFwX21ldGFkYXRhKGhlYXApLT5zaXplOwogCiAgICAgLyog
RmFpbCBpZiB0aGUgaGVhcCBpcyBmdWxsLiAqLwogICAgIGlmICggdW5saWtlbHkoc3ogPT0gaGVh
cF9tZXRhZGF0YShoZWFwKS0+bGltaXQpICkKQEAgLTQ2Myw5ICs0NjMsMTQgQEAgc3RhdGljIHZv
aWQgdGltZXJfc29mdGlycV9hY3Rpb24odm9pZCkKICAgICBpZiAoIHVubGlrZWx5KHRzLT5saXN0
ICE9IE5VTEwpICkKICAgICB7CiAgICAgICAgIC8qIG9sZF9saW1pdCA9PSAoMl5uKS0xOyBuZXdf
bGltaXQgPT0gKDJeKG4rNCkpLTEgKi8KLSAgICAgICAgaW50IG9sZF9saW1pdCA9IGhlYXBfbWV0
YWRhdGEoaGVhcCktPmxpbWl0OwotICAgICAgICBpbnQgbmV3X2xpbWl0ID0gKChvbGRfbGltaXQg
KyAxKSA8PCA0KSAtIDE7Ci0gICAgICAgIHN0cnVjdCB0aW1lciAqKm5ld2hlYXAgPSB4bWFsbG9j
X2FycmF5KHN0cnVjdCB0aW1lciAqLCBuZXdfbGltaXQgKyAxKTsKKyAgICAgICAgdW5zaWduZWQg
aW50IG9sZF9saW1pdCA9IGhlYXBfbWV0YWRhdGEoaGVhcCktPmxpbWl0OworICAgICAgICB1bnNp
Z25lZCBpbnQgbmV3X2xpbWl0ID0gKChvbGRfbGltaXQgKyAxKSA8PCA0KSAtIDE7CisgICAgICAg
IHN0cnVjdCB0aW1lciAqKm5ld2hlYXAgPSBOVUxMOworCisgICAgICAgIC8qIERvbid0IGdyb3cg
dGhlIGhlYXAgYmV5b25kIHdoYXQgaXMgcmVwcmVzZW50YWJsZSBpbiBpdHMgbWV0YWRhdGEuICov
CisgICAgICAgIGlmICggbmV3X2xpbWl0ID09ICh0eXBlb2YoaGVhcF9tZXRhZGF0YShoZWFwKS0+
bGltaXQpKW5ld19saW1pdCAmJgorICAgICAgICAgICAgIG5ld19saW1pdCArIDEgKQorICAgICAg
ICAgICAgbmV3aGVhcCA9IHhtYWxsb2NfYXJyYXkoc3RydWN0IHRpbWVyICosIG5ld19saW1pdCAr
IDEpOwogICAgICAgICBpZiAoIG5ld2hlYXAgIT0gTlVMTCApCiAgICAgICAgIHsKICAgICAgICAg
ICAgIHNwaW5fbG9ja19pcnEoJnRzLT5sb2NrKTsKQEAgLTU0NCw3ICs1NDksNyBAQCBzdGF0aWMg
dm9pZCBkdW1wX3RpbWVycSh1bnNpZ25lZCBjaGFyIGtlCiAgICAgc3RydWN0IHRpbWVycyAqdHM7
CiAgICAgdW5zaWduZWQgbG9uZyAgZmxhZ3M7CiAgICAgc190aW1lX3QgICAgICAgbm93ID0gTk9X
KCk7Ci0gICAgaW50ICAgICAgICAgICAgaSwgajsKKyAgICB1bnNpZ25lZCBpbnQgICBpLCBqOwog
CiAgICAgcHJpbnRrKCJEdW1waW5nIHRpbWVyIHF1ZXVlczpcbiIpOwogCkBAIC01NTYsNyArNTYx
LDcgQEAgc3RhdGljIHZvaWQgZHVtcF90aW1lcnEodW5zaWduZWQgY2hhciBrZQogICAgICAgICBz
cGluX2xvY2tfaXJxc2F2ZSgmdHMtPmxvY2ssIGZsYWdzKTsKICAgICAgICAgZm9yICggaiA9IDE7
IGogPD0gaGVhcF9tZXRhZGF0YSh0cy0+aGVhcCktPnNpemU7IGorKyApCiAgICAgICAgICAgICBk
dW1wX3RpbWVyKHRzLT5oZWFwW2pdLCBub3cpOwotICAgICAgICBmb3IgKCB0ID0gdHMtPmxpc3Qs
IGogPSAwOyB0ICE9IE5VTEw7IHQgPSB0LT5saXN0X25leHQsIGorKyApCisgICAgICAgIGZvciAo
IHQgPSB0cy0+bGlzdDsgdCAhPSBOVUxMOyB0ID0gdC0+bGlzdF9uZXh0ICkKICAgICAgICAgICAg
IGR1bXBfdGltZXIodCwgbm93KTsKICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdHMt
PmxvY2ssIGZsYWdzKTsKICAgICB9CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
