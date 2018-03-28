From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.11] tools: set DEBUG_DIR from configure
Date: Wed, 28 Mar 2018 08:26:33 +0100
Message-ID: <20180328072633.ulcm3mzggyt5kqxb@MacBook-Pro-de-Roger.local>
References: <20180327161344.94634-1-roger.pau@citrix.com>
 <20180327161807.GD30726@aepfle.de>
 <20180327162057.leyxcnt7rw2m64xj@MacBook-Pro-de-Roger.local>
 <20180327162812.y553z7wb2pyoxiwu@MacBook-Pro-de-Roger.local>
 <096a0ae6-491d-2069-f40c-b758c2a15203@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jcus=gs=citrix.com=prvs=618139c40=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f15Tp-00026H-9h
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 07:26:45 +0000
Content-Disposition: inline
In-Reply-To: <096a0ae6-491d-2069-f40c-b758c2a15203@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMTE6NTU6MzdBTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gMy8yNy8xOCAxMToyOCBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+
IE9uIFR1ZSwgTWFyIDI3LCAyMDE4IGF0IDA1OjIwOjU3UE0gKzAxMDAsIFJvZ2VyIFBhdSBNb25u
w6kgd3JvdGU6Cj4gPj4gT24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDY6MTg6MDhQTSArMDIwMCwg
T2xhZiBIZXJpbmcgd3JvdGU6Cj4gPj4+IE9uIFR1ZSwgTWFyIDI3LCBSb2dlciBQYXUgTW9ubmUg
d3JvdGU6Cj4gPj4+Cj4gPj4+PiArQUNfQVJHX1dJVEgoW2RlYnVnZGlyXSwKPiA+Pj4+ICsgICAg
QVNfSEVMUF9TVFJJTkcoWy0td2l0aC1kZWJ1Z2Rpcj1ESVJdLAo+ID4+Pj4gKyAgICBbUGF0aCB0
byBkaXJlY3RvcnkgZm9yIGRlYnVnIHN5bWJvbHMuIFtQUkVGSVgvdXNyL2xpYi9kZWJ1Z11dKSwK
PiA+Pj4+ICsgICAgW2RlYnVnZGlyX3BhdGg9JHdpdGh2YWxdLAo+ID4+Pj4gKyAgICBbZGVidWdk
aXJfcGF0aD0kcHJlZml4L3Vzci9saWIvZGVidWddKQo+ID4+Pgo+ID4+PiBXb3VsZCB0aGF0IGNy
ZWF0ZSAvdXNyL3Vzci9saWIvZGVidWcgcGVyIGRlZmF1bHQ/Cj4gPj4KPiA+PiBObywgdGhpcyB3
b3VsZCBiZTogL3Vzci9sb2NhbC91c3IvbGliL2RlYnVnIGJ5IGRlZmF1bHQuCj4gPiAKPiA+IFdo
aWNoIG1heWJlIHNob3VsZCBiZTogL3Vzci9sb2NhbC9saWIvZGVidWcgaW5zdGVhZD8KPiA+IAo+
IAo+IFlvdSBzaG91bGQgdXNlICRwcmVmaXgvbGliL2RlYnVnIGJ5IGRlZmF1bHQuIFdoaWNoIHdv
dWxkIGNhdXNlIHRoaXMgdG8KPiBtYXAgYXBwcm9wcmlhdGVseS4gSWYgeW91IGhhdmUgbGV0J3Mg
c2F5IC91c3IvYmluL2xzIHRoZW4gYnkgZGVmYXVsdCBpdAo+IHdvdWxkIGhhdmUgL3Vzci9saWIv
ZGVidWcvdXNyL2Jpbi9scy5kZWJ1ZyBJZiB5b3UgaGF2ZQo+IC91c3IvbG9jYWwvYmluL2ZvbyB0
aGVuIGl0IHdvdWxkIGJlIC91c3IvbG9jYWwvZGVidWcvdXNyL2xvY2FsL2Jpbi9mb28uZGVidWcK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gbGliLwo+
IAo+IEFzc3VtaW5nIHRoYXQgbHMgd2FzIGJ1aWx0IHdpdGggLi9jb25maWd1cmUgLS1wcmVmaXg9
L3VzciBhbmQgZm9vIHdhcwoKSSBndWVzcyB5b3UgbWVhbiAtLXByZWZpeD0vLCB1c2luZyAvdXNy
IHdvdWxkIGdlbmVyYXRlIC91c3IvdXNyL2Jpbi9scwpBRkFJQ1Q/CgpXaWxsIHNlbmQgdjIgc2hv
cnRseSwgaG9wZWZ1bGx5IHRoaXMgdGltZSB0aGUgcGF0aHMgd2lsbCBiZSByaWdodCA6KQoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
