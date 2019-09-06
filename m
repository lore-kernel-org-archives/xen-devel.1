Return-Path: <SRS0=7BPq=XB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6539CC43331
	for <xen-devel@archiver.kernel.org>; Fri,  6 Sep 2019 07:41:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F79D20640
	for <xen-devel@archiver.kernel.org>; Fri,  6 Sep 2019 07:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F79D20640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i68rj-0004ED-U8; Fri, 06 Sep 2019 07:41:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pN+4=XB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i68ri-0004E8-02
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 07:41:06 +0000
X-Inumbo-ID: ad9b86b4-d079-11e9-abeb-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad9b86b4-d079-11e9-abeb-12813bfff9fa;
 Fri, 06 Sep 2019 07:41:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96B5AB648;
 Fri,  6 Sep 2019 07:41:02 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  6 Sep 2019 09:40:58 +0200
Message-Id: <20190906074058.21782-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Reply-To: xen-devel@lists.xenproject.org, jgross@suse.com
Cc: jgross@suse.com, luwei.kang@intel.com, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, marmarek@invisiblethingslab.com,
 olekstysh@gmail.com, paul.durrant@citrix.com, JBeulich@suse.com,
 puwen@hygon.cn, roger.pau@citrix.com, Volodymyr_Babchuk@epam.com,
 chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBlbWFpbCBvbmx5IHRyYWNrcyBiaWcgaXRlbXMgZm9yIHhlbi5naXQgdHJlZS4gUGxlYXNl
IHJlcGx5IGZvciBpdGVtcyB5b3UKd291bGQgbGlrZSB0byBzZWUgaW4gNC4xMyBzbyB0aGF0IHBl
b3BsZSBoYXZlIGFuIGlkZWEgd2hhdCBpcyBnb2luZyBvbiBhbmQKcHJpb3JpdGlzZSBhY2NvcmRp
bmdseS4KCllvdSdyZSB3ZWxjb21lIHRvIHByb3ZpZGUgZGVzY3JpcHRpb24gYW5kIHVzZSBjYXNl
cyBvZiB0aGUgZmVhdHVyZSB5b3UncmUKd29ya2luZyBvbi4KCj0gVGltZWxpbmUgPQoKV2Ugbm93
IGFkb3B0IGEgZml4ZWQgY3V0LW9mZiBkYXRlIHNjaGVtZS4gV2Ugd2lsbCByZWxlYXNlIGFib3V0
IGV2ZXJ5IDggbW9udGhzLgpUaGUgdXBjb21pbmcgNC4xMyB0aW1lbGluZSBhcmUgYXMgZm9sbG93
ZWQ6CgoqIExhc3QgcG9zdGluZyBkYXRlOiBTZXB0ZW1iZXIgMTN0aCwgMjAxOQoqIEhhcmQgY29k
ZSBmcmVlemU6IFNlcHRlbWJlciAyN3RoLCAyMDE5CiogUkMxOiBUQkQKKiBSZWxlYXNlOiBOb3Zl
bWJlciA3dGgsIDIwMTkKCk5vdGUgdGhhdCB3ZSBkb24ndCBoYXZlIGZyZWV6ZSBleGNlcHRpb24g
c2NoZW1lIGFueW1vcmUuIEFsbCBwYXRjaGVzCnRoYXQgd2lzaCB0byBnbyBpbnRvIDQuMTMgbXVz
dCBiZSBwb3N0ZWQgaW5pdGlhbGx5IG5vIGxhdGVyIHRoYW4gdGhlCmxhc3QgcG9zdGluZyBkYXRl
IGFuZCBmaW5hbGx5IG5vIGxhdGVyIHRoYW4gdGhlIGhhcmQgY29kZSBmcmVlemUuIEFsbApwYXRj
aGVzIHBvc3RlZCBhZnRlciB0aGF0IGRhdGUgd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHF1ZXVlZCBp
bnRvIG5leHQKcmVsZWFzZS4KClJDcyB3aWxsIGJlIGFycmFuZ2VkIGltbWVkaWF0ZWx5IGFmdGVy
IGZyZWV6ZS4KCldlIHJlY2VudGx5IGludHJvZHVjZWQgYSBqaXJhIGluc3RhbmNlIHRvIHRyYWNr
IGFsbCB0aGUgdGFza3MgKG5vdCBvbmx5IGJpZykKZm9yIHRoZSBwcm9qZWN0LiBTZWU6IGh0dHBz
Oi8veGVucHJvamVjdC5hdGxhc3NpYW4ubmV0L3Byb2plY3RzL1hFTi9pc3N1ZXMuCgpTb21lIG9m
IHRoZSB0YXNrcyB0cmFja2VkIGJ5IHRoaXMgZS1tYWlsIGFsc28gaGF2ZSBhIGNvcnJlc3BvbmRp
bmcgamlyYSB0YXNrCnJlZmVycmVkIGJ5IFhFTi1OLgoKSSBoYXZlIHN0YXJ0ZWQgdG8gaW5jbHVk
ZSB0aGUgdmVyc2lvbiBudW1iZXIgb2Ygc2VyaWVzIGFzc29jaWF0ZWQgdG8gZWFjaApmZWF0dXJl
LiBDYW4gZWFjaCBvd25lciBzZW5kIGFuIHVwZGF0ZSBvbiB0aGUgdmVyc2lvbiBudW1iZXIgaWYg
dGhlIHNlcmllcwp3YXMgcG9zdGVkIHVwc3RyZWFtPwoKPSBQcm9qZWN0cyA9Cgo9PSBIeXBlcnZp
c29yID09IAoKKiAgUGVyLWNwdSB0YXNrbGV0CiAgLSAgWEVOLTI4CiAgLSAgS29ucmFkIFJ6ZXN6
dXRlayBXaWxrCgoqICBDb3JlIHNjaGVkdWxpbmcgKHYyKQogIC0gIEp1ZXJnZW4gR3Jvc3MKCj09
PSB4ODYgPT09IAoKKiAgUFYtSU9NTVUgKHY3KQogIC0gIFBhdWwgRHVycmFudAoKKiAgSFZNIGd1
ZXN0IENQVSB0b3BvbG9neSBzdXBwb3J0IChSRkMpCiAgLSAgQ2hhbyBHYW8KCiogIEludGVsIFBy
b2Nlc3NvciBUcmFjZSB2aXJ0dWFsaXphdGlvbiBlbmFibGluZyAodjEpCiAgLSAgTHV3ZWkgS2Fu
ZwoKKiAgTGludXggc3R1YiBkb21haW5zIChSRkMgdjIpCiAgLSAgTWFyZWsgTWFyY3p5a293c2tp
LUfDs3JlY2tpCgoqICBJbXByb3ZlIGxhdGUgbWljcm9jb2RlIGxvYWRpbmcgKHY5KQogIC0gIENo
YW8gR2FvCgoqICBGaXhlcyB0byAjREIgaW5qZWN0aW9uCiAgLSAgQW5kcmV3IENvb3BlcgoKKiAg
Q1BVSUQvTVNSIFhlbi90b29sc3RhY2sgaW1wcm92ZW1lbnRzCiAgLSAgQW5kcmV3IENvb3BlcgoK
KiAgSW1wcm92ZW1lbnRzIHRvIGRvbWFpbl9jcmFzaCgpCiAgLSAgQW5kcmV3IENvb3BlcgoKKiAg
RUlCUlMKICAtICBBbmRyZXcgQ29vcGVyCgoqICBYZW4gaW9yZXEgc2VydmVyICh2MikKICAtICBS
b2dlciBQYXUgTW9ubmUKCj09PSBBUk0gPT09IAoKKiAgVEVFIG1lZGlhdG9yIChhbmQgT1AtVEVF
KSBzdXBwb3J0IGluIFhFTiAodjcpCiAgLSAgVm9sb2R5bXlyIEJhYmNodWsKCiogIFJlbmVzYXMg
SVBNTVUtVk1TQSBzdXBwb3J0ICsgTGludXgncyBpb21tdV9md3NwZWMgKHYyKQogIC0gIE9sZWtz
YW5kciBUeXNoY2hlbmtvCgo9PSBDb21wbGV0ZWQgPT0gCgoqICBEcm9wIHRtZW0KICAtICBXZWkg
TGl1CgoqICBBZGQgc3VwcG9ydCBmb3IgSHlnb24gRGh5YW5hIEZhbWlseSAxOGggcHJvY2Vzc29y
CiAgLSAgUHUgV2VuCgoqICBoeXBlcnZpc29yIHg4NiBpbnN0cnVjdGlvbiBlbXVsYXRvciBhZGRp
dGlvbnMgZm9yIEFWWDUxMgogIC0gIEphbiBCZXVsaWNoCgoqICB4MkFQSUMgc3VwcG9ydCBmb3Ig
QU1ECiAgLSAgSmFuIEJldWxpY2gKCgpKdWVyZ2VuIEdyb3NzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
