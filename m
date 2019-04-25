From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Hypervisor build can't work without `python` (Was:
 Re: Xen commit 9b0bc91b3 possibly removed too much info from README)
Date: Thu, 25 Apr 2019 05:32:30 -0600
Message-ID: <5CC19ACE0200007800229027@prv1-mh.provo.novell.com>
References: <20190417105729.GS30543@zion.uk.xensource.com>
 <cda91b28-50c4-308a-30d8-6cecceb973c6@citrix.com>
 <20190417110356.GT30543@zion.uk.xensource.com>
 <a3576f49-eebc-6684-d043-b9511895cf1a@citrix.com>
 <20190417111635.GU30543@zion.uk.xensource.com>
 <7fe14ebe-987a-8b95-1d77-d6d40a473fa3@citrix.com>
 <20190417112645.GV30543@zion.uk.xensource.com>
 <1ff06c9a-8e81-7c00-9dab-26f3d4173714@suse.com>
 <3d698d86-c406-df10-ccb9-17d38988b0a8@citrix.com>
 <606a37f6-2158-14bf-8f49-79ea249b8f62@suse.com>
 <20190417145136.GZ30543@zion.uk.xensource.com>
 <584ACCED020000078E2C01CD@prv1-mh.provo.novell.com>
 <D1DA3F7202000045A293CED3@prv1-mh.provo.novell.com>
 <960CB533020000B48E2C01CD@prv1-mh.provo.novell.com>
 <D1E23F7802000079A293CED3@prv1-mh.provo.novell.com>
 <48D5F043020000E137554D14@prv1-mh.provo.novell.com>
 <14AB34BE020000728E2C01CD@prv1-mh.provo.novell.com>
 <9A8B94880200008537554D14@prv1-mh.provo.novell.com>
 <A9FA5B7C02000009A293CED3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJccK-00051a-Ng
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 11:32:40 +0000
In-Reply-To: <A9FA5B7C02000009A293CED3@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA0LjE5IGF0IDE2OjUxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMDI6NDQ6MjFQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPj4gTGV0IENvbmZpZy5tayBoYXZlOgo+PiAKPj4gLWluY2x1ZGUgY29uZmlnL2Jhc2lj
X3Rvb2xzLm1rCj4+IAo+PiBhdCB0aGUgdmVyeSBiZWdpbm5pbmcsIHdpdGggY29uZmlnL2Jhc2lj
X3Rvb2xzLm1rIGJlaW5nIGNyZWF0ZWQgdmlhCj4+IGNvbmZpZ3VyZSBhbmQgY29udGFpbmluZyB0
aGUgYmFzaWMgdG9vbCB2YXJpYWJsZXM6Cj4+IAo+PiBDQyA6PSBnY2MKPj4gQVdLIDo9IGF3awo+
PiBQWVRIT04gOj0gcHl0aG9uMwo+PiAuLi4KPj4gCj4+IEFzIENvbmZpZy5tayB3aWxsIHNldCB0
aG9zZSB2YXJpYWJsZXMgd2l0aCBkZWZ1YWx0IHZhbHVlcyBpbiBjYXNlIHRoZXkKPj4gYXJlIGVt
cHR5IGFsbCBpcyBmaW5lIHRoZW4uCj4gCj4gRnJhbmtseSBJJ20gbm90IGEgYmlnIGZhbiBvZiB0
aGlzIGFwcHJvYWNoIC0tIHlvdSBjYW4gcG90ZW50aWFsbHkgZ2V0Cj4gZGlmZmVyZW50IHRvb2xj
aGFpbiBkZXBlbmRpbmcgb24gaG93IHlvdSBidWlsZCBzdHVmZi4gSSB3b3VsZCByYXRoZXIKPiBq
dXN0IGRvY3VtZW50IHRoYXQgZm9yIGh5cGVydmlzb3IgYnVpbGQgZWl0aGVyIHB5dGhvbiBpcyBh
dmFpbGFibGUgb3IKPiB5b3Ugc2hvdWxkIHNwZWNpZnkgUFlUSE9OPSB3aGVuIGludm9raW5nIG1h
a2UuCgorMQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
