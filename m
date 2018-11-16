From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V6 4/4] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Fri, 16 Nov 2018 12:20:37 +0000
Message-ID: <222c4324-d98b-92e9-b023-19d39eff8b6c@citrix.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-5-git-send-email-rcojocaru@bitdefender.com>
 <AD4830D4-4C9B-49FF-A33B-51BE88A5B6B7@citrix.com>
 <18432a31-4ba0-4913-2ccc-88c66037bc62@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sqSd=N3=citrix.com=prvs=851e78e2c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gNd75-0002oY-3q
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 12:20:43 +0000
In-Reply-To: <18432a31-4ba0-4913-2ccc-88c66037bc62@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTUvMTggODo1MSBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDExLzE1LzE4
IDEwOjI2IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pgo+Pgo+Pj4gT24gTm92IDE0LCAyMDE4
LCBhdCA4OjQwIFBNLCBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+
IHdyb3RlOgo+Pj4KPj4+IFdoZW4gYW4gbmV3IGFsdHAybSB2aWV3IGlzIGNyZWF0ZWQgdmVyeSBl
YXJseSBvbiBndWVzdCBib290LCB0aGUKPj4+IGRpc3BsYXkgd2lsbCBmcmVlemUgKGFsdGhvdWdo
IHRoZSBndWVzdCB3aWxsIHJ1biBub3JtYWxseSkuIFRoaXMKPj4+IG1heSBhbHNvIGhhcHBlbiBv
biByZXNpemluZyB0aGUgZGlzcGxheS4gVGhlIHJlYXNvbiBpcyB0aGUgd2F5Cj4+PiBYZW4gY3Vy
cmVudGx5IChtaXMpaGFuZGxlcyBsb2dkaXJ0eSBWR0E6IGl0IGludGVudGlvbmFsbHkKPj4+IG1p
c2NvbmZpZ3VyZXMgVkdBIHBhZ2VzIHNvIHRoYXQgdGhleSB3aWxsIGZhdWx0Lgo+Pj4KPj4+IFRo
ZSBwcm9ibGVtIGlzIHRoYXQgaXQgb25seSBkb2VzIHRoaXMgaW4gdGhlIGhvc3QgcDJtLiBPbmNl
IHdlCj4+PiBzd2l0Y2ggdG8gYSBuZXcgYWx0cDJtLCB0aGUgbWlzY29uZmlndXJlZCBlbnRyaWVz
IHdpbGwgbm8gbG9uZ2VyCj4+PiBmYXVsdCwgc28gdGhlIGRpc3BsYXkgd2lsbCBub3QgYmUgdXBk
YXRlZC4KPj4+Cj4+PiBUaGlzIHBhdGNoOgo+Pj4gKiB1cGRhdGVzIGVwdF9oYW5kbGVfbWlzY29u
ZmlnKCkgdG8gdXNlIHRoZSBhY3RpdmUgYWx0cDJtIGluc3RlYWQKPj4+ICBvZiB0aGUgaG9zdHAy
bTsKPj4+ICogbW9kaWZpZXMgcDJtX2NoYW5nZV9lbnRyeV90eXBlX2dsb2JhbCgpLCBwMm1fbWVt
b3J5X3R5cGVfY2hhbmdlZAo+Pj4gIGFuZCBwMm1fY2hhbmdlX3R5cGVfcmFuZ2UoKSB0byBwcm9w
YWdhdGUgdGhlaXIgY2hhbmdlcyB0byBhbGwKPj4+ICB2YWxpZCBhbHRwMm1zLgo+Pj4KPj4+IFdp
dGggdGhlIGludHJvZHVjdGlvbiBvZiBhbHRwMm0gZmllbGRzIGluIHAybV9tZW1vcnlfdHlwZV9j
aGFuZ2VkKCkKPj4+IHRoZSB3aG9sZSBmdW5jdGlvbiBoYXMgYmVlbiBwdXQgdW5kZXIgQ09ORklH
X0hWTS4KPj4KPj4gU29ycnkg4oCUIGFjdHVhbGx5LCBJIHRoaW5rIHRoZXJl4oCZcyB5ZXQgYW5v
dGhlciBpc3N1ZSBsdXJraW5nIGhlcmU6ICBwMm1fZmluaXNoX3R5cGVfY2hhbmdlKCkuIEnigJls
bCBwb2tlIGFyb3VuZCBhIGJpdCBtb3JlIHRvbW9ycm93Lgo+IAo+IE9LLCBJJ2xsIHdhaXQgZm9y
IHlvdXIgcmVjb21tZW5kYXRpb24gYmVmb3JlIHdvcmtpbmcgb24gdGhlIGxhc3QgcGF0Y2gKPiBv
ZiB0aGUgc2VyaWVzLgoKSXQgbG9va3MgbGlrZSB5b3UnbGwgd2FudCB0byBkbyB0aGUgc2FtZSB0
aGluZyB0bwpwMm1fZmluaXNoX3R5cGVfY2hhbmdlKCkgdGhhdCB5b3UgZGlkIGZvciBwMm1fY2hh
bmdlX3R5cGVfcmFuZ2UoKToKY3JlYXRlIGEgZmluaXNoX3R5cGVfY2hhbmdlKCkgZnVuY3Rpb24g
d2hpY2ggbG9vcHMgb3ZlciB0aGUgYXBwcm9wcmlhdGUKcmFuZ2UgY2FsbGluZyBwMm0tPnJlY2Fs
YygpLCBhbmQgdGhlbiBoYXZlIHAybV9maW5pc2hfdHlwZV9jaGFuZ2UoKQpmaXJzdCBjYWxsIHRo
aXMgb24gdGhlIGhvc3RwMm0sIHRoZW4gb25lLWJ5LW9uZSBvbiBhbGwgdmFsaWQgYWx0cDJtcy4K
CkluIGZpbmlzaF90eXBlX2NoYW5nZSgpIHlvdSdsbCB3YW50IHRvIGNsaXAgZmlyc3RfZ2ZuIGFu
ZCBtYXhfbnIgdG8gZml0CndpdGhpbiBwMm0tPm1pbl9yZW1hcHBlZF9nZm4gYW5kIHAybS0+bWF4
X3JlbWFwcGVkX2dmbiBmb3IgYWx0cDJtcy4KCkkgdGhpbmsgdGhhdCBzaG91bGQgZG8gdGhlIHRy
aWNrLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
