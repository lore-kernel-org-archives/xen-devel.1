From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 1/4] xen: sched/credit1: make
 vcpu_migration_delay per-cpupool
Date: Wed, 21 Mar 2018 16:24:30 +0000
Message-ID: <0ed2b863-8258-a5d8-3736-3f8349c2a602@citrix.com>
References: <152113608271.4918.9160597572418705851.stgit@Palanthas.fritz.box>
 <152113628298.4918.7803242816493309324.stgit@Palanthas.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cavf=gl=citrix.com=prvs=61134a012=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eyger-0001uZ-CL
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 16:32:13 +0000
In-Reply-To: <152113628298.4918.7803242816493309324.stgit@Palanthas.fritz.box>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTUvMjAxOCAwNTo1MSBQTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gUmlnaHQgbm93
LCB2Q1BVIG1pZ3JhdGlvbiBkZWxheSBpcyBjb250cm9sbGVkIGJ5Cj4gdGhlIHZjcHVfbWlncmF0
aW9uX2RlbGF5IGJvb3QgcGFyYW1ldGVyLiBUaGlzIG1lYW5zCj4gdGhlIHNhbWUgdmFsdWUgd2ls
bCBhbHdheXMgYmUgdXNlZCBmb3IgZXZlcnkgaW5zdGFuY2UKPiBvZiBDcmVkaXQxLCBpbiBhbnkg
Y3B1cG9vbCB0aGF0IHdpbGwgYmUgY3JlYXRlZC4KPiAKPiBBbHNvLCBpbiBvcmRlciB0byBnZXQg
YW5kIHNldCBzdWNoIHZhbHVlLCBhIHNwZWNpYWwKPiBwdXJwb3NlIGxpYnhjIGludGVyZmFjZSBp
cyBkZWZpbmVkLCBhbmQgdXNlZCBieSB0aGUKPiB4ZW5wbSB0b29sLiBBbmQgdGhpcyBpcyBwcm9i
bGVtYXRpYyBpZiBYZW4gaXMgYnVpbHQKPiB3aXRob3V0IENyZWRpdDEgc3VwcG9ydC4KPiAKPiBU
aGlzIGNvbW1pdCBhZGRzIGEgdmNwdV9taWdyX2RlbGF5IGZpZWxkIGluc2lkZQo+IHN0cnVjdCBj
c2NoZWRfcHJpdmF0ZSwgc28gdGhhdCB3ZSBjYW4gZ2V0L3NldCB0aGUKPiBtaWdyYXRpb24gZGVs
YXkgaW5kZXBlbnRseSBmb3IgZWFjaCBDcmVkaXQxIGluc3RhbmNlLAo+IGluIGRpZmZlcmVudCBj
cHVwb29scy4KPiAKPiBHZXR0aW5nIGFuZCBzZXR0aW5nIG5vdyBoYXBwZW5zIHZpYSBYRU5fU1lT
Q1RMX1NDSEVET1BfKiwKPiB3aGljaCBpcyBtdWNoIGJldHRlciBzdWl0ZWQgZm9yIHRoaXMgcGFy
YW1ldGVyLgo+IAo+IFRoZSB2YWx1ZSBvZiB0aGUgYm9vdCB0aW1lIHBhcmFtZXRlciBpcyB1c2Vk
IGZvcgo+IGluaXRpYWxpemluZyB0aGUgdmNwdV9taWdyX2RlbGF5IGZpZWxkIG9mIHRoZSBwcml2
YXRlCj4gc3RydWN0dXJlIG9mIGFsbCB0aGUgc2NoZWR1bGVyIGluc3RhbmNlcywgd2hlbiB0aGV5
J3JlCj4gY3JlYXRlZC4KPiAKPiBXaGlsZSB0aGVyZSwgc2F2ZSByZWFkaW5nIE5PVygpIGFuZCBk
b2luZyBhbnkgc190aW1lX3QKPiBvcGVyYXRpb24sIHdoZW4gdGhlIG1pZ3JhdGlvbiBkZWxheSBv
ZiBhIHNjaGVkdWxlciBpcwo+IHplcm8gKGFzIGl0IGlzLCBieSBkZWZhdWx0KSwgaW4KPiBfX2Nz
Y2hlZF92Y3B1X2lzX2NhY2hlX2hvdCgpLgo+IAo+IEZpbmFsbHksIG5vdGUgdGhhdCwgZnJvbSB0
aGlzIGNvbW1pdCBvbiwgdXNpbmcgYHhlbnBtCj4ge3NldCxnZXR9LXZjcHUtbWlncmF0aW9uLWRl
bGF5JyB3aWxsIGhhdmUgbm8gZWZmZWN0Cj4gYW55IGxvbmdlci4gQSBzdWJzZXF1ZW50IGNvbW1p
dCB3aWxsIHJlLWVuYWJsZSBpdCwgZm9yCj4gdGhlIHNha2Ugb2YgYmFja3dhcmRzLWNvbXBhdGli
aWxpdHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNl
LmNvbT4KCkxvb2tzIGdvb2QsIHRoYW5rcyEKClJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxn
ZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
