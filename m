From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen: report PV capability in sysctl and
 use it in toolstack
Date: Fri, 9 Nov 2018 11:25:54 +0000
Message-ID: <3b880d86-2671-3101-3b68-cd2569e30d04@citrix.com>
References: <20181109112346.6258-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wzzi=nu=citrix.com=prvs=84405b137=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gL4vR-0003D1-W1
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 11:26:10 +0000
In-Reply-To: <20181109112346.6258-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTEvMTggMTE6MjMsIFdlaSBMaXUgd3JvdGU6Cj4gMGUyYzg4NmVmICgieGVuOiBkZWNv
dXBsZSBIVk0gYW5kIElPTU1VIGNhcGFiaWxpdGllcyIpIHByb3ZpZGVkIGEKPiB0cnV0aCB0YWJs
ZSBmb3Igd2hhdCBgeGwgaW5mb2Agd291bGQgcmVwb3J0LiBJbiBvcmRlciB0byBtYWtlIHRoZQo+
IHRhYmxlIHdvcmsgeGVuIHdpbGwgbmVlZCB0byByZXBvcnQgaXRzIFBWIGNhcGFiaWxpdHkuCj4K
PiBSZXBsYWNlIGNhcF9kaXJlY3RpbyB3aXRoIGNhcF9wdiBpbiBsaWJ4bCBJREwuIEl0IGlzIHNh
ZmUgdG8gZG8gc28KPiBiZWNhdXNlIGNhcF9kaXJlY3RpbyBoYXMgbmV2ZXIgYmVlbiByZWxlYXNl
ZC4gUmV2ZXJ0IHRvIHVzZQo+IGNhcF9odm1fZGlyZWN0aW8gdG8gbWFyayB0aGUgYXZhaWxhYmls
aXR5IG9mIElPTU1VLCB0byBzYXZlIHVzIGZyb20KPiBwcm92aWRpbmcgYSBjb21wYXRpYmlsaXR5
IGxheWVyLgo+Cj4gRG9uJ3QgYnVtcCBzeXNjdGwgdmVyc2lvbiBudW1iZXIgYmVjYXVzZSB3ZSd2
ZSBhbHJlYWR5IGRvbmUgc28uCj4KPiBBbHNvIHByb3ZpZGUgYSBuZXcgdmlydF9jYXBzICJwdiIs
IGNoYW5nZSAiZGlyZWN0aW8iIHRvICJwdl9kaXJlY3RpbyIuCj4gVGhlIHRydXRoIHRhYmxlIGlz
IG5vdzoKPgo+ICAgICBwdiAgICAgIGh2bSAgICAgaW9tbXUgICAgICAgICAgIGZsYWdzIGluIHhs
IGluZm8KPiAgICAgMCAgICAgICAwICAgICAgIHggICAgICAgICAgICAgICBuL2EKPiAgICAgMCAg
ICAgICAxICAgICAgIDAgICAgICAgICAgICAgICBodm0KPiAgICAgMCAgICAgICAxICAgICAgIDEg
ICAgICAgICAgICAgICBodm0gaHZtX2RpcmVjdGlvCj4gICAgIDEgICAgICAgMCAgICAgICAwICAg
ICAgICAgICAgICAgcHYKPiAgICAgMSAgICAgICAwICAgICAgIDEgICAgICAgICAgICAgICBwdiBw
dl9kaXJlY3Rpbwo+ICAgICAxICAgICAgIDEgICAgICAgMCAgICAgICAgICAgICAgIHB2IGh2bQo+
ICAgICAxICAgICAgIDEgICAgICAgMSAgICAgICAgICAgICAgIHB2IGh2bSBodm1fZGlyZWN0aW8g
cHZfZGlyZWN0aW8KPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+CgpMR1RNLsKgIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
