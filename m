Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC00C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 05:25:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D2B20825
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 05:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D2B20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFu7B-0003A5-Ou; Mon, 15 Apr 2019 05:25:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CazJ=SR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hFu7A-00039w-1y
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 05:25:08 +0000
X-Inumbo-ID: d40ef42a-5f3e-11e9-92d7-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d40ef42a-5f3e-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 05:25:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7B6CDACE1;
 Mon, 15 Apr 2019 05:25:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 15 Apr 2019 07:25:02 +0200
Message-Id: <20190415052502.1067-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] Xen 4.13 Development Update
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
Cc: jgross@suse.com, wei.liu2@citrix.com, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, marmarek@invisiblethingslab.com, dfaggioli@suse.com,
 paul.durrant@citrix.com, JBeulich@suse.com, puwen@hygon.cn,
 luwei.kang@intel.com, Volodymyr_Babchuk@epam.com, chao.gao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415052502.Y1-pZtMLi44x23v3whBXXVS4OclHyaueOjM7BNmISZE@z>

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
dXRlayBXaWxrCgoqICBJbXByb3ZlbWVudHMgdG8gZG9tYWluIGNyZWF0aW9uICh2MikKICAtICBB
bmRyZXcgQ29vcGVyCgoqICBDb3JlIGF3YXJlIHNjaGVkdWxpbmcgKFJGQyB2MSkKICAtICBEYXJp
byBGYWdnaW9saQoKKiAgQ29yZSBhd2FyZSBzY2hlZHVsaW5nIGZvciBjcmVkaXQyIChSRkMgdjEp
CiAgLSAgRGFyaW8gRmFnZ2lvbGkKCiogIENvcmUgc2NoZWR1bGluZyAoUkZDIHYxKQogIC0gIEp1
ZXJnZW4gR3Jvc3MKCiogIFN3aXRjaCB0byB1c2UgZG9taGVhcCBwYWdlIGZvciBwYWdlIHRhYmxl
IChSRkMgdjEpCiAgLSAgV2VpIExpdQoKKiAgRHJvcCB0bWVtCiAgLSAgV2VpIExpdQoKPT09IHg4
NiA9PT0gCgoqICBQVi1JT01NVSAodjcpCiAgLSAgUGF1bCBEdXJyYW50CgoqICBIVk0gZ3Vlc3Qg
Q1BVIHRvcG9sb2d5IHN1cHBvcnQgKFJGQykKICAtICBDaGFvIEdhbwoKKiAgSW50ZWwgUHJvY2Vz
c29yIFRyYWNlIHZpcnR1YWxpemF0aW9uIGVuYWJsaW5nICh2MSkKICAtICBMdXdlaSBLYW5nCgoq
ICBMaW51eCBzdHViIGRvbWFpbnMgKFJGQyB2MikKICAtICBNYXJlayBNYXJjenlrb3dza2ktR8Oz
cmVja2kKCiogIEltcHJvdmUgbGF0ZSBtaWNyb2NvZGUgbG9hZGluZyAodjQpCiAgLSAgQ2hhbyBH
YW8KCiogIEZpeGVzIHRvICNEQiBpbmplY3Rpb24KICAtICBBbmRyZXcgQ29vcGVyCgoqICBDUFVJ
RC9NU1IgWGVuL3Rvb2xzdGFjayBpbXByb3ZlbWVudHMKICAtICBBbmRyZXcgQ29vcGVyCgoqICBJ
bXByb3ZlbWVudHMgdG8gZG9tYWluX2NyYXNoKCkKICAtICBBbmRyZXcgQ29vcGVyCgoqICBBZGQg
c3VwcG9ydCBmb3IgSHlnb24gRGh5YW5hIEZhbWlseSAxOGggcHJvY2Vzc29yICh2NCkKICAtICBQ
dSBXZW4KCiogIHgyQVBJQyBzdXBwb3J0IGZvciBBTUQKICAtICBKYW4gQmV1bGljaAoKKiAgRUlC
UlMKICAtICBBbmRyZXcgQ29vcGVyCgo9PT0gQVJNID09PSAKCiogIFRFRSBtZWRpYXRvciAoYW5k
IE9QLVRFRSkgc3VwcG9ydCBpbiBYRU4gKHYyKQogIC0gIFZvbG9keW15ciBCYWJjaHVrCgo9PSBD
b21wbGV0ZWQgPT0gCgoKSnVlcmdlbiBHcm9zcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
