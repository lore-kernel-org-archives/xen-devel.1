From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: arm: xl vcpu-pin leads to oom-killer slashing
 processes
Date: Wed, 5 Dec 2018 12:28:00 +0200
Message-ID: <97cc37c3-cff2-5128-b052-276b9147ef7d@gmail.com>
References: <2c2385f9-515d-1c13-2618-d22d52901abc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j75d=oo=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gUUPV-0006um-6D
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 10:28:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id e26so14330896lfc.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Dec 2018 02:28:04 -0800 (PST)
Received: from [10.17.180.102] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id p23sm3522822lfh.47.2018.12.05.02.28.01
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Dec 2018 02:28:01 -0800 (PST)
In-Reply-To: <2c2385f9-515d-1c13-2618-d22d52901abc@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SXQgaGFwcGVucyB3aXRoIGNyZWRpdCBhbmQgY3JlZGl0MiBzY2hlZHVsZXJzLCB3aXRoIG9sZCBh
bmQgbmV3IHZnaWMuCgpPbiAwNS4xMi4xOCAxMjoyNiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBI
ZWxsbywKPiAKPiBPbiB0aGUgY3VycmVudAo+ICDCoMKgwqAgNmQ4ZmZhYyAoeGVuYml0cy9tYXN0
ZXIpIHhlbi9hcm06IGdpYzogUmVtb3ZlIGR1cGxpY2F0ZWQgY29tbWVudCBpbiBkb19zZ2kKPiBh
bmQKPiAgwqDCoMKgIDcwNzM5NDIgKHhlbmJpdHMvc3RhZ2luZywgeGVuYml0cy9zbW9rZSwgeGVu
Yml0cy9jb3Zlcml0eS10ZXN0ZWQvc21va2UpIHBjaTogYXBwbHkgd29ya2Fyb3VuZCBmb3IgSW50
ZWwgZXJyYXRhIEhTRTQzIGFuZCBCREYyL0JEWDIKPiAKPiBgeGwgdmNwdS1waW5gIGxlYWRzIHRv
IG9vbS1raWxsZXIgYmVjb21lcyBtYWQgYW5kIHNsYXNoaW5nIGFsbCBwcm9jZXNzZXM6Cj4gCgot
LSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
