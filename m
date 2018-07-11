From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/8] x86: (allow to) suppress use of
 hyper-threading
Date: Wed, 11 Jul 2018 05:55:07 -0600
Message-ID: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t1xz=j3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdDiB-0003ex-6U
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 11:55:11 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SSd2ZSBiZWVuIGNvbnNpZGVyaW5nIHRvIGFkZCBhIHJlc3BlY3RpdmUgY29tbWFuZCBsaW5lIG9w
dGlvbiBmb3IKcXVpdGUgYSBsb25nIHRpbWUsIGJ1dCBuZXZlciBnb3QgYXJvdW5kIHRvLiBOb3cg
dGhhdCB0aGUgVExCbGVlZAppbmZvcm1hdGlvbiBpcyBwdWJsaWNbMV0sIHdlJ3JlIGF0IHBvaW50
IHdoZXJlIHdlIG5vdCBvbmx5IHdhbnQsCmJ1dCBuZWVkIHRoaXMsIGFuZCB3aGVyZSBwZXJoYXBz
IGl0IG5lZWRzIHRvIGJlIHRoZSBkZWZhdWx0IG9uCmFmZmVjdGVkIHN5c3RlbXMuIFRoZSBmaXJz
dCA1IHBhdGNoZXMgYXJlIGFsbCBwcmVyZXF1aXNpdGVzIHRvIHRoZQo2dGggb25lOyB0aGUgZmlu
YWwgdHdvIGFyZSBzaW1wbHkgYWRkcmVzc2luZyB0aGluZ3MgSSBoYWQgbm90aWNlZAp3aGlsZSBw
dXR0aW5nIHRvZ2V0aGVyIHRoZSByZXN0LgoKMTogY3B1cG9vbHM6IGZpeCBzdGF0ZSB3aGVuIGRv
d25pbmcgYSBDUFUgZmFpbGVkCjI6IHg4NjogZGlzdGluZ3Vpc2ggQ1BVIG9mZmxpbmluZyBmcm9t
IENQVSByZW1vdmFsCjM6IGFsbG93IGNwdV9kb3duKCkgdG8gYmUgY2FsbGVkIGVhcmxpZXIKNDog
eDg2L0FNRDogZGlzdGluZ3Vpc2ggY29tcHV0ZSB1bml0cyBmcm9tIGh5cGVyLXRocmVhZHMKNTog
eDg2OiBicmluZyB1cCBhbGwgQ1BVcyBldmVuIGlmIG5vdCBhbGwgYXJlIHN1cHBvc2VkIHRvIGJl
IHVzZWQKNjogeDg2OiBjb21tYW5kIGxpbmUgb3B0aW9uIHRvIGF2b2lkIHVzZSBvZiBzZWNvbmRh
cnkgaHlwZXItdGhyZWFkcwo3OiB4ODYvc2hpbTogZnVsbHkgaWdub3JlICJub3NtcCIgYW5kICJt
YXhjcHVzPSIKODogY3B1bWFzazogdGlkeSB7LHp9YWxsb2NfY3B1bWFza192YXIoKSAKCkphbgoK
WzFdIGh0dHBzOi8vd3d3LnZ1c2VjLm5ldC9wcm9qZWN0cy90bGJsZWVkLwoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
