From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/2] fix several issues in documentation
Date: Tue,  8 May 2018 08:47:29 +0200
Message-ID: <20180508064731.12391-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=orcc=h3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fFwPT-0008IZ-33
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 06:47:39 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, ross.lagerwall@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

U29tZSBkb2N1bWVudHMgY29udGFpbiBpbnZhbGlkIHBhbmRvYyBzeW50YXggbGVhZGluZyB0byBm
YWlsdXJlcyB3aGVuCmNyZWF0aW5nIFBERnMgZnJvbSB0aGVtLCBlLmcuIHdoZW4gY2FsbGluZyAi
bWFrZSBhbGwiIGluIHRoZSBkb2NzCmRpcmVjdG9yeS4KCkNvcnJlY3QgdGhvc2UgYnkgdXNpbmcg
cHJvcGVyIGxpc3RzLCBjb2RlIGJsb2NrcyBhbmQgc3BlY2lhbCBjaGFyYWN0ZXIKZXNjYXBpbmcu
CgpDaGFuZ2VzIGluIFYzOgotIGRyb3BwZWQgcGF0Y2hlcyAxIGFuZCAyIG9mIFYyIGFzIGFscmVh
ZHkgYXBwbGllZAotIGNvbXBsZXRlIHJld29yayBvZiBpbnRlbF9wc3JfY2F0X2NkcC5wYW5kb2Mg
Zm9ybWF0dGluZyAoQW5kcmV3KQoKQ2hhbmdlcyBpbiBWMjoKLSBkcm9wcGVkIHBhdGNoZXMgMSBh
bmQgNCBhcyBhbHJlYWR5IGFwcGxpZWQKLSByZWJhc2VkIHRvIGN1cnJlbnQgc3RhZ2luZwotIHJl
LWFkZGVkIGRyb3BwZWQgbGluZSBpbiBsaXZlcGF0Y2gubWFya2Rvd24gKEtvbnJhZCkKCkluIGNh
c2UgdGhlIG1haW50YWluZXJzIGFyZSBmaW5lIHdpdGggbXkgY2hhbmdlcyBJIGJlbGlldmUgdGhl
IHNlcmllcwpzaG91bGQgYmUgaW5jbHVkZWQgaW4gNC4xMS4gU28gZm9yIHRoZSBzZXJpZXM6CgpS
ZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpKdWVyZ2Vu
IEdyb3NzICgyKToKICBkb2M6IGNvcnJlY3QgbGl2ZXBhdGNoLm1hcmtkb3duIHN5bnRheAogIGRv
YzogY29ycmVjdCBpbnRlbF9wc3JfY2F0X2NkcC5wYW5kb2Mgc3ludGF4CgogZG9jcy9mZWF0dXJl
cy9pbnRlbF9wc3JfY2F0X2NkcC5wYW5kb2MgfCA1NjIgKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLQogZG9jcy9taXNjL2xpdmVwYXRjaC5tYXJrZG93biAgICAgICAgICAgfCA1OTAgKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDU3MyBpbnNl
cnRpb25zKCspLCA1NzkgZGVsZXRpb25zKC0pCgotLSAKMi4xMy42CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
