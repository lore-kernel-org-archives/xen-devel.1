From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] x86: respect memory size limits
Date: Tue, 22 Jan 2019 09:06:26 +0100
Message-ID: <20190122080628.7238-1-jgross__23784.6729623683$1548144520$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mEf3=P6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1glr5y-0005nJ-Gg
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 08:07:42 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, linux-mm@kvack.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gYSBjdXN0b21lciBzeXN0ZW0gcnVubmluZyBYZW4gYSBib290IHByb2JsZW0gd2FzIG9ic2Vy
dmVkIGR1ZSB0bwp0aGUga2VybmVsIG5vdCByZXNwZWN0aW5nIHRoZSBtZW1vcnkgc2l6ZSBsaW1p
dCBpbXBvc2VkIGJ5IHRoZSBYZW4KaHlwZXJ2aXNvci4KCkR1cmluZyBhbmFseXNpcyBJIGZvdW5k
IHRoZSBzYW1lIHByb2JsZW0gc2hvdWxkIGJlIGFibGUgdG8gb2NjdXIgb24KYmFyZSBtZXRhbCBp
biBjYXNlIHRoZSBtZW1vcnkgd291bGQgYmUgbGltaXRlZCB2aWEgdGhlICJtZW09IiBib290CnBh
cmFtZXRlci4KClRoZSBzeXN0ZW0gdGhpcyBwcm9ibGVtIGhhcyBiZWVuIG9ic2VydmVkIG9uIGhh
cyB0b25zIG9mIG1lbW9yeQphZGRlZCB2aWEgUENJLiBTbyB3aGlsZSBpbiB0aGUgRTgyMCBtYXAg
dGhlIG5vdCB0byBiZSB1c2VkIG1lbW9yeSBoYXMKYmVlbiB3aXBlZCBvdXQgdGhlIGFkZGl0aW9u
YWwgUENJIG1lbW9yeSBpcyBkZXRlY3RlZCBkdXJpbmcgQUNQSSBzY2FuCmFuZCBpdCBpcyBhZGRl
ZCB2aWEgX19hZGRfbWVtb3J5KCkuCgpUaGlzIHNtYWxsIHNlcmllcyB0cmllcyB0byByZXBhaXIg
dGhlIGlzc3VlIGJ5IHRlc3RpbmcgdGhlIGltcG9zZWQKbWVtb3J5IGxpbWl0IGR1cmluZyB0aGUg
bWVtb3J5IGhvdHBsdWcgcHJvY2VzcyBhbmQgcmVmdXNpbmcgdG8gYWRkIGl0CmluIGNhc2UgdGhl
IGxpbWl0IGlzIGJlaW5nIHZpb2xhdGVkLgoKSSd2ZSBjaG9zZW4gdG8gcmVmdXNlIGFkZGluZyB0
aGUgY29tcGxldGUgbWVtb3J5IGNodW5rIGluIGNhc2UgdGhlCmxpbWl0IGlzIHJlYWNoZWQgaW5z
dGVhZCBvZiBhZGRpbmcgb25seSBzb21lIG9mIHRoZSBtZW1vcnksIGFzIEkKdGhvdWdodCB0aGlz
IHdvdWxkIHJlc3VsdCBpbiBsZXNzIHByb2JsZW1zIChlLmcuIGF2b2lkaW5nIHRvIGFkZApvbmx5
IHBhcnRzIG9mIGEgMTI4TUIgbWVtb3J5IGJhciB3aGljaCBtaWdodCBiZSBkaWZmaWN1bHQgdG8g
cmVtb3ZlCmxhdGVyKS4KCgpKdWVyZ2VuIEdyb3NzICgyKToKICB4ODY6IHJlc3BlY3QgbWVtb3J5
IHNpemUgbGltaXRpbmcgdmlhIG1lbT0gcGFyYW1ldGVyCiAgeDg2L3hlbjogZG9udCBhZGQgbWVt
b3J5IGFib3ZlIG1heCBhbGxvd2VkIGFsbG9jYXRpb24KCiBhcmNoL3g4Ni9rZXJuZWwvZTgyMC5j
ICAgICAgICAgfCA1ICsrKysrCiBhcmNoL3g4Ni94ZW4vc2V0dXAuYyAgICAgICAgICAgfCA1ICsr
KysrCiBpbmNsdWRlL2xpbnV4L21lbW9yeV9ob3RwbHVnLmggfCAyICsrCiBtbS9tZW1vcnlfaG90
cGx1Zy5jICAgICAgICAgICAgfCA2ICsrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
