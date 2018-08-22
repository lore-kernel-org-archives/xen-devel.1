From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] VMX: make vmx_read_guest_msr() cope with
 callers not checking its return value
Date: Wed, 22 Aug 2018 01:44:52 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912D35FD@SHSMSX101.ccr.corp.intel.com>
References: <5B740FAC02000078001DE559@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5ybv=lf=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fsICk-0001V0-4J
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 01:45:02 +0000
In-Reply-To: <5B740FAC02000078001DE559@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFdl
ZG5lc2RheSwgQXVndXN0IDE1LCAyMDE4IDc6MzQgUE0KPiAKPiBJdCB0b29rIHRpbGwgdGhlIDQu
NSBiYWNrcG9ydHMgb2YgdGhlIEwxVEYgcHJlcmVxcyB0aGF0IGdjYyA4LjIgZmluYWxseQo+IG5v
dGljZWQgdGhhdCB0aGUgdlBNVSBjYWxsZXJzLCBub3QgY2hlY2tpbmcgdGhlIGZ1bmN0aW9uJ3Mg
cmV0dXJuIHZhbHVlLAo+IG1heSBjb25zdW1lIHVuaW5pdGlhbGl6ZWQgZGF0YS4gR3VhcmQgYWdh
aW5zdCB0aGlzIGJ5IHN0b3JpbmcgemVybyBvbgo+IHRoZSBlcnJvciBwYXRoLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKCkFja2VkLWJ5OiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
