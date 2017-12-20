From: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>
Subject: Re: [PATCH V1 1/1] Xen/libxl: Perform PCI reset using
 'reset' SysFS attribute
Date: Wed, 20 Dec 2017 22:39:56 +0100
Message-ID: <1a192ce9-9171-d127-d18a-b341bcbf2a46@alstadheim.priv.no>
References: <20171207222639.9879-1-Govinda.Tatti@Oracle.COM>
 <20171207222639.9879-2-Govinda.Tatti@Oracle.COM>
 <CAFLBxZZ-KO2Ytu1-fxgdmSZvy=a2C+SBeuweOHWGfbRnPxBRuA@mail.gmail.com>
 <dc8308cf-f6da-7b92-5bbb-05f58fd9e18b@Oracle.COM>
 <CAFLBxZb-S8CiRmpa=ddS-By300Hkwx_hLF66JVX2R3tHvzFcPA@mail.gmail.com>
 <59839a62-9cc4-b3a1-d765-bc372378d976@Oracle.COM>
 <76649b03-0dde-dd37-28bd-f29b340aa009@alstadheim.priv.no>
 <90c62b47-daae-747d-8fbf-c04402c63ae1@Oracle.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jw2f=dq=alstadheim.priv.no=hakon@srs-us1.protection.inumbo.net>)
 id 1eRm5w-0002t5-AS
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 21:40:08 +0000
Received: from postfix-relay.alstadheim.priv.no
 (148-252-114.233.3p.ntebredband.no [148.252.114.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: hakon.alstadheim@ntebb.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id CB2722006F
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2017 22:39:58 +0100 (CET)
Received: from smtps.alstadheim.priv.no (localhost [127.0.0.1])
 by postfix-relay.alstadheim.priv.no (Postfix) with ESMTP id 1C6B0C007EFA
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2017 22:39:58 +0100 (CET)
Received: from [192.168.2.201] (unknown [192.168.2.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hakon)
 by smtps.alstadheim.priv.no (Postfix) with ESMTPSA id E0EBD14B7FF
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2017 22:39:57 +0100 (CET)
In-Reply-To: <90c62b47-daae-747d-8fbf-c04402c63ae1@Oracle.COM>
Content-Language: en-US
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

CgpEZW4gMTguIGRlcy4gMjAxNyAxOTozMywgc2tyZXYgR292aW5kYSBUYXR0aToKPj4+PiBBcmUg
eW91IHNheWluZyBkb19mbHIgZG9lc24ndCBleGlzdCBhdCBhbGwgaW4gYW55IHZlcnNpb24gb2Yg
TGludXgsCj4+Pj4gYW5kIGFzIHN1Y2ggdGhlIGxpbmUgeW91J3JlIHJlbW92aW5nIGlzIGN1cnJl
bnRseSBwb2ludGxlc3M/Cj4+PiBZZXMsIHRoYXQncyBjb3JyZWN0LiBJbiBvdGhlci13b3Jkcywg
aXQgd2lsbCBub3QgYnJlYWsgYW55IGV4aXN0aW5nIGNvZGUKPj4+IG9yIGZ1bmN0aW9uYWxpdHku
Cj4+IEV4Y2VwdCBmb3IgcGVvcGxlLCBsaWtlIG1lLCBydW5uaW5nIHVub2ZmaWNpYWwgcGF0Y2hl
cyB0byBsaW51eC4gSXQKPj4gc2hvdWxkIGJlIE9LIHRvIGFzc3VtZSB0aGV5IGFyZSB3YXRjaGlu
ZyB0aGlzIHRocmVhZC4KPiBEbyB3ZSBuZWVkIHRvIGFjY291bnQgZm9yIHVub2ZmaWNpYWwgcGF0
Y2hlcyBvciB1c2FnZSBvZiBkb19mbHI/LiBJZiB5ZXMsCj4gd2UgbmVlZCB0byBtYWludGFpbmJh
Y2t3YXJkIGNvbXBhdGliaWxpdHkgZm9yIGRvX2ZsciBhdHRyaWJ1dGUuCgpXaGVuIHRoZSBmaW5h
bCwgb2ZmaWNpYWwgY2hhbmdlIHRvIHRoZSBsaW51eCBiYWNrZW5kIGRyaXZlciBnb2VzIGluLAps
b2NhbCBwYXRjaGVzIHdpbGwgbm8gbG9uZ2VyIGFwcGx5LgoKVGhlIGNhdXNlIHNob3VsZCBiZSBv
YnZpb3VzIHRvIGFueWJvZHkgZGVhbGluZyB3aXRoIHBhdGNoaW5nIHRoZSBsaW51eApzb3VyY2Vz
IG9uIHRoZWlyIG93bi4gUnVubmluZyBuZXdlciBrZXJuZWxzIGFzIGRvbTAgb24gb2xkIFhlbiB3
b3VsZApqdXN0IG1lYW4gdGhvc2UgcGVvcGxlIHdvdWxkIG5lZWQgYSBkaWZmZXJlbnQgKHNpbXBs
ZXIpIHBhdGNoLgoKQXMgYSBjb252ZW5pZW5jZSwgSSdkIGxpa2UgYSBoZWFkcyB1cCBiZWZvcmUg
dGhlIGludGVyZmFjZSBvbiB0aGUKeGVuL2xpYnhsIHNpZGUgY2hhbmdlcywgc28gSSBjYW4gbWFr
ZSBzdXJlIHRvIHJ1biBhIGNvbXBhdGlibGUgZG9tMAprZXJuZWwuIEFuIGVudHJ5IGluIGNoYW5n
ZWxvZyBzaG91bGQgc3VmZmljZS4KCkEgd2lzaGxpc3QgaXRlbSBtaWdodCBiZSB0byBoYXZlIGxp
YnhsIGVycm9yIG1lc3NhZ2UgYmUgYXMgZm9vbC1wcm9vZiBhcwpwb3NzaWJsZS4gIkZhaWxlZCB0
byBhY2Nlc3MgcGNpYmFjayBwYXRoICVzIiBjb3VsZCBwZXJoYXBzIGJlIGltcHJvdmVkCnVwb24u
IFBlcmhhcHMgYWRkICJtYWtlIHN1cmUgcGNpYmFjayB2ZXJzaW9uIGlzIGNvbXBhdGlibGUgd2l0
aCBsaWJ4bAp2ZXJzaW9uIi4KCkFkZGluZyBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBjb2RlIGp1
c3QgZm9yIHRoaXMgd291bGQgYmUgdW5uZWNlc3NhcnkKY3J1ZnQgYXMgZmFyIGFzIEkgY2FuIHNl
ZS4KCkknbGwgZ28gYmFjayB0byBsdXJraW5nIG5vdy4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
