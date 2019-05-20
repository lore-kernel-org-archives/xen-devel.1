From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [RFC PATCH 1/2] xen/device-tree: Add
 dt_count_phandle_with_args helper
Date: Mon, 20 May 2019 16:48:27 +0300
Message-ID: <6534c5d0-1164-4076-f22f-6a820eff9c46@gmail.com>
References: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
 <1556806436-26283-2-git-send-email-olekstysh@gmail.com>
 <ce325872-a19e-2d07-ca88-cd3f0b1bd933@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ag2u=TU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hSieb-0002s4-93
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 13:48:37 +0000
Received: by mail-lf1-x144.google.com with SMTP id y13so10356052lfh.9
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 06:48:35 -0700 (PDT)
In-Reply-To: <ce325872-a19e-2d07-ca88-cd3f0b1bd933@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

Ck9uIDIwLjA1LjE5IDE0OjAzLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSwgSnVsaWVu
CgoKPgo+IE9uIDAyLzA1LzIwMTkgMTU6MTMsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+
PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5j
b20+Cj4+Cj4+IFBvcnQgTGludXggaGVscGVyIG9mX2NvdW50X3BoYW5kbGVfd2l0aF9hcmdzIGZv
ciBjb3VudGluZwo+PiBudW1iZXIgb2YgcGhhbmRsZXMgaW4gYSBwcm9wZXJ0eS4KPgo+IExpbnV4
IDUuMSB1c2VzIGEgY29tcGxldGVseSBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb24gZm9yIAo+IG9m
X2NvdW50X3BoYW5kbGVfd2l0aF9hcmdzLiBTbyB3aGljaCB2ZXJzaW9uIG9mIExpbnV4IGRpZCB5
b3UgcG9ydCBmcm9tPwoKVGhpcyBwYXRjaCBpcyBleGFjdGx5IHRoZSBzYW1lIG9uZSBbMV0sIEkg
ZGlkIG1vcmUgdGhhbiAyIHllYXJzIGFnbyBpbiAKdGhlIGNvbnRleHQgb2Ygbm9uLXNoYXJlZCBJ
T01NVSBwYXRjaCBzZXJpZXMuIExpa2VseSwgSSB3YXMgYmFzZWQgb24gdjQuNC4KClNvcnJ5IGZv
ciB0aGUgY29uZnVzaW5nIGRlc2NyaXB0aW9uLgoKCllvdSBhcmUgcmlnaHQsIGN1cnJlbnQgaW1w
bGVtZW50YXRpb24gb2ZfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MgaXMgCmNvbXBsZXRlbHkgZGlm
ZmVyZW50LCBhbmQgSSBhbSBhZnJhaWQsIGlzIG5vdCBlYXNpbHkgYmFjay1wb3J0YWJsZSB0byBY
ZW4uCgpJZiB0aGUgaW1wbGVtZW50YXRpb24gInY0LjQiIGxvb2tzIGNvcnJlY3QgYW5kIGZpdHMg
aW4gY3VycmVudCBYZW4gCmNvZGViYXNlLCBJIGNhbiByZWNvbGxlY3QgYW4gZXhhY3QgdmVyc2lv
biBhbmQgdXBkYXRlIHRoZSBwYXRjaCAKZGVzY3JpcHRpb24uCgpXaGF0IGRvIHlvdSB0aGluaz8K
CgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85ODYyNTU3LwoKPgo+IENo
ZWVycywKPgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
