From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V9 5/7] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Mon, 26 Nov 2018 05:08:17 -0700
Message-ID: <5BFBE23102000078001FFF07@prv1-mh.provo.novell.com>
References: <1542886828-11241-1-git-send-email-rcojocaru@bitdefender.com>
 <1542886828-11241-6-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRFgq-0005mt-3D
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 12:08:36 +0000
In-Reply-To: <1542886828-11241-6-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjExLjE4IGF0IDEyOjQwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gQEAgLTk1NiwxOCArMTAwMywxNCBAQCBpbnQgcDJtX2NoYW5nZV90eXBlX29uZShzdHJ1
Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbl9sLAo+ICB9Cj4gIAo+ICAvKiBNb2RpZnkg
dGhlIHAybSB0eXBlIG9mIGEgcmFuZ2Ugb2YgZ2ZucyBmcm9tIG90IHRvIG50LiAqLwo+IC12b2lk
IHAybV9jaGFuZ2VfdHlwZV9yYW5nZShzdHJ1Y3QgZG9tYWluICpkLCAKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3Qgb3QsIHAybV90eXBlX3QgbnQp
Cj4gK3N0YXRpYyB2b2lkIGNoYW5nZV90eXBlX3JhbmdlKHN0cnVjdCBwMm1fZG9tYWluICpwMm0s
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVu
c2lnbmVkIGxvbmcgZW5kLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fdHlw
ZV90IG90LCBwMm1fdHlwZV90IG50KQo+ICB7Cj4gICAgICB1bnNpZ25lZCBsb25nIGdmbiA9IHN0
YXJ0Owo+IC0gICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IHAybV9nZXRfaG9zdHAybShkKTsK
PiArICAgIHN0cnVjdCBkb21haW4gKmQgPSBwMm0tPmRvbWFpbjsKPiAgICAgIGludCByYyA9IDA7
Cj4gIAo+IC0gICAgQVNTRVJUKG90ICE9IG50KTsKPiAtICAgIEFTU0VSVChwMm1faXNfY2hhbmdl
YWJsZShvdCkgJiYgcDJtX2lzX2NoYW5nZWFibGUobnQpKTsKPiAtCj4gLSAgICBwMm1fbG9jayhw
Mm0pOwo+ICAgICAgcDJtLT5kZWZlcl9uZXN0ZWRfZmx1c2ggPSAxOwoKV2hpbGUgcmV2aWV3aW5n
IHRoZSBmaXJzdCBvZiBHZW9yZ2UncyBwYXRjaGVzIEkgc3RhcnRlZCB3b25kZXJpbmcKd2h5IHlv
dSBrZWVwIHRoaXMgYW5kIC4uLgoKPiBAQCAtMTAxMSwyMyArMTA1NCw1NCBAQCB2b2lkIHAybV9j
aGFuZ2VfdHlwZV9yYW5nZShzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgcDJtLT5kZWZlcl9uZXN0
ZWRfZmx1c2ggPSAwOwo+ICAgICAgaWYgKCBuZXN0ZWRodm1fZW5hYmxlZChkKSApCj4gICAgICAg
ICAgcDJtX2ZsdXNoX25lc3RlZHAybShkKTsKCi4uLiB0aGlzIGhlcmUsIHN1Y2ggdGhhdCBpdCB3
b3VsZCBiZSBjYWxsZWQgbXVsdGlwbGUgdGltZXMsIGRlc3BpdGUKcDJtX2ZsdXNoX25lc3RlZHAy
bSgpIHRha2luZyBhIHN0cnVjdCBkb21haW4sIG5vdCBhIHN0cnVjdCBwMm0KYXMgaW5wdXQuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
