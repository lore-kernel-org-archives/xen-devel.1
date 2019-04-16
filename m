From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/4] xen/console: Simplify domU console
 handling in guest_console_write
Date: Tue, 16 Apr 2019 13:48:31 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904161348230.1370@sstabellini-ThinkPad-X260>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-5-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGV0M-0001FY-9l
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 20:48:34 +0000
In-Reply-To: <20190402164238.1815-5-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyIEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gMiBwYXRocyBpbiB0aGUg
ZG9tVSBjb25zb2xlIGhhbmRsaW5nIGFyZSBub3cgdGhlIHNhbWUuIFNvIHRoZXkgY2FuIGJlCj4g
bWVyZ2VkIHRvIG1ha2UgdGhlIGNvZGUgc2ltcGxlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+ICB4ZW4vZHJpdmVycy9j
aGFyL2NvbnNvbGUuYyB8IDkgKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIv
Y29uc29sZS5jIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPiBpbmRleCBiMTE5YmY5ODBi
Li41NDgzZDY2NTEyIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4g
KysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPiBAQCAtNTg0LDEzICs1ODQsOCBAQCBz
dGF0aWMgbG9uZyBndWVzdF9jb25zb2xlX3dyaXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY2hh
cikgYnVmZmVyLCBpbnQgY291bnQpCj4gICAgICAgICAgICAgICprb3V0ID0gJ1wwJzsKPiAgICAg
ICAgICAgICAgc3Bpbl9sb2NrKCZjZC0+cGJ1Zl9sb2NrKTsKPiAgICAgICAgICAgICAga2NvdW50
ID0ga2luIC0ga2J1ZjsKPiAtICAgICAgICAgICAgaWYgKCBjID09ICdcbicgKQo+IC0gICAgICAg
ICAgICB7Cj4gLSAgICAgICAgICAgICAgICBjZC0+cGJ1ZltjZC0+cGJ1Zl9pZHhdID0gJ1wwJzsK
PiAtICAgICAgICAgICAgICAgIGd1ZXN0X3ByaW50ayhjZCwgWEVOTE9HX0dfREVCVUcgIiVzJXNc
biIsIGNkLT5wYnVmLCBrYnVmKTsKPiAtICAgICAgICAgICAgICAgIGNkLT5wYnVmX2lkeCA9IDA7
Cj4gLSAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgZWxzZSBpZiAoIGNkLT5wYnVmX2lkeCAr
IChrb3V0IC0ga2J1ZikgPCAoRE9NQUlOX1BCVUZfU0laRSAtIDEpICkKPiArICAgICAgICAgICAg
aWYgKCBjICE9ICdcbicgJiYKPiArICAgICAgICAgICAgICAgIChjZC0+cGJ1Zl9pZHggKyAoa291
dCAtIGtidWYpIDwgKERPTUFJTl9QQlVGX1NJWkUgLSAxKSkgKQo+ICAgICAgICAgICAgICB7Cj4g
ICAgICAgICAgICAgICAgICAvKiBidWZmZXIgdGhlIG91dHB1dCB1bnRpbCBhIG5ld2xpbmUgKi8K
PiAgICAgICAgICAgICAgICAgIG1lbWNweShjZC0+cGJ1ZiArIGNkLT5wYnVmX2lkeCwga2J1Ziwg
a291dCAtIGtidWYpOwo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
