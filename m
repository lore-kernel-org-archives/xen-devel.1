From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 03:10:29 -0600
Message-ID: <5B97868502000078001E712B@prv1-mh.provo.novell.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzegt-0003iZ-MJ
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 09:10:35 +0000
In-Reply-To: <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "andrii_anisov@epam.com" <andrii_anisov@epam.com>, andrii.anisov@gmail.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA5LjE4IGF0IDEwOjUwLCA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4gd3JvdGU6
Cj4gT24gMTEuMDkuMTggMTE6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBOQUssIGZvciB0d28g
cmVhc29uczogSSdtIG5vdCBvZiB0aGUgb3BpbmlvbiB0aGF0IHJlYWRpbmcgYSAxNSBvciBtb3Jl
Cj4+IGRpZ2l0IGRlY2ltYWwgbnVtYmVyIHdpdGhvdXQgYW55IHNlcGFyYXRvcnMgaXMgYW55IGVh
c2llciB0aGFuIHRoZQo+PiBjdXJyZW50IGZvcm1hdC4KPiBJdCdzIHF1aXRlIHN1YmplY3RpdmUu
IElNSE8gdGltZXN0YW1wcyBtZWFzdXJlZCBpbiBucyBlYXNpZXIgdG8gCj4gdW5kZXJzdGFuZCBp
biBkZWNpbWFscyByYXRoZXIgdGhhbiBpbiBzZXBhcmF0ZWQgMzItYml0IGhleC1lcy4gTm8gbWF0
dGVyIAo+IGhvdyBtYW55IGRpZ2l0YWwgbnVtYmVyIHRoZXkgaGF2ZS4KCkl0IGlzIHN1YmplY3Rp
dmUsIHllcywgYnV0IGluIHN1Y2ggYSBjYXNlIHlvdSBldmVuIG1vcmUgc28gbmVlZCB0bwpkZW1v
bnN0cmF0ZSBhIGNoYW5nZSBpcyBhbiBvdmVyYWxsIGltcHJvdmVtZW50LgoKPiBFdmVuIHBvc3Qg
cHJvY2Vzc2luZyBvZiBwZXJmYyBvdXRwdXQgaXMgZWFzaWVyIGluIGNhc2Ugb2YgZGVjaW1hbCAK
PiB0aW1lc3RhbXBzLiBZb3Ugc2hvdWxkIG5vdCBwYXJzZSBoZXhlcyBhbmQgb2RkIHNlcGFyYXRv
cnMgdG8gY2FsY3VsYXRlIAo+IHRoZSB0aW1lIGVsYXBzZWQgYmV0d2VlbiB0d28gc2FtcGxlcy4K
ClBvc3QgcHJvY2Vzc2luZyB1c3VhbGx5IHVzZXMgc2NyaXBzIGZvciBwYXJzaW5nIC0gSSBkb24n
dCB0aGluayBpdCdzCm92ZXJseSBjb21wbGljYXRlZCB0byBoYXZlIGEgc2NyaXB0IGNvbnZlcnQg
dGhlIG51bWJlciBpbnRvCmJhc2ljYWxseSBhbnkgZm9ybWF0IHlvdSB3YW50LgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
