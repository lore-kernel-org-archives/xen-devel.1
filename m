From: Patrick Beckmann <beckmann@tyntec.com>
Subject: Re: 4.10.1 Xen crash and reboot
Date: Mon, 11 Feb 2019 11:41:15 +0100
Message-ID: <0e97df87-1a78-d426-8ebe-3a33ae5dc537@tyntec.com>
References: <39aa98be-6ea7-ea23-837c-29894a440f8f@tyntec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y70g=QS=tyntec.com=beckmann@srs-us1.protection.inumbo.net>)
 id 1gt91c-0000tH-US
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 10:41:21 +0000
Received: from maildo.tyntec.com (maildo.tyntec.com [78.110.229.11])
 by pigeon.tyntec.com (Postfix) with ESMTPS id E0E57582A3C7
 for <xen-devel@lists.xenproject.org>; Mon, 11 Feb 2019 11:41:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by maildo.tyntec.com (Postfix) with ESMTP id D50AF3CB0248
 for <xen-devel@lists.xenproject.org>; Mon, 11 Feb 2019 11:41:14 +0100 (CET)
Received: from maildo.tyntec.com ([127.0.0.1])
 by localhost (maildo.tyntec.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id U-xkpdAr8cwU for <xen-devel@lists.xenproject.org>;
 Mon, 11 Feb 2019 11:41:14 +0100 (CET)
Received: from [10.3.195.27] (dhcp-10-3-195-27.tech-on-air.com [10.3.195.27])
 by maildo.tyntec.com (Postfix) with ESMTPSA id ACBE93CB00E3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Feb 2019 11:41:14 +0100 (CET)
In-Reply-To: <39aa98be-6ea7-ea23-837c-29894a440f8f@tyntec.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpBbSAwNy4wMS4yMDE5IHVtIDEyOjEyIHNjaHJpZWIgUGF0cmljayBCZWNrbWFubjoKPiBJ
IGp1c3Qgam9pbmVkIHRoaXMgbGlzdCBhbmQgYW0gcmVmZXJyaW5nIHRvCj4gICBodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTIvbXNnMDA5
MzguaHRtbAo+IAo+IFdlIGhhdmUgZXhwZXJpZW5jZWQgc2V2ZXJhbCBjcmFzaGVzIG9mIGEgcmVj
ZW50IERlYmlhbiA5IERvbTAgb24gbmV3Cj4gaGFyZHdhcmUgd2l0aCBYZW4gdmVyc2lvbiAiNC44
LjQreHNhMjczK3NoaW00LjEwLjEreHNhMjczLTErZGViOXUxMCIuCj4gQWZ0ZXIgcmVwb3J0aW5n
IGl0IHdpdGhpbiBEZWJpYW4gYnVnICM5MTI5NzUKPiAoaHR0cHM6Ly9idWdzLmRlYmlhbi5vcmcv
Y2dpLWJpbi9idWdyZXBvcnQuY2dpP2J1Zz05MTI5NzUpIGl0IHdhcwo+IHBvaW50ZWQgb3V0LCB0
aGF0IHRoaXMgd291bGQgYmUgdGhlIHNhbWUgZXJyb3IsIGFuZCBJIHdhcyBhc2tlZCB0byBqb2lu
Cj4gZGlzY3Vzc2lvbiBoZXJlLgo+IAo+IFVuZm9ydHVuYXRlbHkgd2UgYXJlIHVuYWJsZSB0byBy
ZWxpYWJseSByZXByb2R1Y2UgdGhlIGJlaGF2aW91ci4KPiBDdXJyZW50bHkgd2UgYXJlIHJ1bm5p
bmcgdGhlIERvbTAgd2l0aCBYZW4gdmVyc2lvbgo+ICI0LjguMyt4c2EyNjcrc2hpbTQuMTAuMSt4
c2EyNjctMStkZWI5dTkiIHRvIHRlc3QgdGhlIGFzc3VtcHRpb24sIHRoYXQgYQo+IGJ1ZyB3YXMg
aW50cm9kdWNlZCBiZXR3ZWVuIHRoZXNlIHZlcnNpb25zLgpTaW5jZSBtb3JlIHRoYW4gZml2ZSB3
ZWVrcyB0aGUgRG9tMCBpcyBydW5uaW5nIHN0YWJsZSB3aXRoIHRoZSBEZWJpYW4gOQpkaXN0cmli
dXRlZCBYZW4gdmVyc2lvbgogIDQuOC4zK3hzYTI2NytzaGltNC4xMC4xK3hzYTI2Ny0xK2RlYjl1
OQp3aGlsZSB3aXRoIHZlcnNpb24KICA0LjguNCt4c2EyNzMrc2hpbTQuMTAuMSt4c2EyNzMtMStk
ZWI5dTEwCml0IHdhcyBjcmFzaGluZyBiZXR3ZWVuIG9uY2UgZXZlcnkgdHdvIHdlZWtzIGFuZCB0
d2ljZSBhIGRheS4KCldlIGhhdmUgc2V2ZXJhbCBvdGhlciBzZXJ2ZXJzIHdpdGggc2ltaWxhciBo
YXJkd2FyZSBhbmQga2VwdCBvbiB0aGUKNC44LjMgWGVuIHZlcnNpb24sIHdoaWNoIG5ldmVyIGNy
YXNoZWQgc28gZmFyLiBBbm90aGVyIHNlcnZlciwgdGhhdCB3YXMKY3Jhc2hpbmcgd2l0aCBYZW4g
NC44LjQsIGlzIHJ1bm5pbmcgaXQgd2l0aCAicGNpZD0wIiBzaW5jZSAzMSBkYXlzLgpIb3dldmVy
IHdlIG1pZ3JhdGVkIHNldmVyYWwgbWFjaGluZXMgYXdheSBmcm9tIHRoYXQgb25lLCBzbyB0aGF0
IGl0IGhhcwphIHZlcnkgbG93IGxvYWQvZGl2ZXJzaXR5IHdpdGhpbiB0aGUgc2V0IG9mIGd1ZXN0
LCB3aGljaCBtaWdodCBmYWxzaWZ5CnJlc3VsdHMuCgpJIGhvcGUgdGhpcyBoZWxwcyBhIGJpdCB0
byBmaW5kIHRoZSBjYXVzZSBvZiB0aGUgY3Jhc2hlcy4gSWYgeW91IG5lZWQKYW55IGZ1cnRoZXIg
aW5mb3JtYXRpb24sIHBsZWFzZSBsZXQgbWUga25vdyEKClRoYW5rcyBhbmQgQmVzdCBSZWdhcmRz
LApQYXRyaWNrIEJlY2ttYW5uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
