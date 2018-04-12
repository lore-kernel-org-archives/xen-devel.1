From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 0/5] for-linux/sndif: add explicit back and
 front synchronization
Date: Thu, 12 Apr 2018 13:13:56 -0400
Message-ID: <690a322e-20a6-fe55-1d87-0a52de126ee0__49397.7036480375$1523553070$gmane$org@oracle.com>
References: <20180412160102.15833-1-oleksandr_andrushchenko@epam.com>
 <d5ede3f5-200e-f1c7-71f4-4ebfb938ca48@gmail.com>
 <43348cf5-d2f8-9d7d-0390-2273eef8f67d@oracle.com>
 <db3ee9fb-d0ab-5f17-a1ec-7bb8ec5cf75f@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qv6=hb=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1f6flh-0007uP-Dl
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 17:12:17 +0000
In-Reply-To: <db3ee9fb-d0ab-5f17-a1ec-7bb8ec5cf75f@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, konrad.wilk@oracle.com, tiwai@suse.de
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTIvMjAxOCAxMjo1NSBQTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDQvMTIvMjAxOCAwNzo1NSBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwNC8x
Mi8yMDE4IDEyOjExIFBNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IEhlbGxv
LCBLb25yYWQsIFRha2FzaGkhCj4+Pgo+Pj4gQ291bGQgeW91IHBsZWFzZSByZXZpZXcgdGhlICpM
aW51eCBLZXJuZWwqIHZlcnNpb24gb2YgdGhlIGNoYW5nZXM/Cj4+PiBBcyBJIHNhaWQgaW4gdGhl
IGNvdmVyIGxldHRlciBiZWxvdyB0aGVyZSBpcyBubyBmdW5jdGlvbmFsIGNoYW5nZXMKPj4+IGNv
bXBhcmluZyB0byB0aGUgY29ycmVzcG9uZGluZyBYZW4gdmVyc2lvbiwgYnV0IHNwYWNlcyB0byB0
YWJzLgo+Pj4gU3RpbGwsIGZvcm1hbGx5LCBJIGhhdmUgdG8gZHJvcCB0aGUgUi1iIHRhZ3MgYW5k
IHJlcXVlc3QgZm9yIHRoZSBuZXcKPj4+IHJldmlldy4KPj4gSXMgdGhlcmUgYW55IHJlYXNvbiB3
aHkgdGhpcyBhbGwgY2FuJ3QgYmUgZG9uZSBpbiBhIHNpbmdsZSBwYXRjaD8KPiBKdXN0IHRvIHBy
ZXNlcnZlIHRoZSBoaXN0b3J5IG9mIHRoZSBjaGFuZ2VzPwoKVGhlIGhpc3RvcnkgaXMgdHJhY2tl
ZCBpbiBYZW4gdHJlZSBhbmQgc2luY2UgeW91IGFyZSBvbmx5IHVwZGF0aW5nIHRoZQpoZWFkZXIg
ZmlsZSBJIGRvbid0IHRoaW5rIHdlIGdhaW4gbXVjaCBieSByZXBlYXRpbmcgaXQgaGVyZS4KCj4+
IFRoaXMgaXMganVzdCBzeW5jaW5nIHVwIHdpdGggdGhlIGNhbm9uaWNhbCBkZWZpbml0aW9uIGlu
IFhlbi4KPiBEbyB5b3Ugd2FudCBtZSB0byBzcXVhc2ggYW5kIHJlc2VuZD8KCgpZZXMsIHBsZWFz
ZS4KCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
