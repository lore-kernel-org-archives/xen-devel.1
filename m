From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/vm_event: correctly gather gs_shadow
 value
Date: Wed, 1 May 2019 10:17:43 +0300
Message-ID: <2924b458-c79d-0993-b54f-924fec1f0caf@bitdefender.com>
References: <20190501042249.1218-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WEFG=TB=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hLjVf-0002mo-EL
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 07:18:31 +0000
In-Reply-To: <20190501042249.1218-1-tamas@tklengyel.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8xLzE5IDc6MjIgQU0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBDdXJyZW50bHkgdGhl
IGdzX3NoYWRvdyB2YWx1ZSBpcyBvbmx5IGNhY2hlZCB3aGVuIHRoZSB2Q1BVIGlzIGJlaW5nIHNj
aGVkdWxlZAo+IG91dCBieSBYZW4uIFJlcG9ydGluZyB0aGlzICh1c3VhbGx5KSBzdGFsZSB2YWx1
ZSB0aHJvdWdoIHZtX2V2ZW50IGlzIGluY29ycmVjdCwKPiBzaW5jZSBpdCBkb2Vzbid0IHJlcHJl
c2VudCB0aGUgYWN0dWFsIHN0YXRlIG9mIHRoZSB2Q1BVIGF0IHRoZSB0aW1lIHRoZSBldmVudAo+
IHdhcyByZWNvcmRlZC4gVGhpcyBwcmV2ZW50cyB2bV9ldmVudCBzdWJzY3JpYmVycyBmcm9tIGNv
cnJlY3RseSBmaW5kaW5nIGtlcm5lbAo+IHN0cnVjdHVyZXMgaW4gdGhlIGd1ZXN0IHdoZW4gaXQg
aXMgdHJhcHBlZCB3aGlsZSBpbiByaW5nMy4KCklzbid0IHRoZSBWQ1BVIGFsd2F5cyBzY2hlZHVs
ZWQgb3V0IChzaW5jZSBpdCBpcyBwYXVzZWQpIHdpdGggc3luYwp2bV9ldmVudHM/IElzIHRoaXMg
YW4gYXN5bmMgZml4IG9ubHk/CgpJbiBhbnkgY2FzZSwKCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2Nh
cnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
