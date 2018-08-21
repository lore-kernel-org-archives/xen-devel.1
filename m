From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 34/34] RFC x86: introduce directio virt cap
Date: Tue, 21 Aug 2018 12:40:22 +0200
Message-ID: <20180821104022.rirzq57tscc7wpo3@mac>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <84f9dde9a5f6253653fc267fd8f874d21e4f4a58.1534518694.git-series.wei.liu2@citrix.com>
 <20180821083218.ibkdoyouclvfthh3@mac>
 <20180821102558.htkmokaqznjni6xv@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=js+4=le=citrix.com=prvs=7646db883=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fs45b-0001au-S3
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 10:40:43 +0000
Content-Disposition: inline
In-Reply-To: <20180821102558.htkmokaqznjni6xv@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMTE6MjU6NThBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEF1ZyAyMSwgMjAxOCBhdCAxMDozMjoxOEFNICswMjAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDQ6MTI6NTJQTSArMDEwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gaHZtX2RpcmVjdGlvIGlzIHNldCB3aGVuIGlvbW11IGlzIGVu
YWJsZWQsIGJ1dCBpbiBmYWN0IGlvbW11IGlzIG5vdAo+ID4gPiB0aWVkIHRvIEhWTS4gSW4gb3Jk
ZXIgdG8gbm90IGJyZWFrIGV4aXN0aW5nIHRvb2xzLCBleHBvc2UgYSBuZXcgZmxhZwo+ID4gPiBk
aXJlY3RpbyBmb3IgKGlvbW11X2VuYWJsZWQgJiYgIWh2bV9lbmFibGVkKS4KPiA+ID4gCj4gPiA+
IFJGQyBUaGlzIGRvZXNuJ3QgYnVpbGQgYXQgdGhlIG1vbWVudC4gRG8gd2UgY2FyZSBhYm91dCB0
aGF0IGZsYWcgYmVpbmcKPiA+ID4gaW5hY2N1cmF0ZT8KPiA+IAo+ID4gSSB0aGluayB0aGVyZSBp
cyBubyBoYXJkd2FyZSBvdXQgdGhlcmUgd2l0aCBhbiBJT01NVSB0aGF0IGRvbid0IGhhdmUKPiA+
IHZpcnR1YWxpemF0aW9uIGV4dGVuc2lvbnMgKGllOiBoYXZpbmcgVlRkIGJ1dCBub3QgVlR4IGZv
ciBleGFtcGxlKSwKPiA+IGJ1dCBtYXliZSBJJ20gd3JvbmcuCj4gCj4gVGhlIHF1ZXN0aW9uIGlz
IHdoZXRoZXIgaXQgbWFrZXMgc2Vuc2UgdG8gZXhwb3NlIHRoZSBuYW1lICJodm1fZGlyZWN0aW8i
Cj4gYXQgYWxsIHdoZW4geW91IGNhbid0IHJ1biBhbiBIVk0gZ3Vlc3QgaW4gdGhlIGZpcnN0IHBs
YWNlLgo+IAo+IEFsc28gaW9tbXUgaXNuJ3QgYW4gSFZNIG9ubHkgZmVhdHVyZSwgUFYgZ3Vlc3Rz
IGNhbiBhbHNvIG1ha2UgdXNlIG9mIGl0Cj4gaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgaGVu
Y2UgdGhlIHN1Z2dlc3Rpb24gb2YgImRpcmVjdGlvIi4KClJpZ2h0LCBJIHNlZSB5b3VyIHBvaW50
LgoKQ291bGQgd2UgcmVtb3ZlIHRoaXMgaHZtX2RpcmVjdGlvIGFydGlmYWN0IGFuZCBqdXN0IGV4
cG9zZSBhbiBpb21tdQpjYXBhYmlsaXR5PwoKU2luY2UgdGhpcyBpcyBhIHN5c2N0bCBJIHRoaW5r
IHdlIGNhbiBjaGFuZ2UgdGhlIGludGVyZmFjZSB3aXRob3V0Cmlzc3Vlcywgc28gSSB3b3VsZCBq
dXN0CnMvWEVOX1NZU0NUTF9QSFlTQ0FQX2h2bV9kaXJlY3Rpby9YRU5fU1lTQ1RMX1BIWVNDQVBf
aW9tbXUvLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
