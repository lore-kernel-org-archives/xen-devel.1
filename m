From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: Re: [PATCH 2/2] x86/dmar: zap DMAR signature for dom0
 once in TBOOT case
Date: Mon, 20 Aug 2018 16:58:24 +0800
Message-ID: <29789eea-c894-2f3b-aaa2-70a24247cb15@oracle.com>
References: <787bc1e4-3175-4123-80a3-74d2dc1b2d7f@default>
 <5B7A7C2702000078001DFCDF@prv1-mh.provo.novell.com>
 <91fba9e6-3639-f114-42a6-1057ce461c75@citrix.com>
Reply-To: zhenzhong.duan@oracle.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <91fba9e6-3639-f114-42a6-1057ce461c75@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Shane Wang <shane.wang@intel.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-Devel <xen-devel@lists.xen.org>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC84LzIwIDE2OjQ0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDIwLzA4LzIwMTgg
MDk6MzAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMC4wOC4xOCBhdCAwNTozMiwgPHpo
ZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+IHdyb3RlOgo+Pj4gV2hlbiBUQk9PVCBlbmFibGVkLCBh
Y3BpX3BhcnNlX2RtYXIoKSB6YXAgYSBjb3B5IG9mIERNQVIgdGFibGUgcmF0aGVyCj4+PiB0aGFu
IHRoZSByZWFsIHRhYmxlLCBzbyBtYWtlIGl0IGNvbnRyb2xlZCBieSBjb25maWcgb3B0aW9uIGJh
c2VkIG9uIHRoZQo+Pj4gZmFjdCB0aGF0IHdlIGFscmVhZHkgaGF2ZSBkb25lIHRoZSByZWFsIHph
cHBpbmcgaW4gdGJvb3RfcGFyc2VfZG1hcl90YWJsZSgpLgo+PiBJcyB0aGlzIGp1c3QgYSBjb3Nt
ZXRpYyBjaGFuZ2UsIG9yIGlzIHRoZXJlIGFueSBoYXJtIGRvbmUgYnkgdGhlIGV4dHJhCj4+IHph
cHBpbmc/Cj4gCj4gQmVmb3JlIDEyM2M3NzkzNzk3NTAyYjIyMjMwMGViNzEwY2QzODczZGNjYTQx
ZWUsIGNhbGxpbmcgaXQgbXVsdGlwbGUKPiB0aW1lcyB3b3VsZCByZXF1aXJlIGFuIGVxdWl2YWxl
bnQgbnVtYmVyIG9mIHJlaW5zdGF0ZSBjYWxscyBmb3IgaXQgdG8gd29yay4KPiAKPiBUaGF0IGNo
YW5nZSB3ZW50IGludG8gWGVuIDQuNiwgd2hlcmVhcyBJIGd1ZXNzIHRoaXMgaXMgYSBwYXRjaCBi
ZWluZwo+IHVwc3RyZWFtZWQgZnJvbSBPcmFjbGVzIDQuNCBwYXRjaHF1ZXVlPwpOb3QgZm9yIHRo
YXQgcmVhc29uLiBQYXRjaCBpcyBmb3IgdXBzdHJlYW0uCnRib290X3BhcnNlX2RtYXJfdGFibGUo
KSBjYWxsZWQgYWNwaV9kbWFyX3phcCgpIHRoZSBmaXJzdCB0aW1lLCAKYWNwaV9wYXJzZV9kbWFy
IGNhbGxlZCBpdCB0aGUgc2Vjb25kIHRpbWUsIEkgdGhvdWdodCBpdCdzIGEgZHVwLgoKVGhhbmtz
ClpoZW56aG9uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
