From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] ALSA: xen-front: Do not use stream buffer
 size before it is set
Date: Thu, 4 Apr 2019 15:46:53 +0300
Message-ID: <605c7689-de3e-06fe-2771-4b47dee1cd8f__25930.1024883584$1554382078$gmane$org@gmail.com>
References: <20190404123838.22162-1-andr2000@gmail.com>
 <4a852738-7dc1-09df-165b-a133486e3bb7@suse.com>
 <s5h4l7ec51l.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o7bd=SG=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hC1li-00016Z-Jf
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 12:46:58 +0000
Received: by mail-lj1-x233.google.com with SMTP id y6so1939241ljd.12
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2019 05:46:57 -0700 (PDT)
In-Reply-To: <s5h4l7ec51l.wl-tiwai@suse.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Takashi Iwai <tiwai@suse.de>, Juergen Gross <jgross@suse.com>
Cc: alsa-devel@alsa-project.org, konrad.wilk@oracle.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, perex@perex.cz, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gNC80LzE5IDM6NDUgUE0sIFRha2FzaGkgSXdhaSB3cm90ZToKPiBPbiBUaHUsIDA0IEFwciAy
MDE5IDE0OjQyOjQ0ICswMjAwLAo+IEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA0LzA0LzIw
MTkgMTQ6MzgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Pj4gRnJvbTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4K
Pj4+IFRoaXMgZml4ZXMgdGhlIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCB3aGlsZSBtb3ZpbmcgdG8g
WGVuIHNoYXJlZAo+Pj4gYnVmZmVyIGltcGxlbWVudGF0aW9uLgo+Pj4KPj4+IEZpeGVzOiA1OGY5
ZDgwNmQxNmEgKCJBTFNBOiB4ZW4tZnJvbnQ6IFVzZSBYZW4gY29tbW9uIHNoYXJlZCBidWZmZXIg
aW1wbGVtZW50YXRpb24iKQo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4gUmV2aWV3ZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBBcHBsaWVkIG5vdywgdGhhbmtzLgo+
IEkgcHV0IENjIHRvIHN0YWJsZSBzaW5jZSB0aGUgYnVnIHdhcyBhbHJlYWR5IGluIDUuMC4KPgo+
Cj4gVGFrYXNoaQpUaGFuayB5b3UsCk9sZWtzYW5kcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
