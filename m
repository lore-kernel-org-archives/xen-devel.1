From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 0/5] for-linux/sndif: add explicit back and
 front synchronization
Date: Thu, 12 Apr 2018 19:55:04 +0300
Message-ID: <db3ee9fb-d0ab-5f17-a1ec-7bb8ec5cf75f__39106.9154874005$1523552052$gmane$org@epam.com>
References: <20180412160102.15833-1-oleksandr_andrushchenko@epam.com>
 <d5ede3f5-200e-f1c7-71f4-4ebfb938ca48@gmail.com>
 <43348cf5-d2f8-9d7d-0390-2273eef8f67d@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ulak=hb=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1f6fVP-00063g-05
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 16:55:27 +0000
In-Reply-To: <43348cf5-d2f8-9d7d-0390-2273eef8f67d@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, konrad.wilk@oracle.com, tiwai@suse.de
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTIvMjAxOCAwNzo1NSBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA0LzEy
LzIwMTggMTI6MTEgUE0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBIZWxsbywg
S29ucmFkLCBUYWthc2hpIQo+Pgo+PiBDb3VsZCB5b3UgcGxlYXNlIHJldmlldyB0aGUgKkxpbnV4
IEtlcm5lbCogdmVyc2lvbiBvZiB0aGUgY2hhbmdlcz8KPj4gQXMgSSBzYWlkIGluIHRoZSBjb3Zl
ciBsZXR0ZXIgYmVsb3cgdGhlcmUgaXMgbm8gZnVuY3Rpb25hbCBjaGFuZ2VzCj4+IGNvbXBhcmlu
ZyB0byB0aGUgY29ycmVzcG9uZGluZyBYZW4gdmVyc2lvbiwgYnV0IHNwYWNlcyB0byB0YWJzLgo+
PiBTdGlsbCwgZm9ybWFsbHksIEkgaGF2ZSB0byBkcm9wIHRoZSBSLWIgdGFncyBhbmQgcmVxdWVz
dCBmb3IgdGhlIG5ldwo+PiByZXZpZXcuCj4gSXMgdGhlcmUgYW55IHJlYXNvbiB3aHkgdGhpcyBh
bGwgY2FuJ3QgYmUgZG9uZSBpbiBhIHNpbmdsZSBwYXRjaD8KSnVzdCB0byBwcmVzZXJ2ZSB0aGUg
aGlzdG9yeSBvZiB0aGUgY2hhbmdlcz8KPiBUaGlzIGlzIGp1c3Qgc3luY2luZyB1cCB3aXRoIHRo
ZSBjYW5vbmljYWwgZGVmaW5pdGlvbiBpbiBYZW4uCkRvIHlvdSB3YW50IG1lIHRvIHNxdWFzaCBh
bmQgcmVzZW5kPwo+IC1ib3Jpcwo+Cj4KVGhhbmsgeW91LApPbGVrc2FuZHIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
