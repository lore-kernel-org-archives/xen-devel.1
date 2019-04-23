From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 1/1] xen/gnttab: print log at level
 XENLOG_ERR before panic
Date: Tue, 23 Apr 2019 12:47:57 +0100
Message-ID: <fd752460-921f-3e12-214c-029e595f81b3@citrix.com>
References: <1555936799-15675-1-git-send-email-dongli.zhang@oracle.com>
 <d34d784e-9db9-b646-4099-8b787308fef2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GOvG=SZ=citrix.com=prvs=0096ed56b=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hItub-0004AY-SW
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 11:48:33 +0000
In-Reply-To: <d34d784e-9db9-b646-4099-8b787308fef2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, tim@xen.org, ian.jackson@eu.citrix.com, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gNC8yMy8xOSAxMTozNyBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMi8wNC8yMDE5
IDEzOjM5LCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4+IFByaW50IGxvZyBhdCBsZXZlbCBYRU5MT0df
RVJSIChpbnN0ZWFkIFhFTkxPR19JTkZPKSBhcyBkb21haW5fY3Jhc2goKQo+PiBpbmRpY2F0ZXMg
dGhlcmUgaXMgZmF0YWwgZXJyb3IuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8
ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb20+Cj4+IC0tLQo+PiAgeGVuL2NvbW1vbi9ncmFudF90YWJs
ZS5jIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgYi94ZW4vY29t
bW9uL2dyYW50X3RhYmxlLmMKPj4gaW5kZXggODA3MjhlYS4uNzI1YzYxOCAxMDA2NDQKPj4gLS0t
IGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYwo+PiBAQCAtMTI4Miw3ICsxMjgyLDcgQEAgdW5tYXBfY29tbW9uKAo+PiAgICAgIGlmICgg
dW5saWtlbHkoKHJkID0gcmN1X2xvY2tfZG9tYWluX2J5X2lkKGRvbSkpID09IE5VTEwpICkKPj4g
ICAgICB7Cj4+ICAgICAgICAgIC8qIFRoaXMgY2FuIGhhcHBlbiB3aGVuIGEgZ3JhbnQgaXMgaW1w
bGljaXRseSB1bm1hcHBlZC4gKi8KPj4gLSAgICAgICAgZ2RwcmludGsoWEVOTE9HX0lORk8sICJD
b3VsZCBub3QgZmluZCBkb21haW4gJWRcbiIsIGRvbSk7Cj4+ICsgICAgICAgIGdkcHJpbnRrKFhF
TkxPR19FUlIsICJDb3VsZCBub3QgZmluZCBkb21haW4gJWRcbiIsIGRvbSk7Cj4gCj4gV2hpbGUg
SSBhZ3JlZSB3aXRoIHRoZSBjaGFuZ2UgaW4gcHJpbmNpcGxlLCB3aGF0IGRvZXMgdGhpcyBhY3R1
YWxseSBkbz/CoAo+IFRoZSBlbnRpcmUgcHJpbnRrKCkgaXMgY29tcGlsZWQgb3V0IGluIHJlbGVh
c2UgYnVpbGRzLCBhbmQgZGVidWcgYnVpbGRzCj4gbG9nIGFsbCBtZXNzYWdlcy4KCi4uLmJ5IGRl
ZmF1bHQ7IGJ1dCBwcmVzdW1hYmx5IHlvdSBjYW4gdHVybiB0aGF0IGRvd24sIHJpZ2h0PwoKVGhp
cyBhbHNvIGNoYW5nZXMgdGhlIHByZWZpeCBpbiB0aGUgbG9nIG91dHB1dCwgcmlnaHQ/ICBUaGF0
IHdvdWxkIG1ha2UKaXQgZWFzaWVyIHRvIGlkZW50aWZ5IHdoaWNoIG1lc3NhZ2UgaXMgaW1wb3J0
YW50IGZvciB1bmRlcnRhbmRpbmcgd2h5CnlvdXIgZG9tYWluIGp1c3QgY3Jhc2hlZC4KCkFja2Vk
LWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
