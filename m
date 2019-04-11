From: Julien Grall <julien.grall@arm.com>
Subject: Re: [OSSTEST PATCH 21/62] ts-kernel-build: disable
 host1x, which doesn't build
Date: Thu, 11 Apr 2019 11:51:30 +0100
Message-ID: <8d4ff0b9-0570-ef0f-e837-4ccf2da4d680@arm.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-22-ian.jackson@eu.citrix.com>
 <20190410152749.GA1460@ulmo> <fd1db931-034d-3de5-439a-d78be62a9517@arm.com>
 <23726.4132.637193.17047@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SOEG=SN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hEXJN-0006L7-LI
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:52:05 +0000
In-Reply-To: <23726.4132.637193.17047@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Thierry Reding <thierry.reding@gmail.com>, Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSWFuLAoKT24gNC8xMC8xOSA0OjQ3IFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiBKdWxpZW4g
R3JhbGwgd3JpdGVzICgiUmU6IFtPU1NURVNUIFBBVENIIDIxLzYyXSB0cy1rZXJuZWwtYnVpbGQ6
IGRpc2FibGUgaG9zdDF4LCB3aGljaCBkb2Vzbid0IGJ1aWxkIik6Cj4+IElhbiBhcmUgd2UgdXNp
bmcgYSBkaWZmZXJlbnQgY29uZmlnIGJldHdlZW4gSmVzc2llIGFuZCBTdHJldGNoPwo+IAo+IE5v
dCB2ZXJ5IFsxXSwgYnV0IHdlICphcmUqIHVzaW5nIGEgZGlmZmVyZW50IGNvbXBpbGVyIChzaW5j
ZSB3ZSBqdXN0Cj4gdXNlIHRoZSBvbmUgZnJvbSB0aGUgZGlzdHJvKS4KPiAKPiBbMV0gVGhlcmUg
YXJlIHNvbWUgY2hhbmdlcyB0byBhZGQgc29tZSBUaHVuZGVyWCBkcml2ZXJzLCBpbiBhIHBhdGNo
Cj4gdGhhdCB5b3Ugc3VnZ2VzdGVkIDotKToKPiAKPiArc2V0b3B0IENPTkZJR19QQ0lfSE9TVF9U
SFVOREVSX1BFTT15Cj4gK3NldG9wdCBDT05GSUdfUENJX0hPU1RfVEhVTkRFUl9FQ0FNPXkKPiAr
c2V0b3B0IENPTkZJR19USFVOREVSX05JQ19QRj1tCj4gK3NldG9wdCBDT05GSUdfVEhVTkRFUl9O
SUNfVkY9bQo+ICtzZXRvcHQgQ09ORklHX1RIVU5ERVJfTklDX0JHWD1tCj4gK3NldG9wdCBDT05G
SUdfVEhVTkRFUl9OSUNfUkdYPW0KPiArc2V0b3B0IENPTkZJR19NRElPX1RIVU5ERVI9bQo+ICtz
ZXRvcHQgQ09ORklHX0kyQ19USFVOREVSWD1tCj4gK3NldG9wdCBDT05GSUdfU1BJX1RIVU5ERVJY
PW0KPiAKPiBJIGRvdWJ0IHRoZXNlIGFyZSByZWxhdGVkLgoKUmlnaHQsIHRoaXMgc2hvdWxkIG5v
dCBjaGFuZ2UgdGhlIHNlbGVjdGlvbiBvZiB0aGUgaG9zdDF4IGRyaXZlci4gU28gCnRoaXMgaXMg
bW9zdGx5IGxpa2UgZHVlIHRvIHRoZSBjb21waWxlciBjaGFuZ2UuCgo+IAo+IEl0J3MgbmljZSB0
byBrbm93IHRoYXQgaXQncyBmaXhlZCBpbiA0LjE4LiAgSSBkb24ndCBrbm93IGhvdwo+IGRpc3J1
cHRpdmUgaXQgd291bGQgYmUgdG8gYmFja3BvcnQgaXQuICBJIGNvdWxkIHBlcmhhcHMgbWFrZSB0
aGUKPiBjb25maWcgb3B0aW9uIHRvIGRpc2FibGUgaG9zdDF4IGNvbmRpdGlvbmFsIG9uIHRoZSBM
aW51eCBrZXJuZWwKPiB2ZXJzaW9uIGJ1dCBpdCBzZWVtcyBlYXNpZXIgdG8ganVzdCBsZWF2ZSB0
aGluZ3MgYXMgdGhleSBhcmUgYW5kIHRha2UKPiB0aGUgd29ya2Fyb3VuZCBvdXQgYXQgc29tZSBw
b2ludCBpbiB0aGUgZGlzdGFudCBmdXR1cmUgd2hlbiBhbGwKPiBrZXJuZWxzIHdlIGNhcmUgYWJv
dXQgaGF2ZSB0aGUgZml4LgoKSSBhZ3JlZSB0aGF0IHRoaXMgaXMgdGhlIG1vc3Qgc2Vuc2libGUg
YXBwcm9hY2ggZm9yIG5vdy4KCkxvb2tpbmcgYXQgWzFdLCBJIGd1ZXNzIHdlIHdvdWxkIG5lZWQg
dG8gcmVxdWVzdCBiYWNrcG9ydCB1cCB0byAzLjE4PwoKQ2hlZXJzLAoKWzFdIApodHRwOi8vbG9n
cy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L3Jlc3VsdHMvYWxsLWJyYW5jaC1zdGF0
dXNlcy50eHQKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
