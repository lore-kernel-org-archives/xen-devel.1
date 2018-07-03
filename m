From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 03/10] x86: Add Intel Processor Trace
 support for cpuid
Date: Tue, 3 Jul 2018 11:25:53 +0100
Message-ID: <9dddab32-17e7-4740-0578-d9407b8c2ec9@citrix.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-4-git-send-email-luwei.kang@intel.com>
 <5B364D8802000078001CF419@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E168048216@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E168048216@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Kang, Luwei" <luwei.kang@intel.com>, Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "Tian,
 Kevin" <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDcvMTggMTE6MTksIEthbmcsIEx1d2VpIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaAo+Pj4gQEAgLTIxNSw2ICsyMTUsNyBAQCBY
RU5fQ1BVRkVBVFVSRShTTUFQLCAgICAgICAgICA1KjMyKzIwKSAvKlMgIFN1cGVydmlzb3IgTW9k
ZSBBY2Nlc3MgUHJldmVudGlvbiAqLwo+Pj4gIFhFTl9DUFVGRUFUVVJFKEFWWDUxMklGTUEsICAg
IDUqMzIrMjEpIC8qQSAgQVZYLTUxMiBJbnRlZ2VyIEZ1c2VkIE11bHRpcGx5IEFkZCAqLwo+Pj4g
IFhFTl9DUFVGRUFUVVJFKENMRkxVU0hPUFQsICAgIDUqMzIrMjMpIC8qQSAgQ0xGTFVTSE9QVCBp
bnN0cnVjdGlvbiAqLwo+Pj4gIFhFTl9DUFVGRUFUVVJFKENMV0IsICAgICAgICAgIDUqMzIrMjQp
IC8qQSAgQ0xXQiBpbnN0cnVjdGlvbiAqLwo+Pj4gK1hFTl9DUFVGRUFUVVJFKElQVCwgICAgICAg
ICAgIDUqMzIrMjUpIC8qSCAgSW50ZWwgUHJvY2Vzc29yIFRyYWNlICovCj4+IEJ0dyAtIGludHJv
ZHVjaW5nIHRoZSBmZWF0dXJlIGZsYWcgaGVyZSBpcyBjZXJ0YWlubHkgZmluZSwgYnV0IEkgdGhp
bmsgeW91IHNob3VsZCBhZGQgdGhlIEggYW5ub3RhdGlvbiBvbmx5IG9uY2UgZnVuY3Rpb25hbGl0
eSBpcwo+PiBjb21wbGV0ZS4gVGhhdCB3b3VsZCB0aGVuIGUuZy4gYWxzbyByZWR1Y2UgdGhlIGlt
cGFjdCBvZiBwYXRjaCA4IGFkZGluZyBmdW5jdGlvbmFsaXR5IG90aGVyd2lzZSBzdHJpY3RseSBu
ZWNlc3NhcnkgYWxyZWFkeSBpbiBwYXRjaAo+PiA3Lgo+IFNvcnJ5LCBub3QgZnVsbCB1bmRlcnN0
YW5kIGhlcmUuIERvIHlvdSBtZWFuIEkgbmVlZCBleHBvc2UgdGhpcyBmZWF0dXJlIHRvIGd1ZXN0
IGFmdGVyIGFsbCBpcyByZWFkeT8gVGhhdCBpcyBtb3ZlIHRoaXMgcGF0Y2ggYWZ0ZXIgcGF0Y2gg
Nyw4ID8KCkFzIGFuIGV4YW1wbGUsIHRha2UgbXkgc2VyaWVzIGFkZGluZyBTU0JEIHN1cHBvcnQg
dG8gWGVuLgoKRmlyc3QsCmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0
O2E9Y29tbWl0ZGlmZjtoPTlkZjUyYTI1ZTBlOTVhMGI5OTcxYWEyZmMyNmM1YzZhNWNiZGY0ZWYK
d2hpY2ggYWRkcyB0aGUgbmV3IGZlYXR1cmUgZGVmaW5lIHNvIFhlbiBjYW4gZ2FpbiBzb21lIGNv
ZGUuCgpMYXRlcgpodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNv
bW1pdGRpZmY7aD05ZGY1MmEyNWUwZTk1YTBiOTk3MWFhMmZjMjZjNWM2YTVjYmRmNGVmCnRoZSBm
ZWF0dXJlIGlzIG9mZmVyZWQgdG8gZ3Vlc3RzIHdoZW4gYWxsIHRoZSBYZW4gaW5mcmFzdHJ1Y3R1
cmUgaXMgaW4KcGxhY2UuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
