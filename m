From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/9] x86/vmx: Fix handing of MSR_DEBUGCTL on
 VMExit
Date: Tue, 22 May 2018 13:53:06 +0100
Message-ID: <8a3983fc-e08b-a807-8dd9-08b21a92e344@citrix.com>
References: <1526988046-22948-1-git-send-email-andrew.cooper3@citrix.com>
 <1526988046-22948-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1526988046-22948-6-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMTggMTI6MjAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gQ3VycmVudGx5LCB3aGVu
ZXZlciB0aGUgZ3Vlc3Qgd3JpdGVzIGEgbm9uemVybyB2YWx1ZSB0byBNU1JfREVCVUdDVEwsIFhl
bgo+IHVwZGF0ZXMgYSBob3N0IE1TUiBsb2FkIGxpc3QgZW50cnkgd2l0aCB0aGUgY3VycmVudCBo
YXJkd2FyZSB2YWx1ZSBvZgo+IE1TUl9ERUJVR0NUTC4gIFRoaXMgaXMgd3JvbmcuCj4KPiBPbiBW
TUV4aXQsIGhhcmR3YXJlIGF1dG9tYXRpY2FsbHkgcmVzZXRzIE1TUl9ERUJVR0NUTCB0byAwLiAg
VGhlIG9ubHkgY2FzZQo+IHdoZXJlIGRpZmZlcmVudCBiZWhhdmlvdXIgaXMgbmVlZGVkIGlzIGlm
IFhlbiBpcyBkZWJ1Z2dpbmcgaXRzZWxmLCBhbmQgdGhpcwo+IG5lZWRzIHNldHRpbmcgdXAgdW5j
b25kaXRpb25hbGx5IGZvciB0aGUgbGlmZXRpbWUgb2YgdGhlIFZNLgo+Cj4gVGhlIGBsZXJgIGNv
bW1hbmQgbGluZSBib29sZWFuIGlzIHRoZSBvbmx5IHdheSB0byBjb25maWd1cmUgYW55IHVzZSBv
Zgo+IE1TUl9ERUJVR0NUTCBmb3IgWGVuLCBzbyB0aWUgdGhlIGhvc3QgbG9hZCBsaXN0IGVudHJ5
IHRvIHRoaXMgc2V0dGluZyBpbgo+IGNvbnN0cnVjdF92bWNzKCkuICBBbnkgcnVudGltZSB1cGRh
dGUgb2YgWGVuJ3MgTVNSX0RFQlVHQ1RMIHNldHRpbmcgcmVxdWlyZXMKPiBtb3JlIGNvbXBsaWNh
dGVkIHN5bmNocm9uaXNhdGlvbiBhY3Jvc3MgYWxsIHRoZSBydW5uaW5nIFZNcy4KPgo+IEluIHRo
ZSBleGNlZWRpbmdseSBjb21tb24gY2FzZSwgdGhpcyBhdm9pZHMgdGhlIHVubmVjZXNzYXJ5IG92
ZXJoZWFkIG9mIGhhdmluZwo+IGEgaG9zdCBsb2FkIGVudHJ5IHBlcmZvcm1pbmcgdGhlIHNhbWUg
emVyb2luZyBvcGVyYXRpb24gdGhhdCBoYXJkd2FyZSBoYXMKPiBhbHJlYWR5IHBlcmZvcm1lZCBh
cyBwYXJ0IG9mIHRoZSBWTUV4aXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKU28gYWZ0ZXIgZG9pbmcgc29tZSBhcmNoYWVvbG9n
eSwgdGhlIGxhc3QgbWVhbmluZ2Z1bCBjaGFuZ2UgdG8gREVCVUdDVEwKaGFuZGluZyB3YXMgYy9z
IGRmYTYyNWUxICJWTVg6IGZpeCBEZWJ1Z0N0bCBNU1IgY2xlYXJpbmciIGluIFhlbiA0LjUsCmJ1
dCB0aGUgdW5kZXJseWluZyBsb2dpYyBoYXMgYmVlbiBicm9rZW4gc2luY2UgaXRzIGludHJvZHVj
dGlvbiBpbgowYWU5ZWY1NWEgInZteDogbGFzdCBicmFuY2ggcmVjb3JkaW5nIE1TUiBlbXVsYXRp
b24iIGluIDIwMDcuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
