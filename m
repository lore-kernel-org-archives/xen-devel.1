From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: remove size limit of privcmd-buf
 mapping interface
Date: Thu, 1 Nov 2018 15:23:09 +0100
Message-ID: <b64f7fa4-a553-bcb4-6051-c91080642b8e__37781.4995394603$1541082117$gmane$org@suse.com>
References: <20181101123307.8424-1-jgross@suse.com>
 <5BDB0B240200007800142507@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=4oi9=nm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gIDsP-0001hO-N7
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 14:23:13 +0000
In-Reply-To: <5BDB0B240200007800142507@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, sstabellini@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTEvMjAxOCAxNToxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPiAxMS8wMS8xOCAxOjM0IFBNID4+Pgo+PiBDdXJyZW50bHkgdGhl
IHNpemUgb2YgaHlwZXJjYWxsIGJ1ZmZlcnMgYWxsb2NhdGVkIHZpYQo+PiAvZGV2L3hlbi9oeXBl
cmNhbGwgaXMgbGltaXRlZCB0byBhIGRlZmF1bHQgb2YgNjQgbWVtb3J5IHBhZ2VzLiBGb3IgbGl2
ZQo+PiBtaWdyYXRpb24gb2YgZ3Vlc3RzIHRoaXMgbWlnaHQgYmUgdG9vIHNtYWxsIGFzIHRoZSBw
YWdlIGRpcnR5IGJpdG1hc2sKPj4gbmVlZHMgdG8gYmUgc2l6ZWQgYWNjb3JkaW5nIHRvIHRoZSBz
aXplIG9mIHRoZSBndWVzdC4gVGhpcyBtZWFucwo+PiBtaWdyYXRpbmcgYSA4R0Igc2l6ZWQgZ3Vl
c3QgaXMgYWxyZWFkeSBleGhhdXN0aW5nIHRoZSBkZWZhdWx0IGJ1ZmZlcgo+PiBzaXplIGZvciB0
aGUgZGlydHkgYml0bWFwLgo+Pgo+PiBUaGVyZSBpcyBubyBzZW5zaWJsZSB3YXkgdG8gc2V0IGEg
c2FuZSBsaW1pdCwgc28ganVzdCByZW1vdmUgaXQKPj4gY29tcGxldGVseS4gVGhlIGRldmljZSBu
b2RlJ3MgdXNhZ2UgaXMgbGltaXRlZCB0byByb290IGFueXdheSwgc28gdGhlcmUKPj4gaXMgbm8g
YWRkaXRpb25hbCBET1Mgc2NlbmFyaW8gYWRkZWQgYnkgYWxsb3dpbmcgdW5saW1pdGVkIGJ1ZmZl
cnMuCj4gCj4gQnV0IGlzIHRoaXMgc2V0dGluZyBvZiBwZXJtaXNzaW9ucyB3aGF0IHdlIHdhbnQg
bG9uZyB0ZXJtPyBXaGF0IGFib3V0IGEKPiBkZS1wcml2aWxlZ2VkIHFlbXUsIHdoaWNoIHN0aWxs
IG5lZWRzIHRvIGJlIGFibGUgdG8gaXNzdWUgYXQgbGVhc3QgZG0tb3AKPiBoeXBlcmNhbGxzPwoK
V291bGRuJ3QgdGhhdCBxZW11IGhhdmUgb3BlbmVkIHRoZSBub2RlIHdoaWxlIHN0aWxsIGJlaW5n
IHByaXZpbGVnZWQ/CgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
