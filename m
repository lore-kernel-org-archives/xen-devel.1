Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D74C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 06:57:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3E0E2083E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 06:57:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sW9wXTAo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3E0E2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hE7Al-0007LK-Fh; Wed, 10 Apr 2019 06:57:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u/ID=SM=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hE7Ak-0007LF-IP
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 06:57:26 +0000
X-Inumbo-ID: e4b29719-5b5d-11e9-92d7-bc764e045a96
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e4b29719-5b5d-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 06:57:24 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3A6rtSN102389;
 Wed, 10 Apr 2019 06:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=haD+pyVJ/wup3eE+efA1av6YAZLaFW8TSl53K+NO7Vo=;
 b=sW9wXTAowOdbzBXJNQa3Adh/6gtvdTUeBqZo5166GCZIg5cx3fiU6kaZVOB5PDYYvln/
 mdlDvhFyg4u5PWealyrwWi25LZyfZTC8udTwS39B3liU9DynQa4rolK/caJoWONIy4hk
 xfWNpvhVpJgLc78POVjP4NaJRcPfXhfCZZ15CeL5IZKbLQ8OB9BMsebcBcOb7LkI5/m+
 lW+deGv7O3/c08DD3WrEToMBBDzjuDErxi727bgd1EvZxQvutYI+F/MJvdn9ucDLToho
 On+jLJqAeLlfSUoSAb9cEtpZFEfGJ0yHuOgvUoU/0vN4NYJQu4IjkRXGbjubM4te0RMa +A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 2rphmehapj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Apr 2019 06:56:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3A6thaK003155;
 Wed, 10 Apr 2019 06:56:08 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2rpytc2nvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Apr 2019 06:56:07 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3A6u4B2018192;
 Wed, 10 Apr 2019 06:56:04 GMT
Received: from [10.159.253.119] (/10.159.253.119)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 09 Apr 2019 23:56:04 -0700
To: Juergen Gross <jgross@suse.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20190220201609.28290-1-joao.m.martins@oracle.com>
 <35051310-c497-8ad5-4434-1b8426a317d2@redhat.com>
 <8b1f4912-4f92-69ae-ae01-d899d5640572@oracle.com>
 <3ee91f33-2973-c2db-386f-afbf138081b4@redhat.com>
 <59676804-786d-3df8-7752-8e45dec6d65b@oracle.com>
 <ac0fb2d0-59bf-1330-24ab-331c1a69b13f@suse.com>
 <94738323-ebdf-d58e-55b6-313e27c923b0@oracle.com>
 <585163c2-8dea-728d-7556-9cb3559f0eca@suse.com>
 <97808492-58ee-337f-c894-900b34b7b1a5@oracle.com>
 <59deb041-2b5d-8451-32c7-644fe36e053b@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <8e2e1d56-3490-365c-e2de-c3fd262518ba@oracle.com>
Date: Tue, 9 Apr 2019 23:55:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <59deb041-2b5d-8451-32c7-644fe36e053b@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9222
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904100050
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9222
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904100050
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
 x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wNC0wOCAxMDowNCBwLm0uLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA4LzA0
LzIwMTkgMTk6MzEsIEpvYW8gTWFydGlucyB3cm90ZToKPj4gT24gNC84LzE5IDExOjQyIEFNLCBK
dWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMDgvMDQvMjAxOSAxMjozNiwgSm9hbyBNYXJ0aW5z
IHdyb3RlOgo+Pj4+IE9uIDQvOC8xOSA3OjQ0IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+
PiBPbiAxMi8wMy8yMDE5IDE4OjE0LCBKb2FvIE1hcnRpbnMgd3JvdGU6Cj4+Pj4+PiBPbiAyLzIy
LzE5IDQ6NTkgUE0sIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4+Pj4+Pj4gT24gMjEvMDIvMTkgMTI6
NDUsIEpvYW8gTWFydGlucyB3cm90ZToKPj4+Pj4+Pj4gT24gMi8yMC8xOSA5OjA5IFBNLCBQYW9s
byBCb256aW5pIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMjAvMDIvMTkgMjE6MTUsIEpvYW8gTWFydGlu
cyB3cm90ZToKPj4+Pj4+Pj4+PiAgIDIuIFBWIERyaXZlciBzdXBwb3J0IChwYXRjaGVzIDE3IC0g
MzkpCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiAgIFdlIHN0YXJ0IGJ5IHJlZGlyZWN0aW5nIGh5cGVy
Y2FsbHMgZnJvbSB0aGUgYmFja2VuZCB0byByb3V0aW5lcwo+Pj4+Pj4+Pj4+ICAgd2hpY2ggZW11
bGF0ZSB0aGUgYmVoYXZpb3VyIHRoYXQgUFYgYmFja2VuZHMgZXhwZWN0IGkuZS4gZ3JhbnQKPj4+
Pj4+Pj4+PiAgIHRhYmxlIGFuZCBpbnRlcmRvbWFpbiBldmVudHMuIE5leHQsIHdlIGFkZCBzdXBw
b3J0IGZvciBsYXRlCj4+Pj4+Pj4+Pj4gICBpbml0aWFsaXphdGlvbiBvZiB4ZW5idXMsIGZvbGxv
d2VkIGJ5IGltcGxlbWVudGluZwo+Pj4+Pj4+Pj4+ICAgZnJvbnRlbmQvYmFja2VuZCBjb21tdW5p
Y2F0aW9uIG1lY2hhbmlzbXMgKGkuZS4gZ3JhbnQgdGFibGVzIGFuZAo+Pj4+Pj4+Pj4+ICAgaW50
ZXJkb21haW4gZXZlbnQgY2hhbm5lbHMpLiBGaW5hbGx5LCBpbnRyb2R1Y2UgeGVuLXNoaW0ua28s
Cj4+Pj4+Pj4+Pj4gICB3aGljaCB3aWxsIHNldHVwIGEgbGltaXRlZCBYZW4gZW52aXJvbm1lbnQu
IFRoaXMgdXNlcyB0aGUgYWRkZWQKPj4+Pj4+Pj4+PiAgIGZ1bmN0aW9uYWxpdHkgb2YgWGVuIHNw
ZWNpZmljIHNoYXJlZCBtZW1vcnkgKGdyYW50IHRhYmxlcykgYW5kCj4+Pj4+Pj4+Pj4gICBub3Rp
ZmljYXRpb25zIChldmVudCBjaGFubmVscykuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSSBhbSBhIGJp
dCB3b3JyaWVkIGJ5IHRoZSBsYXN0IHBhdGNoZXMsIHRoZXkgc2VlbSByZWFsbHkgYnJpdHRsZSBh
bmQKPj4+Pj4+Pj4+IHByb25lIHRvIGJyZWFrYWdlLiAgSSBkb24ndCBrbm93IFhlbiB3ZWxsIGVu
b3VnaCB0byB1bmRlcnN0YW5kIGlmIHRoZQo+Pj4+Pj4+Pj4gbGFjayBvZiBzdXBwb3J0IGZvciBH
TlRNQVBfaG9zdF9tYXAgaXMgZml4YWJsZSwgYnV0IGlmIG5vdCwgeW91IGhhdmUgdG8KPj4+Pj4+
Pj4+IGRlZmluZSBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IGh5cGVyY2FsbC4KPj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IEkgZ3Vlc3MgQW5rdXIgYWxyZWFkeSBhbnN3ZXJlZCB0aGlzOyBzbyBqdXN0IHRvIHN0
YWNrIHRoaXMgb24gdG9wIG9mIGhpcyBjb21tZW50Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGUgeGVu
X3NoaW1fZG9tYWluKCkgaXMgb25seSBtZWFudCB0byBoYW5kbGUgdGhlIGNhc2Ugd2hlcmUgdGhl
IGJhY2tlbmQKPj4+Pj4+Pj4gaGFzL2Nhbi1oYXZlIGZ1bGwgYWNjZXNzIHRvIGd1ZXN0IG1lbW9y
eSBbaS5lLiBuZXRiYWNrIGFuZCBibGtiYWNrIHdvdWxkIHdvcmsKPj4+Pj4+Pj4gd2l0aCBzaW1p
bGFyIGFzc3VtcHRpb25zIGFzIHZob3N0P10uIEZvciB0aGUgbm9ybWFsIGNhc2UsIHdoZXJlIGEg
YmFja2VuZCAqaW4gYQo+Pj4+Pj4+PiBndWVzdCogbWFwcyBhbmQgdW5tYXBzIG90aGVyIGd1ZXN0
IG1lbW9yeSwgdGhpcyBpcyBub3QgYXBwbGljYWJsZSBhbmQgdGhlc2UKPj4+Pj4+Pj4gY2hhbmdl
cyBkb24ndCBhZmZlY3QgdGhhdCBjYXNlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJT1csIHRoZSBQViBi
YWNrZW5kIGhlcmUgc2l0cyBvbiB0aGUgaHlwZXJ2aXNvciwgYW5kIHRoZSBoeXBlcmNhbGxzIGFy
ZW4ndAo+Pj4+Pj4+PiBhY3R1YWwgaHlwZXJjYWxscyBidXQgcmF0aGVyIGludm9raW5nIHNoaW1f
aHlwZXJjYWxsKCkuIFRoZSBjYWxsIGNoYWluIHdvdWxkIGdvCj4+Pj4+Pj4+IG1vcmUgb3IgbGVz
cyBsaWtlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiA8bmV0YmFja3xibGtiYWNrfHNjc2liYWNrPgo+Pj4+
Pj4+PiAgIGdudHRhYl9tYXBfcmVmcyhtYXBfb3BzLCBwYWdlcykKPj4+Pj4+Pj4gICAgIEhZUEVS
VklTT1JfZ3JhbnRfdGFibGVfb3AoR05UVEFCT1BfbWFwX2dyYW50X3JlZiwuLi4pCj4+Pj4+Pj4+
ICAgICAgIHNoaW1faHlwZXJjYWxsKCkKPj4+Pj4+Pj4gICAgICAgICBzaGltX2hjYWxsX2dudG1h
cCgpCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE91ciByZWFzb25pbmcgd2FzIHRoYXQgZ2l2ZW4gd2UgYXJl
IGFscmVhZHkgaW4gS1ZNLCB3aHkgbWFwcGluZyBhIHBhZ2UgaWYgdGhlCj4+Pj4+Pj4+IHVzZXIg
KGkuZS4gdGhlIGtlcm5lbCBQViBiYWNrZW5kKSBpcyBoaW1zZWxmPyBUaGUgbGFjayBvZiBHTlRN
QVBfaG9zdF9tYXAgaXMgaG93Cj4+Pj4+Pj4+IHRoZSBzaGltIGRldGVybWluZXMgaXRzIHVzZXIg
ZG9lc24ndCB3YW50IHRvIG1hcCB0aGUgcGFnZS4gQWxzbywgdGhlcmUncyBhbm90aGVyCj4+Pj4+
Pj4+IGlzc3VlIHdoZXJlIFBWIGJhY2tlbmRzIGFsd2F5cyBuZWVkIGEgc3RydWN0IHBhZ2UgdG8g
cmVmZXJlbmNlIHRoZSBkZXZpY2UKPj4+Pj4+Pj4gaW5mbGlnaHQgZGF0YSBhcyBBbmt1ciBwb2lu
dGVkIG91dC4KPj4+Pj4+Pgo+Pj4+Pj4+IFVsdGltYXRlbHkgaXQncyB1cCB0byB0aGUgWGVuIHBl
b3BsZS4gIEl0IGRvZXMgbWFrZSB0aGVpciBBUEkgdWdsaWVyLAo+Pj4+Pj4+IGVzcGVjaWFsbHkg
dGhlIGluL291dCBjaGFuZ2UgZm9yIHRoZSBwYXJhbWV0ZXIuICBJZiB5b3UgY2FuIGF0IGxlYXN0
Cj4+Pj4+Pj4gYXZvaWQgdGhhdCwgaXQgd291bGQgYWxsZXZpYXRlIG15IGNvbmNlcm5zIHF1aXRl
IGEgYml0Lgo+Pj4+Pj4KPj4+Pj4+IEluIG15IHZpZXcsIHdlIGhhdmUgdHdvIG9wdGlvbnMgb3Zl
cmFsbDoKPj4+Pj4+Cj4+Pj4+PiAxKSBNYWtlIGl0IGV4cGxpY2l0LCB0aGUgY2hhbmdlcyB0aGUg
UFYgZHJpdmVycyB3ZSBoYXZlIHRvIG1ha2UgaW4KPj4+Pj4+IG9yZGVyIHRvIHN1cHBvcnQgeGVu
X3NoaW1fZG9tYWluKCkuIFRoaXMgY291bGQgbWVhbiBlLmcuIGEpIGFkZCBhIGNhbGxiYWNrCj4+
Pj4+PiBhcmd1bWVudCB0byBnbnR0YWJfbWFwX3JlZnMoKSB0aGF0IGlzIGludm9rZWQgZm9yIGV2
ZXJ5IHBhZ2UgdGhhdCBnZXRzIGxvb2tlZCB1cAo+Pj4+Pj4gc3VjY2Vzc2Z1bGx5LCBhbmQgaW5z
aWRlIHRoaXMgY2FsbGJhY2sgdGhlIFBWIGRyaXZlciBtYXkgdXBkYXRlIGl0J3MgdHJhY2tpbmcK
Pj4+Pj4+IHBhZ2UuIEhlcmUgd2Ugbm8gbG9uZ2VyIGhhdmUgdGhpcyBpbi9vdXQgcGFyYW1ldGVy
IGluIGdudHRhYl9tYXBfcmVmcywgYW5kIGFsbAo+Pj4+Pj4gc2hpbV9kb21haW4gc3BlY2lmaWMg
Yml0cyB3b3VsZCBiZSBhIGxpdHRsZSBtb3JlIGFic3RyYWN0ZWQgZnJvbSBYZW4gUFYKPj4+Pj4+
IGJhY2tlbmRzLiBTZWUgbmV0YmFjayBleGFtcGxlIGJlbG93IHRoZSBzY2lzc29ycyBtYXJrLiBP
ciBiKSBoYXZlIHNvcnQgb2YgYQo+Pj4+Pj4gdHJhbnNsYXRlX2dyZWYoKSBhbmQgcHV0X2dyZWYo
KSBBUEkgdGhhdCBYZW4gUFYgZHJpdmVycyB1c2Ugd2hpY2ggbWFrZSBpdCBldmVuCj4+Pj4+PiBt
b3JlIGV4cGxpY2l0IHRoYXQgdGhlcmUncyBubyBncmFudCBvcHMgaW52b2x2ZWQuIFRoZSBsYXR0
ZXIgaXMgbW9yZSBpbnZhc2l2ZS4KPj4+Pj4+Cj4+Pj4+PiAyKSBUaGUgc2Vjb25kIG9wdGlvbiBp
cyB0byBzdXBwb3J0IGd1ZXN0IGdyYW50IG1hcHBpbmcvdW5tYXBwaW5nIFsqXSB0byBhbGxvdwo+
Pj4+Pj4gaG9zdGluZyBQViBiYWNrZW5kcyBpbnNpZGUgdGhlIGd1ZXN0LiBUaGlzIHdvdWxkIHJl
bW92ZSB0aGUgWGVuIGNoYW5nZXMgaW4gdGhpcwo+Pj4+Pj4gc2VyaWVzIGNvbXBsZXRlbHkuIEJ1
dCBpdCB3b3VsZCByZXF1aXJlIGFub3RoZXIgZ3Vlc3QgYmVpbmcgdXNlZAo+Pj4+Pj4gYXMgbmV0
YmFjay9ibGtiYWNrL3hlbnN0b3JlZCwgYW5kIGxlc3MgcGVyZm9ybWFuY2UgdGhhbiAxKSAodGhv
dWdoLCBpbiB0aGVvcnksCj4+Pj4+PiBpdCB3b3VsZCBiZSBlcXVpdmFsZW50IHRvIHdoYXQgZG9l
cyBYZW4gd2l0aCBncmFudHMvZXZlbnRzKS4gVGhlIG9ubHkgY2hhbmdlcyBpbgo+Pj4+Pj4gTGlu
dXggWGVuIGNvZGUgaXMgYWRkaW5nIHhlbnN0b3JlZCBkb21haW4gc3VwcG9ydCwgYnV0IHRoYXQg
aXMgdXNlZnVsIG9uIGl0cyBvd24KPj4+Pj4+IG91dHNpZGUgdGhlIHNjb3BlIG9mIHRoaXMgd29y
ay4KPj4+Pj4+Cj4+Pj4+PiBJIHRoaW5rIHRoZXJlJ3MgdmFsdWUgb24gYm90aDsgMSkgaXMgcHJv
YmFibHkgbW9yZSBmYW1pbGlhciBmb3IgS1ZNIHVzZXJzCj4+Pj4+PiBwZXJoYXBzIChhcyBpdCBp
cyBzaW1pbGFyIHRvIHdoYXQgdmhvc3QgZG9lcz8pIHdoaWxlICAyKSBlcXVhdGVzIHRvIGltcGxl
bWVudGluZwo+Pj4+Pj4gWGVuIGRpc2FncmVnYXRpb24gY2FwYWJpbGl0aWVzIGluIEtWTS4KPj4+
Pj4+Cj4+Pj4+PiBUaG91Z2h0cz8gWGVuIG1haW50YWluZXJzIHdoYXQncyB5b3VyIHRha2Ugb24g
dGhpcz8KPj4+Pj4KPj4+Pj4gV2hhdCBJJ2QgbGlrZSBiZXN0IHdvdWxkIGJlIGEgbmV3IGhhbmRs
ZSAoZS5nLiB4ZW5ob3N0X3QgKikgdXNlZCBhcyBhbgo+Pj4+PiBhYnN0cmFjdGlvbiBsYXllciBm
b3IgdGhpcyBraW5kIG9mIHN0dWZmLiBJdCBzaG91bGQgYmUgcGFzc2VkIHRvIHRoZQo+Pj4+PiBi
YWNrZW5kcyBhbmQgdGhvc2Ugd291bGQgcGFzcyBpdCBvbiB0byBsb3ctbGV2ZWwgWGVuIGRyaXZl
cnMgKHhlbmJ1cywKPj4+Pj4gZXZlbnQgY2hhbm5lbHMsIGdyYW50IHRhYmxlLCAuLi4pLgo+Pj4+
Pgo+Pj4+IFNvIGlmIElJUkMgYmFja2VuZHMgd291bGQgdXNlIHRoZSB4ZW5ob3N0IGxheWVyIHRv
IGFjY2VzcyBncmFudHMgb3IgZnJhbWVzCj4+Pj4gcmVmZXJlbmNlZCBieSBncmFudHMsIGFuZCB0
aGF0IHdvdWxkIGdyb2sgaW50byBzb21lIG9mIHRoaXMuIElPVywgeW91IHdvdWxkIGhhdmUKPj4+
PiB0d28gaW1wbGVtZW50b3JzIG9mIHhlbmhvc3Q6IG9uZSBmb3IgbmVzdGVkIHJlbW90ZS9sb2Nh
bCBldmVudHMrZ3JhbnRzIGFuZAo+Pj4+IGFub3RoZXIgZm9yIHRoaXMgInNoaW0gZG9tYWluIiA/
Cj4+Pgo+Pj4gQXMgSSdkIG5lZWQgdGhhdCBmb3IgbmVzdGVkIFhlbiBJIGd1ZXNzIHRoYXQgd291
bGQgbWFrZSBpdCAzIHZhcmlhbnRzLgo+Pj4gUHJvYmFibHkgdGhlIHhlbi1zaGltIHZhcmlhbnQg
d291bGQgbmVlZCBtb3JlIGhvb2tzLCBidXQgdGhhdCBzaG91bGQgYmUKPj4+IG5vIHByb2JsZW0u
Cj4+Pgo+PiBJIHByb2JhYmx5IG1lc3NlZCB1cCBpbiB0aGUgc2hvcnQgZGVzY3JpcHRpb24gYnV0
ICJuZXN0ZWQgcmVtb3RlL2xvY2FsCj4+IGV2ZW50cytncmFudHMiIHdhcyByZWZlcnJpbmcgdG8g
bmVzdGVkIFhlbiAoRldJVyByZW1vdGUgbWVhbnQgTDAgYW5kIGxvY2FsIEwxKS4KPj4gU28gbWF5
YmUgb25seSAyIHZhcmlhbnRzIGFyZSBuZWVkZWQ/Cj4gCj4gSSBuZWVkIG9uZSB4ZW5ob3N0IHZh
cmlhbnQgZm9yIHRoZSAibm9ybWFsIiBjYXNlIGFzIHRvZGF5OiB0YWxraW5nIHRvCj4gdGhlIHNp
bmdsZSBoeXBlcnZpc29yIChvciBpbiBuZXN0ZWQgY2FzZTogdG8gdGhlIEwxIGh5cGVydmlzb3Ip
Lgo+IAo+IFRoZW4gSSBuZWVkIGEgdmFyaWFudCBmb3IgdGhlIG5lc3RlZCBjYXNlIHRhbGtpbmcg
dG8gTDAgaHlwZXJ2aXNvci4KPiAKPiBBbmQgeW91IG5lZWQgYSB2YXJpYW50IHRhbGtpbmcgdG8g
eGVuLXNoaW0uCj4gCj4gVGhlIGZpcnN0IHR3byB2YXJpYW50cyBjYW4gYmUgYWN0aXZlIGluIHRo
ZSBzYW1lIHN5c3RlbSBpbiBjYXNlIG9mCj4gbmVzdGVkIFhlbjogdGhlIGJhY2tlbmRzIG9mIEwy
IGRvbTAgYXJlIHRhbGtpbmcgdG8gTDEgaHlwZXJ2aXNvciwKPiB3aGlsZSBpdHMgZnJvbnRlbmRz
IGFyZSB0YWxraW5nIHdpdGggTDAgaHlwZXJ2aXNvci4KVGhhbmtzIHRoaXMgaXMgY2xhcmlmeWlu
Zy4KClNvLCBlc3NlbnRpYWxseSBiYWNrZW5kIGRyaXZlcnMgd2l0aCBhIHhlbmhvc3RfdCBoYW5k
bGUsIGNvbW11bmljYXRlCndpdGggWGVuIGxvdy1sZXZlbCBkcml2ZXJzIGV0YyB1c2luZyB0aGUg
c2FtZSBoYW5kbGUsIGhvd2V2ZXIsIGlmIHRoZXkKY29tbXVuaWNhdGUgd2l0aCBmcm9udGVuZCBk
cml2ZXJzIGZvciBhY2Nlc3NpbmcgdGhlICJyZWFsIiB3b3JsZCwKdGhleSBleGNsdXNpdmVseSB1
c2Ugc3RhbmRhcmQgbWVjaGFuaXNtcyAoTGludXggb3IgaHlwZXJjYWxscyk/CgpJbiB0aGlzIHNj
ZW5hcmlvIEwyIGRvbTAgeGVuLW5ldGJhY2sgYW5kIEwyIGRvbTAgeGVuLW5ldGZyb250IHNob3Vs
ZApqdXN0IGJlIGFibGUgdG8gdXNlIExpbnV4IGludGVyZmFjZXMuIEJ1dCBpZiBMMiBkb20wIHhl
bmJ1cy1iYWNrZW5kCm5lZWRzIHRvIHRhbGsgdG8gTDIgZG9tMCB4ZW5idXMtZnJvbnRlbmQgdGhl
biBkbyB5b3Ugc2VlIHRoZW0gbGF5ZXJlZApvciBhcmUgdGhleSBzdGlsbCBleGNsdXNpdmVseSB0
YWxraW5nIHZpYSB0aGUgc3RhbmRhcmQgbWVjaGFuaXNtcz8KCkFua3VyCgo+IAo+Pgo+Pj4+PiBJ
IHdhcyBwbGFubmluZyB0byBkbyB0aGF0ICh0aGUgeGVuaG9zdF90ICogc3R1ZmYpIHNvb24gaW4g
b3JkZXIgdG8gYWRkCj4+Pj4+IHN1cHBvcnQgZm9yIG5lc3RlZCBYZW4gdXNpbmcgUFYgZGV2aWNl
cyAoeW91IG5lZWQgdHdvIFhlbnN0b3JlcyBmb3IgdGhhdAo+Pj4+PiBhcyB0aGUgbmVzdGVkIGRv
bTAgaXMgYWN0aW5nIGFzIFhlbiBiYWNrZW5kIHNlcnZlciwgd2hpbGUgdXNpbmcgUFYKPj4+Pj4g
ZnJvbnRlbmRzIGZvciBhY2Nlc3NpbmcgdGhlICJyZWFsIiB3b3JsZCBvdXRzaWRlKS4KPj4+Pj4K
Pj4+Pj4gVGhlIHhlbmhvc3RfdCBzaG91bGQgYmUgdXNlZCBmb3I6Cj4+Pj4+Cj4+Pj4+IC0gYWNj
ZXNzaW5nIFhlbnN0b3JlCj4+Pj4+IC0gaXNzdWluZyBhbmQgcmVjZWl2aW5nIGV2ZW50cwo+Pj4+
PiAtIGRvaW5nIGh5cGVyY2FsbHMKPj4+Pj4gLSBncmFudCB0YWJsZSBvcGVyYXRpb25zCj4+Pj4+
Cj4+Pj4KPj4+PiBJbiB0aGUgdGV4dCBhYm92ZSwgSSBzb3J0IG9mIHN1Z2dlc3RlZCBhIHNsaWNl
IG9mIHRoaXMgb24gMS5iKSB3aXRoIGEKPj4+PiB0cmFuc2xhdGVfZ3JlZigpIGFuZCBwdXRfZ3Jl
ZigpIEFQSSAtLSB0byBnZXQgdGhlIHBhZ2UgZnJvbSBhIGdyZWYuIFRoaXMgd2FzCj4+Pj4gYmVj
YXVzZSBvZiB0aGUgZmxhZ3N8aG9zdF9hZGRyIGh1cmRsZSB3ZSBkZXBpY3RlZCBhYm92ZSB3cnQg
dG8gdXNpbmcgdXNpbmcgZ3JhbnQKPj4+PiBtYXBzL3VubWFwcy4gWW91IHRoaW5rIHNvbWUgb2Yg
dGhlIHhlbmhvc3QgbGF5ZXIgd291bGQgYmUgYW1tZW5hYmxlIHRvIHN1cHBvcnQKPj4+PiB0aGlz
IGNhc2U/Cj4+Pgo+Pj4gSSB0aGluayBzbywgeWVzLgo+Pj4KPj4+Pgo+Pj4+PiBTbyBleGFjdGx5
IHRoZSBraW5kIG9mIHN0dWZmIHlvdSB3YW50IHRvIGRvLCB0b28uCj4+Pj4+Cj4+Pj4gQ29vbCBp
ZGVhIQo+Pj4KPj4+IEluIHRoZSBlbmQgeW91IG1pZ2h0IG1ha2UgbXkgbGlmZSBlYXNpZXIgZm9y
IG5lc3RlZCBYZW4uIDotKQo+Pj4KPj4gSGVoZSA6KQo+Pgo+Pj4gRG8geW91IHdhbnQgdG8gaGF2
ZSBhIHRyeSB3aXRoIHRoYXQgaWRlYSBvciBzaG91bGQgSSBkbyB0aGF0PyBJIG1pZ2h0IGJlCj4+
PiBhYmxlIHRvIHN0YXJ0IHdvcmtpbmcgb24gdGhhdCBpbiBhYm91dCBhIG1vbnRoLgo+Pj4KPj4g
QW5rdXIgKENDJ2VkKSB3aWxsIGdpdmUgYSBzaG90IGF0IGl0LCBhbmQgc2hvdWxkIHN0YXJ0IGEg
bmV3IHRocmVhZCBvbiB0aGlzCj4+IHhlbmhvc3QgYWJzdHJhY3Rpb24gbGF5ZXIuCj4gCj4gR3Jl
YXQsIGxvb2tpbmcgZm9yd2FyZCB0byBpdCEKPiAKPiAKPiBKdWVyZ2VuCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
