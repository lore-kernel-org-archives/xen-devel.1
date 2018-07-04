From: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH v2 06/10] x86: Introduce a new function to
 get capability of Intel PT
Date: Wed, 4 Jul 2018 09:42:52 +0000
Message-ID: <82D7661F83C1A047AF7DC287873BF1E16805DAC7@SHSMSX101.ccr.corp.intel.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-7-git-send-email-luwei.kang@intel.com>
 <5B3643A002000078001CF391@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E1680481D9@SHSMSX101.ccr.corp.intel.com>
 <5B3B676B02000078001D0469@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E16805D910@SHSMSX101.ccr.corp.intel.com>
 <5B3C8EAF02000078001D0EB4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B3C8EAF02000078001D0EB4@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, "Tian, Kevin" <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiA+PiA+PiA+ICsjZGVmaW5lIElQVF9DQVAoX24sIF9sLCBfciwgX20pICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+PiA+PiA+ICsgICAgW0lQVF9DQVBfICMjIF9uXSA9IHsgLm5h
bWUgPSBfX3N0cmluZ2lmeShfbiksIC5sZWFmID0gX2wsIFwKPiA+PiA+PiA+ICsgICAgICAgIC5y
ZWcgPSBfciwgLm1hc2sgPSBfbSB9Cj4gPj4gPj4gPiArCj4gPj4gPj4gPiArc3RhdGljIHN0cnVj
dCBpcHRfY2FwX2Rlc2Mgewo+ID4+ID4+ID4gKyAgICBjb25zdCBjaGFyICAgICpuYW1lOwo+ID4+
ID4+ID4gKyAgICB1bnNpZ25lZCBpbnQgIGxlYWY7Cj4gPj4gPj4gPiArICAgIHVuc2lnbmVkIGNo
YXIgcmVnOwo+ID4+ID4+Cj4gPj4gPj4gSSBkb24ndCB0aGluayBsZWFmIG5lZWRzIHRvIGJlIGZ1
bGwgMzIgYml0cyB3aWRlPyBPbmNlIHNocnVuayBieQo+ID4+ID4+IGF0IGxlYXN0IHR3byBiaXRz
LCB0aGUgc2l6ZSBvZiB0aGUgb3ZlcmFsbCBzdHJ1Y3R1cmUgY291bGQgZ28gZG93biBmcm9tIDI0
IHRvIDE2IGJ5dGVzLgo+ID4+ID4KPiA+PiA+IE9LLCB3aWxsIGNoYW5nZSBpdCBmcm9tICIgdW5z
aWduZWQgaW50ICAiIHRvICJ1bnNpbmdlZCBjaGFyIi4KPiA+Pgo+ID4+IEknZCBwcmVmZXIgaWYg
eW91IHVzZWQgYml0IGZpZWxkcywgYXMgd2FzIG1lYW50IHRvIGJlIGltcGxpZWQgYnkgbXkgcmVw
bHkuCj4gPgo+ID4gbGlrZSB0aGlzPyBJZiB0d28gYml0cyBpcyB0b28gZmV3IGZvciAibGVhZiI/
Cj4gPgo+ID4gc3RhdGljIGNvbnN0IHN0cnVjdCBpcHRfY2FwX2Rlc2Mgewo+ID4gICAgIGNvbnN0
IGNoYXIgICAgKm5hbWU7Cj4gPiAgICAgdW5zaWduZWQgY2hhciBsZWFmOjI7Cj4gPiAgICAgdW5z
aWduZWQgY2hhciByZWc6MjsKPiA+ICAgICB1bnNpbmdlZCBpbnQgbWFzazsKPiA+IH0KPiAKPiBZ
ZXMuIEFzIHN1Z2dlc3RlZCBiZWZvcmUgSSdkIHVzZSBtb3JlIGJpdHMgZm9yIGxlYWYsIHRvIGF2
b2lkIHRoaXMgbmVlZGluZyB0byBjaGFuZ2UgaW1tZWRpYXRlbHkgb25jZSBhIG5ldyBsZWFmIGJl
Y29tZXMga25vd24uCj4gQWZ0ZXIgYWxsIHRoZSBnb2FsIGlzIG9ubHkgdG8gaGF2ZSBsZWFmIGFu
ZCByZWcgdG9nZXRoZXIgZml0IGluIDMyIGJpdHMuIE1ha2luZyBsZWFmIDggYml0cyB3aWRlIGZv
ciBub3cgd291bGQgbGlrZWx5IGhlbHAgZ2VuZXJhdGVkIGNvZGUuCj4gQW5kIHBsZWFzZSBkb24n
dCB1c2UgdW5zaWduZWQgY2hhciBpbiBjYXNlcyBsaWtlIHRoaXMgd2hlcmUgeW91IGRvbid0IHJl
YWxseSBuZWVkIHRoZSBtb3JlIG5hcnJvdyB0eXBlIC0gYmUgYXMgY2xvc2UgdG8gd2hhdCB0aGUK
PiBzdGFuZGFyZCBhbGxvd3Mgd2l0aG91dCBleHRlbnNpb25zIGFzIHBvc3NpYmxlOyBJT1cgdW5z
aWduZWQgaW50IGhlcmUuCj4gCgpzdGF0aWMgY29uc3Qgc3RydWN0IGlwdF9jYXBfZGVzYyB7CiAg
ICBjb25zdCBjaGFyICAgICpuYW1lOwogICAgdW5zaWduZWQgaW50IGxlYWY6ODsKICAgIHVuc2ln
bmVkIGludCByZWc6MjsKICAgIHVuc2luZ2VkIGludCBtYXNrOwp9CgpUaGFua3MsCkx1d2VpIEth
bmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
