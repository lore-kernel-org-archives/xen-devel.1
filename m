From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 19/23] x86: PIT emulation is common to
 both PV and HVM
Date: Tue, 28 Aug 2018 05:44:51 -0600
Message-ID: <5B8535B302000078001E28EB@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <3c651e5f60a496e3e5661f60bd7e913dab2b05a0.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k/hy=ll=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fucQc-0007Ci-QF
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 11:44:58 +0000
In-Reply-To: <3c651e5f60a496e3e5661f60bd7e913dab2b05a0.1535285866.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
TW92ZSB0aGUgZmlsZSB0byB4ODYgY29tbW9uIGNvZGUgYW5kIGNoYW5nZSBpdHMgbmFtZSB0byBl
bXVsLWk4MjU0LmMuCj4gCj4gUHV0IEhWTSBvbmx5IGNvZGUgdW5kZXIgQ09ORklHX0hWTSBvciBp
c19odm1fZG9tYWluLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Cj4gLS0tCj4gdjI6IG1vdmUgdGhlIHdob2xlIGZpbGUuCj4gLS0tCj4gIHhlbi9hcmNo
L3g4Ni9NYWtlZmlsZSAgICAgfCAgIDEgKy0KPiAgeGVuL2FyY2gveDg2L2VtdWwtaTgyNTQuYyB8
IDYwOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIHhlbi9hcmNo
L3g4Ni9odm0vTWFrZWZpbGUgfCAgIDEgKy0KPiAgeGVuL2FyY2gveDg2L2h2bS9pODI1NC5jICB8
IDU5NyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgNCBmaWxlcyBj
aGFuZ2VkLCA2MTAgaW5zZXJ0aW9ucygrKSwgNTk4IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgeGVuL2FyY2gveDg2L2VtdWwtaTgyNTQuYwo+ICBkZWxldGUgbW9kZSAxMDA2NDQg
eGVuL2FyY2gveDg2L2h2bS9pODI1NC5jCgpPbiB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBjaGFu
Z2VzIHRvIHRoZSBmaWxlIGFyZSBvbmx5IENPTkZJR19IVk0KYWRkaXRpb25zCkFja2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkdlbmVyYXRpbmcgdGhlIGRpZmYgd2l0aCBy
ZW5hbWUgZGV0ZWN0aW9uIHdvdWxkIGhhdmUgZWFzZWQgcmV2aWV3CnRob3VnaC4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
