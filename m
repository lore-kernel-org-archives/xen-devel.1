From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 5/5] RFC: test/depriv: Add a tool to check
 process-level depriv
Date: Mon, 8 Oct 2018 17:28:24 +0100
Message-ID: <20181008162824.GD1331@perard.uk.xensource.com>
References: <20181005165701.28030-1-george.dunlap@citrix.com>
 <20181005165701.28030-5-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mg0y=mu=citrix.com=prvs=8126e591f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1g9YOT-00041I-8E
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 16:28:29 +0000
Content-Disposition: inline
In-Reply-To: <20181005165701.28030-5-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMDUsIDIwMTggYXQgMDU6NTc6MDFQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiArIyBURVNUOiBQcm9jZXNzIC8gZ3JvdXAgaWQKPiArIwo+ICsjIFJlYWQgL3Byb2Mv
PHFwaWQ+L3N0YXR1cywgY2hlY2tpbmcgVWlkIGFuZCBHaWQgbGluZXMKPiArIwo+ICsjIFVpZCBz
aG91bGQgYmUgeGVuLXFlbXV1c2VyLXJhbmdlLWJhc2UrJGRvbWlkCj4gKyMgR2lkIHNob3VsZCBi
ZSA2NTUzNCAoIm5vYm9keSIpCgpUaGF0IGlzIHdyb25nLiBHaWQgZG9lc24ndCBoYXZlIHRvIGJl
IG5vYm9keS4gZ2lkIGNhbiBiZSBjaG9zZW4gd2hlbgpjcmVhdGluZyB0aGUgYmFzZSB1c2VyIGlk
LiAoQW5kIEknbSBwcmV0dHkgc3VyZSAibm9ib2R5IiBzaG91bGQgYmUKYXZvaWRlZC4pCgo+ICsj
IEZJWE1FOiBkZWFsIHdpdGggb3RoZXIgVUlEIGNvbmZpZ3VyYXRpb25zPwo+ICtlY2hvIC1uICJQ
cm9jZXNzIFVJRDogIgo+ICt0Z3RfdWlkPSQoaWQgLXUgeGVuLXFlbXV1c2VyLXJhbmdlLWJhc2Up
Cj4gK3RndF91aWQ9JCgoICR0Z3RfdWlkICsgJGRvbWlkICkpCj4gKwo+ICsjIEV4YW1wbGUgaW5w
dXQ6Cj4gKyMgVWlkOgkxMTkzCTExOTMJMTE5MwkxMTkzCj4gK2lucHV0PSQoZ3JlcCBeVWlkOiAv
cHJvYy8kZG1waWQvc3RhdHVzKQo+ICtpZiBbWyAiJGlucHV0IiA9fiBeVWlkOltbOnNwYWNlOl1d
KyhbMC05XSspW1s6c3BhY2U6XV0rKFswLTldKylbWzpzcGFjZTpdXSsoWzAtOV0rKVtbOnNwYWNl
Ol1dKyhbMC05XSspJCBdXSA7IHRoZW4KPiArICAgIHJlc3VsdD0iUEFTU0VEIgo+ICsgICAgZm9y
IGkgaW4gezEuLjR9OyBkbwo+ICsJaWYgW1sgIiR7QkFTSF9SRU1BVENIWyRpXX0iICE9ICIkdGd0
X3VpZCIgXV0gOyB0aGVuCj4gKwkgICAgcmVzdWx0PSJGQUlMRUQiCj4gKwkgICAgZmFpbGVkPSJ0
cnVlIgo+ICsJICAgIGJyZWFrCj4gKwlmaQo+ICsgICAgZG9uZQo+ICtlbHNlCj4gKyAgICByZXN1
bHQ9IkZBSUxFRCIKPiArICAgIGZhaWxlZD0idHJ1ZSIKPiArZmkKPiArZWNobyAkcmVzdWx0Cj4g
Kwo+ICsjIEV4YW1wbGUgaW5wdXQ6Cj4gKyMgR2lkOgkxMDAyMAkxMDAyMAkxMDAyMAkxMDAyMAo+
ICtlY2hvIC1uICJQcm9jZXNzIEdJRDogIgo+ICt0Z3RfZ2lkPSQoaWQgLWcgbm9ib2R5KQoKVGhp
cyBzaG91bGQgYmUgYGlkIC1nIHhlbi1xZW11dXNlci1yYW5nZS1iYXNlYC4KCi0tIApBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
