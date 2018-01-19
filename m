From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [OSSTEST PATCH v2 07/19] ts-host-install: don't use
 the new nic naming scheme
Date: Fri, 19 Jan 2018 17:56:15 +0000
Message-ID: <23138.12607.373097.73856@mariner.uk.xensource.com>
References: <20171031135203.11537-1-wei.liu2@citrix.com>
 <20171031135203.11537-8-wei.liu2@citrix.com>
 <bca1c4ed-c061-3510-e80d-69802a8ac806@linaro.org>
 <3c780892-4aac-1532-d09a-f5e2ce803fdf@linaro.org>
 <20180119142124.h2ldgdssch7duy4s@citrix.com>
 <23138.9721.667173.922904@mariner.uk.xensource.com>
 <20180119171208.m3nlhqb2xartlwbw@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qk1k=eo=citrix.com=prvs=550ee7a3f=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ecauq-0008QD-TO
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 17:57:24 +0000
In-Reply-To: <20180119171208.m3nlhqb2xartlwbw@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW09TU1RFU1QgUEFUQ0ggdjIgMDcvMTld
IHRzLWhvc3QtaW5zdGFsbDogZG9uJ3QgdXNlIHRoZSBuZXcgbmljIG5hbWluZyBzY2hlbWUiKToK
PiBPbiBGcmksIEphbiAxOSwgMjAxOCBhdCAwNTowODowOVBNICswMDAwLCBJYW4gSmFja3NvbiB3
cm90ZToKPiA+IDEuIHBlcnNpc3RlbnQtbmV0LnJ1bGVzIGNvbnRhaW5zIGluZm9ybWF0aW9uIHNh
eWluZyAiaWYgbmljIHdpdGgKPiA+IGFkZHJlc3MgYWE6YmI6Y2M6ZGQ6ZWU6ZmYgc2hvd3MgdXAs
IGNhbGwgaXQgZXRoMjsgYWxzbywgZG8gbm90IGNhbGwKPiA+IGFueXRoaW5nIGVsc2UgZXRoMiIu
ICBTbyBpdCBoYXMgbm90aGluZyB0byBkbyB3aXRoIGlwIGFkZHJlc3Nlcy4KPiAKPiBUaGUgcnVs
ZSBpcyBnZW5lcmF0ZWQgYnkgb3NzdGVzdCwgd2hpY2ggc2F5cyAicGxlYXNlIG1ha2UgdGhpcyBu
aWMgaGF2ZQo+IG1hYyBhZGRyZXNzIFhYWFgiLiBUaGF0IHdvdWxkIGNhdXNlIHRoZSBndWVzdCB0
byBoYXZlIHRoZSBzYW1lIG1hYwo+IGFkZHJlc3MgYXMgdGhlIGhvc3QuIFdoZW4gdGhlIGd1ZXN0
IGlzIHVwIGFuZCBhc2tzIERIQ1Agc2VydmVyIGZvciBhbgo+IElQLCBpdCBnZXRzIHRoZSBob3N0
J3MgSVAuCgpwZXJzaXN0ZW50LW5ldC5ydWxlcyAoYXQgbGVhc3QgdGhlIHBhcnRzIG9mIGl0IGdl
bmVyYXRlZCBieQpwZXJzaXN0ZW50LW5ldC1nZW5lcmF0b3IpIGRvZXMgbm90IGNoYW5nZSB0aGUg
bWFjIGFkZHJlc3NlcyBvZiBuaWNzLgpJdCBtYXRjaGVzIGFjY29yZGluZyB0byB0aGUgbWFjIGFk
ZHJlc3MgYW5kIGNoYW5nZXMgdGhlaXIgIm5hbWVzIi4KCkkgaG9wZSB0aGUgb3NzdGVzdC1nZW5l
cmF0ZWQgb25lIGlzIG5vIGRpZmZlcmVudC4gIEknbSBub3QgZXZlbiBzdXJlCml0J3MgcG9zc2li
bGUgdG8gY2hhbmdlIHRoZSBtYWMgYWRkcmVzcyBmcm9tIGEgdWRldiBydWxlIGFuZCBpZiBpdCBp
cwpjZXJ0YWlubHkgbm90aGluZyBuZWFyIHVzIHNob3VsZCBkbyBpdC4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
