From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PULL 01/16] checkpatch: Add xendevicemodel_handle to
 the list of types
Date: Thu, 26 Apr 2018 16:56:12 +0100
Message-ID: <1524758187-9351-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pghr=hp=citrix.com=prvs=647a3a28a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fBjGL-0006g0-32
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 15:56:49 +0000
In-Reply-To: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Berrange" <berrange@redhat.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBhdm9pZHMgY2hlY2twYXRjaCBtaXNwYXJzaW5nIChhcyBzdGF0ZW1lbnRzKSBsb25nIGZ1
bmN0aW9uCmRlZmluaXRpb25zIG9yIGRlY2xhcmF0aW9ucywgd2hpY2ggc29tZXRpbWVzIHN0YXJ0
IHdpdGggY29uc3RydWN0cwpsaWtlIHRoaXM6CgogIHN0YXRpYyBpbmxpbmUgaW50IHhlbmRldmlj
ZW1vZGVsX3JlbG9jYXRlX21lbW9yeSgKICAgICAgeGVuZGV2aWNlbW9kZWxfaGFuZGxlICpkbW9k
LCBkb21pZF90IGRvbWlkLCAuLi4KClRoZSB0eXBlIHhlbmRldmljZW1vZGVsX2hhbmRsZSBkb2Vz
IG5vdCBjb25mb3JtIHRvIFFlbXUgQ09ESU5HX1NUWUxFLAp3aGljaCB3b3VsZCBzdWdnZXN0IENh
bWVsQ2FzZS4gIEhvd2V2ZXIsIGl0IGlzIGEgdHlwZSBkZWZpbmVkIGJ5IHRoZQpYZW4gUHJvamVj
dCBpbiB4ZW4uZ2l0LiAgSXQgd291bGQgYmUgcG9zc2libGUgdG8gaW50cm9kdWNlIGEgdHlwZWRl
Zgp0byBhbGxvdyB0aGUgcWVtdSBjb2RlIHRvIHJlZmVyIHRvIGl0IGJ5IGEgZGlmZmVyZW50bHkt
c3BlbGxlZCBuYW1lLApidXQgdGhhdCB3b3VsZCBvYmZ1c2NhdGUgbW9yZSB0aGFuIGl0IHdvdWxk
IGNsYXJpZnkuCgpDQzogRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+CkNDOiBQYW9sbyBC
b256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpDQzogRGFuaWVsIFAuIEJlcnJhbmdlIDxiZXJy
YW5nZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25A
ZXUuY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29t
PgotLS0KIHNjcmlwdHMvY2hlY2twYXRjaC5wbCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsIGIvc2NyaXB0cy9j
aGVja3BhdGNoLnBsCmluZGV4IGQ1MjIwN2EuLjViODczNWQgMTAwNzU1Ci0tLSBhL3NjcmlwdHMv
Y2hlY2twYXRjaC5wbAorKysgYi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwKQEAgLTI2Niw2ICsyNjYs
NyBAQCBvdXIgQHR5cGVMaXN0ID0gKAogCXFye3RhcmdldF8oPzp1KT9sb25nfSwKIAlxcntod2Fk
ZHJ9LAogCXFye3htbCR7SWRlbnR9fSwKKwlxcnt4ZW5kZXZpY2Vtb2RlbF9oYW5kbGV9LAogKTsK
IAogIyBUaGlzIGNhbiBiZSBtb2RpZmllZCBieSBzdWIgcG9zc2libGUuICBTaW5jZSBpdCBjYW4g
YmUgZW1wdHksIGJlIGNhcmVmdWwKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
