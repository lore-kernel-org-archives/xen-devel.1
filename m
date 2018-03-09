From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] Move missing items from
 docs/misc/qemu-xen-security to SUPPORT.md
Date: Fri, 09 Mar 2018 03:49:26 -0700
Message-ID: <5AA274C602000078001B02A1@prv-mh.provo.novell.com>
References: <20180308173719.14791-1-lars.kurth@citrix.com>
 <5AA26AE702000078001B01B1@prv-mh.provo.novell.com>
 <c13abc63-56cc-5335-627a-ed66521a5eb7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ibp0=f7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1euFab-000484-Dc
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 10:49:29 +0000
In-Reply-To: <c13abc63-56cc-5335-627a-ed66521a5eb7@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Lars Kurth <lars.kurth@citrix.com>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAzLjE4IGF0IDExOjMwLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwMy8wOS8yMDE4IDEwOjA3IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24g
MDguMDMuMTggYXQgMTg6MzcsIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gLS0t
IGEvU1VQUE9SVC5tZAo+Pj4gKysrIGIvU1VQUE9SVC5tZAo+Pj4gQEAgLTYyMCw2ICs2MjAsNyBA
QCBOb3RlIHRoYXQgb3RoZXIgZGV2aWNlcyBhcmUgYXZhaWxhYmxlIGJ1dCBub3Qgc2VjdXJpdHkg
c3VwcG9ydGVkLgo+Pj4gIAo+Pj4gICMjIyB4ODYvRW11bGF0ZWQgcGxhdGZvcm0gZGV2aWNlcyAo
UUVNVSk6Cj4+PiAgCj4+PiArICAgIFN0YXR1cywgUENJIGhvc3QgYnJpZGdlOiBTdXBwb3J0ZWQK
Pj4+ICAgICAgU3RhdHVzLCBwaWl4MzogU3VwcG9ydGVkCj4+IAo+PiBUaGF0J3Mgd2F5IHRvbyBn
ZW5lcmljIGltbzogQW55IGNoaXBzZXQgd2lsbCBoYXZlIGEgaG9zdCBicmlkZ2UsIHNvCj4+IGl0
cyBzdXBwb3J0IGlzIGFscmVhZHkgaW5jbHVkZWQgaW4gdGhlIHN0YXRlbWVudCBvbiB3aGljaCBj
aGlwc2V0Cj4+IGVtdWxhdGlvbihzKSB3ZSBzdXBwb3J0LiBCeSBhZGRpbmcgd2hhdCB5b3UgYWRk
LCB5b3UgY291bGQgYWdhaW4KPj4gcmFpc2UgdGhlIGV4cGVjdGF0aW9uIHRoYXQgYW55IGhvc3Qg
YnJpZGdlIGltcGxlbWVudGF0aW9uIGluIHFlbXUKPj4gaXMgc3VwcG9ydGVkLgo+IAo+IFllcywg
d2hlbiBJIHNhdyBMYXJzJyBwYXRjaCBJIHdhcyB0cnlpbmcgdG8gcmVtZW1iZXIgd2h5IHRob3Nl
IHRoaW5ncwo+IHdlcmVuJ3QgYWxyZWFkeSBjb3BpZWQgb3ZlciwgYW5kIHdhcyBwcmV0dHkgc3Vy
ZSB0aGVyZSB3YXMgYSBnb29kIHJlYXNvbi4KPiAKPiBBcmUgeW91IHNheWluZywgaW4gZWZmZWN0
LCB0aGF0ICJzdXBwb3J0IGZvciBwaWl4MyIgKmltcGxpZXMqIHN1cHBvcnQKPiBmb3IgdGhlIFBD
SSBob3N0IGJyaWRnZSBwcm92aWRlZCBieSB0aGUgcGlpeDMgY2hpcHNldD8KClllcy4KCj4gSWYg
c28sICJQQ0kgaG9zdCBicmlkZ2UiIHdhcyByZWR1bmRhbnQsIGFuZCBtYXkgaGF2ZSBiZWVuIHB1
dCBpbiBiZWZvcmUKPiBwaWl4MyB3YXMgc3BlY2lmaWVkLgoKTGlrZWx5LgoKSmFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
