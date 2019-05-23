From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] libacpi: report PCI slots as enabled only
 for hotpluggable devices
Date: Thu, 23 May 2019 02:57:49 -0600
Message-ID: <5CE6608D02000078002319C3@prv1-mh.provo.novell.com>
References: <1558548634-25154-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTjXt-00055f-OE
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 08:57:53 +0000
In-Reply-To: <1558548634-25154-1-git-send-email-igor.druzhinin@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE5IGF0IDIwOjEwLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRFNEVCBmb3IgcWVtdS14ZW4gbGFja3MgX1NUQSBtZXRob2Qgb2YgUENJIHNsb3Qgb2Jq
ZWN0LiBJZiBfU1RBIG1ldGhvZAo+IGRvZXNuJ3QgZXhpc3QgdGhlbiB0aGUgc2xvdCBpcyBhc3N1
bWVkIHRvIGJlIGFsd2F5cyBwcmVzZW50IGFuZCBhY3RpdmUKPiB3aGljaCBpbiBjb25qdW5jdGlv
biB3aXRoIF9FSjAgbWV0aG9kIG1ha2VzIGV2ZXJ5IGRldmljZSBlamVjdGFibGUgZm9yCj4gYW4g
T1MgZXZlbiBpZiBpdCdzIG5vdCB0aGUgY2FzZS4KPiAKPiBxZW11LWt2bSBpcyBhYmxlIHRvIGR5
bmFtaWNhbGx5IGFkZCBfRUowIG1ldGhvZCBvbmx5IHRvIHRob3NlIHNsb3RzCj4gdGhhdCBlaXRo
ZXIgaGF2ZSBob3RwbHVnZ2FibGUgZGV2aWNlcyBvciBmcmVlIGZvciBQQ0kgcGFzc3Rocm91Z2gu
Cj4gQXMgWGVuIGxhY2tzIHRoaXMgY2FwYWJpbGl0eSB3ZSBjYW5ub3QgdXNlIHRoZWlyIHdheS4K
PiAKPiBxZW11LXhlbi10cmFkaXRpb25hbCBEU0RUIGhhcyBfU1RBIG1ldGhvZCB3aGljaCBvbmx5
IHJlcG9ydHMgdGhhdAo+IHRoZSBzbG90IGlzIHByZXNlbnQgaWYgdGhlcmUgaXMgYSBQQ0kgZGV2
aWNlcyBob3RwbHVnZ2VkIHRoZXJlLgo+IFRoaXMgaXMgZG9uZSB0aHJvdWdoIHF1ZXJ5aW5nIG9m
IGl0cyBQQ0kgaG90cGx1ZyBjb250cm9sbGVyLgo+IHFlbXUteGVuIGhhcyBzaW1pbGFyIGNhcGFi
aWxpdHkgdGhhdCByZXBvcnRzIGlmIGRldmljZSBpcyAiaG90cGx1Z2dhYmxlCj4gb3IgYWJzZW50
IiB3aGljaCB3ZSBjYW4gdXNlIHRvIGFjaGlldmUgdGhlIHNhbWUgcmVzdWx0Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgoKUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
