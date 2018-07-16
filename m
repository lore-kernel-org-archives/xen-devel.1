From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 06/13] public / x86: introduce
 __HYPERCALL_iommu_op
Date: Mon, 16 Jul 2018 15:14:23 +0100
Message-ID: <20180716141423.xvxglw6y54binzeh@citrix.com>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x/ry=ka=citrix.com=prvs=7282924f4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ff4Gi-0004Dk-Ir
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 14:14:28 +0000
Content-Disposition: inline
In-Reply-To: <20180707110526.35822-7-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKdWwgMDcsIDIwMTggYXQgMTI6MDU6MTlQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyB0aGUgYm9pbGVycGxhdGUgZm9yIGEgbmV3IGh5
cGVyY2FsbCB0byBhbGxvdyBhCj4gZG9tYWluIHRvIGNvbnRyb2wgSU9NTVUgbWFwcGluZ3MgZm9y
IGl0cyBvd24gcGFnZXMuCj4gV2hpbHN0IHRoZXJlIGlzIGR1cGxpY2F0aW9uIG9mIGNvZGUgYmV0
d2VlbiB0aGUgbmF0aXZlIGFuZCBjb21wYXQgZW50cnkKPiBwb2ludHMgd2hpY2ggYXBwZWFycyBy
aXBlIGZvciBzb21lIGZvcm0gb2YgY29tYmluYXRpb24sIEkgdGhpbmsgaXQgaXMKPiBiZXR0ZXIg
dG8gbWFpbnRhaW4gdGhlIHNlcGFyYXRpb24gYXMtaXMgYmVjYXVzZSB0aGUgY29tcGF0IGVudHJ5
IHBvaW50Cj4gd2lsbCBuZWNlc3NhcmlseSBnYWluIGNvbXBsZXhpdHkgaW4gc3Vic2VxdWVudCBw
YXRjaGVzLgo+IAoKU2luY2UgdGhpcyBpcyBhIG5ldyBvcCwgd2h5IGlzIHRoZXJlIGNvbXBhdGli
aWxpdHkgaXNzdWU/IENhbiB3ZSBkbyBhd2F5CndpdGggdGhlIGNvbXBhdCBlbnRyeSBwb2ludCBh
bGwgdG9nZXRoZXI/CgpJIGhhdmVuJ3QgcmVhZCB0aGUgcmVzdCBvZiB0aGlzIHNlcmllcywgbWF5
YmUgaXQgd2lsbCBiZWNvbWUgY2xlYXJlcgpsYXRlci4KCldlaS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
