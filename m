From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 14/16] xen/grant: Switch
 common/grant_table.c to use typesafe MFN
Date: Thu, 15 Mar 2018 02:14:08 -0600
Message-ID: <5AAA396002000078001B1EE4@prv-mh.provo.novell.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-15-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-15-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDE5OjIwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gQXQgdGhlIHNh
bWUgdGltZSByZXBsYWNlIF9tZm4oMCkgYnkgSU5WQUxJRF9NRk4gb3IgZHJvcCB0aGUgaW5pdGlh
bGl6ZXIKPiB3aGVuIGl0IGlzIG5vdCBuZWNlc3NhcnkuIFRoaXMgd2lsbCBtYWtlIGNsZWFyZXIg
dGhhdCB0aGUgTUZOCj4gaW5pdGlhbGl6ZWQgaXMgbm90IHZhbGlkLgo+IAo+IE90aGVyIHRoYW4g
X21mbigwKSAtPiBJTlZBTElEX01GTiwgbm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCgpU
aGVyZSdzIG5vIHN1Y2ggdHJhbnNmb3JtYXRpb24gaW4gdGhlIHBhdGNoLCBzbyBJIHRoaW5rIGl0
IHdvdWxkCmJlIGJldHRlciBpZiB5b3Ugc2FpZCAiMCIgb3IgIk1GTiAwIiBpbnN0ZWFkIG9mICJf
bWZuKDApIiBpbiBib3RoCmluc3RhbmNlcyBhYm92ZS4KCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
