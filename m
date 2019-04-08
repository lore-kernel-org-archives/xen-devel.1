Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC2FC10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 17:32:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 317AF2148E
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 17:32:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ci9NvxSe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 317AF2148E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDY7j-00040p-Dn; Mon, 08 Apr 2019 17:31:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCMY=SK=oracle.com=joao.m.martins@srs-us1.protection.inumbo.net>)
 id 1hDY7h-00040k-In
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 17:31:57 +0000
X-Inumbo-ID: 3409ea71-5a24-11e9-92d7-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3409ea71-5a24-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 17:31:55 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x38HSbF0075374;
 Mon, 8 Apr 2019 17:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=TC6Rr4dhZ4pLAIm0OFKokXoDpFtW+09az8JdggeU5s4=;
 b=Ci9NvxSeLqY8w+fv3IHl/tf8j2ZJ8uJTJGqzp1RdyLRuMO/XhE6ceX9rz4Mkw/QiBluw
 NpXYVQ3QaRDlSVL5VetvXYBKBFDiQXd6Rs5sK5nAwA6XCPiiDqW7NqhEzM1Mwz1fDqDc
 28P9uCI0dhKWuIPEd5c7mg60SfDIBwITGyYaGgK5M2rc7bwUAyXhKiT3/40bVQU+akXr
 o7wQ/m8rcYrF33hbShc3uf1vS4HHGjCR5fbjHdQASoCiQ8WYolVR0Rp7Y3oi3P9N655/
 NYQuujRMPO9xH/M6IQr9LkWE4QB/2ztImMkiXb1ufwIfZ2RDfxWr+nl70Bi1WOr0cJB6 ig== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2rpkhsr0jp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Apr 2019 17:31:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x38HTose094106;
 Mon, 8 Apr 2019 17:31:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2rpkehu6j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Apr 2019 17:31:41 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x38HVdCW030255;
 Mon, 8 Apr 2019 17:31:39 GMT
Received: from [10.175.213.227] (/10.175.213.227)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Apr 2019 10:31:39 -0700
To: Juergen Gross <jgross@suse.com>
References: <20190220201609.28290-1-joao.m.martins@oracle.com>
 <35051310-c497-8ad5-4434-1b8426a317d2@redhat.com>
 <8b1f4912-4f92-69ae-ae01-d899d5640572@oracle.com>
 <3ee91f33-2973-c2db-386f-afbf138081b4@redhat.com>
 <59676804-786d-3df8-7752-8e45dec6d65b@oracle.com>
 <ac0fb2d0-59bf-1330-24ab-331c1a69b13f@suse.com>
 <94738323-ebdf-d58e-55b6-313e27c923b0@oracle.com>
 <585163c2-8dea-728d-7556-9cb3559f0eca@suse.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <97808492-58ee-337f-c894-900b34b7b1a5@oracle.com>
Date: Mon, 8 Apr 2019 18:31:35 +0100
MIME-Version: 1.0
In-Reply-To: <585163c2-8dea-728d-7556-9cb3559f0eca@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9221
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904080140
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9221
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904080140
Subject: Re: [Xen-devel] [PATCH RFC 00/39] x86/KVM: Xen HVM guest support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Ankur Arora <ankur.a.arora@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC84LzE5IDExOjQyIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA4LzA0LzIwMTkg
MTI6MzYsIEpvYW8gTWFydGlucyB3cm90ZToKPj4gT24gNC84LzE5IDc6NDQgQU0sIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAxMi8wMy8yMDE5IDE4OjE0LCBKb2FvIE1hcnRpbnMgd3JvdGU6
Cj4+Pj4gT24gMi8yMi8xOSA0OjU5IFBNLCBQYW9sbyBCb256aW5pIHdyb3RlOgo+Pj4+PiBPbiAy
MS8wMi8xOSAxMjo0NSwgSm9hbyBNYXJ0aW5zIHdyb3RlOgo+Pj4+Pj4gT24gMi8yMC8xOSA5OjA5
IFBNLCBQYW9sbyBCb256aW5pIHdyb3RlOgo+Pj4+Pj4+IE9uIDIwLzAyLzE5IDIxOjE1LCBKb2Fv
IE1hcnRpbnMgd3JvdGU6Cj4+Pj4+Pj4+ICAyLiBQViBEcml2ZXIgc3VwcG9ydCAocGF0Y2hlcyAx
NyAtIDM5KQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAgV2Ugc3RhcnQgYnkgcmVkaXJlY3RpbmcgaHlwZXJj
YWxscyBmcm9tIHRoZSBiYWNrZW5kIHRvIHJvdXRpbmVzCj4+Pj4+Pj4+ICB3aGljaCBlbXVsYXRl
IHRoZSBiZWhhdmlvdXIgdGhhdCBQViBiYWNrZW5kcyBleHBlY3QgaS5lLiBncmFudAo+Pj4+Pj4+
PiAgdGFibGUgYW5kIGludGVyZG9tYWluIGV2ZW50cy4gTmV4dCwgd2UgYWRkIHN1cHBvcnQgZm9y
IGxhdGUKPj4+Pj4+Pj4gIGluaXRpYWxpemF0aW9uIG9mIHhlbmJ1cywgZm9sbG93ZWQgYnkgaW1w
bGVtZW50aW5nCj4+Pj4+Pj4+ICBmcm9udGVuZC9iYWNrZW5kIGNvbW11bmljYXRpb24gbWVjaGFu
aXNtcyAoaS5lLiBncmFudCB0YWJsZXMgYW5kCj4+Pj4+Pj4+ICBpbnRlcmRvbWFpbiBldmVudCBj
aGFubmVscykuIEZpbmFsbHksIGludHJvZHVjZSB4ZW4tc2hpbS5rbywKPj4+Pj4+Pj4gIHdoaWNo
IHdpbGwgc2V0dXAgYSBsaW1pdGVkIFhlbiBlbnZpcm9ubWVudC4gVGhpcyB1c2VzIHRoZSBhZGRl
ZAo+Pj4+Pj4+PiAgZnVuY3Rpb25hbGl0eSBvZiBYZW4gc3BlY2lmaWMgc2hhcmVkIG1lbW9yeSAo
Z3JhbnQgdGFibGVzKSBhbmQKPj4+Pj4+Pj4gIG5vdGlmaWNhdGlvbnMgKGV2ZW50IGNoYW5uZWxz
KS4KPj4+Pj4+Pgo+Pj4+Pj4+IEkgYW0gYSBiaXQgd29ycmllZCBieSB0aGUgbGFzdCBwYXRjaGVz
LCB0aGV5IHNlZW0gcmVhbGx5IGJyaXR0bGUgYW5kCj4+Pj4+Pj4gcHJvbmUgdG8gYnJlYWthZ2Uu
ICBJIGRvbid0IGtub3cgWGVuIHdlbGwgZW5vdWdoIHRvIHVuZGVyc3RhbmQgaWYgdGhlCj4+Pj4+
Pj4gbGFjayBvZiBzdXBwb3J0IGZvciBHTlRNQVBfaG9zdF9tYXAgaXMgZml4YWJsZSwgYnV0IGlm
IG5vdCwgeW91IGhhdmUgdG8KPj4+Pj4+PiBkZWZpbmUgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBo
eXBlcmNhbGwuCj4+Pj4+Pj4KPj4+Pj4+IEkgZ3Vlc3MgQW5rdXIgYWxyZWFkeSBhbnN3ZXJlZCB0
aGlzOyBzbyBqdXN0IHRvIHN0YWNrIHRoaXMgb24gdG9wIG9mIGhpcyBjb21tZW50Lgo+Pj4+Pj4K
Pj4+Pj4+IFRoZSB4ZW5fc2hpbV9kb21haW4oKSBpcyBvbmx5IG1lYW50IHRvIGhhbmRsZSB0aGUg
Y2FzZSB3aGVyZSB0aGUgYmFja2VuZAo+Pj4+Pj4gaGFzL2Nhbi1oYXZlIGZ1bGwgYWNjZXNzIHRv
IGd1ZXN0IG1lbW9yeSBbaS5lLiBuZXRiYWNrIGFuZCBibGtiYWNrIHdvdWxkIHdvcmsKPj4+Pj4+
IHdpdGggc2ltaWxhciBhc3N1bXB0aW9ucyBhcyB2aG9zdD9dLiBGb3IgdGhlIG5vcm1hbCBjYXNl
LCB3aGVyZSBhIGJhY2tlbmQgKmluIGEKPj4+Pj4+IGd1ZXN0KiBtYXBzIGFuZCB1bm1hcHMgb3Ro
ZXIgZ3Vlc3QgbWVtb3J5LCB0aGlzIGlzIG5vdCBhcHBsaWNhYmxlIGFuZCB0aGVzZQo+Pj4+Pj4g
Y2hhbmdlcyBkb24ndCBhZmZlY3QgdGhhdCBjYXNlLgo+Pj4+Pj4KPj4+Pj4+IElPVywgdGhlIFBW
IGJhY2tlbmQgaGVyZSBzaXRzIG9uIHRoZSBoeXBlcnZpc29yLCBhbmQgdGhlIGh5cGVyY2FsbHMg
YXJlbid0Cj4+Pj4+PiBhY3R1YWwgaHlwZXJjYWxscyBidXQgcmF0aGVyIGludm9raW5nIHNoaW1f
aHlwZXJjYWxsKCkuIFRoZSBjYWxsIGNoYWluIHdvdWxkIGdvCj4+Pj4+PiBtb3JlIG9yIGxlc3Mg
bGlrZToKPj4+Pj4+Cj4+Pj4+PiA8bmV0YmFja3xibGtiYWNrfHNjc2liYWNrPgo+Pj4+Pj4gIGdu
dHRhYl9tYXBfcmVmcyhtYXBfb3BzLCBwYWdlcykKPj4+Pj4+ICAgIEhZUEVSVklTT1JfZ3JhbnRf
dGFibGVfb3AoR05UVEFCT1BfbWFwX2dyYW50X3JlZiwuLi4pCj4+Pj4+PiAgICAgIHNoaW1faHlw
ZXJjYWxsKCkKPj4+Pj4+ICAgICAgICBzaGltX2hjYWxsX2dudG1hcCgpCj4+Pj4+Pgo+Pj4+Pj4g
T3VyIHJlYXNvbmluZyB3YXMgdGhhdCBnaXZlbiB3ZSBhcmUgYWxyZWFkeSBpbiBLVk0sIHdoeSBt
YXBwaW5nIGEgcGFnZSBpZiB0aGUKPj4+Pj4+IHVzZXIgKGkuZS4gdGhlIGtlcm5lbCBQViBiYWNr
ZW5kKSBpcyBoaW1zZWxmPyBUaGUgbGFjayBvZiBHTlRNQVBfaG9zdF9tYXAgaXMgaG93Cj4+Pj4+
PiB0aGUgc2hpbSBkZXRlcm1pbmVzIGl0cyB1c2VyIGRvZXNuJ3Qgd2FudCB0byBtYXAgdGhlIHBh
Z2UuIEFsc28sIHRoZXJlJ3MgYW5vdGhlcgo+Pj4+Pj4gaXNzdWUgd2hlcmUgUFYgYmFja2VuZHMg
YWx3YXlzIG5lZWQgYSBzdHJ1Y3QgcGFnZSB0byByZWZlcmVuY2UgdGhlIGRldmljZQo+Pj4+Pj4g
aW5mbGlnaHQgZGF0YSBhcyBBbmt1ciBwb2ludGVkIG91dC4KPj4+Pj4KPj4+Pj4gVWx0aW1hdGVs
eSBpdCdzIHVwIHRvIHRoZSBYZW4gcGVvcGxlLiAgSXQgZG9lcyBtYWtlIHRoZWlyIEFQSSB1Z2xp
ZXIsCj4+Pj4+IGVzcGVjaWFsbHkgdGhlIGluL291dCBjaGFuZ2UgZm9yIHRoZSBwYXJhbWV0ZXIu
ICBJZiB5b3UgY2FuIGF0IGxlYXN0Cj4+Pj4+IGF2b2lkIHRoYXQsIGl0IHdvdWxkIGFsbGV2aWF0
ZSBteSBjb25jZXJucyBxdWl0ZSBhIGJpdC4KPj4+Pgo+Pj4+IEluIG15IHZpZXcsIHdlIGhhdmUg
dHdvIG9wdGlvbnMgb3ZlcmFsbDoKPj4+Pgo+Pj4+IDEpIE1ha2UgaXQgZXhwbGljaXQsIHRoZSBj
aGFuZ2VzIHRoZSBQViBkcml2ZXJzIHdlIGhhdmUgdG8gbWFrZSBpbgo+Pj4+IG9yZGVyIHRvIHN1
cHBvcnQgeGVuX3NoaW1fZG9tYWluKCkuIFRoaXMgY291bGQgbWVhbiBlLmcuIGEpIGFkZCBhIGNh
bGxiYWNrCj4+Pj4gYXJndW1lbnQgdG8gZ250dGFiX21hcF9yZWZzKCkgdGhhdCBpcyBpbnZva2Vk
IGZvciBldmVyeSBwYWdlIHRoYXQgZ2V0cyBsb29rZWQgdXAKPj4+PiBzdWNjZXNzZnVsbHksIGFu
ZCBpbnNpZGUgdGhpcyBjYWxsYmFjayB0aGUgUFYgZHJpdmVyIG1heSB1cGRhdGUgaXQncyB0cmFj
a2luZwo+Pj4+IHBhZ2UuIEhlcmUgd2Ugbm8gbG9uZ2VyIGhhdmUgdGhpcyBpbi9vdXQgcGFyYW1l
dGVyIGluIGdudHRhYl9tYXBfcmVmcywgYW5kIGFsbAo+Pj4+IHNoaW1fZG9tYWluIHNwZWNpZmlj
IGJpdHMgd291bGQgYmUgYSBsaXR0bGUgbW9yZSBhYnN0cmFjdGVkIGZyb20gWGVuIFBWCj4+Pj4g
YmFja2VuZHMuIFNlZSBuZXRiYWNrIGV4YW1wbGUgYmVsb3cgdGhlIHNjaXNzb3JzIG1hcmsuIE9y
IGIpIGhhdmUgc29ydCBvZiBhCj4+Pj4gdHJhbnNsYXRlX2dyZWYoKSBhbmQgcHV0X2dyZWYoKSBB
UEkgdGhhdCBYZW4gUFYgZHJpdmVycyB1c2Ugd2hpY2ggbWFrZSBpdCBldmVuCj4+Pj4gbW9yZSBl
eHBsaWNpdCB0aGF0IHRoZXJlJ3Mgbm8gZ3JhbnQgb3BzIGludm9sdmVkLiBUaGUgbGF0dGVyIGlz
IG1vcmUgaW52YXNpdmUuCj4+Pj4KPj4+PiAyKSBUaGUgc2Vjb25kIG9wdGlvbiBpcyB0byBzdXBw
b3J0IGd1ZXN0IGdyYW50IG1hcHBpbmcvdW5tYXBwaW5nIFsqXSB0byBhbGxvdwo+Pj4+IGhvc3Rp
bmcgUFYgYmFja2VuZHMgaW5zaWRlIHRoZSBndWVzdC4gVGhpcyB3b3VsZCByZW1vdmUgdGhlIFhl
biBjaGFuZ2VzIGluIHRoaXMKPj4+PiBzZXJpZXMgY29tcGxldGVseS4gQnV0IGl0IHdvdWxkIHJl
cXVpcmUgYW5vdGhlciBndWVzdCBiZWluZyB1c2VkCj4+Pj4gYXMgbmV0YmFjay9ibGtiYWNrL3hl
bnN0b3JlZCwgYW5kIGxlc3MgcGVyZm9ybWFuY2UgdGhhbiAxKSAodGhvdWdoLCBpbiB0aGVvcnks
Cj4+Pj4gaXQgd291bGQgYmUgZXF1aXZhbGVudCB0byB3aGF0IGRvZXMgWGVuIHdpdGggZ3JhbnRz
L2V2ZW50cykuIFRoZSBvbmx5IGNoYW5nZXMgaW4KPj4+PiBMaW51eCBYZW4gY29kZSBpcyBhZGRp
bmcgeGVuc3RvcmVkIGRvbWFpbiBzdXBwb3J0LCBidXQgdGhhdCBpcyB1c2VmdWwgb24gaXRzIG93
bgo+Pj4+IG91dHNpZGUgdGhlIHNjb3BlIG9mIHRoaXMgd29yay4KPj4+Pgo+Pj4+IEkgdGhpbmsg
dGhlcmUncyB2YWx1ZSBvbiBib3RoOyAxKSBpcyBwcm9iYWJseSBtb3JlIGZhbWlsaWFyIGZvciBL
Vk0gdXNlcnMKPj4+PiBwZXJoYXBzIChhcyBpdCBpcyBzaW1pbGFyIHRvIHdoYXQgdmhvc3QgZG9l
cz8pIHdoaWxlICAyKSBlcXVhdGVzIHRvIGltcGxlbWVudGluZwo+Pj4+IFhlbiBkaXNhZ3JlZ2F0
aW9uIGNhcGFiaWxpdGllcyBpbiBLVk0uCj4+Pj4KPj4+PiBUaG91Z2h0cz8gWGVuIG1haW50YWlu
ZXJzIHdoYXQncyB5b3VyIHRha2Ugb24gdGhpcz8KPj4+Cj4+PiBXaGF0IEknZCBsaWtlIGJlc3Qg
d291bGQgYmUgYSBuZXcgaGFuZGxlIChlLmcuIHhlbmhvc3RfdCAqKSB1c2VkIGFzIGFuCj4+PiBh
YnN0cmFjdGlvbiBsYXllciBmb3IgdGhpcyBraW5kIG9mIHN0dWZmLiBJdCBzaG91bGQgYmUgcGFz
c2VkIHRvIHRoZQo+Pj4gYmFja2VuZHMgYW5kIHRob3NlIHdvdWxkIHBhc3MgaXQgb24gdG8gbG93
LWxldmVsIFhlbiBkcml2ZXJzICh4ZW5idXMsCj4+PiBldmVudCBjaGFubmVscywgZ3JhbnQgdGFi
bGUsIC4uLikuCj4+Pgo+PiBTbyBpZiBJSVJDIGJhY2tlbmRzIHdvdWxkIHVzZSB0aGUgeGVuaG9z
dCBsYXllciB0byBhY2Nlc3MgZ3JhbnRzIG9yIGZyYW1lcwo+PiByZWZlcmVuY2VkIGJ5IGdyYW50
cywgYW5kIHRoYXQgd291bGQgZ3JvayBpbnRvIHNvbWUgb2YgdGhpcy4gSU9XLCB5b3Ugd291bGQg
aGF2ZQo+PiB0d28gaW1wbGVtZW50b3JzIG9mIHhlbmhvc3Q6IG9uZSBmb3IgbmVzdGVkIHJlbW90
ZS9sb2NhbCBldmVudHMrZ3JhbnRzIGFuZAo+PiBhbm90aGVyIGZvciB0aGlzICJzaGltIGRvbWFp
biIgPwo+IAo+IEFzIEknZCBuZWVkIHRoYXQgZm9yIG5lc3RlZCBYZW4gSSBndWVzcyB0aGF0IHdv
dWxkIG1ha2UgaXQgMyB2YXJpYW50cy4KPiBQcm9iYWJseSB0aGUgeGVuLXNoaW0gdmFyaWFudCB3
b3VsZCBuZWVkIG1vcmUgaG9va3MsIGJ1dCB0aGF0IHNob3VsZCBiZQo+IG5vIHByb2JsZW0uCj4g
CkkgcHJvYmFibHkgbWVzc2VkIHVwIGluIHRoZSBzaG9ydCBkZXNjcmlwdGlvbiBidXQgIm5lc3Rl
ZCByZW1vdGUvbG9jYWwKZXZlbnRzK2dyYW50cyIgd2FzIHJlZmVycmluZyB0byBuZXN0ZWQgWGVu
IChGV0lXIHJlbW90ZSBtZWFudCBMMCBhbmQgbG9jYWwgTDEpLgpTbyBtYXliZSBvbmx5IDIgdmFy
aWFudHMgYXJlIG5lZWRlZD8KCj4+PiBJIHdhcyBwbGFubmluZyB0byBkbyB0aGF0ICh0aGUgeGVu
aG9zdF90ICogc3R1ZmYpIHNvb24gaW4gb3JkZXIgdG8gYWRkCj4+PiBzdXBwb3J0IGZvciBuZXN0
ZWQgWGVuIHVzaW5nIFBWIGRldmljZXMgKHlvdSBuZWVkIHR3byBYZW5zdG9yZXMgZm9yIHRoYXQK
Pj4+IGFzIHRoZSBuZXN0ZWQgZG9tMCBpcyBhY3RpbmcgYXMgWGVuIGJhY2tlbmQgc2VydmVyLCB3
aGlsZSB1c2luZyBQVgo+Pj4gZnJvbnRlbmRzIGZvciBhY2Nlc3NpbmcgdGhlICJyZWFsIiB3b3Js
ZCBvdXRzaWRlKS4KPj4+Cj4+PiBUaGUgeGVuaG9zdF90IHNob3VsZCBiZSB1c2VkIGZvcjoKPj4+
Cj4+PiAtIGFjY2Vzc2luZyBYZW5zdG9yZQo+Pj4gLSBpc3N1aW5nIGFuZCByZWNlaXZpbmcgZXZl
bnRzCj4+PiAtIGRvaW5nIGh5cGVyY2FsbHMKPj4+IC0gZ3JhbnQgdGFibGUgb3BlcmF0aW9ucwo+
Pj4KPj4KPj4gSW4gdGhlIHRleHQgYWJvdmUsIEkgc29ydCBvZiBzdWdnZXN0ZWQgYSBzbGljZSBv
ZiB0aGlzIG9uIDEuYikgd2l0aCBhCj4+IHRyYW5zbGF0ZV9ncmVmKCkgYW5kIHB1dF9ncmVmKCkg
QVBJIC0tIHRvIGdldCB0aGUgcGFnZSBmcm9tIGEgZ3JlZi4gVGhpcyB3YXMKPj4gYmVjYXVzZSBv
ZiB0aGUgZmxhZ3N8aG9zdF9hZGRyIGh1cmRsZSB3ZSBkZXBpY3RlZCBhYm92ZSB3cnQgdG8gdXNp
bmcgdXNpbmcgZ3JhbnQKPj4gbWFwcy91bm1hcHMuIFlvdSB0aGluayBzb21lIG9mIHRoZSB4ZW5o
b3N0IGxheWVyIHdvdWxkIGJlIGFtbWVuYWJsZSB0byBzdXBwb3J0Cj4+IHRoaXMgY2FzZT8KPiAK
PiBJIHRoaW5rIHNvLCB5ZXMuCj4gCj4+Cj4+PiBTbyBleGFjdGx5IHRoZSBraW5kIG9mIHN0dWZm
IHlvdSB3YW50IHRvIGRvLCB0b28uCj4+Pgo+PiBDb29sIGlkZWEhCj4gCj4gSW4gdGhlIGVuZCB5
b3UgbWlnaHQgbWFrZSBteSBsaWZlIGVhc2llciBmb3IgbmVzdGVkIFhlbi4gOi0pCj4gCkhlaGUg
OikKCj4gRG8geW91IHdhbnQgdG8gaGF2ZSBhIHRyeSB3aXRoIHRoYXQgaWRlYSBvciBzaG91bGQg
SSBkbyB0aGF0PyBJIG1pZ2h0IGJlCj4gYWJsZSB0byBzdGFydCB3b3JraW5nIG9uIHRoYXQgaW4g
YWJvdXQgYSBtb250aC4KPiAKQW5rdXIgKENDJ2VkKSB3aWxsIGdpdmUgYSBzaG90IGF0IGl0LCBh
bmQgc2hvdWxkIHN0YXJ0IGEgbmV3IHRocmVhZCBvbiB0aGlzCnhlbmhvc3QgYWJzdHJhY3Rpb24g
bGF5ZXIuCgoJSm9hbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
