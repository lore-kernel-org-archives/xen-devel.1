From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v14 4/9] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Fri, 05 Oct 2018 01:33:07 -0600
Message-ID: <5BB713B302000078001EEA3E@prv1-mh.provo.novell.com>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-5-paul.durrant@citrix.com>
 <37e5e689-110e-6bc4-1a54-8401d58dc282@citrix.com>
 <456a887cbf714c2f84c2548168df1b97@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8Kbn-0002Rk-GW
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 07:33:11 +0000
In-Reply-To: <456a887cbf714c2f84c2548168df1b97@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEwLjE4IGF0IDE4OjM2LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEkgc3RpbGwgdGhpbmsgYW4gaW1wbGljaXQgZG9tYWluX2NyYXNoKCkgZG9lc24ndCByZWFs
bHkgYmVsb25nIGluIHNvbWV0aGluZyAKPiB0aGF0IGxvb2tzIGxpa2UgYSBzdHJhaWdodGZvcndh
cmQgd3JhcHBlciBhcm91bmQgYSBwZXItaW1wbGVtZW50YXRpb24ganVtcCAKPiB0YWJsZS4gSG93
IGFib3V0IGlvbW11X21hcC91bm1hcF9tYXlfY3Jhc2goKSBpbnN0ZWFkIHRvIGhpZ2hsaWdodCB0
aGUgCj4gc2VtYW50aWM/CgpJZiBhbnl0aGluZyB0aGVuIHRoZSBvdGhlciB3YXkgYXJvdW5kLCBp
LmUuIGlvbW11X3VubWFwX25vX2NyYXNoKCksCnN1Y2ggdGhhdCBvbmx5IGNhbGxlcnMgd2hvIGV4
cGxpY2l0bHkgbWVhbiB0byBkZWFsIHdpdGggdGhlIGNyYXNoaW5nCnRoZW1zZWx2ZXMgd291bGQg
dXNlIHRoZSBvdGhlcndpc2UgaW5zZWN1cmUgdmFyaWFudC4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
