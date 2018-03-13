From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [Qemu-devel] [RFC PATCH 00/30] Xen Q35 Bringup
 patches + support for PCIe Extended Capabilities for passed through devices
Date: Tue, 13 Mar 2018 09:21:54 +0000
Message-ID: <20180313092154.GA3048@redhat.com>
References: <cover.1520867740.git.x1917x@gmail.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ndcn=gd=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1evg8D-00011R-AJ
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 09:22:05 +0000
Content-Disposition: inline
In-Reply-To: <cover.1520867740.git.x1917x@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey Gerasimenko <x1917x@gmail.com>
Cc: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
List-Id: xen-devel@lists.xenproject.org

VGhlIHN1YmplY3QgbGluZSBzYXlzIHRvIGV4cGVjdCAzMCBwYXRjaGVzLCBidXQgeW91J3ZlIG9u
bHkgc2VudCAxOCB0bwp0aGUgbGlzdCBoZXJlLiBJIGV2ZW50dWFsbHkgZmlndXJlZCBvdXQgdGhh
dCB0aGUgZmlyc3QgMTIgcGF0Y2hlcyB3ZXJlCmluIFhlbiBjb2RlIGFuZCBzbyBub3Qgc2VudCB0
byBxZW11LWRldmVsLgoKRm9yIGZ1dHVyZSBpZiB5b3UgaGF2ZSBjaGFuZ2VzIHRoYXQgYWZmZWN0
IG11bHRpcGxlIGNvbXBsZXRlbHkgc2VwYXJhdGUKcHJvamVjdHMsIHNlbmQgdGhlbSBhcyBzZXBh
cmF0ZSBzZXJpZXMuIGllIGp1c3Qgc2VuZCBQQVRDSCAwMC8xOCB0bwpRRU1VIGRldmVsIHNvIGl0
IGRvZXNuJ3QgbG9vayBsaWtlIGEgYnVuY2ggb2YgcGF0Y2hlcyBoYXZlIGdvbmUgbWlzc2luZy4K
Ck9uIFR1ZSwgTWFyIDEzLCAyMDE4IGF0IDA0OjMzOjQ1QU0gKzEwMDAsIEFsZXhleSBHZXJhc2lt
ZW5rbyB3cm90ZToKPiBIb3cgdG8gdXNlIHRoZSBRMzUgZmVhdHVyZToKPiAKPiBBIG5ldyBkb21h
aW4gY29uZmlnIG9wdGlvbiB3YXMgaW1wbGVtZW50ZWQ6IGRldmljZV9tb2RlbF9tYWNoaW5lLiBJ
dCdzCj4gYSBzdHJpbmcgd2hpY2ggaGFzIGZvbGxvd2luZyBwb3NzaWJsZSB2YWx1ZXM6Cj4gLSAi
aTQ0MCIgLS0gaTQ0MCBlbXVsYXRpb24gKGRlZmF1bHQpCj4gLSAicTM1IiAgLS0gZW11bGF0ZSBh
IFEzNSBtYWNoaW5lLiBCeSBkZWZhdWx0LCB0aGUgc3RvcmFnZSBpbnRlcmZhY2UgaXMKPiAgIEFI
Q0kuCgpQcmVzdW1hYmx5IHRoaXMgaXMgbWFwcGluZyB0byB0aGUgUUVNVSAtbWFjaGluZSBhcmcs
IHNvIGl0IGZlZWxzIGRlc2lyYWJsZQp0byBrZWVwIHRoZSBzYW1lIG5hbWluZyBzY2hlbWUuIGll
IGFsbG93IGFueSBvZiB0aGUgdmVyc2lvbmVkIG1hY2hpbmUKbmFtZXMgdGhhdCBRRU1VIHVzZXMu
IGVnIGFueSBvZiAicGMtcTM1LTIueCIgdmVyc2lvbmVkIHR5cGVzLCBvciAncTM1JyBhcwphbiBh
bGlhcyBmb3IgbGF0ZXN0LCBhbmQgdXNlICJwYy1pNDQwZngtMi54IiB2ZXJzaW9uZWQgdHlwZXMg
b2YgJ3BjJyBhcwphbiBhbGlhcyBmb3IgbGF0ZXN0LCByYXRoZXIgdGhhbiAnaTQ0MCcgd2hpY2gg
aXMgbmVlZGxlc3NseSBkaXZlcmluZwpmcm9tIHRoZSBRRU1VIG1hY2hpbmUgdHlwZS4KClJlZ2Fy
ZHMsCkRhbmllbAotLSAKfDogaHR0cHM6Ly9iZXJyYW5nZS5jb20gICAgICAtby0gICAgaHR0cHM6
Ly93d3cuZmxpY2tyLmNvbS9waG90b3MvZGJlcnJhbmdlIDp8Cnw6IGh0dHBzOi8vbGlidmlydC5v
cmcgICAgICAgICAtby0gICAgICAgICAgICBodHRwczovL2ZzdG9wMTM4LmJlcnJhbmdlLmNvbSA6
fAp8OiBodHRwczovL2VudGFuZ2xlLXBob3RvLm9yZyAgICAtby0gICAgaHR0cHM6Ly93d3cuaW5z
dGFncmFtLmNvbS9kYmVycmFuZ2UgOnwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
