From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 17/28] x86/vvtd: save and restore
	emulated VT-d
Date: Fri, 23 Feb 2018 17:19:47 +0000
Message-ID: <20180223171947.b4c2k2m5qbvbzpsr@MacBook-Pro-de-Roger.local>
References: <1510899755-40237-1-git-send-email-chao.gao@intel.com>
 <1510899755-40237-18-git-send-email-chao.gao@intel.com>
 <20180212144912.jywfmqlowmkrsmeq@MacBook-Pro-de-Roger.local>
 <20180223052223.GB162485@skl-4s-chao.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180223052223.GB162485@skl-4s-chao.sh.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Lan Tianyu <tianyu.lan@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDE6MjI6MjNQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gT24gTW9uLCBGZWIgMTIsIDIwMTggYXQgMDI6NDk6MTJQTSArMDAwMCwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToKPiA+T24gRnJpLCBOb3YgMTcsIDIwMTcgYXQgMDI6MjI6MjRQTSArMDgwMCwg
Q2hhbyBHYW8gd3JvdGU6Cj4gPgo+ID4+ICtzdHJ1Y3QgaHZtX2h3X3Z2dGQKPiA+PiArewo+ID4+
ICsgICAgdWludDMyX3QgZWltX2VuYWJsZWQgOiAxLAo+ID4+ICsgICAgICAgICAgICAgaW50cmVt
YXBfZW5hYmxlZCA6IDE7Cj4gPj4gKyAgICB1aW50MzJfdCBmYXVsdF9pbmRleDsKPiA+PiArCj4g
Pj4gKyAgICAvKiBJbnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlIGJhc2UgZ2ZuIGFuZCB0aGUgbWF4
IG9mIGVudHJpZXMgKi8KPiA+PiArICAgIHVpbnQzMl90IGlydF9tYXhfZW50cnk7Cj4gPj4gKyAg
ICB1aW50NjRfdCBpcnQ7Cj4gPj4gKwo+ID4+ICsgICAgdWludDMyX3QgcmVnc1tWVlREX01BWF9P
RkZTRVQvc2l6ZW9mKHVpbnQzMl90KV07Cj4gPj4gK307Cj4gPj4gKwo+ID4+ICtERUNMQVJFX0hW
TV9TQVZFX1RZUEUoVlZURCwgMjEsIHN0cnVjdCBodm1faHdfdnZ0ZCk7Cj4gPgo+ID5BZGRpbmcg
bmV3IGZpZWxkcyB0byB0aGlzIHN0cnVjdCBpbiBhIG1pZ3JhdGlvbiBjb21wYXRpYmxlIHdheSBp
cwo+ID5nb2luZyB0byBiZSBhIFBJVEEsIGJ1dCB0aGVyZSdzIG5vIGVhc3kgc29sdXRpb24gdG8g
dGhpcyBJJ20gYWZyYWlkLi4uCj4gCj4gV2hhdCBkbyB5b3UgbWVhbiBieSAibWlncmF0aW9uIGNv
bXBhdGlibGUiPyBEbyB5b3UgbWVhbiBtaWdyYXRpbmcgYSBodm0KPiBndWVzdCB3aXRoIHZpb21t
dSBiZXR3ZWVuIGRpZmZlcmVudCBYZW4gdmVyc2lvbnM/IENvdWxkIGl0IGJlIHNvbHZlZCBieQo+
IGxlYXZpbmcgc29tZSBwYWRkaW5nIGZpZWxkcyBoZXJlPwoKSXQncyBpbmV2aXRhYmxlLCBidXQg
d2hlbiBuZXcgZmVhdHVyZXMgYXJlIGFkZGVkIHRvIHRoZSB2dnRkCmltcGxlbWVudGF0aW9uIHRo
ZSBzdHJ1Y3Qgd2lsbCBsaWtlbHkgY2hhbmdlIGFuZCB0aGVuIHdlIHdpbGwgbmVlZApzb21lIGNv
bnZlcnNpb24gaGVscGVyLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
