From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] libxc/arm: initialise p2m_size to make gcc
 happy
Date: Thu, 22 Mar 2018 09:09:17 +0000
Message-ID: <b83f77fc-ce48-ce95-7b1e-1d29388cb468@arm.com>
References: <20180314123203.30646-1-wei.liu2@citrix.com>
 <37798a67-72b4-901c-ba17-e76fc1d2da65@arm.com>
 <20180321164342.x2zqe3bgbrlvntzt@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlws=gm=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eywDu-0006b9-2a
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 09:09:26 +0000
In-Reply-To: <20180321164342.x2zqe3bgbrlvntzt@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMy8yMS8yMDE4IDA0OjQzIFBNLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFdlZCwgTWFy
IDE0LCAyMDE4IGF0IDAxOjI3OjM3UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGks
Cj4+Cj4+IE9uIDAzLzE0LzIwMTggMTI6MzIgUE0sIFdlaSBMaXUgd3JvdGU6Cj4+PiBHY2Mgd2l0
aCAtTzMgZmFpbGVkIHRvIHNwb3QgdGhlIGxvb3AgdG8gaW5pdGlhbGlzZSBwMm1fc2l6ZSBydW5z
IGF0Cj4+PiBsZWFzdCBvbmNlLgo+Pgo+PiBBc2lkZSwgQW5kcmV3J3MgY29tbWVudCB0aGUgcGF0
Y2ggbG9va3Mgb2theS4gQnV0IEkgYW0gd29uZGVyaW5nIHdoeSB3ZSBuZWVkCj4+IHRvIGFsbG9j
YXRlIHAybV9ob3N0IGZvciBBcm0/Cj4+Cj4gCj4gTm90IHN1cmUsIHJlYWxseS4gOi0pCj4gCj4+
ICBGcm9tIGEgcXVpY2sgbG9vayBJIGhhdmUgc2VlbiBubyByZWFsIHVzZXIgZXhjZXB0IHhjX2Rv
bV91cGRhdGVfZ3Vlc3RfcDJtCj4+IHRoYXQgY2FuIGNvcGUgd2l0aCBwMm1faG9zdCA9IE5VTEwu
Cj4+Cj4gCj4gTWF5YmUgaXQgaXMgdG8gd29yayBhcm91bmQgdGhpcyBsaW1pdGF0aW9uIGluIGNv
ZGUuCgpJIHdpbGwgaGF2ZSBhIGxvb2sgYXQgaXQuIE1lYW53aGlsZSwgSSBndWVzcyBpdCBpcyBi
ZXR0ZXIgdG8gbWFrZSBHQ0MgCmhhcHB5IHdpdGggdGhhdCBwYXRjaC4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
