From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86/PVH/libxl: Check whether Linux guest
 can handle RSDP at 4G boundary
Date: Mon, 9 Apr 2018 18:04:52 +0200
Message-ID: <1cdcf47a-7af6-4e5d-341a-b98b8d7293a9@suse.com>
References: <20180409142459.2096-1-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rfzc=g6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f5ZHs-0007l5-SQ
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 16:04:56 +0000
In-Reply-To: <20180409142459.2096-1-boris.ostrovsky@oracle.com>
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

T24gMDkvMDQvMTggMTY6MjQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBDb21taXQgNGE1NzMz
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
aXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gLS0tCj4gdjI6Cj4gKiBSZW5hbWVkIGZsYWcgdG8g
WEVORkVBVF9saW51eF9yc2RwX3VucmVzdHJpY3RlZAo+ICogQ2xhcmlmaWVkIGNvbW1lbnQgaW4g
ZmVhdHVyZXMuaAo+IAo+IEkgZGlkIG5vdCBpbmNsdWRlIHRhZ3MgYmVjYXVzZSBvZiB0aGUgY2hh
bmdlcyBidXQganVzdCBpbiBjYXNlIC0tLQo+IGhlcmUgdGhleSBhcmU6Cj4gCj4gQWNrZWQtYnk6
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KClNvIGFnYWluOgoKUmV2
aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
