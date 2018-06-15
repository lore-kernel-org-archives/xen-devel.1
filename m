From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 5/9] xen/gntdev: Allow mappings for DMA
 buffers
Date: Fri, 15 Jun 2018 09:50:53 +0300
Message-ID: <38f10738-63b6-89ce-07a8-7791b2a7e4dc__21192.3972740353$1529045392$gmane$org@epam.com>
References: <20180615062753.9229-1-andr2000@gmail.com>
 <20180615062753.9229-6-andr2000@gmail.com>
 <e892748a-c268-9622-e568-4c361366bce1@epam.com>
 <b9c3f740-dea1-638b-49d9-60cf5880619d@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=phhv=jb=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fTiZf-0003Aq-CA
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 06:51:07 +0000
In-Reply-To: <b9c3f740-dea1-638b-49d9-60cf5880619d@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTUvMjAxOCAwOTo0NiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNS8wNi8x
OCAwODozMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+IFBsZWFzZSBub3RlLCB0
aGF0IHRoaXMgd2lsbCBuZWVkIGEgY2hhbmdlIChhdHRhY2hlZCkgd2hpbGUKPj4gYXBwbHlpbmcg
dG8gdGhlIG1haW5saW5lIGtlcm5lbCBiZWNhdXNlIG9mIEFQSSBjaGFuZ2VzIFsxXS4KPj4KPj4g
VW5mb3J0dW5hdGVseSwgY3VycmVudCBYZW4gdGlwIGtlcm5lbCB0cmVlIGlzIHY0LjE3LXJjNSBi
YXNlZCwKPj4gc28gSSBjYW5ub3QgbWFrZSB0aGUgY2hhbmdlIGluIHRoaXMgcGF0Y2ggbm93Lgo+
IEkgZG9uJ3Qgc2VlIGFueSBjaGFuY2UgdGhpcyBzZXJpZXMgY291bGQgZ28gaW50byA0LjE4LCBh
cyB0aGUgbWVyZ2UKPiB3aW5kb3cgaXMganVzdCBjbG9zaW5nLiBTbyBwbGVhc2UgcG9zdCB0aGUg
cGF0Y2ggYmFzZWQgb24gY3VycmVudAo+IExpbnV4IG1hc3RlciBvZiB0b3J2YWxkcy9saW51eC5n
aXQKT2ssIEknbGwgd2FpdCBmb3IgYW55IGNvbW1lbnRzL3ItYidzIGFuZCB0aGVuIHJlYmFzZSB0
bwp0b3J2YWxkcy9saW51eC5naXQgYW5kIHB1c2ggdjU/CkJUVywgaXMgdGhlcmUgYW55IHBsYW4g
dG8gcmViYXNlIFhlbiB0aXAga2VybmVsPwo+Cj4gSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
