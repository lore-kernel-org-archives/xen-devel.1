From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/6] x86/HVM: implement memory read caching
Date: Thu, 19 Jul 2018 04:39:42 -0600
Message-ID: <5B506A6E02000078001D5D17@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hpq6=kd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fg6LZ-0006Rb-6s
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 10:39:45 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RW11bGF0aW9uIHJlcXVpcmluZyBkZXZpY2UgbW9kZWwgYXNzaXN0YW5jZSB1c2VzIGEgZm9ybSBv
ZiBpbnN0cnVjdGlvbgpyZS1leGVjdXRpb24sIGFzc3VtaW5nIHRoYXQgdGhlIHNlY29uZCAoYW5k
IGFueSBmdXJ0aGVyKSBwYXNzIHRha2VzCmV4YWN0bHkgdGhlIHNhbWUgcGF0aC4gVGhpcyBpcyBh
IHZhbGlkIGFzc3VtcHRpb24gYXMgZmFyIHVzZSBvZiBDUFUKcmVnaXN0ZXJzIGdvZXMgKGFzIHRo
b3NlIGNhbid0IGNoYW5nZSB3aXRob3V0IGFueSBvdGhlciBpbnN0cnVjdGlvbgpleGVjdXRpbmcg
aW4gYmV0d2VlbiksIGJ1dCBpcyB3cm9uZyBmb3IgbWVtb3J5IGFjY2Vzc2VzLiBJbiBwYXJ0aWN1
bGFyCml0IGhhcyBiZWVuIG9ic2VydmVkIHRoYXQgV2luZG93cyBtaWdodCBwYWdlIG91dCBidWZm
ZXJzIHVuZGVybmVhdGggYW4KaW5zdHJ1Y3Rpb24gY3VycmVudGx5IHVuZGVyIGVtdWxhdGlvbiAo
aGl0dGluZyBiZXR3ZWVuIHR3byBwYXNzZXMpLiBJZgp0aGUgZmlyc3QgcGFzcyB0cmFuc2xhdGVk
IGEgbGluZWFyIGFkZHJlc3Mgc3VjY2Vzc2Z1bGx5LCBhbnkgc3Vic2VxdWVudApwYXNzIG5lZWRz
IHRvIGRvIHNvIHRvbywgeWllbGRpbmcgdGhlIGV4YWN0IHNhbWUgdHJhbnNsYXRpb24uCgpJbnRy
b2R1Y2UgYSBjYWNoZSAodXNlZCBqdXN0IGJ5IGd1ZXN0IHBhZ2UgdGFibGUgYWNjZXNzZXMgZm9y
IG5vdykgdG8KbWFrZSBzdXJlIGFib3ZlIGRlc2NyaWJlZCBhc3N1bXB0aW9uIGhvbGRzLiBUaGlz
IGlzIGEgdmVyeSBzaW1wbGlzdGljCmltcGxlbWVudGF0aW9uIGZvciBub3c6IE9ubHkgZXhhY3Qg
bWF0Y2hlcyBhcmUgc2F0aXNmaWVkIChubyBvdmVybGFwcyBvcgpwYXJ0aWFsIHJlYWRzIG9yIGFu
eXRoaW5nKS4KClRoZXJlJ3MgYWxzbyBzb21lIHNlZW1pbmdseSB1bnJlbGF0ZWQgY2xlYW51cCBo
ZXJlIHdoaWNoIHdhcyBmb3VuZApkZXNpcmFibGUgb24gdGhlIHdheS4KCjE6IHg4Ni9tbTogYWRk
IG9wdGlvbmFsIGNhY2hlIHRvIEdMQS0+R0ZOIHRyYW5zbGF0aW9uCjI6IHg4Ni9tbTogdXNlIG9w
dGlvbmFsIGNhY2hlIGluIGd1ZXN0X3dhbGtfdGFibGVzKCkKMzogeDg2L0hWTTogaW1wbGVtZW50
IG1lbW9yeSByZWFkIGNhY2hpbmcKNDogVk1YOiBjb3JyZWN0IFBEUFRFIGxvYWQgY2hlY2tzCjU6
IHg4Ni9IVk06IHByZWZpbGwgY2FjaGUgd2l0aCBQRFBURXMgd2hlbiBwb3NzaWJsZQo2OiB4ODYv
c2hhZG93OiBhIGxpdHRsZSBiaXQgb2Ygc3R5bGUgY2xlYW51cAoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
