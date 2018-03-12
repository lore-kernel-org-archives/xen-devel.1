From: Alexey Gerasimenko <x1917x@gmail.com>
Subject: [RFC PATCH 12/12] docs: provide description for
	device_model_machine option
Date: Tue, 13 Mar 2018 04:33:57 +1000
Message-ID: <632e2773d742c3aeec5104a65b94f83df3aec691.1520867741.git.x1917x@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=z5vn=gc=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1evSI2-0007Uh-03
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 18:35:18 +0000
Received: by mail-pg0-x243.google.com with SMTP id d1so1082720pgv.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Mar 2018 11:35:17 -0700 (PDT)
In-Reply-To: <cover.1520867740.git.x1917x@gmail.com>
In-Reply-To: <cover.1520867740.git.x1917x@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Alexey Gerasimenko <x1917x@gmail.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBhZGRzIGRlc2NyaXB0aW9uIGZvciAnZGV2aWNlX21vZGVsX21hY2hpbmUnIG9w
dGlvbiB3aGljaCBhbGxvd3MKdG8gY29udHJvbCB3aGljaCBjaGlwc2V0IHdpbGwgYmUgZW11bGF0
ZWQgYnkgZGV2aWNlIG1vZGVsLgoKU2lnbmVkLW9mZi1ieTogQWxleGV5IEdlcmFzaW1lbmtvIDx4
MTkxN3hAZ21haWwuY29tPgotLS0KIGRvY3MvbWFuL3hsLmNmZy5wb2QuNS5pbiB8IDI3ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5jZmcucG9kLjUuaW4gYi9kb2NzL21hbi94bC5jZmcu
cG9kLjUuaW4KaW5kZXggYTY5OTM2Nzc3OS4uN2I4OTkxYWI3ZCAxMDA2NDQKLS0tIGEvZG9jcy9t
YW4veGwuY2ZnLnBvZC41LmluCisrKyBiL2RvY3MvbWFuL3hsLmNmZy5wb2QuNS5pbgpAQCAtMjQ4
NCw2ICsyNDg0LDMzIEBAIHlvdSBoYXZlIGV4aXN0aW5nIGd1ZXN0cyB0aGVuLCBkZXBlbmRpbmcg
b24gdGhlIG5hdHVyZSBvZiB0aGUgZ3Vlc3QKIE9wZXJhdGluZyBTeXN0ZW0sIHlvdSBtYXkgd2lz
aCB0byBmb3JjZSB0aGVtIHRvIHVzZSB0aGUgZGV2aWNlCiBtb2RlbCB3aGljaCB0aGV5IHdlcmUg
aW5zdGFsbGVkIHdpdGguCiAKKz1pdGVtIEI8ZGV2aWNlX21vZGVsX21hY2hpbmU9IlNUUklORyI+
CisKK1NlbGVjdHMgd2hpY2ggY2hpcHNldCB0aGUgZGV2aWNlIG1vZGVsIHNob3VsZCBlbXVsYXRl
IGZvciB0aGlzCitndWVzdC4KKworVmFsaWQgb3B0aW9ucyBhcmU6CisKKz1vdmVyIDQKKworPWl0
ZW0gQjwiaTQ0MCI+CisKK1VzZSBpNDQwIGVtdWxhdGlvbiAoYSBkZWZhdWx0IHNldHRpbmcpCisK
Kz1pdGVtIEI8InEzNSI+CisKK1VzZSBRMzUvSUNIOSBlbXVsYXRpb24uIFRoaXMgZW5hYmxlcyBh
ZGRpdGlvbmFsIGZlYXR1cmVzIGZvcgorUENJZSBkZXZpY2UgcGFzc3Rocm91Z2gKKworPWJhY2sK
KworTm90ZSB0aGF0IG9taXR0aW5nIGRldmljZV9tb2RlbF9tYWNoaW5lIHBhcmFtZXRlciBtZWFu
cyBpNDQwIHN5c3RlbQorYnkgZGVmYXVsdCwgc28gdGhlIGRlZmF1bHQgYmVoYXZpb3IgZG9lc24n
dCBjaGFuZ2UgZm9yIG9sZCBkb21haW4KK2NvbmZpZyBmaWxlcy4KKworSXQgaXMgcmVjb21tZW5k
ZWQgdG8gaW5zdGFsbCB0aGUgZ3Vlc3QgT1MgZnJvbSBzY3JhdGNoIHRvIGF2b2lkIGlzc3Vlcwor
ZHVlIHRvIHRoZSBlbXVsYXRlZCBwbGF0Zm9ybSBjaGFuZ2UuCisKID1pdGVtIEI8ZGV2aWNlX21v
ZGVsX292ZXJyaWRlPSJQQVRIIj4KIAogT3ZlcnJpZGUgdGhlIHBhdGggdG8gdGhlIGJpbmFyeSB0
byBiZSB1c2VkIGFzIHRoZSBkZXZpY2UtbW9kZWwuIFRoZQotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
