From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 31/34] xen: refuse to create HVM guests when
 !CONFIG_HVM
Date: Tue, 21 Aug 2018 11:41:33 +0100
Message-ID: <20180821104133.vlg3ngqeqooi4reh@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <71cdcc5fbe6d8e6e1801270f6ef7fc1563957447.1534518694.git-series.wei.liu2@citrix.com>
 <3746e4b4-73ec-bb5e-7944-ec5c98fab9c4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7kme=le=citrix.com=prvs=7644f7420=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fs46c-0001kx-9j
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 10:41:46 +0000
Content-Disposition: inline
In-Reply-To: <3746e4b4-73ec-bb5e-7944-ec5c98fab9c4@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMDE6NTk6NTdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8wOC8yMDE4IDE2OjEyLCBXZWkgTGl1IHdyb3RlOgo+ID4gU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9jb21t
b24vZG9tYWluLmMgfCA4ICsrKysrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFp
bi5jIGIveGVuL2NvbW1vbi9kb21haW4uYwo+ID4gaW5kZXggMTcxZDI1ZS4uYTIyZGYxMiAxMDA2
NDQKPiA+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMKPiA+ICsrKyBiL3hlbi9jb21tb24vZG9t
YWluLmMKPiA+IEBAIC0zMTgsOCArMzE4LDE0IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVh
dGUoZG9taWRfdCBkb21pZCwKPiA+ICAgICAgaWYgKCAhaXNfaWRsZV9kb21haW4oZCkgKQo+ID4g
ICAgICB7Cj4gPiAgICAgICAgICBpZiAoIGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9o
dm1fZ3Vlc3QgKQo+IAo+IEFzIGRpc2NvdmVyZWQgZHVyaW5nIG15IGRvbWFpbiBjcmVhdGlvbiBy
ZXdyaXRlIHdvcmssIGxpYnhsIG9uIEFSTQo+IGRvZXNuJ3Qgc2V0IGh2bS9oYXAuCj4gCj4gSU1P
LCB0aGV5IHNob3VsZCwgYW5kIGxpYnhsIHNob3VsZCBiZSBmaXhlZC4KPiAKCklTVFIgdGhleSB3
YW50ZWQgZ3Vlc3QgdHlwZSB0byBiZSBQViBpbiBsaWJ4bC4KCldlaS4KCj4gfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
