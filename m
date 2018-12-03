From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ALSA: xen-front: Use
 Xen common shared buffer implementation
Date: Mon, 3 Dec 2018 11:38:49 +0200
Message-ID: <ab0405f7-6f77-14d6-7b18-8378488a3211__29020.8022612662$1543829859$gmane$org@gmail.com>
References: <20181130074205.20496-1-andr2000@gmail.com>
 <20181130074205.20496-3-andr2000@gmail.com> <s5htvjvvtng.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x8t8=om=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gTkgo-0008Mh-Al
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 09:38:54 +0000
Received: by mail-lf1-x144.google.com with SMTP id p86so8576332lfg.5
 for <xen-devel@lists.xenproject.org>; Mon, 03 Dec 2018 01:38:52 -0800 (PST)
In-Reply-To: <s5htvjvvtng.wl-tiwai@suse.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: jgross@suse.com, alsa-devel@alsa-project.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMy8xOCAxMTozNiBBTSwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIEZyaSwgMzAgTm92
IDIwMTggMDg6NDI6MDUgKzAxMDAsCj4gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+
IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0Bl
cGFtLmNvbT4KPj4KPj4gVXNlIHBhZ2UgZGlyZWN0b3J5IGJhc2VkIHNoYXJlZCBidWZmZXIgaW1w
bGVtZW50YXRpb24KPj4gbm93IGF2YWlsYWJsZSBhcyBjb21tb24gY29kZSBmb3IgWGVuIGZyb250
ZW5kIGRyaXZlcnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBGb3IgdGhlIHNvdW5kIGJpdHMs
Cj4gICAgUmV2aWV3ZWQtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4KVGhhbmsgeW91
Cj4KPiBJIHN1cHBvc2UgdGhlIHdob2xlIHBhdGNoc2V0IHdpbGwgYmUgdGFrZW4gdGhyb3VnaCB4
ZW4gb3Igb3RoZXIgdHJlZT8KWGVuIHRyZWUKPgo+IHRoYW5rcywKPgo+IFRha2FzaGkKClRoYW5r
IHlvdSwKCk9sZWtzYW5kcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
