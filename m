From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/dom0: change align type to int
Date: Fri, 04 Jan 2019 08:35:38 -0700
Message-ID: <5C2F7D4A020000780020A470@prv1-mh.provo.novell.com>
References: <20190104151422.38797-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gfRVg-0001PI-NP
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 15:35:44 +0000
In-Reply-To: <20190104151422.38797-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE5IGF0IDE2OjE0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZXJlJ3Mgbm8gcmVhc29uIHRvIHVzZSBsb25nIHRvIHN0b3JlIHRoZSBhbGlnbm1lbnQsIHNp
bmNlIHRoZSBiaWdnZXIKCmJpZ2dlc3Q/Cgo+IHBhZ2Ugc2l6ZSBpcyAxR0IsIGFuZCB0aGUgYWxp
Z25tZW50IGlzIHN0b3JlZCBhcyBhIGZyYW1lIG51bWJlci4KPiAKPiBSZXBvcnRlZC1ieTogSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHhlbi9h
cmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aHZtL2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gaW5kZXgg
NWFlM2EzMjA2MC4uYjY5NjEwMDA0MyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2Rv
bTBfYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gQEAgLTky
LDggKzkyLDcgQEAgc3RhdGljIGludCBfX2luaXQgcHZoX3BvcHVsYXRlX21lbW9yeV9yYW5nZShz
dHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMpCj4gIHsKPiAgICAgIHN0cnVjdCB7Cj4gLSAg
ICAgICAgdW5zaWduZWQgbG9uZyBhbGlnbjsKPiAtICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXI7
Cj4gKyAgICAgICAgdW5zaWduZWQgaW50IGFsaWduLCBvcmRlcjsKPiAgICAgIH0gc3RhdGljIGNv
bnN0IF9faW5pdGNvbnN0IG9yZGVyc1tdID0gewo+ICAgICAgICAgIC8qIE5COiBtdXN0IGJlIHNv
cnRlZCBieSBkZWNyZWFzaW5nIHNpemUuICovCj4gICAgICAgICAgeyAuYWxpZ24gPSBQRk5fRE9X
TihHQigxKSksIC5vcmRlciA9IFBBR0VfT1JERVJfMUcgfSwKClRoYXQncyBub3QgZW5vdWdoIGFm
YWljdCwgeW91IGFsc28gbmVlZCB0byB1c2UgMVVMIGluCgogICAgICAgICAgICBlbmQgPSAoc3Rh
cnQgKyBucl9wYWdlcykgJiB+KG9yZGVyc1swXS5hbGlnbiAtIDEpOwoKSmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
