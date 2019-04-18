From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v5 01/15] x86/cpu: Create Hygon Dhyana
 architecture support file
Date: Thu, 18 Apr 2019 10:15:05 +0800
Message-ID: <e1ff5aaa-7618-05fa-fbcd-f5e5681eb8af@hygon.cn>
References: <cover.1554382869.git.puwen@hygon.cn>
 <0d6839a65753c60f4fd1738560a551ca7df7b1e8.1554382869.git.puwen@hygon.cn>
 <614b4eab-065a-c911-7759-2663ab6a9657@citrix.com>
 <8f23051d-a8b5-a25b-af4a-acf045c31cd2@hygon.cn>
 <5CA708840200007800224C6E@prv1-mh.provo.novell.com>
 <a14a1f04-eab0-dac6-7a7b-6125578cd3e5@hygon.cn>
 <20190417150352.GA30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L8l5=SU=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hGwk4-0004mN-87
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 02:25:36 +0000
In-Reply-To: <20190417150352.GA30543@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS80LzE3IDIzOjA0LCBXZWkgTGl1IHdyb3RlOgo+IE9uIFNhdCwgQXByIDEzLCAyMDE5
IGF0IDEyOjE0OjE0QU0gKzA4MDAsIFB1IFdlbiB3cm90ZToKPj4gT24gMjAxOS80LzUgMTU6NTAs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMDQuMDQuMTkgYXQgMTg6MzksIDxwdXdlbkBoeWdv
bi5jbj4gd3JvdGU6Cj4+Pj4gT24gMjAxOS80LzQgMjI6MDcsIEFuZHJldyBDb29wZXIgd3JvdGU6
Cj4+Pj4+IFRoaXMgbmVlZHMgdGhlIGZvbGxvd2luZyBodW5rIGZvbGRpbmcgaW4KPj4+Pj4gd2hp
Y2ggY2FuIGJlIGRvbmUgb24gY29tbWl0IHRvIGF2b2lkIHNlbmRpbmcgeWV0IGFub3RoZXIgdmVy
c2lvbi4KPj4+Pgo+Pj4+IERvIHlvdSBtZWFuIEkgbmVlZCB0byBzZW5kIGEgaW5kaXZpZHVhbCBw
YXRjaCBmb3IgdGhpcyBmaWxlIGluc3RlYWQgb2YKPj4+PiByZXdvcmtpbmcgdGhlIHdob2xlIHNl
cmllcz8KPj4+Cj4+PiBJIGRvbid0IHRoaW5rIHRoYXQncyBuZWNlc3NhcnksIHVubGVzcyBvdGhl
ciByZWFzb25zIGFyaXNlIGZvciB0aGVyZQo+Pj4gdG8gYmUgeWV0IGFub3RoZXIgcm91bmQgbmVj
ZXNzYXJ5LiBBcyBBbmRyZXcgc2F5cyAtIHRoaXMgY2FuIGVhc2lseQo+Pj4gYmUgZG9uZSB3aGls
ZSBjb21taXR0aW5nLgo+Pgo+PiBIaSBKYW4gYW5kIEFuZHJldywKPj4KPj4gSG93IGFib3V0IHRo
ZSBwYXRjaGVzIHRpbGwgbm93PyBBcmUgdGhleSBhY2NlcHRhYmxlIHRvIGNvbW1pdD8KPiAKPiBG
WUkgd2UncmUgdHJ5aW5nIHRvIHNvcnQgb3V0IGlzc3VlcyB3aXRoIHVwc3RyZWFtIENJIHN5c3Rl
bSwgc28KPiBjb21taXR0aW5nIHRoZXNlIHBhdGNoZXMgbmVlZCB0byB3YWl0IGEgYml0LiBCdXQg
ZG9uJ3Qgd29ycnksIHRoZXkgd2lsbAo+IGV2ZW50dWFsbHkgYmUgY29tbWl0dGVkIChhc3N1bWlu
ZyBhbGwgdGhlIGFja3MgYW5kIFJicyBhcmUgaW4gcGxhY2UpLgoKT2theSwgdGhhbmtzISBCdXQg
dGhlcmUncyBzdGlsbCBubyBhY2tzIGZvciB0aGlzIHBhdGNoIG9mIHRoZSB3aG9sZSAKc2VyaWVz
LCBzbyBJIGp1c3Qgd29ycnkgYWJvdXQgaXQuIENvdWxkIHNvbWVvbmUgb2ZmZXIgQWNrZWQtYnkg
dGFnIGZvciBpdD8KCi0tIApSZWdhcmRzLApQdSBXZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
