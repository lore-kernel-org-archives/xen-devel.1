From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/pvshim: use 2M alignment
Date: Tue, 19 Mar 2019 07:42:56 -0600
Message-ID: <5C90F1E00200007800220499@prv1-mh.provo.novell.com>
References: <20190319130550.32570-1-wei.liu2@citrix.com>
 <20190319130550.32570-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h6F1B-0002vh-MZ
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:43:01 +0000
In-Reply-To: <20190319130550.32570-3-wei.liu2@citrix.com>
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

Pj4+IE9uIDE5LjAzLjE5IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZwo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9jb25maWdzL3B2c2hpbV9kZWZjb25maWcKPiBAQCAtNSw2ICs1LDcgQEAgQ09ORklH
X1BWSF9HVUVTVD15Cj4gIENPTkZJR19QVl9TSElNPXkKPiAgQ09ORklHX1BWX1NISU1fRVhDTFVT
SVZFPXkKPiAgQ09ORklHX05SX0NQVVM9MzIKPiArQ09ORklHX1hFTl9BTElHTl8yTT15Cj4gICMg
RGlzYWJsZSBmZWF0dXJlcyBub3QgdXNlZCBieSB0aGUgUFYgc2hpbQo+ICAjIENPTkZJR19TSEFE
T1dfUEFHSU5HIGlzIG5vdCBzZXQKPiAgIyBDT05GSUdfQklHTUVNIGlzIG5vdCBzZXQKCkluc3Rl
YWQgb2YgdGhpcywgd2h5IG5vdCBhZGQKCiAgICBkZWZhdWx0IFhFTl9BTElHTl8yTSBpZiBQVl9T
SElNX0VYQ0xVU0lWRQoKdG8gdGhlIGNvbmZpZyBvcHRpb24gaXRzZWxmLCBhaGVhZCBvZiB0aGUg
ZGVmYXVsdCBwYXRjaCAxIGVzdGFibGlzaGVzPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
