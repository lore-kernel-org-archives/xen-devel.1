From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH v2] docs/xl: Clarify documentation for
 mem-max and mem-set
Date: Mon, 13 May 2019 16:24:28 +0000
Message-ID: <B645202A-6968-46D8-A689-52518EBB912A@citrix.com>
References: <20190408110943.8987-1-george.dunlap@citrix.com>
 <ee29edd9-a23d-eb00-d403-1e8040bf3174@citrix.com>
 <20190513135930.GJ2798@zion.uk.xensource.com>
 <20190513142822.GO2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oEJ8=TN=citrix.com=prvs=029f63c82=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hQDl4-0006ZC-4O
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 16:24:58 +0000
In-Reply-To: <20190513142822.GO2798@zion.uk.xensource.com>
Content-Language: en-US
Content-ID: <0374123ED56DD941AF2E4D52A2B7F6D7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDEzLzA1LzIwMTksIDA4OjI4LCAiV2VpIExpdSIgPHdlaS5saXUyQGNpdHJpeC5j
b20+IHdyb3RlOg0KDQogICAgT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDI6NTk6MzBQTSArMDEw
MCwgV2VpIExpdSB3cm90ZToNCiAgICA+IE9uIFdlZCwgTWF5IDAxLCAyMDE5IGF0IDAzOjU5OjQx
UE0gKzAxMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQogICAgPiA+IE9uIDQvOC8xOSAxMjowOSBQ
TSwgR2VvcmdlIER1bmxhcCB3cm90ZToNCiAgICA+ID4gPiBtZW0tc2V0IGlzIHRoZSBwcmltYXJ5
IGNvbW1hbmQgdGhhdCB1c2VycyB3aWxsIG5lZWQgdG8gdXNlIGFuZA0KICAgID4gPiA+IHVuZGVy
c3RhbmQuICBNb3ZlIGl0IGZpcnN0LCBhbmQgY2xhcmlmeSB0aGUgd29yZGluZzsgYWxzbyBzcGVj
aWZ5IHRoYXQNCiAgICA+ID4gPiB5b3UgY2FuJ3Qgc2V0IHRoZSB0YXJnZXQgaGlnaGVyIHRoYW4g
bWF4bWVtIGZyb20gdGhlIGRvbWFpbiBjb25maWcuDQogICAgPiA+ID4gDQogICAgPiA+ID4gbWVt
LW1heCBpcyBhY3R1YWxseSBhIHByZXR0eSB1c2VsZXNzIGNvbW1hbmQgYXQgdGhlIG1vbWVudC4g
IENsYXJpZnkNCiAgICA+ID4gPiB0aGF0IHVzZXJzIGFyZSBub3QgZXhwZWN0ZWQgdG8gdXNlIGl0
OyBhbmQgZG9jdW1lbnQgYWxsIG9mIGl0cyBxdWlya3kNCiAgICA+ID4gPiBiZWhhdmlvci4NCiAg
ICA+ID4gPiANCiAgICA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+DQogICAgPiA+IA0KICAgID4gPiBXZWkgLyBJYW46IFBpbmc/DQog
ICAgPiA+IA0KICAgID4gPiBKdWVyZ2VuIHJlcGxpZWQgdG8gbXkgInJldmlldyBub3RlIiBjb21t
ZW50LCBub3QgdG8gYW55dGhpbmcgYWN0aW9uYWJsZQ0KICAgID4gPiBpbiB0aGUgcGF0Y2ggKG9y
IGNvbW1pdCBtZXNzYWdlKSBpdHNlbGYuDQogICAgPiANCiAgICA+IEFja2VkLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPg0KICAgID4gDQogICAgPiAoSSBhbHJlYWR5IHNhaWQgdGhp
cyBsb29rZWQgb2theSB0byBtZSBpbiB2MSkNCiAgICANCiAgICBJIGJlbGlldmUgTGFycycgUmIg
ZnJvbSB2MSBzdGlsbCBzdGFuZHMuDQoNClllcw0KTGFycw0KICAgIA0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
