From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 2/8] xen/arm: p2m: Provide an
 helper to generate the VTTBR
Date: Wed, 23 Jan 2019 15:27:37 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901231527030.17936@sstabellini-ThinkPad-X260>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3kqX=P7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gmRvp-0007VR-Oe
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 23:27:41 +0000
In-Reply-To: <20181128164939.8329-3-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyOCBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEEgZm9sbG93LXVwIHBh
dGNoIHdpbGwgbmVlZCB0byBnZW5lcmF0ZSB0aGUgVlRUQlIgaW4gYSBmZXcgcGxhY2VzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0t
Cj4gIHhlbi9hcmNoL2FybS9wMm0uYyB8IDcgKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+IGluZGV4IDZjNzYyOThlYmMuLjhlYmYxZThk
YmEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jCj4gKysrIGIveGVuL2FyY2gvYXJt
L3AybS5jCj4gQEAgLTQ3LDYgKzQ3LDExIEBAIHN0YXRpYyBjb25zdCBwYWRkcl90IGxldmVsX21h
c2tzW10gPQo+ICBzdGF0aWMgY29uc3QgdWludDhfdCBsZXZlbF9vcmRlcnNbXSA9Cj4gICAgICB7
IFpFUk9FVEhfT1JERVIsIEZJUlNUX09SREVSLCBTRUNPTkRfT1JERVIsIFRISVJEX09SREVSIH07
Cj4gIAo+ICtzdGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfdnR0YnIodWludDE2X3Qgdm1pZCwgbWZu
X3Qgcm9vdF9tZm4pCj4gK3sKPiArICAgIHJldHVybiAobWZuX3RvX21hZGRyKHJvb3RfbWZuKSB8
ICgodWludDY0X3Qpdm1pZCA8PCA0OCkpOwoKT3V0ZXIgYnJhY2tldHMgYXJlIG5vdCBuZWNlc3Nh
cnkuIFJlZ2FyZGxlc3M6CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgoKCj4gK30KPiArCj4gIC8qIFVubG9jayB0aGUgZmx1c2ggYW5kIGRv
IGEgUDJNIFRMQiBmbHVzaCBpZiBuZWNlc3NhcnkgKi8KPiAgdm9pZCBwMm1fd3JpdGVfdW5sb2Nr
KHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCj4gIHsKPiBAQCAtMTE0Nyw3ICsxMTUyLDcgQEAgc3Rh
dGljIGludCBwMm1fYWxsb2NfdGFibGUoc3RydWN0IGRvbWFpbiAqZCkKPiAgCj4gICAgICBwMm0t
PnJvb3QgPSBwYWdlOwo+ICAKPiAtICAgIHAybS0+dnR0YnIgPSBwYWdlX3RvX21hZGRyKHAybS0+
cm9vdCkgfCAoKHVpbnQ2NF90KXAybS0+dm1pZCA8PCA0OCk7Cj4gKyAgICBwMm0tPnZ0dGJyID0g
Z2VuZXJhdGVfdnR0YnIocDJtLT52bWlkLCBwYWdlX3RvX21mbihwMm0tPnJvb3QpKTsKPiAgCj4g
ICAgICAvKgo+ICAgICAgICogTWFrZSBzdXJlIHRoYXQgYWxsIFRMQnMgY29ycmVzcG9uZGluZyB0
byB0aGUgbmV3IFZNSUQgYXJlIGZsdXNoZWQKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
