From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/altp2m: cleanup p2m_altp2m_lazy_copy
Date: Fri, 12 Apr 2019 17:48:09 +0100
Message-ID: <cf39f8c3-fd03-9be1-c5e8-94bde833f829@citrix.com>
References: <20190412163932.2087-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04/T=SO=citrix.com=prvs=998838f76=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hEzLZ-0006yu-DW
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 16:48:13 +0000
In-Reply-To: <20190412163932.2087-1-tamas@tklengyel.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDQvMjAxOSAxNzozOSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFRoZSBwMm1fYWx0
cDJtX2xhenlfY29weSBpcyByZXNwb25zaWJsZSBmb3IgbGF6aWx5IHBvcHVsYXRpbmcgYW4gYWx0
cDJtIHZpZXcKPiB3aGVuIHRoZSBndWVzdCB0cmFwcyBvdXQgZHVlIHRvIG5vIEVQVCBlbnRyeSBi
ZWluZyBwcmVzZW50IGluIHRoZSBhY3RpdmUgdmlldy4KPiBDdXJyZW50bHkgdGhlIGZ1bmN0aW9u
IHRvb2sgc2V2ZXJhbCBpbnB1dHMgdGhhdCBpdCBkaWRuJ3QgdXNlIGFuZCBhbHNvCj4gbG9ja2Vk
L3VubG9ja2VkIGdmbnMgd2hlbiBpdCBkaWRuJ3QgbmVlZCB0by4KCkkndmUgZ290IGEgc2VyaWVz
LCAiW1BBVENIIDAwLzE0XSBYU0EtMjc3IGZvbGxvd3VwIiB3aGljaCBpcyBzdGlsbAp3YWl0aW5n
IGZvciBtbSByZXZpZXcsIHdoaWNoIGNsZWFucyBzb21lIG9mIHRoaXMgdXAsIGJ1dCBjYW1lIHRv
IGEKZGlmZmVyZW50IGNvbmNsdXNpb24gYWJvdXQgdGhlIGxvY2tpbmcgc2FmZXR5IG9mIHRoZSBH
Rk5zLgoKU3BlY2lmaWNhbGx5LAoKW1BBVENIIDA0LzE0XSB4ODYvcDJtOiBGaXggbG9ja2luZyBp
biBwMm1fYWx0cDJtX2xhenlfY29weSgpCgooYW5kIHNvbWUgb3RoZXIgY2xlYW51cCBjaGFuZ2Vz
IGluIHBhdGNoIDUgYW5kIDYpIHdoaWNoIGV4dGVuZHMgdGhlCmR1cmF0aW9uIG9mIHRoZSBnZm4g
bG9ja3MuCgpJIGFkbWl0IHRoYXQgSSBoYWRuJ3Qgc3BvdHRlZCB0aGF0IGdwYS9nbGEvbnBmZWMg
d2FzIHVubmVjZXNzYXJ5LCBhbmQKdGhhdCBkb2VzIGxvb2sgbGlrZSBhbiBpbXByb3ZlbWVudC4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
