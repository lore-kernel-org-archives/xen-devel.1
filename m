From: Govinda Tatti <Govinda.Tatti@Oracle.COM>
Subject: Re: [PATCH V1 1/1] Xen/libxl: Perform PCI reset using
 'reset' SysFS attribute
Date: Mon, 18 Dec 2017 12:33:22 -0600
Message-ID: <90c62b47-daae-747d-8fbf-c04402c63ae1@Oracle.COM>
References: <20171207222639.9879-1-Govinda.Tatti@Oracle.COM>
 <20171207222639.9879-2-Govinda.Tatti@Oracle.COM>
 <CAFLBxZZ-KO2Ytu1-fxgdmSZvy=a2C+SBeuweOHWGfbRnPxBRuA@mail.gmail.com>
 <dc8308cf-f6da-7b92-5bbb-05f58fd9e18b@Oracle.COM>
 <CAFLBxZb-S8CiRmpa=ddS-By300Hkwx_hLF66JVX2R3tHvzFcPA@mail.gmail.com>
 <59839a62-9cc4-b3a1-d765-bc372378d976@Oracle.COM>
 <76649b03-0dde-dd37-28bd-f29b340aa009@alstadheim.priv.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vyyb=do=oracle.com=govinda.tatti@srs-us1.protection.inumbo.net>)
 id 1eR0JL-0000tI-1p
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2017 18:38:47 +0000
In-Reply-To: <76649b03-0dde-dd37-28bd-f29b340aa009@alstadheim.priv.no>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IEFyZSB5b3Ugc2F5aW5nIGRvX2ZsciBkb2Vzbid0IGV4aXN0IGF0IGFsbCBpbiBhbnkgdmVy
c2lvbiBvZiBMaW51eCwKPj4+IGFuZCBhcyBzdWNoIHRoZSBsaW5lIHlvdSdyZSByZW1vdmluZyBp
cyBjdXJyZW50bHkgcG9pbnRsZXNzPwo+PiBZZXMsIHRoYXQncyBjb3JyZWN0LiBJbiBvdGhlci13
b3JkcywgaXQgd2lsbCBub3QgYnJlYWsgYW55IGV4aXN0aW5nIGNvZGUKPj4gb3IgZnVuY3Rpb25h
bGl0eS4KPiBFeGNlcHQgZm9yIHBlb3BsZSwgbGlrZSBtZSwgcnVubmluZyB1bm9mZmljaWFsIHBh
dGNoZXMgdG8gbGludXguIEl0Cj4gc2hvdWxkIGJlIE9LIHRvIGFzc3VtZSB0aGV5IGFyZSB3YXRj
aGluZyB0aGlzIHRocmVhZC4KRG8gd2UgbmVlZCB0byBhY2NvdW50IGZvciB1bm9mZmljaWFsIHBh
dGNoZXMgb3IgdXNhZ2Ugb2YgZG9fZmxyPy4gSWYgeWVzLAp3ZSBuZWVkIHRvIG1haW50YWluYmFj
a3dhcmQgY29tcGF0aWJpbGl0eSBmb3IgZG9fZmxyIGF0dHJpYnV0ZS4KCkNoZWVycwpHT1ZJTkRB
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
