From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/2] xen/xsm: Cleanup in preparation for XSM
 SILO mode
Date: Tue, 26 Jun 2018 13:42:23 +0100
Message-ID: <46d8010f-5d98-5649-df45-49e974a7df24@citrix.com>
References: <1530011348-4852-1-git-send-email-andrew.cooper3@citrix.com>
 <5B322BB302000078001CE02C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B322BB302000078001CE02C@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xin Li <xin.li@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Xen-devel <xen-devel@lists.xen.org>, Tim Deegan <tim@xen.org>, Ming Lu <ming.lu@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDYvMTggMTM6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI2LjA2LjE4IGF0
IDEzOjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEZ1dHVyZSBjaGFu
Z2VzIHdpbGwgaW50cm9kdWNlIGEgbmV3IFNJTE8gbW9kZSwgd2hpY2ggaXMgaW50ZW5kZWQgdG8g
YmUgdXNlZnVsCj4+IGZvciBjbG91ZCBhbmQgZW50ZXJwcmlzZSBzZXR1cHMgd2hlcmUgYWxsIGRv
bVVzIGFyZSB1bnByaXZpbGVnZWQgYW5kIGhhdmUgbm8KPj4gYnVpc25lc3MgY29tbXVuaWNhdGlu
ZyBkaXJlY3RseS4KPj4KPj4gVGhpcyB3YXMgZGlzY3Vzc2VkIGF0IFhlblN1bW1pdCwgYnV0IEkn
bGwgbGVhdmUgZnVydGhlciBkZXRhaWxzIHRvIHRoZSBzZXJpZXMKPj4gd2hpY2ggaW50cm9kdWNl
cyBpdC4gIEhvd2V2ZXIsIHRvIGJlZ2luIHdpdGgsIGNsZWFuIHVwIHRoZSBYU00gbmFtZXNwYWNp
bmcgdG8KPj4gYmV0dGVyIHNlcGFyYXRlIFhTTSBhbmQgRkxBU0suCj4+Cj4+IE5vIGZ1bmN0aW9u
YWwgY2hhbmdlLgo+Pgo+PiBBbmRyZXcgQ29vcGVyICgyKToKPj4gICB4ZW4veHNtOiBSZW5hbWUg
Q09ORklHX0ZMQVNLXyogdG8gQ09ORklHX1hTTV9GTEFTS18qCj4+ICAgeGVuL3hzbTogUmVuYW1l
IENPTklGSUdfWFNNX1BPTElDWSB0byBDT05GSUdfWFNNX0ZMQVNLX1BPTElDWQo+IEkgZG9uJ3Qg
cGFydGljdWxhcmx5IG1pbmQgdGhlIGNoYW5nZSwgYnV0IEkgYWxzbyBkb24ndCB2aWV3IGl0IGFz
Cj4gcGFydGljdWxhcmx5IHVzZWZ1bDogRm9yIHRoZSBmaXJzdCBwYXRjaCBJJ2Qgc2VlIHRoZSBw
b2ludCBpZiB5b3UKPiBtZWFudCB0byBpbnRyb2R1Y2Ugc29tZSBDT05GSUdfQUJDX0ZMQVNLLCBi
dXQgdGhhdCdzIG5vdCBob3cKPiBJIHVuZGVyc3RhbmQgdGhlIGRlc2NyaXB0aW9uIHRoZXJlLiBG
b3IgdGhlIHNlY29uZCBJIGRvbid0IHNlZQo+IHRoZSBwb2ludCBvZiByZXRhaW5pbmcgWFNNIGlu
IHRoZSBuYW1lLgoKWFNNICE9IEZsYXNrLCBhbmQgdGhpcyBpcyB0aGUgbmFtaW5nIGNvbmZ1c2lv
biB0cnlpbmcgdG8gYmUgcmVjdGlmaWVkLgoKQ09ORklHX1hTTV9TSUxPIGlzIGdvaW5nIHRvIGJl
IHRoZSBpbnRyb2R1Y2VkIG5ldyBtb2RlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
