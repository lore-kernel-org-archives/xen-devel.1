From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86emul: fix 3-operand IMUL
Date: Tue, 18 Dec 2018 13:54:57 +0200
Message-ID: <2a351eb9-7e35-ace4-9541-8bd49b45b98b@bitdefender.com>
References: <5C18DA1C020000780020716C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hbVh=O3=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gZDxp-0006qk-NJ
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 11:55:05 +0000
In-Reply-To: <5C18DA1C020000780020716C@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Andrei LUTAS <vlutas@bitdefender.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTgvMTggMToyOSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgY29tbWl0IDc1
MDY2Y2Q0ZWEgKCJ4ODZlbXVsOiBmaXggeyxpfW11bCBhbmQgeyxpfWRpdiIpIGluZGVlZCBkaWQK
PiBhcyBpdHMgdGl0bGUgc2F5cywgaXQgYnJva2UgdGhlIDMtb3BlcmFuZCBmb3JtIGJ5IHVuaWZv
cm1seSB1c2luZyBBTC9BWC8KPiBFQVgvUkFYIGFzIHNlY29uZCBzb3VyY2Ugb3BlcmFuZC4gRml4
IHRoaXMgYW5kIGFkZCB0ZXN0cyBjb3ZlcmluZyBib3RoCj4gY2FzZXMuCj4gCj4gUmVwb3J0ZWQt
Ynk6IEFuZHJlaSBMdXRhcyA8dmx1dGFzQGJpdGRlZmVuZGVyLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpUZXN0ZWQtYnk6IFJhenZhbiBDb2pv
Y2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KCgpUaGFuayB5b3UsClJhenZhbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
