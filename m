From: Julien Grall <julien.grall@arm.com>
Subject: Re: [OSSTEST PATCH 14/15] cross builds: Build armhf
 kernels on amd64 hosts
Date: Fri, 26 Apr 2019 22:24:17 +0100
Message-ID: <fb17e257-83b0-ae65-4a47-d3c10d47b1d1@arm.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
 <20190426164002.22381-15-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK8KT-0006Mp-Et
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 21:24:21 +0000
In-Reply-To: <20190426164002.22381-15-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSWFuLAoKT24gNC8yNi8xOSA1OjQwIFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiBPdXIgYXJt
aGYgaG9zdHMgYXJlIGRldmJvYXJkcyBhbmQgdmVyeSBzbG93LCBhcyB3ZWxsIGFzIHNjYXJjZS4g
IEl0Cj4gNXRha2VzIDE3a3Mgb3Igc28gZm9yIGEga2VybmVsIGJ1aWxkLiAgVGhpcyB3aWxsIGdv
ICptdWNoKiBmYXN0ZXIgb24KCk5JVDogcy81dGFrZXMvdGFrZXMvCgo+IGFuIGFtZDY0IGJveCBh
bmQgd2UgaGF2ZSBsb3RzIG9mIHRob3NlIHRvby4KPiAKPiBzdGFuZGFsb25lLWdlbmVyYXRlLWR1
bXAtZmxpZ2h0LXJ1bnZhcnMgc2hvd3MgdGhhdCB0aGUgb25seSBjaGFuZ2UgaXMKPiB0byBjaGFu
Z2UgaG9zdF9hcmNoIGZyb20gYXJtaGYgdG8gYW1kNjQgaW4gYnVpbGQtYXJtaGYtcHZvcHMgam9i
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDQzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKRldJVzoKCkFja2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKPiAtLS0KPiAgIG1maS1jb21t
b24gfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvbWZpLWNvbW1vbiBiL21maS1jb21tb24KPiBpbmRleCA3YjVj
ODk0Zi4uMzBmMjY5MmQgMTAwNjQ0Cj4gLS0tIGEvbWZpLWNvbW1vbgo+ICsrKyBiL21maS1jb21t
b24KPiBAQCAtNDI0LDcgKzQyNCw3IEBAIGNyZWF0ZV9idWlsZF9qb2JzICgpIHsKPiAgICAgICBm
aQo+ICAgCj4gICAgICAgam9iX2NyZWF0ZV9idWlsZF9jcm9zc2FibGUgYnVpbGQtJGFyY2gtcHZv
cHMgYnVpbGQta2VybiAkYXJjaCAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAgIC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gKyAgICAgICAgICAgICAgICBhcm1oZiBhbWQ2NCAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICAgIGtjb25maWdob3c9
eGVuLWVuYWJsZS14ZW4tY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAg
ICAgICAgICAgICAgICAgJFJVTlZBUlMgJEJVSUxEX1JVTlZBUlMgJEJVSUxEX0xJTlVYX1JVTlZB
UlMgJGFyY2hfcnVudmFycyAgIFwKPiAgICAgICAgICAgICAgICAgICAkaG9zdG9zX3J1bnZhcnMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IAoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
