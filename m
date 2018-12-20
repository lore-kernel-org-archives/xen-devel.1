From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V11 3/5] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Thu, 20 Dec 2018 15:31:20 +0000
Message-ID: <48448e59-c1fc-d1e0-af10-ad61013f3c2e@citrix.com>
References: <1544001488-23763-1-git-send-email-rcojocaru@bitdefender.com>
 <1544001488-23763-4-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z86S=O5=citrix.com=prvs=885450f5c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ga0NG-0001NU-K4
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:36:34 +0000
In-Reply-To: <1544001488-23763-4-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvNS8xOCA5OjE4IEFNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4gV2hlbiBhbiBuZXcg
YWx0cDJtIHZpZXcgaXMgY3JlYXRlZCB2ZXJ5IGVhcmx5IG9uIGd1ZXN0IGJvb3QsIHRoZQo+IGRp
c3BsYXkgd2lsbCBmcmVlemUgKGFsdGhvdWdoIHRoZSBndWVzdCB3aWxsIHJ1biBub3JtYWxseSku
IFRoaXMKPiBtYXkgYWxzbyBoYXBwZW4gb24gcmVzaXppbmcgdGhlIGRpc3BsYXkuIFRoZSByZWFz
b24gaXMgdGhlIHdheQo+IFhlbiBjdXJyZW50bHkgKG1pcyloYW5kbGVzIGxvZ2RpcnR5IFZHQTog
aXQgaW50ZW50aW9uYWxseQo+IG1pc2NvbmZpZ3VyZXMgVkdBIHBhZ2VzIHNvIHRoYXQgdGhleSB3
aWxsIGZhdWx0Lgo+IAo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgaXQgb25seSBkb2VzIHRoaXMgaW4g
dGhlIGhvc3QgcDJtLiBPbmNlIHdlCj4gc3dpdGNoIHRvIGEgbmV3IGFsdHAybSwgdGhlIG1pc2Nv
bmZpZ3VyZWQgZW50cmllcyB3aWxsIG5vIGxvbmdlcgo+IGZhdWx0LCBzbyB0aGUgZGlzcGxheSB3
aWxsIG5vdCBiZSB1cGRhdGVkLgo+IAo+IFRoaXMgcGF0Y2g6Cj4gKiB1cGRhdGVzIGVwdF9oYW5k
bGVfbWlzY29uZmlnKCkgdG8gdXNlIHRoZSBhY3RpdmUgYWx0cDJtIGluc3RlYWQKPiAgIG9mIHRo
ZSBob3N0cDJtOwo+ICogbW9kaWZpZXMgcDJtX2NoYW5nZV9lbnRyeV90eXBlX2dsb2JhbCgpLAo+
ICAgcDJtX21lbW9yeV90eXBlX2NoYW5nZWQoKSwgcDJtX2NoYW5nZV90eXBlX3JhbmdlKCkgYW5k
Cj4gICBwMm1fZmluaXNoX3R5cGVfY2hhbmdlKCkgdG8gcHJvcGFnYXRlIHRoZWlyIGNoYW5nZXMg
dG8gYWxsCj4gICB2YWxpZCBhbHRwMm1zLgo+IAo+IFdpdGggdGhlIGludHJvZHVjdGlvbiBvZiBh
bHRwMm0gZmllbGRzIGluIHAybV9tZW1vcnlfdHlwZV9jaGFuZ2VkKCkKPiB0aGUgd2hvbGUgZnVu
Y3Rpb24gaGFzIGJlZW4gcHV0IHVuZGVyIENPTkZJR19IVk0uCj4gCj4gU3VnZ2VzdGVkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
UmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+IFRlc3RlZC1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKQWNrZWQtYnk6IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
