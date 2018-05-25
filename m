From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 9/9] x86/vmx: Don't leak EFER.NXE into guest
 context
Date: Fri, 25 May 2018 09:03:06 +0100
Message-ID: <b1be9c38-76a7-9579-ed8b-909633590630@citrix.com>
References: <1526988046-22948-1-git-send-email-andrew.cooper3@citrix.com>
 <1526988046-22948-10-git-send-email-andrew.cooper3@citrix.com>
 <20180524160141.fgvw6enzcmy5g2dd@MacBook-Pro-de-Roger.local>
 <c5b1d88f-00bf-65c3-2b8f-2cf3458dee50@citrix.com>
 <5B07BAEA02000078001C5D7F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B07BAEA02000078001C5D7F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDUvMjAxOCAwODoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjQuMDUuMTgg
YXQgMTg6NDgsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjQvMDUv
MTggMTc6MDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBUdWUsIE1heSAyMiwgMjAx
OCBhdCAxMjoyMDo0NlBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+IC0tLSBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bWNzLmgKPj4+PiArKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS92bXgvdm1jcy5oCj4+Pj4gQEAgLTMwNiw2ICszMDYsOCBAQCBleHRlcm4gdTY0
IHZteF9lcHRfdnBpZF9jYXA7Cj4+Pj4gICAgICAodm14X2NwdV9iYXNlZF9leGVjX2NvbnRyb2wg
JiBDUFVfQkFTRURfTU9OSVRPUl9UUkFQX0ZMQUcpCj4+Pj4gICNkZWZpbmUgY3B1X2hhc192bXhf
cGF0IFwKPj4+PiAgICAgICh2bXhfdm1lbnRyeV9jb250cm9sICYgVk1fRU5UUllfTE9BRF9HVUVT
VF9QQVQpCj4+Pj4gKyNkZWZpbmUgY3B1X2hhc192bXhfZWZlciBcCj4+Pj4gKyAgICAodm14X3Zt
ZW50cnlfY29udHJvbCAmIFZNX0VOVFJZX0xPQURfR1VFU1RfRUZFUikKPj4+IERvbid0IHlvdSBh
bHNvIG5lZWQgYSB2bXhfdm1leGl0X2NvbnRyb2wgJiBWTV9FWElUX1NBVkVfR1VFU1RfRUZFUiBh
bmQKPj4+IHZteF92bWV4aXRfY29udHJvbCAmIFZNX0VYSVRfTE9BRF9IT1NUX0VGRVI/Cj4+Pgo+
Pj4gT3IgY2FuIHRoZSBwcmVzZW5jZSBvZiB0aG9zZSB0d28gYmUgaW5mZXJyZWQgZnJvbQo+Pj4g
Vk1fRU5UUllfTE9BRF9HVUVTVF9FRkVSPwo+PiBUaGV5IHdlcmUgaW50cm9kdWNlZCBhdCB0aGUg
c2FtZSB0aW1lIGludG8gaGFyZHdhcmUsIHNvIHRoZXNlIHNldHRpbmdzCj4+IHdpbGwgYmUgdGhl
IHNhbWUgaW4gcHJhY3RpY2UuCj4gSSBzZWUgb3RoZXIgc2ltaWxhciBncm91cHMgb2YgZmVhdHVy
ZXMgYWxzbyBhcmVuJ3QgY2hlY2tlZCBmb3IgY29uc2lzdGVuY3ksCj4gYnV0IHdvdWxkbid0IGl0
IGJlIGJldHRlciB0byBoYXZlIHN1Y2ggY2hlY2tzIGluIHZteF9pbml0X3ZtY3NfY29uZmlnKCkK
PiAoaS5lLiBkaXNhYmxlIGFsbCB0aHJlZSBpZiBhdCBsZWFzdCBvbmUgb2YgdGhlbSBpcyB1bmF2
YWlsYWJsZSk/CgpDb3JyZWN0LsKgIExvZ2ljIHRvIHRoaXMgZWZmZWN0IGlzIGNvbWluZyBhcyBw
YXJ0IG9mIE5lc3RlZCBWaXJ0IHdvcmsuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
