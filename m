From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 10/16] xen/mm: Switch map_pages_to_xen to
 use MFN typesafe
Date: Fri, 02 Mar 2018 08:08:50 -0700
Message-ID: <5A99771202000078001ADE10@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-11-julien.grall@arm.com>
 <5A99768F02000078001ADDEA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A99768F02000078001ADDEA@prv-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Shane Wang <shane.wang@intel.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAzLjE4IGF0IDE2OjA2LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDIxLjAyLjE4IGF0IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiAt
LS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82
NC9tbS5jCj4+IEBAIC00MCw2ICs0MCwxMCBAQCBhc20oIi5maWxlIFwiIiBfX0ZJTEVfXyAiXCIi
KTsKPj4gICNpbmNsdWRlIDxhc20vbWVtX3NoYXJpbmcuaD4KPj4gICNpbmNsdWRlIDxwdWJsaWMv
bWVtb3J5Lmg+Cj4+ICAKPj4gKy8qIE92ZXJyaWRlIG1hY3JvcyBmcm9tIGFzbS9wYWdlLmggdG8g
bWFrZSB0aGVtIHdvcmsgd2l0aCBtZm5fdCAqLwo+PiArI3VuZGVmIHBhZ2VfdG9fbWZuCj4+ICsj
ZGVmaW5lIHBhZ2VfdG9fbWZuKHBnKSBfbWZuKF9fcGFnZV90b19tZm4ocGcpKQo+IAo+IEkgY2Fu
J3Qgc3BvdCB3aGVyZSB0aGlzIGlzIG5lZWRlZCBpbiB0aGlzIGZpbGUuCgpPaCwgSSdtIHNvcnJ5
LCBJIHNob3VsZCBoYXZlIGxvb2tlZCBhdCB0aGUgZmlsZSBhcyB3ZWxsLCBub3QganVzdAphdCB0
aGUgaHVua3MgaW4gdGhlIHBhdGNoLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
