From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: assert MBI is large enough in
 pvh-boot.c
Date: Wed, 26 Sep 2018 06:07:30 -0600
Message-ID: <5BAB768202000078001EC2A8@prv1-mh.provo.novell.com>
References: <20180926110000.9764-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=an3h=mi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g58bN-0007n9-Bi
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 12:07:33 +0000
In-Reply-To: <20180926110000.9764-1-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA5LjE4IGF0IDEzOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1ib290LmMKPiArKysgYi94ZW4vYXJjaC94ODYv
Z3Vlc3QvcHZoLWJvb3QuYwo+IEBAIC00NCw2ICs0NCwxMyBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
Y29udmVydF9wdmhfaW5mbyh2b2lkKQo+ICAKPiAgICAgIEFTU0VSVChwdmhfaW5mby0+bWFnaWMg
PT0gWEVOX0hWTV9TVEFSVF9NQUdJQ19WQUxVRSk7Cj4gIAo+ICsgICAgLyoKPiArICAgICAqIFRl
bXBvcmFyeSBNQkkgYXJyYXkgbmVlZHMgdG8gYmUgYXQgbGVhc3Qgb25lIGVsZW1lbnQgYmlnZ2Vy
IHRoYW4KPiArICAgICAqIHJlcXVpcmVkLiBUaGUgZXh0cmEgZWxlbWVudCBpcyB1c2VkIHRvIGFp
ZCByZWxvY2F0aW9uLiBTZWUKPiArICAgICAqIGFyY2gveDg2L3NldHVwLmM6X19zdGFydF94ZW4o
KS4KPiArICAgICAqLwo+ICsgICAgQVNTRVJUKEFSUkFZX1NJWkUocHZoX21iaV9tb2RzKSA+IHB2
aF9pbmZvLT5ucl9tb2R1bGVzKTsKCkFyZSBBU1NFUlQoKXMgKGFsc28gdGhlIG90aGVyIG9uZSBp
biBjb250ZXh0KSBhY3R1YWxseSB0aGUgcmlnaHQgdGhpbmcKaGVyZT8gSSB0aGluayB3ZSdkIGJl
dHRlciBwYW5pYygpOiBUaGF0J2xsIGFsc28gY292ZXIgcmVsZWFzZSBidWlsZHMgYW5kCmlzIGlt
byBtb3JlIGFwcHJvcHJpYXRlIGZvciBkYXRhIGNvbWluZyBmcm9tIHRoZSBvdXRzaWRlLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
