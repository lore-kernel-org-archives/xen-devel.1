From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V2 0/3] Fix VGA logdirty related display freezes
 with altp2m
Date: Tue, 23 Oct 2018 16:19:01 +0300
Message-ID: <1540300744-7406-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=czqh=nd=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gEwaU-0007X6-9w
 for xen-devel@lists.xenproject.org; Tue, 23 Oct 2018 13:19:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: kevin.tian@intel.com, wei.liu2@citrix.com, jun.nakajima@intel.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGlzIHNlcmllcyBhaW1zIHRvIHByZXZlbnQgdGhlIGRpc3BsYXkgZnJvbSBmcmVl
emluZyB3aGVuCmVuYWJsaW5nIGFsdHAybSBhbmQgc3dpdGNoaW5nIHRvIGEgbmV3IHZpZXcgKGFu
ZCBhc3NvcnRlZCBwcm9ibGVtcwp3aGVuIHJlc2l6aW5nIHRoZSBkaXNwbGF5KS4gU2luY2UgdGhl
IGxhc3QgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLAp3aGF0IHdhcyBwcmV2aW91c2x5IHRoZSBzZWNv
bmQgKGFuZCBsYXN0KSBwYXRjaCBoYXMgYmVlbiBzcGxpdCBpbgp0d28gcGF0Y2hlcywgdGhlIGZp
cnN0IG9mIHdoaWNoIG9ubHkgY29uY2VybnMgaXRzZWxmIHdpdGggcmFuZ2VzZXQKYWxsb2NhdGlv
biAvIGRlYWxsb2NhdGlvbiAvIGluaXRpYWxpemF0aW9uLgoKVGhlIGZpcnN0IHBhdGNoIHByb3Bh
Z2F0ZXMgZXB0LmFkIGNoYW5nZXMgdG8gYWxsIGFjdGl2ZSBhbHRwMm1zLAp0aGUgc2Vjb25kIG9u
ZSBhbGxvY2F0ZXMgYW5kIGluaXRpYWxpemVzIGEgbmV3IGxvZ2RpcnR5IHJhbmdlc2V0IGZvcgpl
YWNoIG5ldyBhbHRwMm0sIGFuZCB0aGUgdGhpcmQgcHJvcGFnYXRlcyAodW5kZXIgbG9jaykgY2hh
bmdlcyB0byBhbGwKcDJtcy4KClRoZSBmaXJzdCBwYXRjaCBpcyB0aGUgc2FtZSBhczoKW1BBVENI
IFY0XSB4ODYvYWx0cDJtOiBwcm9wYWdhdGUgZXB0LmFkIGNoYW5nZXMgdG8gYWxsIGFjdGl2ZSBh
bHRwMm1zCmJ1dCBhcyBpdCBpcyBub3cgcmVxdWlyZWQgZm9yIHRoZSByZXN0IG9mIHRoZSBzZXJp
ZXMgdG8gYXBwbHkgY2xlYW5seSwKaXQgaGFzIGJlZW4gcmVzZW50IGFzIHBhcnQgb2YgdGhpcyBz
ZXJpZXMuCgpbUEFUQ0ggVjIgMS8zXSB4ODYvYWx0cDJtOiBwcm9wYWdhdGUgZXB0LmFkIGNoYW5n
ZXMgdG8gYWxsIGFjdGl2ZSBhbHRwMm1zCltQQVRDSCBWMiAyLzNdIHg4Ni9tbTogYWxsb2NhdGUg
bG9nZGlydHlfcmFuZ2VzIGZvciBhbHRwMm1zCltQQVRDSCBWMiAzLzNdIHg4Ni9hbHRwMm06IGZp
eCBkaXNwbGF5IGZyb3plbiB3aGVuIHN3aXRjaGluZyB0byBhIG5ldyB2aWV3IGVhcmx5CgoKVGhh
bmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
