From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 10/16] xen/mm: Switch map_pages_to_xen to
 use MFN typesafe
Date: Thu, 15 Mar 2018 11:08:43 +0000
Message-ID: <20180315110843.3zyimrdiplnewajm@citrix.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-11-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180314182009.14274-11-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMDY6MjA6MDNQTSArMDAwMCwganVsaWVuLmdyYWxsQGFy
bS5jb20gd3JvdGU6Cj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
PiAKPiBUaGUgY3VycmVudCBwcm90b3R5cGUgaXMgc2xpZ2h0bHkgY29uZnVzaW5nIGJlY2F1c2Ug
aXQgdGFrZXMgYSB2aXJ0dWFsCj4gYWRkcmVzcyBhbmQgYSBwaHlzaWNhbCBmcmFtZSAobm90IGFk
ZHJlc3MhKS4gU3dpdGNoaW5nIHRvIE1GTiB3aWxsIGltcHJvdmUKPiBzYWZldHkgYW5kIHJlZHVj
ZSB0aGUgY2hhbmNlIHRvIG1pc3Rha2VubHkgaW52ZXJ0IHRoZSAyIHBhcmFtZXRlcnMuCj4gCj4g
QWxzbywgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gc3dpdGNoIChhIC0gYikgPj4gUEFHRV9TSElG
VCB0bwo+IFBGTl9ET1dOKGEgLSBiKSBpbiB0aGUgY29kZSBtb2RpZmllZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
