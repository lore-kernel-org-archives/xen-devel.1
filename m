From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3] mm/page_alloc: make bootscrub happen in
 idle-loop
Date: Wed, 7 Nov 2018 16:42:36 +0000
Message-ID: <20181107164236.v6cmkenup2hlp7r4@zion.uk.xensource.com>
References: <20181107111149.14842-1-sergey.dyasli@citrix.com>
 <20181107121714.q65fte6newwxcx2t@zion.uk.xensource.com>
 <ecab96b1-c620-fe41-6843-a9a6e0d9a6cc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <ecab96b1-c620-fe41-6843-a9a6e0d9a6cc@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMDcsIDIwMTggYXQgMDQ6MzY6MDhQTSArMDAwMCwgU2VyZ2V5IER5YXNsaSB3
cm90ZToKPiBPbiAwNy8xMS8yMDE4IDEyOjE3LCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gV2VkLCBO
b3YgMDcsIDIwMTggYXQgMTE6MTE6NDlBTSArMDAwMCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiA+
PiBTY3J1YmJpbmcgUkFNIGR1cmluZyBib290IG1heSB0YWtlIGEgbG9uZyB0aW1lIG9uIG1hY2hp
bmVzIHdpdGggbG90cwo+ID4+IG9mIFJBTS4gQWRkICdpZGxlJyBvcHRpb24gdG8gYm9vdHNjcnVi
IHdoaWNoIG1hcmtzIGFsbCBwYWdlcyBkaXJ0eQo+ID4+IGluaXRpYWxseSBzbyB0aGV5IHdpbGwg
ZXZlbnR1YWxseSBiZSBzY3J1YmJlZCBpbiBpZGxlLWxvb3Agb24gZXZlcnkKPiA+PiBvbmxpbmUg
Q1BVLgo+ID4+Cj4gPj4gSXQncyBndWFyYW50ZWVkIHRoYXQgdGhlIGFsbG9jYXRvciB3aWxsIHJl
dHVybiBzY3J1YmJlZCBwYWdlcyBieSBkb2luZwo+ID4+IGVhZ2VyIHNjcnViYmluZyBkdXJpbmcg
YWxsb2NhdGlvbiAodW5sZXNzIE1FTUZfbm9fc2NydWIgd2FzIHByb3ZpZGVkKS4KPiA+Pgo+ID4+
IFVzZSB0aGUgbmV3ICdpZGxlJyBvcHRpb24gYXMgdGhlIGRlZmF1bHQgb25lLgo+ID4+Cj4gPj4g
U2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+
ID4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4gLS0t
Cj4gPj4gdjIgLS0+IHYzOgo+ID4+IC0gUmVtb3ZlZCAiPSAwIiBmcm9tIGVudW0gYm9vdHNjcnVi
X21vZGUKPiA+PiAtIFJlbW92ZWQgbnVtX29ubGluZV9ub2RlcygpIGZyb20gcHJpbnRrKCkKPiA+
PiAtIEFkZGVkIFJldmlld2VkLWJ5Cj4gPiAKPiA+IEkgdGhpbmsgeW91ciBwYXRjaCAodjI/KSBp
cyBhbHJlYWR5IGNvbW1pdHRlZC4KPiAKPiBIbW0sIHlvdSBhcmUgcmlnaHQ6IENvbW1pdERhdGU6
IFdlZCBOb3YgNyAwOTozNDoxNyAyMDE4ICswMTAwCj4gU29ycnksIEkgd2Fzbid0IGV4cGVjdGlu
ZyB0aGF0Lgo+IAo+IFRob3VnaCBwcmludGsoKSBpbiB0aGUgY29tbWl0dGVkIHZlcnNpb24gaGFz
IGEgdHlwbzoKPiAKPiAgICAgcHJpbnRrKCJTY3J1YmJpbmcgZnJlZSBSQU0gb24gaW4gYmFja2dy
b3VuZFxuIik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eCgpGZWVsIGZyZWUg
dG8gc2VuZCBhIGZvbGxvd3VwIHBhdGNoIHRvIGZpeCB0aGF0LgoKV2VpLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
