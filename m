From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [Qemu-devel] [PATCH v3] xen/pt: allow passthrough
 of devices with bogus interrupt pin
Date: Tue, 4 Dec 2018 10:30:18 +0100
Message-ID: <20181204093018.d6vhfdwg276pf7ja@mac>
References: <20181204075049.10285-1-yan.y.zhao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HNzE=ON=citrix.com=prvs=869b7dada=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gU72Y-0001wW-T2
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 09:30:50 +0000
Content-Disposition: inline
In-Reply-To: <20181204075049.10285-1-yan.y.zhao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhao Yan <yan.y.zhao@intel.com>
Cc: anthony.perard@citrix.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org, qemu-devel@nongnu.org, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMDQsIDIwMTggYXQgMDI6NTA6NDlBTSAtMDUwMCwgWmhhbyBZYW4gd3JvdGU6
Cj4gRm9yIHNvbWUgcGNpIGRldmljZSwgZXZlbiBpdHMgUENJX0lOVEVSUlVQVF9QSU4gaXMgbm90
IDAsIGl0IGFjdHVhbGx5Cj4gZG9lc24ndCBzdXBwb3J0IElOVHggbW9kZSwgc28gaXRzIG1hY2hp
bmUgaXJxIHJlYWQgZnJvbSBob3N0IHN5c2ZzIGlzIDAuCj4gSW4gdGhhdCBjYXNlLCByZXBvcnQg
UENJX0lOVEVSUlVQVF9QSU4gYXMgMCB0byBndWVzdCBhbmQgbGV0IHBhc3N0aHJvdWdoCj4gY29u
dGludWUuCj4gCj4gQ2M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
IENjOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWmhh
byBZYW4gPHlhbi55LnpoYW9AaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKT25lIG5pdCBiZWxvdy4KCj4gCj4gLS0tCj4gdjI6
IGZpeCBzb21lIGNvZGluZyBzdHlsZSBpc3N1ZQo+IHYzOgo+ICAgIDEuIGxldCBzdWJqZWN0IGJl
IG1vcmUgZGVzY3JpcHRpdmUgKHJvZ2VyKQo+ICAgIDIuIGRpc2FibGUgSU5UeCBhc3NlcnRpb24g
aWYgbWFjaGluZSBpcnEgaXMgMC4ocm9nZXIpCj4gICAgMy4gaW4geGVuX3B0X2lycXBpbl9yZWdf
aW5pdCgpLCBkcm9wIHRoZSBlbHNlIGJyYW5jaCBhcyB0aGUgZGVmYXVsdAo+IHZhbHVlIGZvciAq
ZGF0YSBpcyAwLiAocm9nZXIpCj4gLS0tCj4gIGh3L3hlbi94ZW5fcHQuYyAgICAgICAgICAgICB8
IDcgKysrKysrKwo+ICBody94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMgfCA0ICsrKy0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2h3L3hlbi94ZW5fcHQuYyBiL2h3L3hlbi94ZW5fcHQuYwo+IGluZGV4IGU1YTZlZmYu
LmI1NjM4MzcgMTAwNjQ0Cj4gLS0tIGEvaHcveGVuL3hlbl9wdC5jCj4gKysrIGIvaHcveGVuL3hl
bl9wdC5jCj4gQEAgLTg0Nyw2ICs4NDcsMTMgQEAgc3RhdGljIHZvaWQgeGVuX3B0X3JlYWxpemUo
UENJRGV2aWNlICpkLCBFcnJvciAqKmVycnApCj4gICAgICB9Cj4gIAo+ICAgICAgbWFjaGluZV9p
cnEgPSBzLT5yZWFsX2RldmljZS5pcnE7Cj4gKyAgICBpZiAobWFjaGluZV9pcnEgPT0gMCkgewo+
ICsgICAgICAgIFhFTl9QVF9MT0coZCwgIm1hY2hpbmUgaXJxIGlzIDBcbiIpOwo+ICsgICAgICAg
IGNtZCB8PSBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEU7Cj4gKyAgICAgICAgcy0+bWFjaGluZV9p
cnEgPSAwOwoKQUZBSUNUIHRoaXMgaXMgYWxyZWFkeSBpbml0aWFsaXplZCB0byAwLCBzbyB5b3Ug
Y2FuIGRyb3Agc2V0dGluZwptYWNoaW5lX2lycS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
