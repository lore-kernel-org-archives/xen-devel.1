From: Pasha Tatashin <Pavel.Tatashin@microsoft.com>
Subject: Re: [PATCH RFCv2 6/6] memory-hotplug.txt: Add some
 details about locking internals
Date: Thu, 30 Aug 2018 19:38:43 +0000
Message-ID: <b46f358b-8fea-b380-1978-5f3e772130d4__7037.29958409003$1535657849$gmane$org@microsoft.com>
References: <20180821104418.12710-1-david@redhat.com>
 <20180821104418.12710-7-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uez1=ln=microsoft.com=pavel.tatashin@srs-us1.protection.inumbo.net>)
 id 1fvSmG-0007t7-3C
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 19:38:48 +0000
In-Reply-To: <20180821104418.12710-7-david@redhat.com>
Content-Language: en-US
Content-ID: <9F9046A8AD873D478941CC2B49BDEB5E@namprd21.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Cc: Michal Hocko <mhocko@suse.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: xen-devel@lists.xenproject.org

DQpSZXZpZXdlZC1ieTogUGF2ZWwgVGF0YXNoaW4gPHBhdmVsLnRhdGFzaGluQG1pY3Jvc29mdC5j
b20+DQoNCk9uIDgvMjEvMTggNjo0NCBBTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6DQo+IExl
dCdzIGRvY3VtZW50IHRoZSBtYWdpYyBhIGJpdCwgZXNwZWNpYWxseSB3aHkgZGV2aWNlX2hvdHBs
dWdfbG9jayBpcw0KPiByZXF1aXJlZCB3aGVuIGFkZGluZy9yZW1vdmluZyBtZW1vcnkgYW5kIGhv
dyBpdCBhbGwgcGxheSB0b2dldGhlciB3aXRoDQo+IHJlcXVlc3RzIHRvIG9ubGluZS9vZmZsaW5l
IG1lbW9yeSBmcm9tIHVzZXIgc3BhY2UuDQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
