From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Fri, 03 May 2019 02:12:46 -0600
Message-ID: <5CCBF7FE020000780022B859@prv1-mh.provo.novell.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMTJM-000563-Mr
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 08:12:52 +0000
In-Reply-To: <20190502221345.18459-1-tamas@tklengyel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA1LjE5IGF0IDAwOjEzLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
QEAgLTEwMDIsNyArOTg5LDEwIEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFnZXMoc3RydWN0IGRvbWFp
biAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKPiAgICAgIC8qIEZyZWUgdGhlIGNs
aWVudCBwYWdlICovCj4gICAgICBpZih0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQs
ICZjcGFnZS0+Y291bnRfaW5mbykpCj4gICAgICAgICAgcHV0X3BhZ2UoY3BhZ2UpOwo+IC0gICAg
cHV0X3BhZ2UoY3BhZ2UpOwo+ICsKPiArICAgIEJVR19PTighcHV0X2NvdW50KTsKPiArICAgIHdo
aWxlICggcHV0X2NvdW50LS0gKQo+ICsgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKGNwYWdlKTsK
ClN0cmljdGx5IHNwZWFraW5nIEkgdGhpbmsgdGhlIEJVR19PTigpIHNob3VsZCBiZSBtb3ZlZCBh
aGVhZCBvZiB0aGUKaWYoKSBpbiBjb250ZXh0LCBzbyB0aGF0IGEgcHJvYmxlbWF0aWMgcHV0X3Bh
Z2UoKSB3b3VsZCBub3QgZ2V0CmV4ZWN1dGVkIGluIHRoZSBmaXJzdCBwbGFjZSAoZXZlbiBpZiB0
aGUgc3lzdGVtIGlzIHRvIGRpZSBzb29uIGFmdGVyKS4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
