From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 9/9] x86/vmx: Don't leak EFER.NXE into guest
 context
Date: Fri, 25 May 2018 01:27:38 -0600
Message-ID: <5B07BAEA02000078001C5D7F@prv1-mh.provo.novell.com>
References: <1526988046-22948-1-git-send-email-andrew.cooper3@citrix.com>
 <1526988046-22948-10-git-send-email-andrew.cooper3@citrix.com>
 <20180524160141.fgvw6enzcmy5g2dd@MacBook-Pro-de-Roger.local>
 <c5b1d88f-00bf-65c3-2b8f-2cf3458dee50@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c5b1d88f-00bf-65c3-2b8f-2cf3458dee50@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA1LjE4IGF0IDE4OjQ4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjQvMDUvMTggMTc6MDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIFR1
ZSwgTWF5IDIyLCAyMDE4IGF0IDEyOjIwOjQ2UE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6
Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm1jcy5oCj4+PiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm1jcy5oCj4+PiBAQCAtMzA2LDYgKzMwNiw4IEBA
IGV4dGVybiB1NjQgdm14X2VwdF92cGlkX2NhcDsKPj4+ICAgICAgKHZteF9jcHVfYmFzZWRfZXhl
Y19jb250cm9sICYgQ1BVX0JBU0VEX01PTklUT1JfVFJBUF9GTEFHKQo+Pj4gICNkZWZpbmUgY3B1
X2hhc192bXhfcGF0IFwKPj4+ICAgICAgKHZteF92bWVudHJ5X2NvbnRyb2wgJiBWTV9FTlRSWV9M
T0FEX0dVRVNUX1BBVCkKPj4+ICsjZGVmaW5lIGNwdV9oYXNfdm14X2VmZXIgXAo+Pj4gKyAgICAo
dm14X3ZtZW50cnlfY29udHJvbCAmIFZNX0VOVFJZX0xPQURfR1VFU1RfRUZFUikKPj4gRG9uJ3Qg
eW91IGFsc28gbmVlZCBhIHZteF92bWV4aXRfY29udHJvbCAmIFZNX0VYSVRfU0FWRV9HVUVTVF9F
RkVSIGFuZAo+PiB2bXhfdm1leGl0X2NvbnRyb2wgJiBWTV9FWElUX0xPQURfSE9TVF9FRkVSPwo+
Pgo+PiBPciBjYW4gdGhlIHByZXNlbmNlIG9mIHRob3NlIHR3byBiZSBpbmZlcnJlZCBmcm9tCj4+
IFZNX0VOVFJZX0xPQURfR1VFU1RfRUZFUj8KPiAKPiBUaGV5IHdlcmUgaW50cm9kdWNlZCBhdCB0
aGUgc2FtZSB0aW1lIGludG8gaGFyZHdhcmUsIHNvIHRoZXNlIHNldHRpbmdzCj4gd2lsbCBiZSB0
aGUgc2FtZSBpbiBwcmFjdGljZS4KCkkgc2VlIG90aGVyIHNpbWlsYXIgZ3JvdXBzIG9mIGZlYXR1
cmVzIGFsc28gYXJlbid0IGNoZWNrZWQgZm9yIGNvbnNpc3RlbmN5LApidXQgd291bGRuJ3QgaXQg
YmUgYmV0dGVyIHRvIGhhdmUgc3VjaCBjaGVja3MgaW4gdm14X2luaXRfdm1jc19jb25maWcoKQoo
aS5lLiBkaXNhYmxlIGFsbCB0aHJlZSBpZiBhdCBsZWFzdCBvbmUgb2YgdGhlbSBpcyB1bmF2YWls
YWJsZSk/CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
