Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322C7C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 05:51:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E19BC2084B
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 05:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oJfsGKOK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E19BC2084B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hE68h-0002Zg-AC; Wed, 10 Apr 2019 05:51:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u/ID=SM=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hE68g-0002Zb-Ao
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 05:51:14 +0000
X-Inumbo-ID: a57668a2-5b54-11e9-92d7-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a57668a2-5b54-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 05:51:12 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3A5iaFV045325;
 Wed, 10 Apr 2019 05:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=vBGEx1u4ETjzLctlghoHy+pgeY6OEoIag8vqsKRSLCI=;
 b=oJfsGKOKw5eZF6yFQGebwkDVOtg694sZmAnkSWdRfjoJ68GK9y2BYAdDJ7/o7OME/Ohu
 EtdEfGmlPlGmQdQvmX6NlVkouUPiEhmQRiZgh8LQnUPyyNcIQnpZTaRydcVO4sfAgpqc
 2e207HuNdcAaiOyYXNQEijZ5CW5/zZR059Y5LSCE85zIszt6hdrp5uJpQggCIGfeBLzZ
 sXemhv1Bi2X1kKYF3CULBIDLxCtL40uMmsfS4QeWpLidygb4FTbZsp6q0nIPJVBgfPhi
 pCleZ/NLwkuOrdt0ddxJHyC/ZsKFCXJc6VlAE6k8IoG0Q8hH8TJKFiDQkBl+gKMP8MPw 6g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2rpkht0xa0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Apr 2019 05:50:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3A5ngbV042641;
 Wed, 10 Apr 2019 05:50:45 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2rpytc1r6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Apr 2019 05:50:44 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3A5oeeJ022577;
 Wed, 10 Apr 2019 05:50:41 GMT
Received: from [10.159.253.119] (/10.159.253.119)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 09 Apr 2019 22:50:40 -0700
To: Stefano Stabellini <sstabellini@kernel.org>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20190220201609.28290-1-joao.m.martins@oracle.com>
 <35051310-c497-8ad5-4434-1b8426a317d2@redhat.com>
 <8b1f4912-4f92-69ae-ae01-d899d5640572@oracle.com>
 <3ee91f33-2973-c2db-386f-afbf138081b4@redhat.com>
 <59676804-786d-3df8-7752-8e45dec6d65b@oracle.com>
 <ac0fb2d0-59bf-1330-24ab-331c1a69b13f@suse.com>
 <94738323-ebdf-d58e-55b6-313e27c923b0@oracle.com>
 <585163c2-8dea-728d-7556-9cb3559f0eca@suse.com>
 <97808492-58ee-337f-c894-900b34b7b1a5@oracle.com>
 <alpine.DEB.2.10.1904081728120.4155@sstabellini-ThinkPad-X260>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <8300d893-40a3-2b5b-e510-cd5955c72670@oracle.com>
Date: Tue, 9 Apr 2019 22:50:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904081728120.4155@sstabellini-ThinkPad-X260>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9222
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904100042
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9222
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904100042
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
Cc: Juergen Gross <jgross@suse.com>, Artem_Mygaiev@epam.com,
 kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wNC0wOCA1OjM1IHAubS4sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBN
b24sIDggQXByIDIwMTksIEpvYW8gTWFydGlucyB3cm90ZToKPj4gT24gNC84LzE5IDExOjQyIEFN
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMDgvMDQvMjAxOSAxMjozNiwgSm9hbyBNYXJ0
aW5zIHdyb3RlOgo+Pj4+IE9uIDQvOC8xOSA3OjQ0IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
Pj4+PiBPbiAxMi8wMy8yMDE5IDE4OjE0LCBKb2FvIE1hcnRpbnMgd3JvdGU6Cj4+Pj4+PiBPbiAy
LzIyLzE5IDQ6NTkgUE0sIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4+Pj4+Pj4gT24gMjEvMDIvMTkg
MTI6NDUsIEpvYW8gTWFydGlucyB3cm90ZToKPj4+Pj4+Pj4gT24gMi8yMC8xOSA5OjA5IFBNLCBQ
YW9sbyBCb256aW5pIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMjAvMDIvMTkgMjE6MTUsIEpvYW8gTWFy
dGlucyB3cm90ZToKPj4+Pj4+Pj4+PiAgIDIuIFBWIERyaXZlciBzdXBwb3J0IChwYXRjaGVzIDE3
IC0gMzkpCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiAgIFdlIHN0YXJ0IGJ5IHJlZGlyZWN0aW5nIGh5
cGVyY2FsbHMgZnJvbSB0aGUgYmFja2VuZCB0byByb3V0aW5lcwo+Pj4+Pj4+Pj4+ICAgd2hpY2gg
ZW11bGF0ZSB0aGUgYmVoYXZpb3VyIHRoYXQgUFYgYmFja2VuZHMgZXhwZWN0IGkuZS4gZ3JhbnQK
Pj4+Pj4+Pj4+PiAgIHRhYmxlIGFuZCBpbnRlcmRvbWFpbiBldmVudHMuIE5leHQsIHdlIGFkZCBz
dXBwb3J0IGZvciBsYXRlCj4+Pj4+Pj4+Pj4gICBpbml0aWFsaXphdGlvbiBvZiB4ZW5idXMsIGZv
bGxvd2VkIGJ5IGltcGxlbWVudGluZwo+Pj4+Pj4+Pj4+ICAgZnJvbnRlbmQvYmFja2VuZCBjb21t
dW5pY2F0aW9uIG1lY2hhbmlzbXMgKGkuZS4gZ3JhbnQgdGFibGVzIGFuZAo+Pj4+Pj4+Pj4+ICAg
aW50ZXJkb21haW4gZXZlbnQgY2hhbm5lbHMpLiBGaW5hbGx5LCBpbnRyb2R1Y2UgeGVuLXNoaW0u
a28sCj4+Pj4+Pj4+Pj4gICB3aGljaCB3aWxsIHNldHVwIGEgbGltaXRlZCBYZW4gZW52aXJvbm1l
bnQuIFRoaXMgdXNlcyB0aGUgYWRkZWQKPj4+Pj4+Pj4+PiAgIGZ1bmN0aW9uYWxpdHkgb2YgWGVu
IHNwZWNpZmljIHNoYXJlZCBtZW1vcnkgKGdyYW50IHRhYmxlcykgYW5kCj4+Pj4+Pj4+Pj4gICBu
b3RpZmljYXRpb25zIChldmVudCBjaGFubmVscykuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSSBhbSBh
IGJpdCB3b3JyaWVkIGJ5IHRoZSBsYXN0IHBhdGNoZXMsIHRoZXkgc2VlbSByZWFsbHkgYnJpdHRs
ZSBhbmQKPj4+Pj4+Pj4+IHByb25lIHRvIGJyZWFrYWdlLiAgSSBkb24ndCBrbm93IFhlbiB3ZWxs
IGVub3VnaCB0byB1bmRlcnN0YW5kIGlmIHRoZQo+Pj4+Pj4+Pj4gbGFjayBvZiBzdXBwb3J0IGZv
ciBHTlRNQVBfaG9zdF9tYXAgaXMgZml4YWJsZSwgYnV0IGlmIG5vdCwgeW91IGhhdmUgdG8KPj4+
Pj4+Pj4+IGRlZmluZSBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IGh5cGVyY2FsbC4KPj4+Pj4+Pj4+
Cj4+Pj4+Pj4+IEkgZ3Vlc3MgQW5rdXIgYWxyZWFkeSBhbnN3ZXJlZCB0aGlzOyBzbyBqdXN0IHRv
IHN0YWNrIHRoaXMgb24gdG9wIG9mIGhpcyBjb21tZW50Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGUg
eGVuX3NoaW1fZG9tYWluKCkgaXMgb25seSBtZWFudCB0byBoYW5kbGUgdGhlIGNhc2Ugd2hlcmUg
dGhlIGJhY2tlbmQKPj4+Pj4+Pj4gaGFzL2Nhbi1oYXZlIGZ1bGwgYWNjZXNzIHRvIGd1ZXN0IG1l
bW9yeSBbaS5lLiBuZXRiYWNrIGFuZCBibGtiYWNrIHdvdWxkIHdvcmsKPj4+Pj4+Pj4gd2l0aCBz
aW1pbGFyIGFzc3VtcHRpb25zIGFzIHZob3N0P10uIEZvciB0aGUgbm9ybWFsIGNhc2UsIHdoZXJl
IGEgYmFja2VuZCAqaW4gYQo+Pj4+Pj4+PiBndWVzdCogbWFwcyBhbmQgdW5tYXBzIG90aGVyIGd1
ZXN0IG1lbW9yeSwgdGhpcyBpcyBub3QgYXBwbGljYWJsZSBhbmQgdGhlc2UKPj4+Pj4+Pj4gY2hh
bmdlcyBkb24ndCBhZmZlY3QgdGhhdCBjYXNlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJT1csIHRoZSBQ
ViBiYWNrZW5kIGhlcmUgc2l0cyBvbiB0aGUgaHlwZXJ2aXNvciwgYW5kIHRoZSBoeXBlcmNhbGxz
IGFyZW4ndAo+Pj4+Pj4+PiBhY3R1YWwgaHlwZXJjYWxscyBidXQgcmF0aGVyIGludm9raW5nIHNo
aW1faHlwZXJjYWxsKCkuIFRoZSBjYWxsIGNoYWluIHdvdWxkIGdvCj4+Pj4+Pj4+IG1vcmUgb3Ig
bGVzcyBsaWtlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiA8bmV0YmFja3xibGtiYWNrfHNjc2liYWNrPgo+
Pj4+Pj4+PiAgIGdudHRhYl9tYXBfcmVmcyhtYXBfb3BzLCBwYWdlcykKPj4+Pj4+Pj4gICAgIEhZ
UEVSVklTT1JfZ3JhbnRfdGFibGVfb3AoR05UVEFCT1BfbWFwX2dyYW50X3JlZiwuLi4pCj4+Pj4+
Pj4+ICAgICAgIHNoaW1faHlwZXJjYWxsKCkKPj4+Pj4+Pj4gICAgICAgICBzaGltX2hjYWxsX2du
dG1hcCgpCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE91ciByZWFzb25pbmcgd2FzIHRoYXQgZ2l2ZW4gd2Ug
YXJlIGFscmVhZHkgaW4gS1ZNLCB3aHkgbWFwcGluZyBhIHBhZ2UgaWYgdGhlCj4+Pj4+Pj4+IHVz
ZXIgKGkuZS4gdGhlIGtlcm5lbCBQViBiYWNrZW5kKSBpcyBoaW1zZWxmPyBUaGUgbGFjayBvZiBH
TlRNQVBfaG9zdF9tYXAgaXMgaG93Cj4+Pj4+Pj4+IHRoZSBzaGltIGRldGVybWluZXMgaXRzIHVz
ZXIgZG9lc24ndCB3YW50IHRvIG1hcCB0aGUgcGFnZS4gQWxzbywgdGhlcmUncyBhbm90aGVyCj4+
Pj4+Pj4+IGlzc3VlIHdoZXJlIFBWIGJhY2tlbmRzIGFsd2F5cyBuZWVkIGEgc3RydWN0IHBhZ2Ug
dG8gcmVmZXJlbmNlIHRoZSBkZXZpY2UKPj4+Pj4+Pj4gaW5mbGlnaHQgZGF0YSBhcyBBbmt1ciBw
b2ludGVkIG91dC4KPj4+Pj4+Pgo+Pj4+Pj4+IFVsdGltYXRlbHkgaXQncyB1cCB0byB0aGUgWGVu
IHBlb3BsZS4gIEl0IGRvZXMgbWFrZSB0aGVpciBBUEkgdWdsaWVyLAo+Pj4+Pj4+IGVzcGVjaWFs
bHkgdGhlIGluL291dCBjaGFuZ2UgZm9yIHRoZSBwYXJhbWV0ZXIuICBJZiB5b3UgY2FuIGF0IGxl
YXN0Cj4+Pj4+Pj4gYXZvaWQgdGhhdCwgaXQgd291bGQgYWxsZXZpYXRlIG15IGNvbmNlcm5zIHF1
aXRlIGEgYml0Lgo+Pj4+Pj4KPj4+Pj4+IEluIG15IHZpZXcsIHdlIGhhdmUgdHdvIG9wdGlvbnMg
b3ZlcmFsbDoKPj4+Pj4+Cj4+Pj4+PiAxKSBNYWtlIGl0IGV4cGxpY2l0LCB0aGUgY2hhbmdlcyB0
aGUgUFYgZHJpdmVycyB3ZSBoYXZlIHRvIG1ha2UgaW4KPj4+Pj4+IG9yZGVyIHRvIHN1cHBvcnQg
eGVuX3NoaW1fZG9tYWluKCkuIFRoaXMgY291bGQgbWVhbiBlLmcuIGEpIGFkZCBhIGNhbGxiYWNr
Cj4+Pj4+PiBhcmd1bWVudCB0byBnbnR0YWJfbWFwX3JlZnMoKSB0aGF0IGlzIGludm9rZWQgZm9y
IGV2ZXJ5IHBhZ2UgdGhhdCBnZXRzIGxvb2tlZCB1cAo+Pj4+Pj4gc3VjY2Vzc2Z1bGx5LCBhbmQg
aW5zaWRlIHRoaXMgY2FsbGJhY2sgdGhlIFBWIGRyaXZlciBtYXkgdXBkYXRlIGl0J3MgdHJhY2tp
bmcKPj4+Pj4+IHBhZ2UuIEhlcmUgd2Ugbm8gbG9uZ2VyIGhhdmUgdGhpcyBpbi9vdXQgcGFyYW1l
dGVyIGluIGdudHRhYl9tYXBfcmVmcywgYW5kIGFsbAo+Pj4+Pj4gc2hpbV9kb21haW4gc3BlY2lm
aWMgYml0cyB3b3VsZCBiZSBhIGxpdHRsZSBtb3JlIGFic3RyYWN0ZWQgZnJvbSBYZW4gUFYKPj4+
Pj4+IGJhY2tlbmRzLiBTZWUgbmV0YmFjayBleGFtcGxlIGJlbG93IHRoZSBzY2lzc29ycyBtYXJr
LiBPciBiKSBoYXZlIHNvcnQgb2YgYQo+Pj4+Pj4gdHJhbnNsYXRlX2dyZWYoKSBhbmQgcHV0X2dy
ZWYoKSBBUEkgdGhhdCBYZW4gUFYgZHJpdmVycyB1c2Ugd2hpY2ggbWFrZSBpdCBldmVuCj4+Pj4+
PiBtb3JlIGV4cGxpY2l0IHRoYXQgdGhlcmUncyBubyBncmFudCBvcHMgaW52b2x2ZWQuIFRoZSBs
YXR0ZXIgaXMgbW9yZSBpbnZhc2l2ZS4KPj4+Pj4+Cj4+Pj4+PiAyKSBUaGUgc2Vjb25kIG9wdGlv
biBpcyB0byBzdXBwb3J0IGd1ZXN0IGdyYW50IG1hcHBpbmcvdW5tYXBwaW5nIFsqXSB0byBhbGxv
dwo+Pj4+Pj4gaG9zdGluZyBQViBiYWNrZW5kcyBpbnNpZGUgdGhlIGd1ZXN0LiBUaGlzIHdvdWxk
IHJlbW92ZSB0aGUgWGVuIGNoYW5nZXMgaW4gdGhpcwo+Pj4+Pj4gc2VyaWVzIGNvbXBsZXRlbHku
IEJ1dCBpdCB3b3VsZCByZXF1aXJlIGFub3RoZXIgZ3Vlc3QgYmVpbmcgdXNlZAo+Pj4+Pj4gYXMg
bmV0YmFjay9ibGtiYWNrL3hlbnN0b3JlZCwgYW5kIGxlc3MgcGVyZm9ybWFuY2UgdGhhbiAxKSAo
dGhvdWdoLCBpbiB0aGVvcnksCj4+Pj4+PiBpdCB3b3VsZCBiZSBlcXVpdmFsZW50IHRvIHdoYXQg
ZG9lcyBYZW4gd2l0aCBncmFudHMvZXZlbnRzKS4gVGhlIG9ubHkgY2hhbmdlcyBpbgo+Pj4+Pj4g
TGludXggWGVuIGNvZGUgaXMgYWRkaW5nIHhlbnN0b3JlZCBkb21haW4gc3VwcG9ydCwgYnV0IHRo
YXQgaXMgdXNlZnVsIG9uIGl0cyBvd24KPj4+Pj4+IG91dHNpZGUgdGhlIHNjb3BlIG9mIHRoaXMg
d29yay4KPj4+Pj4+Cj4+Pj4+PiBJIHRoaW5rIHRoZXJlJ3MgdmFsdWUgb24gYm90aDsgMSkgaXMg
cHJvYmFibHkgbW9yZSBmYW1pbGlhciBmb3IgS1ZNIHVzZXJzCj4+Pj4+PiBwZXJoYXBzIChhcyBp
dCBpcyBzaW1pbGFyIHRvIHdoYXQgdmhvc3QgZG9lcz8pIHdoaWxlICAyKSBlcXVhdGVzIHRvIGlt
cGxlbWVudGluZwo+Pj4+Pj4gWGVuIGRpc2FncmVnYXRpb24gY2FwYWJpbGl0aWVzIGluIEtWTS4K
Pj4+Pj4+Cj4+Pj4+PiBUaG91Z2h0cz8gWGVuIG1haW50YWluZXJzIHdoYXQncyB5b3VyIHRha2Ug
b24gdGhpcz8KPj4+Pj4KPj4+Pj4gV2hhdCBJJ2QgbGlrZSBiZXN0IHdvdWxkIGJlIGEgbmV3IGhh
bmRsZSAoZS5nLiB4ZW5ob3N0X3QgKikgdXNlZCBhcyBhbgo+Pj4+PiBhYnN0cmFjdGlvbiBsYXll
ciBmb3IgdGhpcyBraW5kIG9mIHN0dWZmLiBJdCBzaG91bGQgYmUgcGFzc2VkIHRvIHRoZQo+Pj4+
PiBiYWNrZW5kcyBhbmQgdGhvc2Ugd291bGQgcGFzcyBpdCBvbiB0byBsb3ctbGV2ZWwgWGVuIGRy
aXZlcnMgKHhlbmJ1cywKPj4+Pj4gZXZlbnQgY2hhbm5lbHMsIGdyYW50IHRhYmxlLCAuLi4pLgo+
Pj4+Pgo+Pj4+IFNvIGlmIElJUkMgYmFja2VuZHMgd291bGQgdXNlIHRoZSB4ZW5ob3N0IGxheWVy
IHRvIGFjY2VzcyBncmFudHMgb3IgZnJhbWVzCj4+Pj4gcmVmZXJlbmNlZCBieSBncmFudHMsIGFu
ZCB0aGF0IHdvdWxkIGdyb2sgaW50byBzb21lIG9mIHRoaXMuIElPVywgeW91IHdvdWxkIGhhdmUK
Pj4+PiB0d28gaW1wbGVtZW50b3JzIG9mIHhlbmhvc3Q6IG9uZSBmb3IgbmVzdGVkIHJlbW90ZS9s
b2NhbCBldmVudHMrZ3JhbnRzIGFuZAo+Pj4+IGFub3RoZXIgZm9yIHRoaXMgInNoaW0gZG9tYWlu
IiA/Cj4+Pgo+Pj4gQXMgSSdkIG5lZWQgdGhhdCBmb3IgbmVzdGVkIFhlbiBJIGd1ZXNzIHRoYXQg
d291bGQgbWFrZSBpdCAzIHZhcmlhbnRzLgo+Pj4gUHJvYmFibHkgdGhlIHhlbi1zaGltIHZhcmlh
bnQgd291bGQgbmVlZCBtb3JlIGhvb2tzLCBidXQgdGhhdCBzaG91bGQgYmUKPj4+IG5vIHByb2Js
ZW0uCj4+Pgo+PiBJIHByb2JhYmx5IG1lc3NlZCB1cCBpbiB0aGUgc2hvcnQgZGVzY3JpcHRpb24g
YnV0ICJuZXN0ZWQgcmVtb3RlL2xvY2FsCj4+IGV2ZW50cytncmFudHMiIHdhcyByZWZlcnJpbmcg
dG8gbmVzdGVkIFhlbiAoRldJVyByZW1vdGUgbWVhbnQgTDAgYW5kIGxvY2FsIEwxKS4KPj4gU28g
bWF5YmUgb25seSAyIHZhcmlhbnRzIGFyZSBuZWVkZWQ/Cj4+Cj4+Pj4+IEkgd2FzIHBsYW5uaW5n
IHRvIGRvIHRoYXQgKHRoZSB4ZW5ob3N0X3QgKiBzdHVmZikgc29vbiBpbiBvcmRlciB0byBhZGQK
Pj4+Pj4gc3VwcG9ydCBmb3IgbmVzdGVkIFhlbiB1c2luZyBQViBkZXZpY2VzICh5b3UgbmVlZCB0
d28gWGVuc3RvcmVzIGZvciB0aGF0Cj4+Pj4+IGFzIHRoZSBuZXN0ZWQgZG9tMCBpcyBhY3Rpbmcg
YXMgWGVuIGJhY2tlbmQgc2VydmVyLCB3aGlsZSB1c2luZyBQVgo+Pj4+PiBmcm9udGVuZHMgZm9y
IGFjY2Vzc2luZyB0aGUgInJlYWwiIHdvcmxkIG91dHNpZGUpLgo+Pj4+Pgo+Pj4+PiBUaGUgeGVu
aG9zdF90IHNob3VsZCBiZSB1c2VkIGZvcjoKPj4+Pj4KPj4+Pj4gLSBhY2Nlc3NpbmcgWGVuc3Rv
cmUKPj4+Pj4gLSBpc3N1aW5nIGFuZCByZWNlaXZpbmcgZXZlbnRzCj4+Pj4+IC0gZG9pbmcgaHlw
ZXJjYWxscwo+Pj4+PiAtIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMKPj4+Pj4KPj4+Pgo+Pj4+IElu
IHRoZSB0ZXh0IGFib3ZlLCBJIHNvcnQgb2Ygc3VnZ2VzdGVkIGEgc2xpY2Ugb2YgdGhpcyBvbiAx
LmIpIHdpdGggYQo+Pj4+IHRyYW5zbGF0ZV9ncmVmKCkgYW5kIHB1dF9ncmVmKCkgQVBJIC0tIHRv
IGdldCB0aGUgcGFnZSBmcm9tIGEgZ3JlZi4gVGhpcyB3YXMKPj4+PiBiZWNhdXNlIG9mIHRoZSBm
bGFnc3xob3N0X2FkZHIgaHVyZGxlIHdlIGRlcGljdGVkIGFib3ZlIHdydCB0byB1c2luZyB1c2lu
ZyBncmFudAo+Pj4+IG1hcHMvdW5tYXBzLiBZb3UgdGhpbmsgc29tZSBvZiB0aGUgeGVuaG9zdCBs
YXllciB3b3VsZCBiZSBhbW1lbmFibGUgdG8gc3VwcG9ydAo+Pj4+IHRoaXMgY2FzZT8KPj4+Cj4+
PiBJIHRoaW5rIHNvLCB5ZXMuCj4+Pgo+Pj4+Cj4+Pj4+IFNvIGV4YWN0bHkgdGhlIGtpbmQgb2Yg
c3R1ZmYgeW91IHdhbnQgdG8gZG8sIHRvby4KPj4+Pj4KPj4+PiBDb29sIGlkZWEhCj4+Pgo+Pj4g
SW4gdGhlIGVuZCB5b3UgbWlnaHQgbWFrZSBteSBsaWZlIGVhc2llciBmb3IgbmVzdGVkIFhlbi4g
Oi0pCj4+Pgo+PiBIZWhlIDopCj4+Cj4+PiBEbyB5b3Ugd2FudCB0byBoYXZlIGEgdHJ5IHdpdGgg
dGhhdCBpZGVhIG9yIHNob3VsZCBJIGRvIHRoYXQ/IEkgbWlnaHQgYmUKPj4+IGFibGUgdG8gc3Rh
cnQgd29ya2luZyBvbiB0aGF0IGluIGFib3V0IGEgbW9udGguCj4+Pgo+PiBBbmt1ciAoQ0MnZWQp
IHdpbGwgZ2l2ZSBhIHNob3QgYXQgaXQsIGFuZCBzaG91bGQgc3RhcnQgYSBuZXcgdGhyZWFkIG9u
IHRoaXMKPj4geGVuaG9zdCBhYnN0cmFjdGlvbiBsYXllci4KPiAKPiBJZiB5b3UgYXJlIHVwIGZv
ciBpdCwgaXQgd291bGQgYmUgZ3JlYXQgdG8gd3JpdGUgc29tZSBkb2N1bWVudGF0aW9uIHRvby4K
PiBXZSBhcmUgc3RhcnRpbmcgdG8gaGF2ZSBkZWNlbnQgZG9jcyBmb3Igc29tZSBQViBwcm90b2Nv
bHMsIGRlc2NyaWJpbmcgYQo+IHNwZWNpZmljIFBWIGludGVyZmFjZSwgYnV0IHdlIGFyZSBsYWNr
aW5nIGRvY3MgYWJvdXQgdGhlIGJhc2ljIGJ1aWxkaW5nCj4gYmxvY2tzIHRvIGJyaW5nIHVwIFBW
IGRyaXZlcnMgaW4gZ2VuZXJhbC4gVGhleSB3b3VsZCBiZSBleHRyZW1lbHkKQWdyZWVkLiBUaGVz
ZSB3b3VsZCBiZSB1c2VmdWwuCgo+IHVzZWZ1bC4gR2l2ZW4gdGhhdCB5b3UgaGF2ZSBqdXN0IGRv
bmUgdGhlIHdvcmssIHlvdSBhcmUgaW4gYSBncmVhdAo+IHBvc2l0aW9uIHRvIHdyaXRlIHRob3Nl
IGRvY3MuIEV2ZW4gYmFkIEVuZ2xpc2ggd291bGQgYmUgZmluZSwgSSBhbSBzdXJlCj4gc29tZWJv
ZHkgZWxzZSBjb3VsZCB2b2x1bnRlZXIgdG8gY2xlYW4tdXAgdGhlIGxhbmd1YWdlLiBBbnl0aGlu
ZyB3b3VsZAo+IGhlbHAgOi0pCkNhbid0IG1ha2UgYW55IHByb21pc2VzIG9uIHRoaXMgeWV0IGJ1
dCBJIHdpbGwgc2VlIGlmIEkgY2FuIGNvbnZlcnQKbm90ZXMgSSBtYWRlIGludG8gc29tZXRoaW5n
IHVzZWZ1bCBmb3IgdGhlIGNvbW11bml0eS4KCgpBbmt1cgoKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
