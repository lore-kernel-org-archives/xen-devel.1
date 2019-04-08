Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86027C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:37:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 542A420870
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="wl0SCb1L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 542A420870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDReY-0006RR-3g; Mon, 08 Apr 2019 10:37:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCMY=SK=oracle.com=joao.m.martins@srs-us1.protection.inumbo.net>)
 id 1hDReX-0006RM-1H
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:37:25 +0000
X-Inumbo-ID: 49d1dec2-59ea-11e9-9e3b-87d849ca6a7b
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49d1dec2-59ea-11e9-9e3b-87d849ca6a7b;
 Mon, 08 Apr 2019 10:37:21 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x38ATTQt079483;
 Mon, 8 Apr 2019 10:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=1Yh8wsEMtdwfeWmTJL2MOGAwGxin4sl8w/5ToT0KMMo=;
 b=wl0SCb1L0uXsUOv1gq/4QkI4ZOH6jPuigFaEx+hkcNNyeGscNuCm9Uiwe/EQrletr04k
 fpZ/eqL2HJ3r6tUFomtuXTVtlgKro1aFrW+0EiWPPkohGEjpYmFHm/RRlaqrb7ZEL34x
 wQKDaH1qMjjsqtUqgSNTrF/wUuhikjQZz/xJPGbU/QBEmgUL7H6UOS9/1pmecJNLBoms
 wRPT920grRZbAMW9UBs3kY0IfLq1X6FIynqH78a/wKhuyooNCY79jwMzPciTc2EJTn/P
 1BblOtXyq2nMW2BF2bEqKsCQoxwpqpkqVWXW9Mt3gkEp3XjmAbmOEccyM8KNV8KMSG/m Nw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2rpmrpwcav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Apr 2019 10:37:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x38AZnh2003711;
 Mon, 8 Apr 2019 10:37:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2rpkehmkj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Apr 2019 10:37:02 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x38Ab0LS021527;
 Mon, 8 Apr 2019 10:37:00 GMT
Received: from [10.175.201.94] (/10.175.201.94)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Apr 2019 03:37:00 -0700
To: Juergen Gross <jgross@suse.com>
References: <20190220201609.28290-1-joao.m.martins@oracle.com>
 <35051310-c497-8ad5-4434-1b8426a317d2@redhat.com>
 <8b1f4912-4f92-69ae-ae01-d899d5640572@oracle.com>
 <3ee91f33-2973-c2db-386f-afbf138081b4@redhat.com>
 <59676804-786d-3df8-7752-8e45dec6d65b@oracle.com>
 <ac0fb2d0-59bf-1330-24ab-331c1a69b13f@suse.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <94738323-ebdf-d58e-55b6-313e27c923b0@oracle.com>
Date: Mon, 8 Apr 2019 11:36:54 +0100
MIME-Version: 1.0
In-Reply-To: <ac0fb2d0-59bf-1330-24ab-331c1a69b13f@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9220
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904080095
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9220
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904080095
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

T24gNC84LzE5IDc6NDQgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTIvMDMvMjAxOSAx
ODoxNCwgSm9hbyBNYXJ0aW5zIHdyb3RlOgo+PiBPbiAyLzIyLzE5IDQ6NTkgUE0sIFBhb2xvIEJv
bnppbmkgd3JvdGU6Cj4+PiBPbiAyMS8wMi8xOSAxMjo0NSwgSm9hbyBNYXJ0aW5zIHdyb3RlOgo+
Pj4+IE9uIDIvMjAvMTkgOTowOSBQTSwgUGFvbG8gQm9uemluaSB3cm90ZToKPj4+Pj4gT24gMjAv
MDIvMTkgMjE6MTUsIEpvYW8gTWFydGlucyB3cm90ZToKPj4+Pj4+ICAyLiBQViBEcml2ZXIgc3Vw
cG9ydCAocGF0Y2hlcyAxNyAtIDM5KQo+Pj4+Pj4KPj4+Pj4+ICBXZSBzdGFydCBieSByZWRpcmVj
dGluZyBoeXBlcmNhbGxzIGZyb20gdGhlIGJhY2tlbmQgdG8gcm91dGluZXMKPj4+Pj4+ICB3aGlj
aCBlbXVsYXRlIHRoZSBiZWhhdmlvdXIgdGhhdCBQViBiYWNrZW5kcyBleHBlY3QgaS5lLiBncmFu
dAo+Pj4+Pj4gIHRhYmxlIGFuZCBpbnRlcmRvbWFpbiBldmVudHMuIE5leHQsIHdlIGFkZCBzdXBw
b3J0IGZvciBsYXRlCj4+Pj4+PiAgaW5pdGlhbGl6YXRpb24gb2YgeGVuYnVzLCBmb2xsb3dlZCBi
eSBpbXBsZW1lbnRpbmcKPj4+Pj4+ICBmcm9udGVuZC9iYWNrZW5kIGNvbW11bmljYXRpb24gbWVj
aGFuaXNtcyAoaS5lLiBncmFudCB0YWJsZXMgYW5kCj4+Pj4+PiAgaW50ZXJkb21haW4gZXZlbnQg
Y2hhbm5lbHMpLiBGaW5hbGx5LCBpbnRyb2R1Y2UgeGVuLXNoaW0ua28sCj4+Pj4+PiAgd2hpY2gg
d2lsbCBzZXR1cCBhIGxpbWl0ZWQgWGVuIGVudmlyb25tZW50LiBUaGlzIHVzZXMgdGhlIGFkZGVk
Cj4+Pj4+PiAgZnVuY3Rpb25hbGl0eSBvZiBYZW4gc3BlY2lmaWMgc2hhcmVkIG1lbW9yeSAoZ3Jh
bnQgdGFibGVzKSBhbmQKPj4+Pj4+ICBub3RpZmljYXRpb25zIChldmVudCBjaGFubmVscykuCj4+
Pj4+Cj4+Pj4+IEkgYW0gYSBiaXQgd29ycmllZCBieSB0aGUgbGFzdCBwYXRjaGVzLCB0aGV5IHNl
ZW0gcmVhbGx5IGJyaXR0bGUgYW5kCj4+Pj4+IHByb25lIHRvIGJyZWFrYWdlLiAgSSBkb24ndCBr
bm93IFhlbiB3ZWxsIGVub3VnaCB0byB1bmRlcnN0YW5kIGlmIHRoZQo+Pj4+PiBsYWNrIG9mIHN1
cHBvcnQgZm9yIEdOVE1BUF9ob3N0X21hcCBpcyBmaXhhYmxlLCBidXQgaWYgbm90LCB5b3UgaGF2
ZSB0bwo+Pj4+PiBkZWZpbmUgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBoeXBlcmNhbGwuCj4+Pj4+
Cj4+Pj4gSSBndWVzcyBBbmt1ciBhbHJlYWR5IGFuc3dlcmVkIHRoaXM7IHNvIGp1c3QgdG8gc3Rh
Y2sgdGhpcyBvbiB0b3Agb2YgaGlzIGNvbW1lbnQuCj4+Pj4KPj4+PiBUaGUgeGVuX3NoaW1fZG9t
YWluKCkgaXMgb25seSBtZWFudCB0byBoYW5kbGUgdGhlIGNhc2Ugd2hlcmUgdGhlIGJhY2tlbmQK
Pj4+PiBoYXMvY2FuLWhhdmUgZnVsbCBhY2Nlc3MgdG8gZ3Vlc3QgbWVtb3J5IFtpLmUuIG5ldGJh
Y2sgYW5kIGJsa2JhY2sgd291bGQgd29yawo+Pj4+IHdpdGggc2ltaWxhciBhc3N1bXB0aW9ucyBh
cyB2aG9zdD9dLiBGb3IgdGhlIG5vcm1hbCBjYXNlLCB3aGVyZSBhIGJhY2tlbmQgKmluIGEKPj4+
PiBndWVzdCogbWFwcyBhbmQgdW5tYXBzIG90aGVyIGd1ZXN0IG1lbW9yeSwgdGhpcyBpcyBub3Qg
YXBwbGljYWJsZSBhbmQgdGhlc2UKPj4+PiBjaGFuZ2VzIGRvbid0IGFmZmVjdCB0aGF0IGNhc2Uu
Cj4+Pj4KPj4+PiBJT1csIHRoZSBQViBiYWNrZW5kIGhlcmUgc2l0cyBvbiB0aGUgaHlwZXJ2aXNv
ciwgYW5kIHRoZSBoeXBlcmNhbGxzIGFyZW4ndAo+Pj4+IGFjdHVhbCBoeXBlcmNhbGxzIGJ1dCBy
YXRoZXIgaW52b2tpbmcgc2hpbV9oeXBlcmNhbGwoKS4gVGhlIGNhbGwgY2hhaW4gd291bGQgZ28K
Pj4+PiBtb3JlIG9yIGxlc3MgbGlrZToKPj4+Pgo+Pj4+IDxuZXRiYWNrfGJsa2JhY2t8c2NzaWJh
Y2s+Cj4+Pj4gIGdudHRhYl9tYXBfcmVmcyhtYXBfb3BzLCBwYWdlcykKPj4+PiAgICBIWVBFUlZJ
U09SX2dyYW50X3RhYmxlX29wKEdOVFRBQk9QX21hcF9ncmFudF9yZWYsLi4uKQo+Pj4+ICAgICAg
c2hpbV9oeXBlcmNhbGwoKQo+Pj4+ICAgICAgICBzaGltX2hjYWxsX2dudG1hcCgpCj4+Pj4KPj4+
PiBPdXIgcmVhc29uaW5nIHdhcyB0aGF0IGdpdmVuIHdlIGFyZSBhbHJlYWR5IGluIEtWTSwgd2h5
IG1hcHBpbmcgYSBwYWdlIGlmIHRoZQo+Pj4+IHVzZXIgKGkuZS4gdGhlIGtlcm5lbCBQViBiYWNr
ZW5kKSBpcyBoaW1zZWxmPyBUaGUgbGFjayBvZiBHTlRNQVBfaG9zdF9tYXAgaXMgaG93Cj4+Pj4g
dGhlIHNoaW0gZGV0ZXJtaW5lcyBpdHMgdXNlciBkb2Vzbid0IHdhbnQgdG8gbWFwIHRoZSBwYWdl
LiBBbHNvLCB0aGVyZSdzIGFub3RoZXIKPj4+PiBpc3N1ZSB3aGVyZSBQViBiYWNrZW5kcyBhbHdh
eXMgbmVlZCBhIHN0cnVjdCBwYWdlIHRvIHJlZmVyZW5jZSB0aGUgZGV2aWNlCj4+Pj4gaW5mbGln
aHQgZGF0YSBhcyBBbmt1ciBwb2ludGVkIG91dC4KPj4+Cj4+PiBVbHRpbWF0ZWx5IGl0J3MgdXAg
dG8gdGhlIFhlbiBwZW9wbGUuICBJdCBkb2VzIG1ha2UgdGhlaXIgQVBJIHVnbGllciwKPj4+IGVz
cGVjaWFsbHkgdGhlIGluL291dCBjaGFuZ2UgZm9yIHRoZSBwYXJhbWV0ZXIuICBJZiB5b3UgY2Fu
IGF0IGxlYXN0Cj4+PiBhdm9pZCB0aGF0LCBpdCB3b3VsZCBhbGxldmlhdGUgbXkgY29uY2VybnMg
cXVpdGUgYSBiaXQuCj4+Cj4+IEluIG15IHZpZXcsIHdlIGhhdmUgdHdvIG9wdGlvbnMgb3ZlcmFs
bDoKPj4KPj4gMSkgTWFrZSBpdCBleHBsaWNpdCwgdGhlIGNoYW5nZXMgdGhlIFBWIGRyaXZlcnMg
d2UgaGF2ZSB0byBtYWtlIGluCj4+IG9yZGVyIHRvIHN1cHBvcnQgeGVuX3NoaW1fZG9tYWluKCku
IFRoaXMgY291bGQgbWVhbiBlLmcuIGEpIGFkZCBhIGNhbGxiYWNrCj4+IGFyZ3VtZW50IHRvIGdu
dHRhYl9tYXBfcmVmcygpIHRoYXQgaXMgaW52b2tlZCBmb3IgZXZlcnkgcGFnZSB0aGF0IGdldHMg
bG9va2VkIHVwCj4+IHN1Y2Nlc3NmdWxseSwgYW5kIGluc2lkZSB0aGlzIGNhbGxiYWNrIHRoZSBQ
ViBkcml2ZXIgbWF5IHVwZGF0ZSBpdCdzIHRyYWNraW5nCj4+IHBhZ2UuIEhlcmUgd2Ugbm8gbG9u
Z2VyIGhhdmUgdGhpcyBpbi9vdXQgcGFyYW1ldGVyIGluIGdudHRhYl9tYXBfcmVmcywgYW5kIGFs
bAo+PiBzaGltX2RvbWFpbiBzcGVjaWZpYyBiaXRzIHdvdWxkIGJlIGEgbGl0dGxlIG1vcmUgYWJz
dHJhY3RlZCBmcm9tIFhlbiBQVgo+PiBiYWNrZW5kcy4gU2VlIG5ldGJhY2sgZXhhbXBsZSBiZWxv
dyB0aGUgc2Npc3NvcnMgbWFyay4gT3IgYikgaGF2ZSBzb3J0IG9mIGEKPj4gdHJhbnNsYXRlX2dy
ZWYoKSBhbmQgcHV0X2dyZWYoKSBBUEkgdGhhdCBYZW4gUFYgZHJpdmVycyB1c2Ugd2hpY2ggbWFr
ZSBpdCBldmVuCj4+IG1vcmUgZXhwbGljaXQgdGhhdCB0aGVyZSdzIG5vIGdyYW50IG9wcyBpbnZv
bHZlZC4gVGhlIGxhdHRlciBpcyBtb3JlIGludmFzaXZlLgo+Pgo+PiAyKSBUaGUgc2Vjb25kIG9w
dGlvbiBpcyB0byBzdXBwb3J0IGd1ZXN0IGdyYW50IG1hcHBpbmcvdW5tYXBwaW5nIFsqXSB0byBh
bGxvdwo+PiBob3N0aW5nIFBWIGJhY2tlbmRzIGluc2lkZSB0aGUgZ3Vlc3QuIFRoaXMgd291bGQg
cmVtb3ZlIHRoZSBYZW4gY2hhbmdlcyBpbiB0aGlzCj4+IHNlcmllcyBjb21wbGV0ZWx5LiBCdXQg
aXQgd291bGQgcmVxdWlyZSBhbm90aGVyIGd1ZXN0IGJlaW5nIHVzZWQKPj4gYXMgbmV0YmFjay9i
bGtiYWNrL3hlbnN0b3JlZCwgYW5kIGxlc3MgcGVyZm9ybWFuY2UgdGhhbiAxKSAodGhvdWdoLCBp
biB0aGVvcnksCj4+IGl0IHdvdWxkIGJlIGVxdWl2YWxlbnQgdG8gd2hhdCBkb2VzIFhlbiB3aXRo
IGdyYW50cy9ldmVudHMpLiBUaGUgb25seSBjaGFuZ2VzIGluCj4+IExpbnV4IFhlbiBjb2RlIGlz
IGFkZGluZyB4ZW5zdG9yZWQgZG9tYWluIHN1cHBvcnQsIGJ1dCB0aGF0IGlzIHVzZWZ1bCBvbiBp
dHMgb3duCj4+IG91dHNpZGUgdGhlIHNjb3BlIG9mIHRoaXMgd29yay4KPj4KPj4gSSB0aGluayB0
aGVyZSdzIHZhbHVlIG9uIGJvdGg7IDEpIGlzIHByb2JhYmx5IG1vcmUgZmFtaWxpYXIgZm9yIEtW
TSB1c2Vycwo+PiBwZXJoYXBzIChhcyBpdCBpcyBzaW1pbGFyIHRvIHdoYXQgdmhvc3QgZG9lcz8p
IHdoaWxlICAyKSBlcXVhdGVzIHRvIGltcGxlbWVudGluZwo+PiBYZW4gZGlzYWdyZWdhdGlvbiBj
YXBhYmlsaXRpZXMgaW4gS1ZNLgo+Pgo+PiBUaG91Z2h0cz8gWGVuIG1haW50YWluZXJzIHdoYXQn
cyB5b3VyIHRha2Ugb24gdGhpcz8KPiAKPiBXaGF0IEknZCBsaWtlIGJlc3Qgd291bGQgYmUgYSBu
ZXcgaGFuZGxlIChlLmcuIHhlbmhvc3RfdCAqKSB1c2VkIGFzIGFuCj4gYWJzdHJhY3Rpb24gbGF5
ZXIgZm9yIHRoaXMga2luZCBvZiBzdHVmZi4gSXQgc2hvdWxkIGJlIHBhc3NlZCB0byB0aGUKPiBi
YWNrZW5kcyBhbmQgdGhvc2Ugd291bGQgcGFzcyBpdCBvbiB0byBsb3ctbGV2ZWwgWGVuIGRyaXZl
cnMgKHhlbmJ1cywKPiBldmVudCBjaGFubmVscywgZ3JhbnQgdGFibGUsIC4uLikuCj4gClNvIGlm
IElJUkMgYmFja2VuZHMgd291bGQgdXNlIHRoZSB4ZW5ob3N0IGxheWVyIHRvIGFjY2VzcyBncmFu
dHMgb3IgZnJhbWVzCnJlZmVyZW5jZWQgYnkgZ3JhbnRzLCBhbmQgdGhhdCB3b3VsZCBncm9rIGlu
dG8gc29tZSBvZiB0aGlzLiBJT1csIHlvdSB3b3VsZCBoYXZlCnR3byBpbXBsZW1lbnRvcnMgb2Yg
eGVuaG9zdDogb25lIGZvciBuZXN0ZWQgcmVtb3RlL2xvY2FsIGV2ZW50cytncmFudHMgYW5kCmFu
b3RoZXIgZm9yIHRoaXMgInNoaW0gZG9tYWluIiA/Cgo+IEkgd2FzIHBsYW5uaW5nIHRvIGRvIHRo
YXQgKHRoZSB4ZW5ob3N0X3QgKiBzdHVmZikgc29vbiBpbiBvcmRlciB0byBhZGQKPiBzdXBwb3J0
IGZvciBuZXN0ZWQgWGVuIHVzaW5nIFBWIGRldmljZXMgKHlvdSBuZWVkIHR3byBYZW5zdG9yZXMg
Zm9yIHRoYXQKPiBhcyB0aGUgbmVzdGVkIGRvbTAgaXMgYWN0aW5nIGFzIFhlbiBiYWNrZW5kIHNl
cnZlciwgd2hpbGUgdXNpbmcgUFYKPiBmcm9udGVuZHMgZm9yIGFjY2Vzc2luZyB0aGUgInJlYWwi
IHdvcmxkIG91dHNpZGUpLgo+IAo+IFRoZSB4ZW5ob3N0X3Qgc2hvdWxkIGJlIHVzZWQgZm9yOgo+
IAo+IC0gYWNjZXNzaW5nIFhlbnN0b3JlCj4gLSBpc3N1aW5nIGFuZCByZWNlaXZpbmcgZXZlbnRz
Cj4gLSBkb2luZyBoeXBlcmNhbGxzCj4gLSBncmFudCB0YWJsZSBvcGVyYXRpb25zCj4gCgpJbiB0
aGUgdGV4dCBhYm92ZSwgSSBzb3J0IG9mIHN1Z2dlc3RlZCBhIHNsaWNlIG9mIHRoaXMgb24gMS5i
KSB3aXRoIGEKdHJhbnNsYXRlX2dyZWYoKSBhbmQgcHV0X2dyZWYoKSBBUEkgLS0gdG8gZ2V0IHRo
ZSBwYWdlIGZyb20gYSBncmVmLiBUaGlzIHdhcwpiZWNhdXNlIG9mIHRoZSBmbGFnc3xob3N0X2Fk
ZHIgaHVyZGxlIHdlIGRlcGljdGVkIGFib3ZlIHdydCB0byB1c2luZyB1c2luZyBncmFudAptYXBz
L3VubWFwcy4gWW91IHRoaW5rIHNvbWUgb2YgdGhlIHhlbmhvc3QgbGF5ZXIgd291bGQgYmUgYW1t
ZW5hYmxlIHRvIHN1cHBvcnQKdGhpcyBjYXNlPwoKPiBTbyBleGFjdGx5IHRoZSBraW5kIG9mIHN0
dWZmIHlvdSB3YW50IHRvIGRvLCB0b28uCj4gCkNvb2wgaWRlYSEKCglKb2FvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
