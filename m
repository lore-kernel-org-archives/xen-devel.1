From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/1] tools/ocaml: Dup2 /dev/null to stdin in
 daemonize()
Date: Wed, 27 Feb 2019 10:46:21 +0000
Message-ID: <b057cd48-c6f1-2481-c427-3755d5de0cd1@citrix.com>
References: <20190227103342.26354-1-christian.lindig@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=udyn=RC=citrix.com=prvs=95452b8ef=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gywjL-0005x1-Fp
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 10:46:27 +0000
In-Reply-To: <20190227103342.26354-1-christian.lindig@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDIvMjAxOSAxMDozMywgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToKPiBEb24ndCBjbG9z
ZSBzdGRpbiBpbiBkYWVtb25pemUoKSBidXQgZHVwMiAvZGV2L251bGwgaW5zdGVhZC4gVGhpcyBh
dm9pZHMKPiBmZCAwIGJlaW5nIHJldXNlZCBhbmQgcG90ZW50aWFsbHkgd3JpdHRlbiB0by4KPgo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4
LmNvbT4KClBvc3NpYmx5IHdvcnRoIG5vdGluZyB0aGF0IHRoaXMgZml4ZXMgYSBidWcgd2hlcmVi
eSAvZGV2L3hlbi9ldnRjaG4KcmVsaWFibHkgZ2V0cyBvcGVuZWQgb24gZmQgMC4KCkkgY2FuIGZp
eCB0aGUgd29yZGluZyB1cCBvbiBjb21taXQgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGNvbmNlcm5z
LgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
LCBhbmQgQ0MnaW5nCkp1ZXJnZW4gZm9yIDQuMTIKCj4gLS0tCj4gIHRvb2xzL29jYW1sL3hlbnN0
b3JlZC9zdGRleHQubWwgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC94ZW5zdG9yZWQv
c3RkZXh0Lm1sIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0ZGV4dC5tbAo+IGluZGV4IDg3OTU2
NWM1MTUuLmZmYjUxNmEwZDQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0
ZGV4dC5tbAo+ICsrKyBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9zdGRleHQubWwKPiBAQCAtMTAw
LDkgKzEwMCw5IEBAIGxldCBkYWVtb25pemUgKCkgPQo+ICAKPiAgCQliZWdpbiBtYXRjaCBVbml4
LmZvcmsgKCkgd2l0aAo+ICAJCXwgMCAtPgo+IC0JCQlsZXQgbnVsbGZkID0gVW5peC5vcGVuZmls
ZSAiL2Rldi9udWxsIiBbIFVuaXguT19XUk9OTFkgXSAwIGluCj4gKwkJCWxldCBudWxsZmQgPSBV
bml4Lm9wZW5maWxlICIvZGV2L251bGwiIFsgVW5peC5PX1JEV1JdIDAgaW4KPiAgCQkJYmVnaW4g
dHJ5Cj4gLQkJCQlVbml4LmNsb3NlIFVuaXguc3RkaW47Cj4gKwkJCQlVbml4LmR1cDIgbnVsbGZk
IFVuaXguc3RkaW47Cj4gIAkJCQlVbml4LmR1cDIgbnVsbGZkIFVuaXguc3Rkb3V0Owo+ICAJCQkJ
VW5peC5kdXAyIG51bGxmZCBVbml4LnN0ZGVycjsKPiAgCQkJd2l0aCBleG4gLT4gVW5peC5jbG9z
ZSBudWxsZmQ7IHJhaXNlIGV4bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
