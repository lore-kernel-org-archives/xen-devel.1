From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v5 0/10] arm: more kconfig configurability
 and small default configs
Date: Tue, 5 Jun 2018 18:52:16 +0100
Message-ID: <4a4819eb-42bf-555f-a82f-c8a18864a7e8@arm.com>
References: <alpine.DEB.2.10.1806041020340.23991@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1806041020340.23991@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, andrii_anisov@epam.com, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, dfaggioli@suse.com, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNC8wNi8xOCAxODoyMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IEhpIGFsbCwK
PiAKPiBUaGlzIHBhdGNoIHNlcmllcyBpcyB0aGUgZmlyc3Qgc3RlcCB0b3dhcmQgYnVpbGRpbmcg
YSBzbWFsbCBjZXJ0aWZpYWJsZQo+IFhlbiBoeXBlcnZpc29yIGZvciBBUk0gYm9hcmRzLgo+IAo+
IEZpcnN0LCB0aGUgc2VyaWVzIG1ha2VzIGEgZmV3IGNoYW5nZXMgdG8gYWxsb3cgZGlzYWJsaW5n
IG1vcmUga2NvbmZpZwo+IG9wdGlvbnM6IG1vc3Qgb2YgdGhlbSBhbHJlYWR5IGV4aXN0IGJ1dCBj
YW5ub3QgYmUgZGlzYWJsZWQuCj4gCj4gVGhlbiwgaXQgaW50cm9kdWNlcyBhIHJlZmVyZW5jZSBr
Y29uZmlnIGZvciBSZW5lc2FzIFJDYXIgKGR1ZSB0byBwb3B1bGFyCj4gZGVtYW5kLCBjYW5kaWRh
dGUgZm9yIGNlcnRpZmljYXRpb25zKSwgWGlsaW54IE1QU29DLCBhbmQgZm9yIFFFTVUKPiBhYXJj
aDY0IChub3QgZm9yIGNlcnRpZmljYXRpb25zLCBidXQgdXNlZnVsIGZvciBkZWJ1Z2dpbmcpLgo+
IAo+IFRoZSBsYXN0IHBhdGNoIGluIHRoZSBzZXJpZXMgYWRkcyBhIGNvbnZlbmllbnQgY2xvYyB0
YXJnZXQgdG8gY291bnQgdGhlCj4gdG90YWwgbGluZXMgb2YgY29kZSBvZiB0aGUgc291cmNlIGZp
bGVzIGJ1aWx0Lgo+IAo+IEFzIGEgY29uc2VxdWVuY2Ugb2YgdGhlc2UgY2hhbmdlcywgc29tZSBv
cHRpb25zIHdpbGwgYmVjb21lIHVzZXItdmlzaWJsZQo+IGFuZCBub3QgZGVwZW5kZW50IG9uIENP
TkZJR19FWFBFUlQuIEl0IGRvZXMgbm90IG1lYW4gdGhhdCBYZW4gUHJvamVjdAo+IHdpbGwgc2Vj
dXJpdHkgc3VwcG9ydCBhbGwgcG9zc2libGUgY29tYmluYXRpb25zIG9mIGtjb25maWcgb3B0aW9u
cy4KPiBJbnN0ZWFkLCB0aGVyZSB3aWxsIGJlIGEgc21hbGwgc2V0IG9mIHByZS1jYW5uZWQgY29u
ZmlndXJhdGlvbnMgdGhhdAo+IHdpbGwgYmUgc3VwcG9ydGVkLiAgU2VlOiBodHRwczovL21hcmMu
aW5mby8/bD14ZW4tZGV2ZWwmbT0xNTI0MjQzODk1MTI0MzIKCkdlb3JnZSwgSWFuLCBKYW4sIHNo
YWxsIFNVUFBPUlQuTUQgYmUgdXBkYXRlZCB0byByZWZsZWN0IHRoZSBLY29uZmlnIApjaGFuZ2Vz
PwoKSSBhbSBtb3N0bHkgdGhpbmtpbmcgYWJvdXQgdGhlIGJvYXJkIHN1cHBvcnQgYW5kIHRoZSBm
YWN0IHRoYXQgbW9yZSAKb3B0aW9ucyBvbiBBcm0gYXJlIHNlbGVjdGFibGUgYnkgdGhlIHVzZXJz
LgoKQ2hlZXJzLAoKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
