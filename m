From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] xen/netfront: Remove unneeded .resume
 callback
Date: Thu, 16 May 2019 09:26:25 +0300
Message-ID: <48fedb13-5af2-e7cf-d182-0f2bb385dda2__16180.6413366989$1557988057$gmane$org@gmail.com>
References: <6205819a-af39-8cd8-db87-f3fe047ff064@gmail.com>
 <ecc825e6-89d3-bbd5-5243-5cc66fa93045@oracle.com>
 <b55d4f90-100c-7a2a-9651-c99c06953465@gmail.com>
 <09afcdca-258f-e5ca-5c31-b7fd079eb213@oracle.com>
 <3e868e7a-4872-e8ab-fd2c-90917ad6d593@arm.com>
 <d709d185-5345-c463-3fd1-e711f954e58a@gmail.com>
 <435369ba-ad3b-1d3a-c2f4-babe8bb6189c@amazon.com>
 <fde362d0-dd48-9c9a-e71a-8fb158909551@epam.com>
 <20190325173011.GA20277@kaos-source-ops-60001.pdx1.amazon.com>
 <f5e824de-da57-9574-3813-2668f2932a6e@gmail.com>
 <20190328231928.GA5172@kaos-source-ops-60001.pdx1.amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/XQJ=TQ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hR9qY-0007VY-BF
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 06:26:30 +0000
Received: by mail-lj1-x241.google.com with SMTP id 188so1942092ljf.9
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2019 23:26:29 -0700 (PDT)
In-Reply-To: <20190328231928.GA5172@kaos-source-ops-60001.pdx1.amazon.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anchal Agarwal <anchalag@amzn.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>
Cc: "jgross@suse.com" <jgross@suse.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Munehisa Kamata <kamatam@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Anchal Agarwal <anchalag@amazon.com>, Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "davem@davemloft.net" <davem@davemloft.net>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sIEFuY2hhbCEKCk9uIDMvMjkvMTkgMToxOSBBTSwgQW5jaGFsIEFnYXJ3YWwgd3JvdGU6
CltzbmlwXQo+Pj4+IEdyZWF0LCBjb3VsZCB5b3UgcGxlYXNlIGxldCB1cyBrbm93IHdoYXQgaXMg
dGhlIHByb2dyZXNzIGFuZCBmdXJ0aGVyIHBsYW5zCj4+Pj4gb24gdGhhdCwgc28gd2UgZG8gbm90
IHdvcmsgb24gdGhlIHNhbWUgY29kZSBhbmQgY2FuIGNvb3JkaW5hdGUgb3VyCj4+Pj4gZWZmb3J0
cyBzb21laG93PyBBbmNoYWwsIGNvdWxkIHlvdSBwbGVhc2Ugc2hlZCBzb21lIGxpZ2h0IG9uIHRo
aXM/Cj4+PiBMb29rcyBsaWtlIG15IHByZXZpb3VzIGVtYWlsIGRpZCBub3QgbWFrZSBpdCB0byBt
YWlsaW5nIGxpc3QuIE1heSBiZSBzb21lIGlzc3VlcyB3aXRoIG15Cj4+PiBlbWFpbCBzZXJ2ZXIg
c2V0dGluZ3MuIEdpdmluZyBpdCBhbm90aGVyIHNob3QuCj4+PiBZZXMsIEkgYW0gd29ya2luZyBv
biB0aG9zZSBwYXRjaGVzIGFuZCBwbGFuIHRvIHJlLXBvc3QgdGhlbSBpbiBhbiBlZmZvcnQgdG8g
dXBzdHJlYW0uCj4+IFRoaXMgaXMgcmVhbGx5IGdyZWF0LCBsb29raW5nIGZvcndhcmQgdG8gaXQ6
IGFueSBkYXRlIGluIHlvdXIgbWluZAo+PiB3aGVuIHRoaXMgY2FuIGhhcHBlbj8KPiBOb3QgYSBz
cGVjaWZpYyBkYXRlIGJ1dCBtYXkgYmUgaW4gZmV3IHdlZWtzLiBJIGFtIGN1cnJlbnRseSBzd2Ft
cGVkIGF0IHdvcmsuCj4KQW55IHByb2dyZXNzIG9uIHRoaXM/CgpUaGFuayB5b3UsCk9sZWtzYW5k
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
