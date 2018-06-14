From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH RFC 01/15] xen: allow console_io hypercalls
 from DomUs on ARM
Date: Thu, 14 Jun 2018 16:33:31 +0100
Message-ID: <3bfcbfbc-119b-dacf-d268-4c52f5f69aca@arm.com>
References: <alpine.DEB.2.10.1806131457490.14695@sstabellini-ThinkPad-X260>
 <1528928118-14960-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528928118-14960-1-git-send-email-sstabellini@kernel.org>
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
Cc: artem_mygaiev@epam.com, Stefano Stabellini <stefanos@xilinx.com>, andrii_anisov@epam.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org, tim@xen.org, jbeulich@suse.com, wei.liu2@citrix.com, dgdegra@tycho.nsa.gov
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDEzLzA2LzE4IDIzOjE1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4gVGhpcyBpcyB2ZXJ5IHVzZWZ1bCB3aGVuIHN0YXJ0aW5nIG11bHRpcGxlIGRvbWFpbnMgZnJv
bSBYZW4gd2l0aG91dAo+IHhlbnN0b3JlIGFjY2Vzcy4gSXQgd2lsbCBhbGxvdyB0aGVtIHRvIHBy
aW50IG91dCB0byB0aGUgWGVuIGNvbnNvbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IENDOiBhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tCj4gQ0M6IEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbQo+IENDOiBpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tCj4gQ0M6IGpiZXVsaWNoQHN1c2UuY29tCj4gQ0M6IGtvbnJhZC53aWxr
QG9yYWNsZS5jb20KPiBDQzogdGltQHhlbi5vcmcKPiBDQzogd2VpLmxpdTJAY2l0cml4LmNvbQo+
IENDOiBkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3YKPiAtLS0KPiBJZiB0aGVyZSBpcyBhIGJldHRlciB3
YXkgdG8gZG8gdGhpcyB3aXRoIFhTTSwgcGxlYXNlIGFkdmlzZS4KCldlIGRlZmluaXRlbHkgbmVl
ZCB0byBrZWVwIHRoZSBYU00gYXJvdW5kIHRvIGF2b2lkIG9wZW5pbmcgYSBob2xlLiBXZSAKYWxz
byBkb24ndCB3YW50IGFsbCB0aGUgZG9tYWluIHRvIGFjY2VzcyB0aGUgY29uc29sZS4KCkxvb2tp
bmcgYXQgdGhlIGltcGxlbWVudGF0aW9uLCBhbnkgZG9tYWluIHdpdGggaXNfcHJpdmlsZWdlZCB3
aWxsIGJlIAphYmxlIHRvIGFjY2VzcyB0aGUgY29uc29sZS4gSUhNTywgSSBkb24ndCB0aGluayB3
ZSBzaG91bGQgc2V0IHRoYXQgZm9yIApEb21VIGNyZWF0ZWQgYnkgWGVuLgoKU28gSSB3b3VsZCBz
dWdnZXN0IHRvIGludHJvZHVjZSBhIG5ldyB2YXJpYWJsZSBpc19jb25zb2xlIGFuZCB0byB0ZWxs
IAp3aGV0aGVyIGEgZG9tYWluIGNhbiBhY2Nlc3MgdGhlIGNvbnNvbGUuIHhzbV9jb25zb2xlX2lv
KC4uLikgd291bGQgdGhlbiAKbmVlZCB0byBiZSB1cGRhdGVkIGFjY29yZGluZ2x5LgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
