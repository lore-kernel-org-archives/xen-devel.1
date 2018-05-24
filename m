From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/9] x86/vmx: Fix handing of MSR_DEBUGCTL on
 VMExit
Date: Thu, 24 May 2018 07:53:02 -0600
Message-ID: <5B06C3BE02000078001C5946@prv1-mh.provo.novell.com>
References: <1526988046-22948-1-git-send-email-andrew.cooper3@citrix.com>
 <1526988046-22948-6-git-send-email-andrew.cooper3@citrix.com>
 <20180524121409.gya5wpgykrtc72sg@MacBook-Pro-de-Roger.local>
 <ef08530f-99f4-589f-c504-dc46d525ade3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ef08530f-99f4-589f-c504-dc46d525ade3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA1LjE4IGF0IDE0OjM5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjQvMDUvMTggMTM6MTQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIFR1
ZSwgTWF5IDIyLCAyMDE4IGF0IDEyOjIwOjQyUE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6
Cj4+PiBDdXJyZW50bHksIHdoZW5ldmVyIHRoZSBndWVzdCB3cml0ZXMgYSBub256ZXJvIHZhbHVl
IHRvIE1TUl9ERUJVR0NUTCwgWGVuCj4+PiB1cGRhdGVzIGEgaG9zdCBNU1IgbG9hZCBsaXN0IGVu
dHJ5IHdpdGggdGhlIGN1cnJlbnQgaGFyZHdhcmUgdmFsdWUgb2YKPj4+IE1TUl9ERUJVR0NUTC4g
IFRoaXMgaXMgd3JvbmcuCj4+Pgo+Pj4gT24gVk1FeGl0LCBoYXJkd2FyZSBhdXRvbWF0aWNhbGx5
IHJlc2V0cyBNU1JfREVCVUdDVEwgdG8gMC4gIFRoZSBvbmx5IGNhc2UKPj4+IHdoZXJlIGRpZmZl
cmVudCBiZWhhdmlvdXIgaXMgbmVlZGVkIGlzIGlmIFhlbiBpcyBkZWJ1Z2dpbmcgaXRzZWxmLCBh
bmQgdGhpcwo+Pj4gbmVlZHMgc2V0dGluZyB1cCB1bmNvbmRpdGlvbmFsbHkgZm9yIHRoZSBsaWZl
dGltZSBvZiB0aGUgVk0uCj4+Pgo+Pj4gVGhlIGBsZXJgIGNvbW1hbmQgbGluZSBib29sZWFuIGlz
IHRoZSBvbmx5IHdheSB0byBjb25maWd1cmUgYW55IHVzZSBvZgo+Pj4gTVNSX0RFQlVHQ1RMIGZv
ciBYZW4sCj4+IEhtLCB0aGVyZSdzIG5vIGRvY3VtZW50YXRpb24gYXQgYWxsIGZvciB0aGUgJ2xl
cicgb3B0aW9uLgo+IAo+IDooICBJU1RSIEphbiBpbnRyb2R1Y2luZyBpdCBmb3IgZGVidWdnaW5n
IHB1cnBvc2VzLCBidXQgSSd2ZSBuZXZlciB1c2VkCj4gaXQgbXlzZWxmLgoKSW5kZWVkIEkndmUg
YmVlbiB1c2luZyB0aGlzIGEgY291cGxlIG9mIHRpbWVzIHRvIGhhdmUgYW4gaWRlYSBob3cgZXhl
Y3V0aW9uCmxlYWQgdG8gdGhlIHBvaW50IHdoZXJlIGFuIGV4Y2VwdGlvbiB3YXMgcmFpc2VkLiBU
aGUgb3B0aW9uIHByZS1kYXRlcyB0aGUKZXhpc3RlbmNlIG9mIHhlbi1jb21tYW5kLWxpbmUubWFy
a2Rvd24gYnkgc2V2ZXJhbCByZWxlYXNlcy4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
