From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 01/12] libacpi: new DSDT ACPI table for
 Q35
Date: Mon, 19 Mar 2018 12:43:05 +0000
Message-ID: <20180319124305.f6v5khq6cuweylr5@MacBook-Pro-de-Roger.local>
References: <cover.1520867740.git.x1917x@gmail.com>
 <6034032fd5b70667515f9ae4f988b024f0015344.1520867740.git.x1917x@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bmhu=gj=citrix.com=prvs=6096ac43a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1exu8A-0005kK-Aa
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 12:43:14 +0000
Content-Disposition: inline
In-Reply-To: <6034032fd5b70667515f9ae4f988b024f0015344.1520867740.git.x1917x@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey Gerasimenko <x1917x@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDQ6MzM6NDZBTSArMTAwMCwgQWxleGV5IEdlcmFzaW1l
bmtvIHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgRFNEVCB0YWJsZSBmb3IgUTM1IChuZXcg
dG9vbHMvbGliYWNwaS9kc2R0X3EzNS5hc2wKPiBmaWxlKS4gVGhlcmUgYXJlIG5vdCBtYW55IGRp
ZmZlcmVuY2VzIHdpdGggZHNkdC5hc2wgKGZvciBpNDQwKSBhdCB0aGUKPiBtb21lbnQsIG5hbWVs
eToKPiAKPiAtIEJERiBsb2NhdGlvbiBvZiBMUEMgQ29udHJvbGxlcgo+IC0gTWlub3IgY2hhbmdl
cyByZWxhdGVkIHRvIEZEQyBkZXRlY3Rpb24KPiAtIEFkZGl0aW9uIG9mIF9PU0MgbWV0aG9kIHRv
IGluZm9ybSBPU1BNIGFib3V0IFBDSWUgZmVhdHVyZXMgc3VwcG9ydGVkCj4gCj4gQXMgd2UgYXJl
IHN0aWxsIHVzaW5nIDQgUENJIHJvdXRlciBsaW5rcyBhbmQgdGhlaXIgY29ycmVzcG9uZGluZwo+
IGRldmljZS9yZWdpc3RlciBhZGRyZXNzZXMgYXJlIHNhbWUgKG9mZnNldCAweDYwKSwgbm8gbmVl
ZCB0byBjaGFuZ2UgUENJCj4gcm91dGluZyBkZXNjcmlwdGlvbnMuCj4gCj4gQWxzbywgQUNQSSBo
b3RwbHVnIGlzIHN0aWxsIHVzZWQgdG8gY29udHJvbCBwYXNzZWQgdGhyb3VnaCBkZXZpY2UgaG90
Cj4gKHVuKXBsdWcgKGFzIGl0IHdhcyBmb3IgaTQ0MCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxl
eGV5IEdlcmFzaW1lbmtvIDx4MTkxN3hAZ21haWwuY29tPgo+IC0tLQo+ICB0b29scy9saWJhY3Bp
L2RzZHRfcTM1LmFzbCB8IDU1MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKClNvIHRoaXMgaXMgYmFzaWNhbGx5IGEgbW9kaWZpZWQgZHVwZSBvZiB0aGUgY3Vy
cmVudCBkc2R0LmFzbD8gQUZBSUNUCnRoZXJlIGFyZSBhIGJ1bmNoIG9mIGNvbW1vbiBiaXRzLCB3
aGljaCBpZGVhbGx5IHdlIHdhbnQgdG8gaGF2ZQpkZWZpbmVkIGluIGEgc2luZ2xlIHBsYWNlLgoK
Q2FuJ3QgeW91IGZhY3RvciBvdXQgdGhlIGNvbW1vbiBwYXJ0cyBvZiB0aGUgZHNkdC5hc2wgaW50
byBzbWFsbGVyCnBhcnRzIGFuIGluY2x1ZGUgdGhlbSBmb3IgYm90aCBkc2R0LmFzbCBhbmQgZHNk
dF9xMzUuYXNsPwoKSSB3b3VsZCBmaXJzdCBoYXZlIGEgcGF0Y2ggdGhhdCBleHRyYWN0IHRoZSBj
b21tb24gcGFydHMgb2YgdGhlCmRzZHQgaW50byBmaWxlKHMpLCBhbmQgdGhlbiBhIHNlY29uZCBw
YXRjaCB3aGljaCBjcmVhdGVzIGEKZHNkdF9xMzUuYXNsIGJhc2VkIG9uIHRob3NlIGNvbW1vbiBi
aXRzIHBsdXMgdGhlIHNwZWNpZmljIHEzNSBjb2RlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
