From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] x86/PVH/libxl: Check whether Linux guest
 can handle RSDP at 4G boundary
Date: Mon, 9 Apr 2018 12:29:00 -0400
Message-ID: <cedc2f52-b4cb-afdc-4898-75df080640ab@oracle.com>
References: <20180409142459.2096-1-boris.ostrovsky@oracle.com>
 <20180409160841.mi3id5wuqwbpxbg2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=phip=g6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1f5ZdZ-00010R-Ri
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 16:27:21 +0000
In-Reply-To: <20180409160841.mi3id5wuqwbpxbg2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: jgross@suse.com, sstabellini@kernel.org, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDkvMjAxOCAxMjowOCBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIEFwciAwOSwg
MjAxOCBhdCAxMDoyNDo1OUFNIC0wNDAwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IENvbW1p
dCA0YTU3MzM3NzFlNmYgKCJsaWJ4bDogcHV0IFJTRFAgZm9yIFBWSCBndWVzdCBuZWFyIDRHQiIp
IGJyZWFrcwo+PiBwcmUtNC4xNyBMaW51eCBndWVzdHMgc2luY2UgdGhleSBkbyBub3QgdXNlIHN0
YXJ0X2luZm8ncyByc2RwX3BhZGRyCj4+IHBvaW50ZXIgYW5kIGluc3RyZWFkIHNjYW4gQklPUyBt
ZW1vcnkgZm9yIFJTRFAgc2lnbmF0dXJlLgo+Pgo+PiBJbnRyb2R1Y2UgWEVORkVBVF9yc2RwX3Vu
cmVzdHJpY3RlZCBmZWF0dXJlIGZsYWcgdGhhdCBpbmRpY2F0ZXMgd2hldGhlcgo+IEkgcmVhbGlz
ZSB0aGUgbmFtZSBoZXJlIGlzIG5vdCB1cGRhdGVkLiBUaGF0IGNhbiBiZSBkb25lIHVwb24KPiBj
b21taXR0aW5nLgoKUGxlYXNlIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
