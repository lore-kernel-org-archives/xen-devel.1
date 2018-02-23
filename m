From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 10/16] xen/mm: Switch map_pages_to_xen to
 use MFN typesafe
Date: Fri, 23 Feb 2018 17:21:03 +0000
Message-ID: <20180223172102.ysbtlzfs6bdmy3tn@citrix.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-11-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180221140259.29360-11-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjEsIDIwMTggYXQgMDI6MDI6NTNQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IFRoZSBjdXJyZW50IHByb3RvdHlwZSBpcyBzbGlnaHRseSBjb25mdXNpbmcgYmVjYXVz
ZSBpdCB0YWtlcyBhIHZpcnR1YWwKPiBhZGRyZXNzIGFuZCBhIHBoeXNpY2FsIGZyYW1lIChub3Qg
YWRkcmVzcyEpLiBTd2l0Y2hpbmcgdG8gTUZOIHdpbGwgaW1wcm92ZQo+IHNhZmV0eSBhbmQgcmVk
dWNlIHRoZSBjaGFuY2UgdG8gbWlzdGFrZW5seSBpbnZlcnQgdGhlIDIgcGFyYW1ldGVycy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2
aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
