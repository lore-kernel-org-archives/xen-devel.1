From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH for-4.11 v2 2/2] Add new add_maintainers.pl
 script to optimise the workflow when using git format-patch with
 get_maintainer.pl
Date: Tue, 1 May 2018 16:16:52 +0100
Message-ID: <23272.34020.765335.855905@mariner.uk.xensource.com>
References: <cover.1525005313.git.lars.kurth@citrix.com>
 <1935c3cc282228c806081ab47653215ca0080a3c.1525005313.git.lars.kurth@citrix.com>
 <23271.10702.618476.183954@mariner.uk.xensource.com>
 <96ED0EFF-C77D-4946-97FE-31731D9DE2AB@citrix.com>
 <23271.17046.529514.36171@mariner.uk.xensource.com>
 <2C272866-A075-4B32-9471-9B709BF90F89@citrix.com>
 <23272.25339.521207.449205@mariner.uk.xensource.com>
 <3B7630C6-E072-42CA-B67B-7E8EE2915C72@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t0l9=hu=citrix.com=prvs=652255aa1=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fDX1W-0001bd-1j
 for xen-devel@lists.xenproject.org; Tue, 01 May 2018 15:16:58 +0000
In-Reply-To: <3B7630C6-E072-42CA-B67B-7E8EE2915C72@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

TGFycyBLdXJ0aCB3cml0ZXMgKCJSZTogW1BBVENIIGZvci00LjExIHYyIDIvMl0gQWRkIG5ldyBh
ZGRfbWFpbnRhaW5lcnMucGwgc2NyaXB0IHRvIG9wdGltaXNlIHRoZSB3b3JrZmxvdyB3aGVuIHVz
aW5nIGdpdCBmb3JtYXQtcGF0Y2ggd2l0aCBnZXRfbWFpbnRhaW5lci5wbCIpOgo+IEluIHRoZSBj
b3ZlciBsZXR0ZXIsIHRoZSB0b29sIGFsd2F5cyBpbnNlcnQgYXQgdGhlIHRvcCBhcyBpdCBpcyBh
IHRyYW5zaWVudAo+IHRoaW5nIHRoYXQgZG9lcyBub3QgZW5kIHVwIGluIGdpdC4KPiAKPiDvu79P
biAwMS8wNS8yMDE4LCAxMzo1MiwgIklhbiBKYWNrc29uIiA8aWFuLmphY2tzb25AY2l0cml4LmNv
bT4gd3JvdGU6Cj4KPiAgICAgQXMgYW4gYXNpZGUsIEkgZ3Vlc3Mgd2l0aCBgLWkgY2Nib2R5JyB5
b3VyIHRvb2wgc3RpbGwgcHV0cyB0aGUgQ0NzIGluCj4gICAgIHRoZSBtYWlsIGhlYWRlcnMgb2Yg
dGhlIGNvdmVyIGxldHRlciA/ICBPciB3aWxsIGdpdC1zZW5kLWVtYWlsIGRvIHRoYXQgPwo+IAo+
IGdpdC1zZW5kLWVtYWlsIGRvZXMgdGhhdC4KClRoZXNlIHJlcGxpZXMgc2VlbSB0byBiZSBjb250
cmFkaWN0b3J5LgoKQWxzbywgSUlSQyBzb21lb25lIHdyb3RlIGVhcmxpZXIgaW4gdGhlIHRocmVh
ZCB0aGF0IHRoZXkgcHJlZmVyIHRoZQpwcmFjdGljZSBvZiBpbmNsdWRpbmcgQ0NzIGluIHRoZSBi
b2R5IG9mIHRoZSBjb3ZlciBsZXR0ZXIgdG9vLiAgU28KYXNzdW1pbmcgdGhhdCB0aGUgZmlyc3Qg
cmVwbHkgaXMgYWNjdXJhdGUsIGl0IG1heSBub3QgYmUgZGVzaXJhYmxlLgoKSWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
