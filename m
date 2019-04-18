From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 01/15] x86/cpu: Create Hygon Dhyana
 architecture support file
Date: Thu, 18 Apr 2019 10:14:44 +0100
Message-ID: <20190418091444.GB30543@zion.uk.xensource.com>
References: <cover.1554382869.git.puwen@hygon.cn>
 <0d6839a65753c60f4fd1738560a551ca7df7b1e8.1554382869.git.puwen@hygon.cn>
 <614b4eab-065a-c911-7759-2663ab6a9657@citrix.com>
 <8f23051d-a8b5-a25b-af4a-acf045c31cd2@hygon.cn>
 <5CA708840200007800224C6E@prv1-mh.provo.novell.com>
 <a14a1f04-eab0-dac6-7a7b-6125578cd3e5@hygon.cn>
 <20190417150352.GA30543@zion.uk.xensource.com>
 <e1ff5aaa-7618-05fa-fbcd-f5e5681eb8af@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TYG2=SU=citrix.com=prvs=00452dca2=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hH388-0005rF-8X
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 09:14:52 +0000
Content-Disposition: inline
In-Reply-To: <e1ff5aaa-7618-05fa-fbcd-f5e5681eb8af@hygon.cn>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMTA6MTU6MDVBTSArMDgwMCwgUHUgV2VuIHdyb3RlOgo+
IE9uIDIwMTkvNC8xNyAyMzowNCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFNhdCwgQXByIDEzLCAy
MDE5IGF0IDEyOjE0OjE0QU0gKzA4MDAsIFB1IFdlbiB3cm90ZToKPiA+ID4gT24gMjAxOS80LzUg
MTU6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+IE9uIDA0LjA0LjE5IGF0IDE4OjM5LCA8
cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+ID4gPiA+ID4gT24gMjAxOS80LzQgMjI6MDcsIEFuZHJl
dyBDb29wZXIgd3JvdGU6Cj4gPiA+ID4gPiA+IFRoaXMgbmVlZHMgdGhlIGZvbGxvd2luZyBodW5r
IGZvbGRpbmcgaW4KPiA+ID4gPiA+ID4gd2hpY2ggY2FuIGJlIGRvbmUgb24gY29tbWl0IHRvIGF2
b2lkIHNlbmRpbmcgeWV0IGFub3RoZXIgdmVyc2lvbi4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gRG8g
eW91IG1lYW4gSSBuZWVkIHRvIHNlbmQgYSBpbmRpdmlkdWFsIHBhdGNoIGZvciB0aGlzIGZpbGUg
aW5zdGVhZCBvZgo+ID4gPiA+ID4gcmV3b3JraW5nIHRoZSB3aG9sZSBzZXJpZXM/Cj4gPiA+ID4g
Cj4gPiA+ID4gSSBkb24ndCB0aGluayB0aGF0J3MgbmVjZXNzYXJ5LCB1bmxlc3Mgb3RoZXIgcmVh
c29ucyBhcmlzZSBmb3IgdGhlcmUKPiA+ID4gPiB0byBiZSB5ZXQgYW5vdGhlciByb3VuZCBuZWNl
c3NhcnkuIEFzIEFuZHJldyBzYXlzIC0gdGhpcyBjYW4gZWFzaWx5Cj4gPiA+ID4gYmUgZG9uZSB3
aGlsZSBjb21taXR0aW5nLgo+ID4gPiAKPiA+ID4gSGkgSmFuIGFuZCBBbmRyZXcsCj4gPiA+IAo+
ID4gPiBIb3cgYWJvdXQgdGhlIHBhdGNoZXMgdGlsbCBub3c/IEFyZSB0aGV5IGFjY2VwdGFibGUg
dG8gY29tbWl0Pwo+ID4gCj4gPiBGWUkgd2UncmUgdHJ5aW5nIHRvIHNvcnQgb3V0IGlzc3VlcyB3
aXRoIHVwc3RyZWFtIENJIHN5c3RlbSwgc28KPiA+IGNvbW1pdHRpbmcgdGhlc2UgcGF0Y2hlcyBu
ZWVkIHRvIHdhaXQgYSBiaXQuIEJ1dCBkb24ndCB3b3JyeSwgdGhleSB3aWxsCj4gPiBldmVudHVh
bGx5IGJlIGNvbW1pdHRlZCAoYXNzdW1pbmcgYWxsIHRoZSBhY2tzIGFuZCBSYnMgYXJlIGluIHBs
YWNlKS4KPiAKPiBPa2F5LCB0aGFua3MhIEJ1dCB0aGVyZSdzIHN0aWxsIG5vIGFja3MgZm9yIHRo
aXMgcGF0Y2ggb2YgdGhlIHdob2xlIHNlcmllcywKPiBzbyBJIGp1c3Qgd29ycnkgYWJvdXQgaXQu
IENvdWxkIHNvbWVvbmUgb2ZmZXIgQWNrZWQtYnkgdGFnIGZvciBpdD8KCkl0IHdvdWxkIGJlIGVp
dGhlciBKYW4gb3IgQW5kcmV3IHdobyBuZWVkcyB0byBhY2sgdGhpcyBwYXRjaC4gIEphbiBpcwph
d2F5IGF0IHRoZSBtb21lbnQuIEFuZCBhIGxvdCBvZiB1cyBpbiBFdXJvcGUgaGF2ZSBhIGxvbmcg
RWFzdGVyIHdlZWtlbmQKdGhpcyB3ZWVrLgoKRnJvbSBteSByZWFkaW5nIG9mIHRoZWlyIGNvbW1l
bnRzLCB5b3UgZG9uJ3QgbmVlZCB0byB3b3JyeSBhYm91dCBnZXR0aW5nCmFuIGFjay4KCldlaS4K
Cj4gCj4gLS0gCj4gUmVnYXJkcywKPiBQdSBXZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
