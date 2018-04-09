From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/PVH/libxl: Check whether Linux guest
 can handle RSDP at 4G boundary
Date: Mon, 9 Apr 2018 09:06:50 +0200
Message-ID: <99bd6a53-195e-4fd1-540d-b6bb19473298@suse.com>
References: <20180407230332.10641-1-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rfzc=g6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f5QtD-0004ZT-SX
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 07:06:55 +0000
In-Reply-To: <20180407230332.10641-1-boris.ostrovsky@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDQvMTggMDE6MDMsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBDb21taXQgNGE1NzMz
NzcxZTZmICgibGlieGw6IHB1dCBSU0RQIGZvciBQVkggZ3Vlc3QgbmVhciA0R0IiKSBicmVha3MK
PiBwcmUtNC4xNyBMaW51eCBndWVzdHMgc2luY2UgdGhleSBkbyBub3QgdXNlIHN0YXJ0X2luZm8n
cyByc2RwX3BhZGRyCj4gcG9pbnRlciBhbmQgaW5zdHJlYWQgc2NhbiBCSU9TIG1lbW9yeSBmb3Ig
UlNEUCBzaWduYXR1cmUuCj4gCj4gSW50cm9kdWNlIFhFTkZFQVRfcnNkcF91bnJlc3RyaWN0ZWQg
ZmVhdHVyZSBmbGFnIHRoYXQgaW5kaWNhdGVzIHdoZXRoZXIKPiB0aGUgZ3Vlc3QgY2FuIGhhbmRs
ZSBSU0RQIGF0IGxvY2F0aW9ucyBwb2ludGVkIHRvIGJ5IHJzZHBfcGFkZHIuCj4gCj4gU2luY2Ug
b25seSBMaW51eCBQVkggZ3Vlc3RzIHN1ZmZlciBmcm9tIHRoaXMgcHJvYmxlbSAoQlNEIGhhcyBh
bHdheXMKPiByZWxpZWQgb24gcnNkcF9wYWRkcikgd2UgY2hlY2sgdGhpcyBmbGFnIGp1c3QgZm9y
IHRob3NlIGd1ZXN0cy4gSWYgdGhlCj4gZmxhZyBpcyBub3Qgc2V0IHdlIHBsYWNlIFJTRFAgaW4g
QklPUywgYXMgYmVmb3JlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9y
aXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
