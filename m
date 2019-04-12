From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] RFC: x86/mm: conditionally check
 page_lock/page_unlock ownership
Date: Fri, 12 Apr 2019 06:01:33 -0600
Message-ID: <5CB07E1D0200007800226E14@prv1-mh.provo.novell.com>
References: <20190412042930.2867-1-tamas@tklengyel.com>
 <20190412042930.2867-2-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEuu7-0000mK-DI
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 12:03:35 +0000
In-Reply-To: <20190412042930.2867-2-tamas@tklengyel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA0LjE5IGF0IDA2OjI5LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
UGF0Y2ggY2Y0YjMwZGNhMGEgIkFkZCBkZWJ1ZyBjb2RlIHRvIGRldGVjdCBpbGxlZ2FsIHBhZ2Vf
bG9jayBhbmQgcHV0X3BhZ2VfdHlwZQo+IG9yZGVyaW5nIiBhZGRlZCBleHRyYSBzYW5pdHkgY2hl
Y2tpbmcgdG8gcGFnZV9sb2NrL3BhZ2VfdW5sb2NrIGZvciBkZWJ1ZyBidWlsZHMKPiB3aXRoIHRo
ZSBhc3N1bXB0aW9uIHRoYXQgbm8gaHlwZXJ2aXNvciBwYXRoIGV2ZXIgbG9ja3MgdHdvIHBhZ2Vz
IGF0IG9uY2UuCj4gCj4gVGhpcyBhc3N1bXB0aW9uIGRvZXNuJ3QgaG9sZCBkdXJpbmcgbWVtb3J5
IHNoYXJpbmcuCgpBIGZ1bmRhbWVudGFsIHF1ZXN0aW9uIGlzIC0gZG9lc24ndCBtZW0tc2hhcmlu
ZyBhYnVzZSBwYWdlX2xvY2soKT8KSSd2ZSBuZXZlciB1bmRlcnN0b29kIHdoeSBpdCB1c2VzIGl0
LCBhbmQgYmFjayB3aGVuIGl0IHdhcyBpbnRyb2R1Y2VkCnRoZSBmdW5jdGlvbiBjbGVhcmx5IHdh
c24ndCBtZWFudCB0byBiZSB1c2VkIG91dHNpZGUgb2YgUFYgbWVtb3J5Cm1hbmFnZW1lbnQgY29k
ZS4KCk9uZSBtaW5pbWFsIHJlbWFyayBvbiB0aGUgcGF0Y2ggaXRzZWxmOiBQbGVhc2UgdXNlIHRy
dWUvZmFsc2UgaW5zdGVhZApvZiAxLzAgd2hlbiBwYXNzaW5nIGJvb2wgYXJndW1lbnRzLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
