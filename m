From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1 1/2] system_state: introduce
 SYS_STATE_smp_booted
Date: Tue, 27 Nov 2018 03:22:25 -0700
Message-ID: <5BFD1AE10200007800200483@prv1-mh.provo.novell.com>
References: <20181127100034.4257-1-sergey.dyasli@citrix.com>
 <20181127100034.4257-2-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181127100034.4257-2-sergey.dyasli@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjExLjE4IGF0IDExOjAwLCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiBUaGUgbmV3IHN0YXRlIG1lYW5zIHRoYXQgYWxsIHNlY29uZGFyeSBDUFVzIGFyZSB1cC4g
T24geDg2IHRoaXMgYWxzbwo+IG1lYW5zIHRoYXQgYSBtaWNyb2NvZGUgd2FzIChwb3RlbnRpYWxs
eSkgdXBkYXRlZCBvbiBhbGwgQ1BVcy4KCkknbSBzbGlnaHRseSBjb25jZXJuZWQgYnkgc3VjaCBh
biB4ODYgc3BlY2lmaWM6IENvdWxkIHdlIHNldHRsZSBvbgphIG1vcmUgZ2VuZXJpYyBkZXNjcmlw
dGlvbiBvZiB0aGUgc3RhdGUgYWxsIENQVXMgYXJlIGluIGF0IHRoYXQKcG9pbnQsIGxpa2UgImZ1
bGx5IGZ1bmN0aW9uYWwiLCBhbmQgb25seSBnaXZlIHVjb2RlIGxvYWRpbmcgb24geDg2CmFzIGFu
IGV4YW1wbGU/Cgo+IEBAIC05MzAsNiArOTMyLDggQEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVu
c2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwKPiAgICAgIHByaW50aygiQnJvdWdodCB1cCAl
bGQgQ1BVc1xuIiwgKGxvbmcpbnVtX29ubGluZV9jcHVzKCkpOwo+ICAgICAgLyogVE9ETzogc21w
X2NwdXNfZG9uZSgpOyAqLwo+ICAKPiArICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9zbXBf
Ym9vdGVkOwoKVGhlIHBsYWNlbWVudCBoZXJlIGFuZCAuLi4KCj4gLS0tIGEveGVuL2FyY2gveDg2
L3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+IEBAIC0xNjgzLDYgKzE2ODMs
OCBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9w
KQo+ICAgICAgICAgIH0KPiAgICAgIH0KPiAgCj4gKyAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RB
VEVfc21wX2Jvb3RlZDsKPiArCj4gICAgICBwcmludGsoIkJyb3VnaHQgdXAgJWxkIENQVXNcbiIs
IChsb25nKW51bV9vbmxpbmVfY3B1cygpKTsKPiAgICAgIGlmICggbnVtX3BhcmtlZCApCj4gICAg
ICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJQYXJrZWQgJXUgQ1BVc1xuIiwgbnVtX3BhcmtlZCk7
CgouLi4gaGVyZSBkaWZmZXIgd3J0IHRoZSBwcmludGsoKXMgLSBpcyB0aGlzIGludGVudGlvbmFs
LCBhbmQgaWYgc28gd2h5PwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
