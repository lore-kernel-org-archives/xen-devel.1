From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 0/8] xen: dma-buf support for grant device
Date: Wed, 30 May 2018 21:46:28 -0400
Message-ID: <9687b6e5-808e-0c63-34c3-90e6fcbdfb2e__11806.8784744993$1527746628$gmane$org@oracle.com>
References: <20180525153331.31188-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oh9n=is=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fOGhv-0001zL-Hw
 for xen-devel@lists.xenproject.org; Thu, 31 May 2018 06:05:07 +0000
In-Reply-To: <20180525153331.31188-1-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNS8yNS8yMDE4IDExOjMzIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToK
Cj4gCj4gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gKDgpOgo+ICAgIHhlbi9ncmFudC10YWJsZTog
TWFrZSBzZXQvY2xlYXIgcGFnZSBwcml2YXRlIGNvZGUgc2hhcmVkCj4gICAgeGVuL2JhbGxvb246
IE1vdmUgY29tbW9uIG1lbW9yeSByZXNlcnZhdGlvbiByb3V0aW5lcyB0byBhIG1vZHVsZQo+ICAg
IHhlbi9ncmFudC10YWJsZTogQWxsb3cgYWxsb2NhdGluZyBidWZmZXJzIHN1aXRhYmxlIGZvciBE
TUEKPiAgICB4ZW4vZ250ZGV2OiBBbGxvdyBtYXBwaW5ncyBmb3IgRE1BIGJ1ZmZlcnMKPiAgICB4
ZW4vZ250ZGV2OiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBkbWEtYnVmIFVBUEkKPiAgICB4ZW4v
Z250ZGV2OiBJbXBsZW1lbnQgZG1hLWJ1ZiBleHBvcnQgZnVuY3Rpb25hbGl0eQo+ICAgIHhlbi9n
bnRkZXY6IEltcGxlbWVudCBkbWEtYnVmIGltcG9ydCBmdW5jdGlvbmFsaXR5Cj4gICAgeGVuL2du
dGRldjogRXhwb3NlIGdudGRldidzIGRtYS1idWYgQVBJIGZvciBpbi1rZXJuZWwgdXNlCj4gCj4g
ICBkcml2ZXJzL3hlbi9LY29uZmlnICAgICAgICAgICB8ICAgMjMgKwo+ICAgZHJpdmVycy94ZW4v
TWFrZWZpbGUgICAgICAgICAgfCAgICAxICsKPiAgIGRyaXZlcnMveGVuL2JhbGxvb24uYyAgICAg
ICAgIHwgICA3MSArLS0KPiAgIGRyaXZlcnMveGVuL2dudGRldi5jICAgICAgICAgIHwgMTAyNSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KCgpJIHRoaW5rIHRoaXMgY2FsbHMgZm9y
IGdudGRldl9kbWEuYy4gSSBvbmx5IGhhZCBhIHF1aWNrIGxvb2sgb3ZlciBnbnRkZXYgCmNoYW5n
ZXMgYnV0IHRoZXkgdmVyeSBtdWNoIGFyZSBjb25jZW50cmF0ZWQgaW4gZG1hLXNwZWNpZmljIHJv
dXRpbmVzLgoKWW91IGVzc2VudGlhbGx5IG9ubHkgc2hhcmUgZmlsZV9vcGVyYXRpb25zIGVudHJ5
IHBvaW50cyB3aXRoIG9yaWdpbmFsIApnbnRkZXYgY29kZSwgcmlnaHQ/CgotYm9yaXMKCgo+ICAg
ZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyAgICAgfCAgMTc2ICsrKysrLQo+ICAgZHJpdmVycy94
ZW4vbWVtLXJlc2VydmF0aW9uLmMgfCAgMTM0ICsrKysrCj4gICBpbmNsdWRlL3VhcGkveGVuL2du
dGRldi5oICAgICB8ICAxMDYgKysrKwo+ICAgaW5jbHVkZS94ZW4vZ3JhbnRfZGV2LmggICAgICAg
fCAgIDM3ICsrCj4gICBpbmNsdWRlL3hlbi9ncmFudF90YWJsZS5oICAgICB8ICAgMjggKwo+ICAg
aW5jbHVkZS94ZW4vbWVtX3Jlc2VydmF0aW9uLmggfCAgIDI5ICsKPiAgIDEwIGZpbGVzIGNoYW5n
ZWQsIDE1MjcgaW5zZXJ0aW9ucygrKSwgMTAzIGRlbGV0aW9ucygtKQo+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMveGVuL21lbS1yZXNlcnZhdGlvbi5jCj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS94ZW4vZ3JhbnRfZGV2LmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L3hlbi9tZW1fcmVzZXJ2YXRpb24uaAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
