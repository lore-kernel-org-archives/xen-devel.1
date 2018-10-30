From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5] arch/x86: Add registers to vm_event
Date: Tue, 30 Oct 2018 07:19:06 -0600
Message-ID: <5BD85A4A02000078001F6516@prv1-mh.provo.novell.com>
References: <20181030100651.19975-1-aisaila@bitdefender.com>
 <5BD8418902000078001F644F@prv1-mh.provo.novell.com>
 <c3323148-9cfb-3b69-59cc-aaaa012be1ff@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kgbc=nk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHTvM-0007WG-DS
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 13:19:12 +0000
In-Reply-To: <c3323148-9cfb-3b69-59cc-aaaa012be1ff@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjEwLjE4IGF0IDEzOjI2LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMTAvMzAvMTggMTozMyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDMw
LjEwLjE4IGF0IDExOjA3LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Pj4gLS0t
IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy92bV9ldmVudC5oCj4+PiBAQCAtMjksNyArMjksNyBAQAo+Pj4gIAo+Pj4gICNpbmNsdWRl
ICJ4ZW4uaCIKPj4+ICAKPj4+IC0jZGVmaW5lIFZNX0VWRU5UX0lOVEVSRkFDRV9WRVJTSU9OIDB4
MDAwMDAwMDMKPj4+ICsjZGVmaW5lIFZNX0VWRU5UX0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAw
MDQKPj4+ICAKPj4+ICAjaWYgZGVmaW5lZChfX1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xT
X18pCj4+PiAgCj4+PiBAQCAtMTU3LDYgKzE1NywxMiBAQAo+Pj4gICNkZWZpbmUgVk1fRVZFTlRf
WDg2X0NSNCAgICAyCj4+PiAgI2RlZmluZSBWTV9FVkVOVF9YODZfWENSMCAgIDMKPj4+ICAKPj4+
ICsvKiBUaGUgbGltaXQgZmllbGQgaXMgcmlnaHQtc2hpZnRlZCBieSAxMiBiaXRzIGlmIC5hci5n
IGlzIHNldC4gKi8KPj4+ICtzdHJ1Y3QgeDg2X3NlbGVjdG9yX3JlZyB7Cj4+IAo+PiBJJ20gc29y
cnkgZm9yIG5vdCBoYXZpbmcgbm90aWNlZCB0aGlzIGVhcmxpZXIsIGJ1dCB0aGlzIG5lZWRzIHBy
b3Blcgo+PiBwcmVmaXhpbmc6IE1hdGNoaW5nIHN0cnVjdCB2bV9ldmVudF9yZWdzX3g4NiwgaXQg
c2hvdWxkIGF0IGxlYXN0Cj4+IGJlIHByZWZpeGVkIGJ5IHZtX2V2ZW50Xy4gU3RyaWN0bHkgc3Bl
YWtpbmcgeGVuXyBhcyB0aGUgdmVyeQo+PiBmaXJzdCB0aGluZyB3b3VsZCBhbHNvIGJlIHJlcXVp
cmVkLCBidXQgSSdsbCBsZWF2ZSB0aGF0IHRvIHRoZSBWTQo+PiBldmVudCBtYWludGFpbmVycyB0
byBkZWNpZGUuIFdpdGggdGhpcwo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+IAo+IEkgYW0gZmluZSB3aXRoIGVpdGhlciBhcHByb2FjaCAoc28gbGVhdmlu
ZyBpdCBhcyBpdCBpcyBub3QgYSBwcm9ibGVtKSwKPiBzbyB3ZSdsbCBnbyB3aXRoIFRhbWFzJyBw
cmVmZXJlbmNlLiBUYW1hcywgd2hhdCdzIHlvdXIgb3Bpbmlvbj8KCkZBT0QgbGVhdmluZyBhcyBp
cyBpcyBub3QgYW4gb3B0aW9uIC0gYXQgbGVhc3Qgdm1fZXZlbnRfIG5lZWRzIHRvCmJlIGFkZGVk
LCB0byBub3QgY2hhbmNlIGNvbGxpc2lvbiB3aXRoIGEgZnV0dXJlIGFkZGl0aW9uIGluIFhlbiBp
dHNlbGYuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
