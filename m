From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Thu, 20 Dec 2018 07:36:46 -0800
Message-ID: <20181220153646.GA22997__12000.3714495853$1545320126$gmane$org@infradead.org>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=onL2=O5=bombadil.srs.infradead.org=batv+4320e4c38c4ab4f6f328+5597+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1ga0NU-0001Ok-Lj
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:36:48 +0000
Content-Disposition: inline
In-Reply-To: <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTgsIDIwMTggYXQgMDg6MjA6MjJQTSArMDEwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+ID4gKwlpZiAoIWRtYV9tYXBfc2coZGV2LT5kZXYsIHhlbl9vYmotPnNndC0+c2ds
LCB4ZW5fb2JqLT5zZ3QtPm5lbnRzLAo+ID4gKwkJCURNQV9CSURJUkVDVElPTkFMKSkgewo+IAo+
IAo+IEFyZSB5b3UgdXNpbmcgdGhlIERNQSBzdHJlYW1pbmcgQVBJIGFzIGEgd2F5IHRvIGZsdXNo
IHRoZSBjYWNoZXM/CgpUaGlzIGxvb2tzIHJhdGhlciBicm9rZW4uICBQbGVhc2Ugc2VuZCB0aGUg
d2hvbGUgcGF0Y2ggc2VyaWVzIHRvCnRoZSBpb21tdSBsaXN0IGZvciBwcm9wZXIgcmV2aWV3LgoK
PiBEb2VzIHRoaXMgbWVhbiB0aGF0IEdGUF9VU0VSIGlzbid0IG1ha2luZyB0aGUgYnVmZmVyIGNv
aGVyZW50PwoKSG93IGNvdWxkIEdGUF9VU0VSIG1ha2UgbWVtb3J5IGNvaGVyZW50IGluIGFueSB3
YXk/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
