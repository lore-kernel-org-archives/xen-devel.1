Return-Path: <SRS0=CxSR=XP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C08AC49ED7
	for <xen-devel@archiver.kernel.org>; Fri, 20 Sep 2019 13:54:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E30C2054F
	for <xen-devel@archiver.kernel.org>; Fri, 20 Sep 2019 13:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E30C2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBJMP-0007NV-1W; Fri, 20 Sep 2019 13:54:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBJMN-0007NN-8c
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 13:54:07 +0000
X-Inumbo-ID: 1bc16a7a-dbae-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bc16a7a-dbae-11e9-a337-bc764e2007e4;
 Fri, 20 Sep 2019 13:54:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 318C7AF2A;
 Fri, 20 Sep 2019 13:54:04 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <c5ffff18-bded-486d-5883-da1f6e091d51@suse.com>
Date: Fri, 20 Sep 2019 15:54:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2] libxc/x86: avoid overflow in CPUID APIC ID
 adjustments
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVjZW50IEFNRCBwcm9jZXNzb3JzIG1heSByZXBvcnQgdXAgdG8gMTI4IGxvZ2ljYWwgcHJvY2Vz
c29ycyBpbiBDUFVJRApsZWFmIDEuIERvdWJsaW5nIHRoaXMgdmFsdWUgcHJvZHVjZXMgMCAod2hp
Y2ggT1NlcyBzaW5jZXJlbHkgZGlzbGlrZSksCmFzIHRoZSByZXNwZWN0aXZlIGZpZWxkIGlzIG9u
bHkgOCBiaXRzIHdpZGUuIFN1cHByZXNzIGRvdWJsaW5nIHRoZSB2YWx1ZQooYW5kIGl0cyBsZWFm
IDB4ODAwMDAwMDggY291bnRlcnBhcnQpIGluIHN1Y2ggYSBjYXNlLgoKTm90ZSB0aGF0IHdoaWxl
IHRoZXJlJ3MgYSBzaW1pbGFyIG92ZXJmbG93IGluIGludGVsX3hjX2NwdWlkX3BvbGljeSgpLAp0
aGF0IG9uZSBpcyBiZWluZyBsZWZ0IGFsb25lIGZvciBub3cuCgpOb3RlIGZ1cnRoZXIgdGhhdCB3
aGlsZSBpdCB3YXMgY29uc2lkZXJlZCB0byBzdXBwcmVzcyB0aGUgbXVsdGlwbGljYXRpb24KYnkg
MiBhbHRvZ2V0aGVyIGlmIHRoZSBob3N0IHRvcG9sb2d5IGFscmVhZHkgcHJvdmlkZXMgYXQgbGVh
c3Qgb25lIGJpdApvZiB0aHJlYWQgSUQgd2l0aGluIEFQSUMgSURzLCBpdCB3YXMgZGVjaWRlZCB0
byBhdm9pZCBtb3JlIGNoYW5nZSBoZXJlCnRoYW4gcmVhbGx5IG5lZWRlZCBhdCB0aGlzIHBvaW50
LgoKQWxzbyB6YXAgbGVhZiA0IChhbmQgYXQgdGhlIHNhbWUgdGltZSBsZWFmIDIpIEVEWCBvdXRw
dXQgZm9yIEFNRCwgYXMgaXQKc2hvdWxkIGhhdmUgYmVlbiBmcm9tIHRoZSBiZWdpbm5pbmcuCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MjogRHJv
cCB1c2Ugb2YgcGh5c2luZm8uIERyb3AgSW50ZWwtb25seSBsZWFmIDQgY2hhbmdlLiBJbmNyZW1l
bnQKICAgIEFwaWNJZENvcmVTaXplIG9ubHkgd2hlbiBkb3VibGluZyBOdW1iZXJPZkNvcmVzLgoK
LS0tIGEvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMKKysrIGIvdG9vbHMvbGlieGMveGNfY3B1
aWRfeDg2LmMKQEAgLTM4NSw3ICszODUsNyBAQCBzdGF0aWMgdm9pZCBhbWRfeGNfY3B1aWRfcG9s
aWN5KGNvbnN0IHN0CiAgICAgewogICAgIGNhc2UgMHgwMDAwMDAwMjoKICAgICBjYXNlIDB4MDAw
MDAwMDQ6Ci0gICAgICAgIHJlZ3NbMF0gPSByZWdzWzFdID0gcmVnc1syXSA9IDA7CisgICAgICAg
IHJlZ3NbMF0gPSByZWdzWzFdID0gcmVnc1syXSA9IHJlZ3NbM10gPSAwOwogICAgICAgICBicmVh
azsKIAogICAgIGNhc2UgMHg4MDAwMDAwMDoKQEAgLTM5NSwxMSArMzk1LDIwIEBAIHN0YXRpYyB2
b2lkIGFtZF94Y19jcHVpZF9wb2xpY3koY29uc3Qgc3QKIAogICAgIGNhc2UgMHg4MDAwMDAwODoK
ICAgICAgICAgLyoKLSAgICAgICAgICogRUNYWzE1OjEyXSBpcyBBcGljSWRDb3JlU2l6ZTogRUNY
Wzc6MF0gaXMgTnVtYmVyT2ZDb3JlcyAobWludXMgb25lKS4KLSAgICAgICAgICogVXBkYXRlIHRv
IHJlZmxlY3QgdkxBUElDX0lEID0gdkNQVV9JRCAqIDIuCisgICAgICAgICAqIEVDWFsxNToxMl0g
aXMgQXBpY0lkQ29yZVNpemUuCisgICAgICAgICAqIEVDWFs3OjBdIGlzIE51bWJlck9mQ29yZXMg
KG1pbnVzIG9uZSkuCisgICAgICAgICAqIFVwZGF0ZSB0byByZWZsZWN0IHZMQVBJQ19JRCA9IHZD
UFVfSUQgKiAyLiAgQnV0IG1ha2Ugc3VyZSB0byBhdm9pZAorICAgICAgICAgKiAtIG92ZXJmbG93
LAorICAgICAgICAgKiAtIGdvaW5nIG91dCBvZiBzeW5jIHdpdGggbGVhZiAxIEVCWFsyMzoxNl0s
CisgICAgICAgICAqIC0gaW5jcmVtZW50aW5nIEFwaWNJZENvcmVTaXplIHdoZW4gaXQncyB6ZXJv
ICh3aGljaCBjaGFuZ2VzIHRoZQorICAgICAgICAgKiAgIG1lYW5pbmcgb2YgYml0cyA3OjApLgog
ICAgICAgICAgKi8KLSAgICAgICAgcmVnc1syXSA9ICgocmVnc1syXSArICgxdSA8PCAxMikpICYg
MHhmMDAwdSkgfAotICAgICAgICAgICAgICAgICAgKChyZWdzWzJdICYgMHhmZnUpIDw8IDEpIHwg
MXU7CisgICAgICAgIGlmICggKHJlZ3NbMl0gJiAweDdmdSkgPCAweDdmdSApCisgICAgICAgIHsK
KyAgICAgICAgICAgIGlmICggKHJlZ3NbMl0gJiAweGYwMDB1KSAmJiAocmVnc1syXSAmIDB4ZjAw
MHUpICE9IDB4ZjAwMHUgKQorICAgICAgICAgICAgICAgIHJlZ3NbMl0gPSAoKHJlZ3NbMl0gKyAw
eDEwMDB1KSAmIDB4ZjAwMHUpIHwgKHJlZ3NbMl0gJiAweGZmdSk7CisgICAgICAgICAgICByZWdz
WzJdID0gKHJlZ3NbMl0gJiAweGYwMDB1KSB8ICgocmVnc1syXSAmIDB4N2Z1KSA8PCAxKSB8IDF1
OworICAgICAgICB9CiAgICAgICAgIGJyZWFrOwogCiAgICAgY2FzZSAweDgwMDAwMDBhOiB7CkBA
IC00NzgsOSArNDg3LDEzIEBAIHN0YXRpYyB2b2lkIHhjX2NwdWlkX2h2bV9wb2xpY3koY29uc3Qg
c3QKICAgICBjYXNlIDB4MDAwMDAwMDE6CiAgICAgICAgIC8qCiAgICAgICAgICAqIEVCWFsyMzox
Nl0gaXMgTWF4aW11bSBMb2dpY2FsIFByb2Nlc3NvcnMgUGVyIFBhY2thZ2UuCi0gICAgICAgICAq
IFVwZGF0ZSB0byByZWZsZWN0IHZMQVBJQ19JRCA9IHZDUFVfSUQgKiAyLgorICAgICAgICAgKiBV
cGRhdGUgdG8gcmVmbGVjdCB2TEFQSUNfSUQgPSB2Q1BVX0lEICogMiwgYnV0IG1ha2Ugc3VyZSB0
byBhdm9pZAorICAgICAgICAgKiBvdmVyZmxvdy4KICAgICAgICAgICovCi0gICAgICAgIHJlZ3Nb
MV0gPSAocmVnc1sxXSAmIDB4MDAwMGZmZmZ1KSB8ICgocmVnc1sxXSAmIDB4MDA3ZjAwMDB1KSA8
PCAxKTsKKyAgICAgICAgaWYgKCAhKHJlZ3NbMV0gJiAweDAwODAwMDAwdSkgKQorICAgICAgICAg
ICAgcmVnc1sxXSA9IChyZWdzWzFdICYgMHgwMDAwZmZmZnUpIHwgKChyZWdzWzFdICYgMHgwMDdm
MDAwMHUpIDw8IDEpOworICAgICAgICBlbHNlCisgICAgICAgICAgICByZWdzWzFdICY9IDB4MDBm
ZmZmZmZ1OwogCiAgICAgICAgIHJlZ3NbMl0gPSBpbmZvLT5mZWF0dXJlc2V0W2ZlYXR1cmV3b3Jk
X29mKFg4Nl9GRUFUVVJFX1NTRTMpXTsKICAgICAgICAgcmVnc1szXSA9IChpbmZvLT5mZWF0dXJl
c2V0W2ZlYXR1cmV3b3JkX29mKFg4Nl9GRUFUVVJFX0ZQVSldIHwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
