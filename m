From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/5] x86: use PDEP/PEXT for
 maddr/direct-map-offset conversion when available
Date: Thu, 27 Sep 2018 00:44:15 -0600
Message-ID: <5BAC7C3F02000078001EC6C7@prv1-mh.provo.novell.com>
References: <5AA7E79302000078001B0FAB@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F73C0@prv1-mh.provo.novell.com>
 <5AA7D98302000078001CDC8C@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F8008@prv1-mh.provo.novell.com>
 <5AA7D98302000078001DD5F0@prv1-mh.provo.novell.com>
 <5B76740802000078001DF345@prv1-mh.provo.novell.com>
 <5B76778602000078001DF374@prv1-mh.provo.novell.com>
 <f3a99ecd-ce17-2ace-954d-d54281632f26@citrix.com>
 <5B7697AE02000078001DF4A5@prv1-mh.provo.novell.com>
 <0fab9fc1-acb5-50cf-6d83-274dfb79b721@citrix.com>
 <5B9640A302000078001E6AD9@prv1-mh.provo.novell.com>
 <9cc0d365-a2b9-d951-93f4-d4b62a1d3347@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gbjr=mj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5Q27-0006cC-0Z
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 06:44:19 +0000
In-Reply-To: <9cc0d365-a2b9-d951-93f4-d4b62a1d3347@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA5LjE4IGF0IDE5OjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gSSBzZWVtIHRvIHJlY2FsbCB5b3Ugc2F5aW5nIHRoYXQgdGhlIG9uZSBzeXN0ZW0gaXQg
d2FzIGludHJvZHVjZWQgZm9yCj4gbmV2ZXIgc2hpcHBlZCwgYXQgd2hpY2ggcG9pbnQsIHdoeSBi
b3RoZXIga2VlcGluZyB0aGUgY29kZSBhcm91bmQ/CgpXZWxsLCBJJ3ZlIHNhaWQgX0kgdGhpbmtf
IHRoZXkndmUgbmV2ZXIgc2hpcHBlZC4KCklycmVzcGVjdGl2ZSBvZiB0aGlzLCBhbm90aGVyIHRo
b3VnaHQgaGVyZSB0byBjb21lIHRvIGEgbWlkZGxlCmdyb3VuZDogV2hhdCBhYm91dCByZXN0cmlj
dGluZyBzdXBwb3J0IGZvciBkaXNjb250aWd1b3VzIG1lbW9yeQptYXBzIHRvIHRoZSBCSUdNRU0g
Y2FzZT8gQXQgd2hpY2ggcG9pbnQgd2UgbWlnaHQgY29uc2lkZXIKbWFraW5nIEJNSTIgYSBwcmVy
ZXEgZm9yIHRoYXQsIGVsaW1pbmF0aW5nIHRoZSBuZWVkIGZvciBzdHViCmZ1bmN0aW9ucywgYW5k
IHVzaW5nIGFsdGVybmF0aXZlcyBqdXN0IHRvIHJlcGxhY2UgUERFUC9QRVhUIHdpdGgKTU9WIHdo
ZW4gcG9zc2libGUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
