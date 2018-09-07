From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] tools: specifically enable VirtFS in Linux
 QEMU builds
Date: Fri, 7 Sep 2018 16:20:09 +0000
Message-ID: <042555be37d34d4baf26401e8a163db6@AMSPEX02CL03.citrite.net>
References: <20180906120636.38754-1-paul.durrant@citrix.com>
 <alpine.DEB.2.10.1809061110360.14449@sstabellini-ThinkPad-X260>
 <e08f982ab0cc415c9a19d1cc40cd69ef@AMSPEX02CL03.citrite.net>
 <20180907145750.c7447dsjd7omk5ec@mac.bytemobile.com>
 <62c817eb-6ccd-1654-7c04-ff22cabcc5d8@citrix.com>
 <f8aee796e09b4dc3b3eb56acd67c300d@AMSPEX02CL03.citrite.net>
 <23442.42208.181389.592660@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bq+s=lv=citrix.com=prvs=781bf32a7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fyJUR-0003uy-OL
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 16:20:11 +0000
In-Reply-To: <23442.42208.181389.592660@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIFttYWlsdG86
aWFuLmphY2tzb25AY2l0cml4LmNvbV0KPiBTZW50OiAwNyBTZXB0ZW1iZXIgMjAxOCAxNzoxOQo+
IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUKPiA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+OyAnU3RlZmFubyBTdGFiZWxsaW5pJyA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47IFdlaQo+IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IEtvbnJhZCBSemVzenV0
ZWsgV2lsawo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgQW5kcmV3IENvb3Blcgo+IDxBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBKdWxp
ZW4gR3JhbGwKPiA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+OyB4ZW4tCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBTdWJqZWN0OiBS
RTogW1hlbi1kZXZlbF0gW1BBVENIXSB0b29sczogc3BlY2lmaWNhbGx5IGVuYWJsZSBWaXJ0RlMg
aW4gTGludXgKPiBRRU1VIGJ1aWxkcwo+IAo+IFBhdWwgRHVycmFudCB3cml0ZXMgKCJSRTogW1hl
bi1kZXZlbF0gW1BBVENIXSB0b29sczogc3BlY2lmaWNhbGx5IGVuYWJsZSBWaXJ0RlMKPiBpbiBM
aW51eCBRRU1VIGJ1aWxkcyIpOgo+ID4gR2VvcmdlIER1bmxhcCBbbWFpbHRvOmdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbV0KPiA+ID4gTm90IHRoZSBsZWFzdCBiZWNhdXNlIHRoZSBkZXBlbmRlbmNp
ZXMgbWF5IGNoYW5nZS4gIEkgdGhpbmsgYWRkaW5nIGFuCj4gPiA+ICItLWVuYWJsZS05cGZzIiBv
cHRpb24gd2hpY2ggd2lsbCBwYXNzIG9uIHRoZSByZXF1aXNpdGUgIi0tZW5hYmxlIiB0bwo+ID4g
PiBxZW11IChzdWNoIHRoYXQgcWVtdSBidWlsZCB3aWxsIGZhaWwgaWYgdGhlIHByZXJlcXMgYXJl
IG5vdCBwcmVzZW50KQo+ID4gPiBtYWtlcyB0aGUgbW9zdCBzZW5zZS4KPiA+Cj4gPiBJJ2QgYmUg
aGFwcHkgd2l0aCB0aGF0IGlmIG90aGVycyBhcmUuCj4gCj4gU0dUTS4gIEkgZ3Vlc3MgdGhlcmUg
d291bGQgYmUgb3NzdGVzdCBwYXRjaChlcykgdG8gYWRkIHRoZQo+IGRlcGVuZGVuY2llcyBhbmQg
cGFzcyB0aGUgbmV3IG9wdGlvbi4KClllcywgdGhleSB3b3VsZCBuZWVkIHRvIGZvbGxvdy4KCiAg
UGF1bAoKPiAKPiBJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
